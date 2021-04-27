// require.config({
// paths: {
//     "jquery": "jquery.min",
//     "com": "common.min"
//   }
// });
// require(['jquery','com'], function ($,com){
// $('#shangchuan').click(function () {
//     var formData = new FormData();
//     formData.append('subject', $('#subject').val());
//         formData.append('excels', document.getElementById("excels").files[0]);
//         formData.append('models', $('#models').val());
//         formData.append('con', document.getElementById("con").files[0]);
//         formData.append('qunfasum', $('#qunfasum').val());
//         formData.append('jiange', $('#jiange').val());
//         formData.append('yuming', $('#yuming').val());
//         formData.append('duankou', $('#duankou').val());
//
//     $.ajax({
//                 url:"/upload/",
//                 type:"POST",
//                 data:formData,
//                 processData:false,
//                 contentType:false,
//                 success: function (data) {
//                     alert(data)
//                     console.log(111)
//                 }
//         })
//
// });
//
//
// });