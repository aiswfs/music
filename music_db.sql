/*
 Navicat MySQL Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : music_db

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 02/06/2020 11:35:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add 歌曲评论', 7, 'add_comment');
INSERT INTO `auth_permission` VALUES (20, 'Can change 歌曲评论', 7, 'change_comment');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 歌曲评论', 7, 'delete_comment');
INSERT INTO `auth_permission` VALUES (22, 'Can add 歌曲动态', 8, 'add_dynamic');
INSERT INTO `auth_permission` VALUES (23, 'Can change 歌曲动态', 8, 'change_dynamic');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 歌曲动态', 8, 'delete_dynamic');
INSERT INTO `auth_permission` VALUES (25, 'Can add 歌曲分类', 9, 'add_label');
INSERT INTO `auth_permission` VALUES (26, 'Can change 歌曲分类', 9, 'change_label');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 歌曲分类', 9, 'delete_label');
INSERT INTO `auth_permission` VALUES (28, 'Can add 歌曲信息', 10, 'add_song');
INSERT INTO `auth_permission` VALUES (29, 'Can change 歌曲信息', 10, 'change_song');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 歌曲信息', 10, 'delete_song');
INSERT INTO `auth_permission` VALUES (31, 'Can add user', 11, 'add_myuser');
INSERT INTO `auth_permission` VALUES (32, 'Can change user', 11, 'change_myuser');
INSERT INTO `auth_permission` VALUES (33, 'Can delete user', 11, 'delete_myuser');
INSERT INTO `auth_permission` VALUES (34, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (35, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (36, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (37, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (38, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (39, 'Can view 歌曲评论', 7, 'view_comment');
INSERT INTO `auth_permission` VALUES (40, 'Can view 歌曲动态', 8, 'view_dynamic');
INSERT INTO `auth_permission` VALUES (41, 'Can view 歌曲分类', 9, 'view_label');
INSERT INTO `auth_permission` VALUES (42, 'Can view 歌曲信息', 10, 'view_song');
INSERT INTO `auth_permission` VALUES (43, 'Can view user', 11, 'view_myuser');
INSERT INTO `auth_permission` VALUES (44, 'Can add 文件', 12, 'add_fileupload');
INSERT INTO `auth_permission` VALUES (45, 'Can change 文件', 12, 'change_fileupload');
INSERT INTO `auth_permission` VALUES (46, 'Can delete 文件', 12, 'delete_fileupload');
INSERT INTO `auth_permission` VALUES (47, 'Can view 文件', 12, 'view_fileupload');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (13, '2020-05-22 08:11:45.514097', '1', 'Dynamic object (1)', 2, '[{\"changed\": {\"fields\": [\"dynamic_plays\"]}}]', 8, 2);
INSERT INTO `django_admin_log` VALUES (3, '2020-05-18 12:16:51.255744', '2', 'pan', 2, '[{\"changed\": {\"fields\": [\"mobile\", \"qq\", \"weChat\", \"last_login\"]}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (4, '2020-05-18 12:18:05.192470', '3', 'aiswfs', 1, '[{\"added\": {}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (5, '2020-05-18 12:19:35.664745', '8', '演员', 2, '[{\"changed\": {\"fields\": [\"song_lyrics\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (6, '2020-05-18 12:21:36.323921', '8', '演员', 2, '[{\"changed\": {\"fields\": [\"song_lyrics\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (7, '2020-05-18 12:31:48.410783', '8', '演员', 2, '[{\"changed\": {\"fields\": [\"song_lyrics\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (8, '2020-05-19 01:46:15.441122', '3', 'aiswfs', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (9, '2020-05-21 16:51:37.099554', '5', 'queen', 1, '[{\"added\": {}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (10, '2020-05-22 07:24:54.356991', '4', 'erjiang', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (11, '2020-05-22 07:24:54.502976', '5', 'queen', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (12, '2020-05-22 07:52:23.008160', '1', 'admin', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (14, '2020-05-31 13:22:56.894350', '1', '爱 都是对的', 2, '[]', 10, 2);
INSERT INTO `django_admin_log` VALUES (15, '2020-05-31 13:24:39.680415', '1', '爱 都是对的', 2, '[{\"changed\": {\"fields\": [\"song_file\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (16, '2020-05-31 13:31:23.119439', '1', '爱 都是对的', 2, '[{\"changed\": {\"fields\": [\"song_file\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (17, '2020-05-31 13:32:30.623033', '1', '爱 都是对的', 2, '[{\"changed\": {\"fields\": [\"song_release\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (18, '2020-05-31 13:32:32.998208', '1', '爱 都是对的', 2, '[]', 10, 2);
INSERT INTO `django_admin_log` VALUES (19, '2020-05-31 13:32:38.774211', '2', '体面', 2, '[{\"changed\": {\"fields\": [\"song_release\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (20, '2020-05-31 13:32:45.399258', '3', '三国恋', 2, '[{\"changed\": {\"fields\": [\"song_release\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (21, '2020-05-31 13:32:51.325801', '13', '爱过了 又怎样', 2, '[{\"changed\": {\"fields\": [\"song_release\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (22, '2020-05-31 13:33:09.449381', '10', 'Volar', 2, '[{\"changed\": {\"fields\": [\"song_release\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (23, '2020-05-31 14:33:21.476543', '2', 'Comment object (2)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (24, '2020-06-01 01:59:23.419399', '2', '体面', 2, '[{\"changed\": {\"fields\": [\"song_lyrics\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (25, '2020-06-01 02:07:07.554398', '3', '三国恋', 2, '[{\"changed\": {\"fields\": [\"song_lyrics\"]}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (26, '2020-06-02 02:52:31.885595', '6', 'aiswfs', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (27, '2020-06-02 02:52:31.888593', '7', 'old', 3, '', 11, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'index', 'comment');
INSERT INTO `django_content_type` VALUES (8, 'index', 'dynamic');
INSERT INTO `django_content_type` VALUES (9, 'index', 'label');
INSERT INTO `django_content_type` VALUES (10, 'index', 'song');
INSERT INTO `django_content_type` VALUES (11, 'user', 'myuser');
INSERT INTO `django_content_type` VALUES (12, 'index', 'fileupload');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-05-03 12:59:37.178031');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-05-03 12:59:38.731120');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-05-03 12:59:39.124142');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-05-03 12:59:39.141143');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2020-05-03 12:59:39.308153');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2020-05-03 12:59:39.390157');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2020-05-03 12:59:39.473162');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2020-05-03 12:59:39.492163');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2020-05-03 12:59:39.574168');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2020-05-03 12:59:39.581168');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2020-05-03 12:59:39.602169');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2020-05-03 12:59:39.782180');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2020-05-03 12:59:39.866185');
INSERT INTO `django_migrations` VALUES (14, 'index', '0001_initial', '2020-05-03 12:59:40.653230');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2020-05-03 12:59:40.764236');
INSERT INTO `django_migrations` VALUES (16, 'user', '0001_initial', '2020-05-03 14:44:00.508273');
INSERT INTO `django_migrations` VALUES (17, 'user', '0002_auto_20200504_1728', '2020-05-04 09:28:29.698405');
INSERT INTO `django_migrations` VALUES (18, 'user', '0003_myuser_position', '2020-05-10 07:47:18.603992');
INSERT INTO `django_migrations` VALUES (19, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-18 12:06:28.794158');
INSERT INTO `django_migrations` VALUES (20, 'index', '0002_fileupload', '2020-05-31 14:14:18.310064');
INSERT INTO `django_migrations` VALUES (21, 'user', '0004_auto_20200531_2203', '2020-05-31 14:14:18.459970');
INSERT INTO `django_migrations` VALUES (22, 'index', '0003_auto_20200531_2214', '2020-05-31 14:14:40.463657');
INSERT INTO `django_migrations` VALUES (23, 'index', '0004_delete_fileupload', '2020-05-31 14:24:00.264710');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('5k7yedavgqddonjgrve1gdxnk2rdq0ql', 'ODJmNmQzMjhlNTNhMTliY2Q1ZmQ4ZjQ4YzI5MGY3NjBlN2Y1YTEyZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYWNkMjA5MWZlMjAxY2U5M2Q0ZjFkZTMzNzM0NzNiYTYxNjM4MGQyIiwicGxheV9saXN0IjpbeyJzb25nX2lkIjo2LCJzb25nX3NpbmdlciI6Ilx1NTQzNFx1ODJlNVx1NWUwYyIsInNvbmdfbmFtZSI6Ilx1NTIyYlx1NTE4ZFx1OGJiMFx1OGQ3NyIsInNvbmdfdGltZSI6IjE4OTktMTItMzAifSx7InNvbmdfaWQiOjEyLCJzb25nX3NpbmdlciI6Ilx1Njc5N1x1OTFjN1x1NmIyMyIsInNvbmdfbmFtZSI6Ilx1NWMzMVx1NjYyZlx1OGZkOVx1NjgzNyIsInNvbmdfdGltZSI6IjE4OTktMTItMzAifSx7InNvbmdfaWQiOjExLCJzb25nX3NpbmdlciI6Ilx1NzM4Ylx1NTI5Ylx1NWI4Zi9cdTUzNjJcdTVkZTdcdTk3ZjMiLCJzb25nX25hbWUiOiJcdTU5N2RcdTVmYzNcdTUyMDZcdTYyNGIiLCJzb25nX3RpbWUiOiIxODk5LTEyLTMwIn1dfQ==', '2020-05-26 14:51:56.031499');
INSERT INTO `django_session` VALUES ('66sspps6sj5pnnxkg1kdnm50ys8vrh3u', 'OGYxZWI2MzdjOTkwZWNhODQ3MGVhNWVhNGM4M2Y0M2JhNWI3MTQ3Yjp7Imt3b3JkIjoiXHU0ZTA5XHU1NmZkXHU2MDRiIiwicGxheV9saXN0IjpbeyJzb25nX2lkIjo2LCJzb25nX3NpbmdlciI6Ilx1NTQzNFx1ODJlNVx1NWUwYyIsInNvbmdfbmFtZSI6Ilx1NTIyYlx1NTE4ZFx1OGJiMFx1OGQ3NyIsInNvbmdfdGltZSI6IjE4OTktMTItMzAifSx7InNvbmdfaWQiOjExLCJzb25nX3NpbmdlciI6Ilx1NzM4Ylx1NTI5Ylx1NWI4Zi9cdTUzNjJcdTVkZTdcdTk3ZjMiLCJzb25nX25hbWUiOiJcdTU5N2RcdTVmYzNcdTUyMDZcdTYyNGIiLCJzb25nX3RpbWUiOiIxODk5LTEyLTMwIn0seyJzb25nX2lkIjoxMywic29uZ19zaW5nZXIiOiJcdTVmMjBcdTYwZTBcdTY2MjUiLCJzb25nX25hbWUiOiJcdTcyMzFcdThmYzdcdTRlODYgXHU1M2M4XHU2MDBlXHU2ODM3Iiwic29uZ190aW1lIjoiMTg5OS0xMi0zMCJ9LHsic29uZ19pZCI6MTIsInNvbmdfc2luZ2VyIjoiXHU2Nzk3XHU5MWM3XHU2YjIzIiwic29uZ19uYW1lIjoiXHU1YzMxXHU2NjJmXHU4ZmQ5XHU2ODM3Iiwic29uZ190aW1lIjoiMTg5OS0xMi0zMCJ9LHsic29uZ19pZCI6Miwic29uZ19zaW5nZXIiOiJcdTRlOGVcdTY1ODdcdTY1ODciLCJzb25nX25hbWUiOiJcdTRmNTNcdTk3NjIiLCJzb25nX3RpbWUiOiIxODk5LTEyLTMwIn0seyJzb25nX2lkIjo1LCJzb25nX3NpbmdlciI6Ilx1Njg4MVx1NjU4N1x1OTdmMy9cdTczOGJcdTk0ZWVcdTRlYWUiLCJzb25nX25hbWUiOiJcdTZlZTFcdTZlZTEiLCJzb25nX3RpbWUiOiIxODk5LTEyLTMwIn1dLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTg3NWRjY2ZmZDU4YjEwMDRiM2E0YTA3NDFkYTY4OWU2MWU5ZWQ3NCJ9', '2020-05-18 08:04:46.398823');
INSERT INTO `django_session` VALUES ('e9pf5d6i9nd7wm5fbad9s7rembr2qokj', 'ZmQ4NWUyNWM0OTBjZGIyODc2YzI0ZTUyNmU3OWVjZTdlMmZhOWEzODp7InBsYXlfbGlzdCI6W3sic29uZ19pZCI6MTEsInNvbmdfc2luZ2VyIjoiXHU3MzhiXHU1MjliXHU1YjhmL1x1NTM2Mlx1NWRlN1x1OTdmMyIsInNvbmdfbmFtZSI6Ilx1NTk3ZFx1NWZjM1x1NTIwNlx1NjI0YiIsInNvbmdfdGltZSI6IjE4OTktMTItMzAifV0sIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NGZlMjM5ZjQ5Mjk5MjJmODZlYWE3NDljMjYyNGY3ZDg5N2ZiNzc4In0=', '2020-06-16 03:16:32.095724');

-- ----------------------------
-- Table structure for index_comment
-- ----------------------------
DROP TABLE IF EXISTS `index_comment`;
CREATE TABLE `index_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `index_comment_song_id_e60ecaa2`(`song_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_comment
-- ----------------------------
INSERT INTO `index_comment` VALUES (1, '点评一下', 'admin', '2020-05-04', 2);
INSERT INTO `index_comment` VALUES (3, '1515661', 'aiswfs', '2020-06-01', 6);
INSERT INTO `index_comment` VALUES (4, '好听', '匿名用户', '2020-06-01', 6);
INSERT INTO `index_comment` VALUES (5, '6545465', 'pan', '2020-06-01', 13);
INSERT INTO `index_comment` VALUES (6, '1212', 'pan', '2020-06-01', 11);
INSERT INTO `index_comment` VALUES (7, '曲子是好曲子，但是调子得换成我们八路军的', 'pan', '2020-06-01', 3);
INSERT INTO `index_comment` VALUES (8, '121212', 'pan', '2020-06-01', 2);

-- ----------------------------
-- Table structure for index_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `index_dynamic`;
CREATE TABLE `index_dynamic`  (
  `dynamic_id` int(11) NOT NULL AUTO_INCREMENT,
  `dynamic_plays` int(11) NOT NULL,
  `dynamic_search` int(11) NOT NULL,
  `dynamic_down` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`dynamic_id`) USING BTREE,
  INDEX `index_dynamic_song_id_21bb9711`(`song_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of index_dynamic
-- ----------------------------
INSERT INTO `index_dynamic` VALUES (1, 58, 45, 22, 1);
INSERT INTO `index_dynamic` VALUES (2, 99, 17, 25, 2);
INSERT INTO `index_dynamic` VALUES (3, 60, 35, 15, 3);
INSERT INTO `index_dynamic` VALUES (4, 4, 6, 2, 4);
INSERT INTO `index_dynamic` VALUES (5, 107, 7, 5, 5);
INSERT INTO `index_dynamic` VALUES (6, 338, 65, 50, 6);
INSERT INTO `index_dynamic` VALUES (7, 161, 53, 21, 7);
INSERT INTO `index_dynamic` VALUES (8, 38, 16, 35, 8);
INSERT INTO `index_dynamic` VALUES (9, 9, 12, 18, 9);
INSERT INTO `index_dynamic` VALUES (10, 131, 73, 35, 10);
INSERT INTO `index_dynamic` VALUES (11, 234, 72, 60, 11);
INSERT INTO `index_dynamic` VALUES (12, 81, 32, 45, 12);
INSERT INTO `index_dynamic` VALUES (13, 210, 54, 13, 13);

-- ----------------------------
-- Table structure for index_label
-- ----------------------------
DROP TABLE IF EXISTS `index_label`;
CREATE TABLE `index_label`  (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_label
-- ----------------------------
INSERT INTO `index_label` VALUES (1, '情感天地');
INSERT INTO `index_label` VALUES (2, '摇滚金属');
INSERT INTO `index_label` VALUES (3, '经典流行');
INSERT INTO `index_label` VALUES (4, '环境心情');
INSERT INTO `index_label` VALUES (5, '午后场景');
INSERT INTO `index_label` VALUES (6, '岁月流金');
INSERT INTO `index_label` VALUES (7, '青春校园');

-- ----------------------------
-- Table structure for index_song
-- ----------------------------
DROP TABLE IF EXISTS `index_song`;
CREATE TABLE `index_song`  (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_singer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_album` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_languages` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_release` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_img` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_lyrics` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `song_file` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`song_id`) USING BTREE,
  INDEX `index_song_label_id_9b9b68ed`(`label_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_song
-- ----------------------------
INSERT INTO `index_song` VALUES (1, '爱 都是对的', '胡夏', '1899-12-30', '胡 爱夏', '国语', '流行', '2010-12-08', '1.jpg', '暂无歌词', '1.m4a', 3);
INSERT INTO `index_song` VALUES (2, '体面', '于文文', '1899-12-30', '《前任3：再见前任》电影插曲', '国语', '伤感', '2017-12-25', '2.jpg', '33.lrc', '2.m4a', 4);
INSERT INTO `index_song` VALUES (3, '三国恋', 'Tank', '1899-12-30', 'Fighting！生存之道', '国语', '摇滚', '2006-04-15', '3.jpg', '44.lrc', '3.m4a', 2);
INSERT INTO `index_song` VALUES (4, '会长大的幸福', 'Tank', '1899-12-30', '第三回合', '国语', '励志', '2009-05-29 00:00:00', '4.jpg', '暂无歌词', '4.m4a', 4);
INSERT INTO `index_song` VALUES (5, '满满', '梁文音/王铮亮', '1899-12-30', '爱，一直存在', '国语', '甜蜜', '2009-11-20 00:00:00', '5.jpg', '暂无歌词', '5.m4a', 1);
INSERT INTO `index_song` VALUES (6, '别再记起', '吴若希', '1899-12-30', '别再记起', '粤语', '场景', '2017-12-07 00:00:00', '6.jpg', '暂无歌词', '6.m4a', 4);
INSERT INTO `index_song` VALUES (7, '爱的魔法', '金莎', '1899-12-30', '他不爱我', '国语', '甜蜜', '2012-03-19 00:00:00', '7.jpg', '暂无歌词', '7.m4a', 1);
INSERT INTO `index_song` VALUES (8, '演员', '薛之谦', '1899-12-30', '演员', '国语', '流行', '2015-06-05 00:00:00', '8.jpg', '22.lrc', '8.m4a', 3);
INSERT INTO `index_song` VALUES (9, '放爱情一个假', '许慧欣', '1899-12-30', '谜', '国语', '安静', '2006-10-01 00:00:00', '9.jpg', '暂无歌词', '9.m4a', 4);
INSERT INTO `index_song` VALUES (10, 'Volar', '侧田', '1899-12-30', 'No Protection', '粤语', '摇滚', '2006-07-05', '10.jpg', '暂无歌词', '10.m4a', 2);
INSERT INTO `index_song` VALUES (11, '好心分手', '王力宏/卢巧音', '1899-12-30', '2 Love 致情挚爱', '国语', '伤感', '2015-07-24 00:00:00', '11.jpg', '11.txt', '11.m4a', 1);
INSERT INTO `index_song` VALUES (12, '就是这样', '林采欣', '1899-12-30', '单曲', '国语', '流行', '2016-10-10 00:00:00', '12.jpg', '暂无歌词', '12.m4a', 3);
INSERT INTO `index_song` VALUES (13, '爱过了 又怎样', '张惠春', '1899-12-30', '单曲', '国语', '流行', '2016-09-07', '13.jpg', '暂无歌词', '13.m4a', 3);

-- ----------------------------
-- Table structure for user_myuser
-- ----------------------------
DROP TABLE IF EXISTS `user_myuser`;
CREATE TABLE `user_myuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weChat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `integral` int(11) NOT NULL,
  `level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `playlist` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_myuser
-- ----------------------------
INSERT INTO `user_myuser` VALUES (2, 'pbkdf2_sha256$120000$KaoTfJPItSd2$rsGeP8zNUX22VWYcWEK/LgyXqYCVdv2/B9XgYnUYnxw=', '2020-06-02 03:16:32.091718', 1, 'pan', '', '', 'pao123@qq.com', 1, 1, '2020-05-18 12:14:00.000000', '1024766276', 'xiapichi', '13983668119', 17, 'VIP用户', '[{\"song_id\": 2, \"song_singer\": \"\\u4e8e\\u6587\\u6587\", \"song_name\": \"\\u4f53\\u9762\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 6, \"song_singer\": \"\\u5434\\u82e5\\u5e0c\", \"song_name\": \"\\u522b\\u518d\\u8bb0\\u8d77\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 8, \"song_singer\": \"\\u859b\\u4e4b\\u8c26\", \"song_name\": \"\\u6f14\\u5458\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 13, \"song_singer\": \"\\u5f20\\u60e0\\u6625\", \"song_name\": \"\\u7231\\u8fc7\\u4e86 \\u53c8\\u600e\\u6837\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 1, \"song_singer\": \"\\u80e1\\u590f\", \"song_name\": \"\\u7231 \\u90fd\\u662f\\u5bf9\\u7684\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 3, \"song_singer\": \"Tank\", \"song_name\": \"\\u4e09\\u56fd\\u604b\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 12, \"song_singer\": \"\\u6797\\u91c7\\u6b23\", \"song_name\": \"\\u5c31\\u662f\\u8fd9\\u6837\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 10, \"song_singer\": \"\\u4fa7\\u7530\", \"song_name\": \"Volar\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 7, \"song_singer\": \"\\u91d1\\u838e\", \"song_name\": \"\\u7231\\u7684\\u9b54\\u6cd5\", \"song_time\": \"1899-12-30\"}, {\"song_id\": 11, \"song_singer\": \"\\u738b\\u529b\\u5b8f/\\u5362\\u5de7\\u97f3\", \"song_name\": \"\\u597d\\u5fc3\\u5206\\u624b\", \"song_time\": \"1899-12-30\"}]', 11);

-- ----------------------------
-- Table structure for user_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_myuser_groups`;
CREATE TABLE `user_myuser_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_myuser_groups_myuser_id_group_id_680fbae2_uniq`(`myuser_id`, `group_id`) USING BTREE,
  INDEX `user_myuser_groups_myuser_id_dfd02c0f`(`myuser_id`) USING BTREE,
  INDEX `user_myuser_groups_group_id_e21a6dfd`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_myuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_myuser_user_permissions`;
CREATE TABLE `user_myuser_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_myuser_user_permiss_myuser_id_permission_id_ae8df385_uniq`(`myuser_id`, `permission_id`) USING BTREE,
  INDEX `user_myuser_user_permissions_myuser_id_5d2dcfb0`(`myuser_id`) USING BTREE,
  INDEX `user_myuser_user_permissions_permission_id_d16c386c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_myuser_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
