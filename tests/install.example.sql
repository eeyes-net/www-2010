-- 仅供测试，只保留了有用的字段

DROP DATABASE IF EXISTS `test_eeyes_news`;
DROP DATABASE IF EXISTS `test_xjtu_know`;
DROP DATABASE IF EXISTS `test_dv`;



-- e瞳新闻数据库

CREATE DATABASE IF NOT EXISTS `test_eeyes_news` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `test_eeyes_news`;

CREATE TABLE `v9_announce` (
  `aid` SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` CHAR(80) NOT NULL,
  `endtime` DATE NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `v9_news` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
  `title` VARCHAR(80) NOT NULL DEFAULT '',
  `thumb` VARCHAR(100) NOT NULL DEFAULT '',
  `posids` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `url` CHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_announce` (`aid`, `title`, `endtime`) VALUES
  ('223', '【活动】第五届社团同乐会重磅来袭——独乐乐不如众乐乐', '2018-01-01'),
  ('224', '【活动】三行情书活动来袭', '2019-01-01'),
  ('225', '【讲座】留留学菁英俱乐部携手新东方带来主题讲座', '2020-01-01'),
  ('226', '【通知】团日活动有关通知', '2021-01-01'),
  ('227', '【活动】第四届模拟招聘大赛——勇往职前', '2022-01-01'),
  ('228', '【讲座】文爱讲座《万里丝绸七彩路》', '2023-01-01');

INSERT INTO `v9_news` (`catid`, `title`, `thumb`, `posids`, `url`) VALUES
-- e瞳关注
  ('1', '厨艺大赛精彩上演', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=21&id=1178'),
  ('1', '彭康书院2014手绘文化衫决赛举行', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=21&id=1177'),
  ('1', '扬帆社城墙公益暴走举行', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=21&id=1173'),
  ('1', '张嘉佳做客交大——从“全世界”到“你身边”', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=21&id=1172'),
  ('1', '筑梦青春，知性合一', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=21&id=1171'),
-- 校园新闻
  ('2', '我校学生创业项目获300万天使投资', '/Public/images/news_photo02.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=6&id=1195'),
  ('2', '小伙伴们，注意了，社团同乐会来袭了', '/Public/images/news_photo02.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=6&id=1175'),
  ('2', 'TEDxXJTU就要在交大开讲啦', '/Public/images/news_photo02.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=6&id=1166'),
  ('2', '外国语学院2014级新生开学典礼暨专业教育会举行', '/Public/images/news_photo02.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=6&id=1163'),
  ('2', '第十二届“新生杯” 综合棋类比赛开始报名啦', '/Public/images/news_photo02.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=6&id=1161'),
-- 异同争鸣
  ('3', '“春苗”远航', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=10&id=957'),
  ('3', '乖气致戾，和气致祥——“8.24”儿童被挖双眼案能否避免？', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=10&id=910'),
  ('3', '用快乐领悟清苦的价值——玉树小学组有感', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=10&id=908'),
  ('3', '饱含一种信念，去经历另一种可能', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=10&id=906'),
  ('3', '青春感想-------致我们正拥有着的青春', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=10&id=870'),
-- 人物专访
  ('4', '专访张嘉佳：从你的全世界路过后，让我留在你身边', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=11&id=1176'),
  ('4', '独家专访沈杨书社三任社长：二十年风雨沈杨路', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=11&id=1174'),
  ('4', '懒人馆：六个学生的不凡创业梦', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=11&id=1154'),
  ('4', '棋如人生------采访棋牌协会会长刘鑫浩', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=11&id=1134'),
  ('4', '让运动不只是运动————专访极限飞盘社社长刘尧', '/Public/images/news_photo01.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=11&id=1133'),
-- 博客天下
  ('5', '民族自决权的贫困', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=12&id=1164'),
  ('5', '举哭若笑周星驰', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=12&id=1157'),
  ('5', '数字音乐平台化：免费音乐时代一去不复返', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=12&id=753'),
  ('5', '5元过一天 大学生挑战城市生存', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=12&id=1013'),
  ('5', '支付宝猛踩微信背后，折射自身三大痛点', '/Public/images/news_photo03.jpg', '0', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=12&id=951'),
-- 置顶新闻
  ('6', '樱花小知识', 'http://news.eeyes.net/uploadfile/2013/0403/thumb_90_0_20130403124322133.jpg', '1', 'http://news.eeyes.net/html/special/2013/0403/71.html'),
  ('6', '关于“相约交大赏樱花”校园开放日的倡议书', 'http://news.eeyes.net/uploadfile/2013/0403/thumb_90_0_20130403124436936.jpg', '1', 'http://news.eeyes.net/html/special/2013/0403/72.html'),
  ('6', '樱花种植史', 'http://news.eeyes.net/uploadfile/2013/0403/thumb_90_0_20130403011405604.jpg', '1', 'http://news.eeyes.net/html/special/2013/0403/73.html'),
  ('6', '【往期回顾】樱花祭精彩上演，cosplay放异彩', 'http://news.eeyes.net/uploadfile/2013/0403/thumb_90_0_20130403012930368.jpg', '1', 'http://news.eeyes.net/html/special/2013/0403/76.html'),
  ('6', '【往期回顾】樱花祭，cos展', 'http://news.eeyes.net/uploadfile/2012/0412/20120412085849872.jpg', '1', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=8&id=23'),
  ('6', '第五届樱花祭', 'http://news.eeyes.net/uploadfile/2013/0403/thumb_90_0_20130403074108227.jpg', '1', 'http://news.eeyes.net/index.php?m=content&c=index&a=show&catid=8&id=51');



-- 交大知道数据库

CREATE DATABASE IF NOT EXISTS `test_xjtu_know` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `test_xjtu_know`;

CREATE TABLE `question` (
  `question_id` INT NOT NULL AUTO_INCREMENT,
  `question_content` TEXT NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `question` (`question_id`, `question_content`) VALUES
  ('1838', '有不少同学吐槽我交部分女生太傲娇，这些女生们你们真的那么diao吗？'),
  ('1775', '怎么鉴别一个男人是好男人'),
  ('1784', '怎么控制自己的脾气？'),
  ('1786', '西安交大13届航天学院的一女生,短发,背着棕色的adidas的包,叫什么名字啊,求认识!!'),
  ('1785', '你会过圣诞节吗？还是习惯过中国自己的传统节日？'),
  ('1799', '你说，圣诞节最大的意义是什么呢？是陪女友独享两个人的浪漫还是和早已失去联系的人谈笑一下？'),
  ('1804', '你们都讨厌什么样的人或者别人做什么事情？'),
  ('1802', '在离开之前，你最想做的十件事是什么？列出之后，请删除其中五个，再看一下什么感觉？'),
  ('1778', '怎么利用圣诞节追女生呢？'),
  ('1790', '单身的人怎么过圣诞。。。求同为单身的人指点');



-- 爱影视数据库

CREATE DATABASE IF NOT EXISTS `test_dv` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `test_dv`;

CREATE TABLE `movie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `introduction` TEXT NOT NULL,
  `count` INT NOT NULL,
  `add_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `movie` (`id`, `title`, `introduction`, `count`, `add_time`) VALUES
  ('1', '爱影视示例视频1', '爱影视示例视频1', '11', '2013-01-01'),
  ('2', '爱影视示例视频2', '爱影视示例视频2', '22', '2014-01-01'),
  ('3', '爱影视示例视频3', '爱影视示例视频3', '33', '2015-01-01'),
  ('4', '爱影视示例视频4', '爱影视示例视频4', '44', '2016-01-01'),
  ('5', '爱影视示例视频5', '爱影视示例视频5', '55', '2017-01-01');
