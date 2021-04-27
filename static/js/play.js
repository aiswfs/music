require.config({
　paths: {
    "jquery": "jquery.min",
    "com": "common.min"
  }
});

require(['jquery','com',"jquery.jplayer"], function ($,com){
  //歌曲纠错
  $('#songCorr').on('click','li',function(){
    var temp = 'corr_' + $('#currentSong').attr('data-rel') + '_' + $(this).index();
    if(localStorage[temp]){
      com.msg('请勿重复提交！');
      return false;
    }
    localStorage[temp] = 1;
    com.loadOpen();
    setTimeout(function(){
      com.loadClose();
      com.msg('提交成功，感谢您的参与！');
    },300);
  });
  if(localStorage.playRule == 'none') localStorage.playRule = '';
  //播放顺序
  if($('#songlist').find('li').length>1){
    localStorage.playRule = localStorage.playRule || 'order';
  }else{
    localStorage.playRule = '';
  }
  if(localStorage.playRule){
    $('#playleixin').find('.'+localStorage.playRule).addClass('current').siblings().removeClass('current');
  }
  //下一首播放歌曲
  setNextPlay();
  console.log("location.href: " + location.href);
  var strhref = location.href;
  arrstr = strhref.split('/');
  if (0 < arrstr.length){
    strhref = arrstr[arrstr.length - 1]
    arrstr=strhref.split('.')
    strhref = arrstr[0]
     $.ajax({
      url:'/user/position?songid=' + strhref,
      type:'GET',
      timeout:10000,
      error:function(http,err){
      },
      success:function(data){
      }
    });
  }
  var time = 0;
  if($('#lrc_content').length>0){
    getLyrics($('#lrc_content').val(),$('#lrc_list'));
    //定义播放器
    $("#jquery_jplayer_1").jPlayer({
        ready: function (event) {
            $(this).jPlayer("setMedia", {
                mp3: $("#jquery_jplayer_1").attr('data-url') //mp3的播放地址
            });
            $("#jquery_jplayer_1").jPlayer('play');
        },
        timeupdate: function (event) {
            time = event.jPlayer.status.currentTime;
        },
        play: function (event) {
            //点击开始方法调用lrc。start歌词方法 返回时间time
            $.lrc.start($('#lrc_content').val(), function () {
                return time;
            });
            $('.click_play').hide().next().show();
        },
        pause: function(){
          $('.click_pause').hide().prev().show();
        },
        ended: function (event) {
            // $("#lrc_list").removeAttr("style").html("<li>歌曲播放完毕！</li>");
            if(localStorage.playNext != null && localStorage.playNext.indexOf('.html') != -1){
              location.href = location.origin + localStorage.playNext;
            }
        },
        swfPath: "/js",  		//存放jplayer.swf的路径
        solution: "html, flash", //支持的页面
        supplied: "mp3", 	//支持的音频的格式
        wmode: "window"
    });
  }
  //播放
  $('.jp_img').on('click',function(){
    $("#jquery_jplayer_1").jPlayer('play');
  });
  $('.click_play').on('click',function(){
    $("#jquery_jplayer_1").jPlayer('play');
  });
  //暂停
  $('.click_pause').on('click',function(){
    $("#jquery_jplayer_1").jPlayer('pause');
    //$(this).hide().prev().show();
  });
  //猜你喜欢的换一换功能
  $('#irefresh').on('click',function(){
    var $this = $(this);
    var id = $('#currentSong').attr('data-rel');
    com.loadOpen();
    $.ajax({
      url:'/ajax_api_index_change_like',
      type:'POST',
      timeout:10000,
      error:function(http,err){
        console.error(http,err);
        com.loadClose();
      },
      success:function(data){
        var json = JSON.parse(data);
        var html = '';
        $.each(json,function(i,e){
          if(i<3){
            html += '<li><a class="pic layz_load pic_po" href="/song_' + e.song_id + '.html" ' +
                    'target="play" title="' + e.song_name + '-' + e.song_artist + '">' +
                    '<img data-src="' + e.song_image + '" alt="' + e.song_name + '的封面"></a>' +
                    '<h4 class="title"><a href="/song_' + e.song_id + '.html" target="play" ' +
                    'title="' + e.song_name + '-' + e.song_artist + '">' + e.song_name + '</a></h4>' +
                    '<a href="singer-' + e.singer_id + '.html" target="_blank" ' +
                    'title="歌手-' + e.song_artist + '" class="meta">' + e.song_artist + '</a>' +
                    '<span class="compare-btn" data-rel="'+e.song_id+'" data-name="'+e.song_name+'" ' +
                    'data-img="'+e.song_image+'" data-artist="'+e.song_artist+'"><i></i>PK</span></li>';
          }
        });
        $this.parent().next().html(html);
        com.showImg();
        com.loadClose();
      }
    });
  });

  //相关歌曲焦点切换
  new com.FocusSwitch($('#J_PartsList'),null,true,10000,$('#J_PartsPrev'),$('#J_PartsNext')).init();

  // 播放列表操作
  $('#playleixin').on('click','li',function(){
    var $this = $(this);
    var run = $this.attr('data-run');
    var songlist = $('#songlist');
    var id = songlist.find('.current').attr('data-id');
    var url = '';
    if($this.hasClass('current')){
      return;
    }
    if(run == 'next'){
      //播放下一首
      if(songlist.find('li').length>1){
        if(songlist.find('.current').next().length>0){
          url = songlist.find('.current').next().find('.name').attr('href');
        }else{
          url = songlist.find('li').eq(0).find('.name').attr('href');
        }
      }else{
        com.msg('歌曲列表中只有一首歌曲！');
        return false;
      }
      //location.href = location.origin + '/' + url;
      location.href = location.origin + url;
    }else if(run == 'cl_all'){
      if(songlist.find('li').length<=1)return;
      com.alert({
        content:'确定清空播放列表吗？',
        button:2,
        time:60000
      },function(){
        com.loadOpen();
        //清除全部
        $.ajax({
          url:'ajax_api_delete_song?type=all&song_id='+id,
          type:'GET',
          timeout:10000,
          error:function(http,err){
            console.error(http,err);
            com.loadClose();
          },
          success:function(data){
            if(data == 'success'){
              songlist.find('.current').find('.num').text('1').end().siblings().remove();
              localStorage.playRule = '';
              localStorage.playNext = '';
              com.msg('已清除全部歌曲！');
            }
            com.loadClose();
          }
        });
      });
    }else{
      if(songlist.find('li').length>1){
        localStorage.playRule = run;
      }else{
        localStorage.playRule = '';
      }
      $this.addClass('current').siblings().removeClass('current');
      setNextPlay();
    }
  });
  //分页
  if($('#pageBar').length>0){
    com.pages($('#curPage').val(),$('#countPage').val(),$('#pageBar'));
  }
  //歌词滚动
  (function($){
  	$.lrc = {
  		handle: null, /* 定时执行句柄 */
  		list: [], /* lrc歌词及时间轴数组 */
  		regex: /^[^\[]*((?:\s*\[\d+\:\d+(?:\.\d+)?\])+)([\s\S]*)$/, /* 提取歌词内容行 */
  		regex_time: /\[(\d+)\:((?:\d+)(?:\.\d+)?)\]/g, /* 提取歌词时间轴 */
  		regex_trim: /^\s+|\s+$/, /* 过滤两边空格 */
  		callback: null, /* 定时获取歌曲执行时间回调函数 */
  		interval: 0.3, /* 定时刷新时间，单位：秒 */
  		format: '<li>{html}</li>', /* 模板 */
  		prefixid: 'lrc', /* 容器ID */
  		hoverClass: 'hover', /* 选中节点的className */
  		hoverTop: 100, /* 当前歌词距离父节点的高度 */
  		duration: 0, /* 歌曲回调函数设置的进度时间 */
  		__duration: -1, /* 当前歌曲进度时间 */
  		/* 歌词开始自动匹配 */
  		start: function(txt, callback) {
  			if(typeof(txt) != 'string' || txt.length < 1 || typeof(callback) != 'function') return;
  			/* 停止前面执行的歌曲 */
  			this.stop();
  			this.callback = callback;
  			var item = null, item_time = null, html = '';
  			/* 分析歌词的时间轴和内容 */
  			txt = txt.split("\n");
  			for(var i = 0; i < txt.length; i++) {
  				item = txt[i].replace(this.regex_trim, '');
  				if(item.length < 1 || !(item = this.regex.exec(item))) continue;
  				while(item_time = this.regex_time.exec(item[1])) {
  					this.list.push([parseFloat(item_time[1])*60+parseFloat(item_time[2]), item[2]]);
  				}
  				this.regex_time.lastIndex = 0;
  			}

  			/* 有效歌词 */
  			if(this.list.length > 0) {
  				/* 对时间轴排序 */
  				this.list.sort(function(a,b){ return a[0]-b[0]; });
  				if(this.list[0][0] >= 0.1) this.list.unshift([this.list[0][0]-0.1, '']);
  				this.list.push([this.list[this.list.length-1][0]+1, '']);
  				for(var i = 0; i < this.list.length; i++)
  					html += this.format.replace(/\{html\}/gi, this.list[i][1]);

  				/* 赋值到指定容器 */
  				$('#'+this.prefixid+'_list').html(html).animate({ marginTop: 0 }, 100).show();
  				/* 隐藏没有歌词的层 */
  				$('#'+this.prefixid+'_nofound').hide();
  				/* 定时调用回调函数，监听歌曲进度 */
  				//this.handle = setInterval('$.lrc.jump($.lrc.callback());', this.interval*1000);
          this.handle = setInterval(function(){
            $.lrc.jump($.lrc.callback());
          }, this.interval*1000);
  			}else{ /* 没有歌词 */
  				$('#'+this.prefixid+'_list').hide();
  				$('#'+this.prefixid+'_nofound').show();
  			}
  		},
  		/* 跳到指定时间的歌词 */
  		jump: function(duration) {
  			if(typeof(this.handle) != 'number' || typeof(duration) != 'number' || !$.isArray(this.list) || this.list.length < 1) return this.stop();
  			if(duration < 0)
  			  duration = 0;
  			if(this.__duration == duration)
  			  return;
  			duration += 0.2;
  			this.__duration = duration;
  			duration += this.interval;

  			var left = 0, right = this.list.length-1, last = right
  				pivot = Math.floor(right/2),
  				tmpobj = null, tmp = 0, thisobj = this;

  			/* 二分查找 */
  			while(left <= pivot && pivot <= right) {
  				if(this.list[pivot][0] <= duration && (pivot == right || duration < this.list[pivot+1][0])) {
  					//if(pivot == right) this.stop();
  					break;
  				}else if( this.list[pivot][0] > duration ) { /* left */
  					right = pivot;
  				}else{ /* right */
  					left = pivot;
  				}
  				tmp = left + Math.floor((right - left)/2);
  				if(tmp == pivot) break;
  				pivot = tmp;
  			}

  			if(pivot == this.pivot) return;
  			this.pivot = pivot;
  			tmpobj = $('#'+this.prefixid+'_list').children().removeClass(this.hoverClass).eq(pivot).addClass(thisobj.hoverClass);
  			tmp = tmpobj.next().offset().top-tmpobj.parent().offset().top - this.hoverTop;
  			tmp = tmp > 0 ? tmp * -1 : 0;
        //改变歌词的marginTop值
        //this.animata(tmpobj.parent()[0]).animate({marginTop: tmp + 'px'}, this.interval*1000);
  			tmpobj.parent().parent().animate({scrollTop: -tmp + 'px'}, this.interval*1000);
        this.animata(tmpobj.parent()[0])
  		},
  		/* 停止执行歌曲 */
  		stop: function() {
  			if(typeof(this.handle) == 'number') clearInterval(this.handle);
  			this.handle = this.callback = null;
  			this.__duration = -1;
  			this.regex_time.lastIndex = 0;
  			this.list = [];
  		},
  		animata: function(elem) {
  			var f = j = 0, callback, _this={},
  				tween = function(t,b,c,d){ return -c*(t/=d)*(t-2) + b; }
  			_this.execution = function(key, val, t) {
  				var s = (new Date()).getTime(), d = t || 500,
  				    b = parseInt(elem.style[key]) || 0,
  				    c = val-b;
  				(function(){
  					var t = (new Date()).getTime() - s;
  					if(t>d){
  						t=d;
  						elem.style[key] = tween(t,b,c,d) + 'px';
  						++f == j && callback && callback.apply(elem);
  						return true;
  					}
  					elem.style[key] = tween(t,b,c,d)+'px';
  					setTimeout(arguments.callee, 10);
  				})();
  			}
  			_this.animate = function(sty, t, fn){
  				callback = fn;
  				for(var i in sty){
  					j++;
  					_this.execution(i,parseInt(sty[i]),t);
  				}
  			}
  			return _this;
  		}
  	};
  })(jQuery);

  //设置下一首歌曲链接
  function setNextPlay(){
    var run = localStorage.playRule;
    var random = 0;
    var songlist = $('#songlist');
    var liArr = songlist.find('li');
    var liCur = songlist.find('.current');
    if(run == 'order'){
      //顺序播放
      if(liArr.length>1){
        if(liCur.next().length>0){
          localStorage.playNext = liCur.next().find('.name').attr('href');
        }else{
          localStorage.playNext = liArr.eq(0).find('.name').attr('href');
        }
      }
    }else if(run == 'single'){
      //单曲播放
      localStorage.playNext = liCur.find('.name').attr('href');
    }else if(run == 'random'){
      //随机播放
      random = com.getRandom(liArr.length,liCur.index());
      localStorage.playNext = liArr.eq(random).find('.name').attr('href');
    }else{
      localStorage.playNext = '';
    }
    console.log('localStorage.playNext: ' + localStorage.playNext);
  }
  //获取歌词
  function getLyrics(str,con){
    var lyrics = str.split("\n");
    var list = [];
    var item_time;
    var item;
    var format = '<li>{html}</li>';
    var html = '';
    var regex = /^[^\[]*((?:\s*\[\d+\:\d+(?:\.\d+)?\])+)([\s\S]*)$/,
    regex_time = /\[(\d+)\:((?:\d+)(?:\.\d+)?)\]/g,
    regex_trim = /^\s+|\s+$/;
    for(var i = 0; i < lyrics.length; i++) {
      item = lyrics[i].replace(regex_trim, '');
      if(item.length < 1 || !(item = regex.exec(item))) continue;

      while(item_time = regex_time.exec(item[1])) {
        list.push([parseFloat(item_time[1])*60+parseFloat(item_time[2]), item[2]]);
      }
      regex_time.lastIndex = 0;
    }
    if(list.length > 0) {
      list.sort(function(a,b){ return a[0]-b[0]; });
      if(list[0][0] >= 0.1) list.unshift([list[0][0]-0.1, '']);
      list.push([list[list.length-1][0]+1, '']);
      for(var i = 0; i < list.length; i++)
        html += format.replace(/\{html\}/gi, list[i][1]);
      con.html(html);
    }else{
      con.html('该歌曲没有歌词');
      con.after($('<div style="line-height:400px;font-size:18px;color:#cccccc;">该歌曲暂时没有歌词</div>'))
    }
  }
});
