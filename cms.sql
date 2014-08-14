/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost
 Source Database       : cms

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 08/14/2014 11:49:39 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cms_adver`
-- ----------------------------
DROP TABLE IF EXISTS `cms_adver`;
CREATE TABLE `cms_adver` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `info` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_adver`
-- ----------------------------
BEGIN;
INSERT INTO `cms_adver` VALUES ('1', '腾讯新广告', '', 'http://qq.com', '腾讯新广告腾讯新广告', '1', '1', '2014-05-26 10:00:01'), ('2', '新浪微博', '', 'http://weibo.com', '新浪微博', '1', '1', '2014-05-26 10:00:53'), ('3', '淘宝广告', '', 'http://taobao.com', '淘宝广告', '1', '1', '2014-05-26 10:01:13'), ('5', 'bb霜', '/uploads/20140526/20140526100229144.png', 'http://baidu.com', 'bb霜', '2', '1', '2014-05-26 10:02:35'), ('6', 'bb霜', '/uploads/20140526/20140526100324693.png', 'http://php.net', 'bb霜', '2', '1', '2014-05-26 10:03:28'), ('7', '侧栏', '/uploads/20140526/20140526140713895.png', 'http://taobao.com', '', '3', '1', '2014-05-26 10:03:53'), ('8', '侧栏', '/uploads/20140526/20140526140757784.png', 'http://taobao.com', '', '3', '1', '2014-05-26 10:04:27');
COMMIT;

-- ----------------------------
--  Table structure for `cms_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `manner` tinyint(1) NOT NULL,
  `cid` mediumint(8) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `sustain` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持',
  `oppose` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_comment`
-- ----------------------------
BEGIN;
INSERT INTO `cms_comment` VALUES ('15', '游客', '期待，赞！！！！！', '1', '0', '56', '2014-08-14 11:41:49', '1', '0'), ('16', '樱桃小丸子', '非常不错！赞！！！', '1', '0', '56', '2014-08-14 11:42:50', '2', '0'), ('17', '路飞', '挺好的，支持 支持', '1', '1', '57', '2014-08-14 11:45:25', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `cms_content`
-- ----------------------------
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '//编号',
  `title` varchar(50) NOT NULL COMMENT '//标题',
  `nav` mediumint(8) unsigned NOT NULL COMMENT '//栏目号',
  `attr` varchar(20) NOT NULL COMMENT '//属性',
  `tag` varchar(30) NOT NULL COMMENT '//标签',
  `keyword` varchar(30) NOT NULL COMMENT '//关键字',
  `thumbnail` varchar(100) NOT NULL COMMENT '//缩略图',
  `source` varchar(20) NOT NULL COMMENT '//文章来源',
  `author` varchar(10) NOT NULL COMMENT '//作者',
  `info` varchar(200) NOT NULL COMMENT '//简介',
  `content` text NOT NULL COMMENT '//详细内容',
  `commend` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//是否允许评论',
  `count` smallint(6) NOT NULL DEFAULT '0' COMMENT '//浏览次数',
  `gold` smallint(6) NOT NULL DEFAULT '0' COMMENT '//消费金币',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//排序',
  `readlimit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//阅读权限',
  `color` varchar(20) NOT NULL COMMENT '//颜色',
  `date` datetime NOT NULL COMMENT '//发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_content`
-- ----------------------------
BEGIN;
INSERT INTO `cms_content` VALUES ('44', '《无头骑士异闻录》第二季再曝视觉图', '14', '推荐,头条', '无头骑士异闻录', '无头骑士异闻录,第二季', '/uploads/20140814/20140814104402336.jpg', '腾讯动漫', 'admin', '即将于2015年1月开始播出的《无头骑士异闻录》第2季《无头骑士异闻录×2》曝光了视觉图第2弹。还记得不久前公开的第1弹视觉图画的是龙峰帝人、纪田正臣和园原杏里这3名', '<p>即将于2015年1月开始播出的《无头骑士异闻录》第2季《无头骑士异闻录&times;2》曝光了视觉图第2弹。还记得不久前公开的第1弹视觉图画的是龙峰帝人、纪田正臣和园原杏里这3名主角，这次曝光的第2弹视觉图同样也画了3个人。左右两名女性角色是折原临也的两个双胞胎妹妹九瑠璃和舞流，中间扁着嘴巴、站得笔挺挺的男生是第2季的新登场角色黑沼青叶。</p>\r\n\r\n<p>《无头骑士异闻录》原作是成田良悟创作的系列轻小说作品，累计销量500万本。本作以池袋为舞台，讲述生活在这里的形形色色的人物的故事。TV动画第1季2010年1月播出，出演声优有泽城美雪、丰永利行、宫野真守、花泽香菜、神谷浩史等。</p>\r\n\r\n<p>《无头骑士异闻录&times;2》2015年1月播出</p>\r\n\r\n<p><strong>【STAFF】</strong></p>\r\n\r\n<p>原作：成田良悟《无头骑士异闻录》（电击文库出版）</p>\r\n\r\n<p>原作插画：安田典生</p>\r\n\r\n<p>导演：大森贵弘</p>\r\n\r\n<p>系列构成：高木登</p>\r\n\r\n<p>角色设定：岸田隆宏</p>\r\n\r\n<p>总作画监督：高田晃</p>\r\n\r\n<p>动作作画监督：山田起生</p>\r\n\r\n<p>美术：伊藤圣</p>\r\n\r\n<p>美术设定：藤濑智康</p>\r\n\r\n<p>小道具设计：山崎绘里</p>\r\n\r\n<p>色彩设计：宫胁裕美</p>\r\n\r\n<p>CG制作：神林宪和</p>\r\n\r\n<p>编辑：关一彦</p>\r\n\r\n<p>摄影：田村仁</p>\r\n\r\n<p>音乐：吉森信</p>\r\n\r\n<p>动画制作：朱夏</p>\r\n', '0', '226', '0', '2', '2', 'blue', '2014-04-04 13:20:33'), ('45', 'AnimePower武汉动漫展9月登陆江城', '16', '推荐,头条', '武汉动漫', '武汉动漫', '/uploads/20140814/20140814102331697.jpg', '腾讯动漫', 'admin', '武汉动漫展近来有如雨后春笋之势， 然而，9月6~7日举办的AnimePower武汉动漫展（简称（AP动漫展）主办泽群别出心裁，筹划了一场不同于以往武汉漫展的动漫盛宴。', '<p>武汉<a href=\"http://comic.qq.com/\" target=\"_blank\">动漫</a>展近来有如雨后春笋之势， 然而，9月6~7日举办的AnimePower武汉动漫展（简称（AP动漫展）主办泽群别出心裁，筹划了一场不同于以往武汉漫展的动漫盛宴。</p>\r\n\r\n<p>据悉，首届AP动漫展主打声优与画师，请来了在《草莓棉花糖》、《白色相薄2》、《我的妹妹哪有那么可爱》、《惊爆草莓》、《<a href=\"http://comic.qq.com/z/bleach/\" target=\"_blank\">死神</a>》中有精彩表现的日本知名声优生天目仁美以及卡牌<a href=\"http://comic.qq.com/mini/mini.shtml\" target=\"_blank\">游戏</a>《扩散性百万亚瑟王》的高人气角色妮妙的人设&mdash;&mdash;日本画师refeia。</p>\r\n\r\n<p>这是史上首次有日本声优来武汉举办声优见面会，开创了武汉动漫展真正接轨国际的先河。主办方表示，在期盼得到大家的认可和支持的同时，AP动漫展将回应动 漫迷的期待继续请日本知名声优与大家见面，可以不用大费周折的远赴外地，更不用专程飞往日本，在武汉本土就能见到自己喜爱的声优，并能与声优互动！这对武 汉动漫迷来说无疑一个天大的福音。</p>\r\n\r\n<p>目前名为&ldquo;AnimePower官博君&rdquo;的AP动漫展官方微博正在进行&ldquo;你想要哪个声优来武 汉&rdquo;的邀请声优调查活动，不光得到了武汉本土动漫迷们的热烈反响，更得到了全国各地动漫迷们的响应与支持。据相关人士透露，主办方在期待首届AP动漫展得 到大家支持，取得圆满成功的同时，也在企划着明年的动漫展。明年企划中的AP动漫展有两场，届时邀请的声优将综合广大漫迷的意见，力求邀请到漫迷们喜爱的 声优来武汉跟全国的动漫迷们见面互动。</p>\r\n\r\n<p>据悉，日本知名画师refeia是9月6~7日 都会在漫展现场的，会现场作画、与观众互动，还有签售。网络上的&ldquo;妮妙狂人&rdquo;为了见&ldquo;准岳父&rdquo;refeia已买好票，请好假，准备不远万里前来&ldquo;拜见岳 父&rdquo;，由此可见refeia的画也是极具魔性，非常吸引人的。refeia著有的萌绘教科书（萌え絵の教科書）是给初学者的教科书，也有着相当的人气。主 办方希望透过refeia让动漫迷们找到画画的信心，重燃画自己喜欢的东西的热情，能够更加贴近二次元。</p>\r\n', '1', '127', '0', '0', '0', '', '2014-05-04 13:53:35'), ('51', 'UF动漫展开幕柿原彻也堀江由衣领衔', '16', '头条,推荐,加粗', '磐石', '堀江由衣,柿原彻也,UF动漫展', '/uploads/20140814/20140814101929568.jpg', '', 'admin', '离UF开幕只有不到半个月的时间了！各位小伙伴是不是都做好一切准备，来UF各种买买买看看看拍拍拍赞赞赞呢！！', '<p>离UF开幕只有不到半个月的时间了！各位小伙伴是不是都做好一切准备，来UF各种买买买看看看拍拍拍赞赞赞呢！UF组委会的大家和秋子一起，为大家准备了一份深圳暑期最奢华的活动盛宴，一次性满足您所有的愿望！那么，今天就和秋子一起来看看舞台和签售台的精彩活动吧！</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/20140814/20140814111252764.jpg\" style=\"height:890px; width:640px\" /></p>\r\n', '1', '267', '0', '0', '0', '', '2014-05-21 14:23:25'), ('52', '十月新番《天体的秩序》片尾曲歌手公布', '14', '无属性', '天体的秩序', '天体的秩序,十月新番', '/uploads/20140814/20140814104659755.jpg', '腾讯动漫', 'admin', '即将于今年十月起开播的秋季新番《天体的秩序》公开了最新片尾曲情报。据悉，《天体的秩序》片尾曲“星屑のインターリュード”将由fhana献唱。', '<p>即将于今年十月起开播的秋季新番《天体的秩序》公开了最新片尾曲情报。据悉，《天体的秩序》片尾曲&ldquo;星屑のインターリュード&rdquo;将由fhana献唱。 fhana曾经以演唱TV动画《有顶天家族》的片尾曲&ldquo;ケセラセラ&rdquo;在Lantis正式出道，此后为《银狐》、《魔女的使命》以及《我们大家的河合庄》等 多部作品献唱主题曲。</p>\r\n\r\n<p>另外，OP主题曲&ldquo;Stargazer&rdquo;曾经已经为大家报道过，将会由所属北海道为主要活动地 点的音乐创作团体I&#39;ve的Larval Stage Planning献唱。一同收录的CP曲&ldquo;North Method&rdquo;将会是《天体的秩序》的印象曲，在此前发布的PV中我们可以提前尝鲜。</p>\r\n\r\n<p>《天体的秩序（天体のメソッド）》由日本知名<a href=\"http://comic.qq.com/pic/comictongren01.shtml\" target=\"_blank\">同人</a>剧 本作家久弥直树，携手画师QP：flapper（由さくら小春、小原トメ太组成的绘师组合）共同打造的原创电视动画。故事撞树某日在雾弥湖的上空中出现了 谜样的圆盘，一度造成全世界的混乱与恐慌，但飞碟却只停留在空中，并没有进一步的行动。在时间流逝中人们渐渐对这件事失去了兴趣......就在两名少女 相遇后，静止的时间再次流动，让众人有所改变的全新故事展开，中学生活最后那一年，将拥有一生无法忘怀的回忆。</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/20140814/20140814111227589.jpg\" style=\"height:433px; width:480px\" /></p>\r\n\r\n<p><strong>【STAFF】</strong></p>\r\n\r\n<p>监督：迫井政行</p>\r\n\r\n<p>原案・脚本：久弥直树</p>\r\n\r\n<p>人物原案：QP:flapper</p>\r\n\r\n<p>人物设定・总作画监督：秋谷有纪惠</p>\r\n\r\n<p>大道具：りぱ</p>\r\n\r\n<p>小道具：古泽祐纪子</p>\r\n\r\n<p>美术设定：金平和茂（KUSANAGI）</p>\r\n\r\n<p>美术监督：伊藤弘（KUSANAGI）</p>\r\n\r\n<p>色彩设计：加藤里惠</p>\r\n\r\n<p>摄影监督：出水田和人（T2 studio）</p>\r\n\r\n<p>编辑：定松刚（SATELGHT）</p>\r\n\r\n<p>音响监督：明田川仁</p>\r\n\r\n<p>音乐制作：Lantis</p>\r\n\r\n<p>印象曲：Larval Stage Planning「North Method」</p>\r\n\r\n<p>制片：infinite</p>\r\n\r\n<p>动画制作：Studio 3Hz</p>\r\n\r\n<p><strong>【CAST】</strong></p>\r\n\r\n<p>古宮乃乃香：夏川椎菜</p>\r\n\r\n<p>椎原小春：佳村遥</p>\r\n\r\n<p>水坂柚季：丰崎爱生</p>\r\n\r\n<p>户川汐音：小松未可子</p>\r\n\r\n<p>诺艾露：水濑祈</p>\r\n\r\n<p>水坂凑太：石川界人</p>\r\n\r\n<p><strong>【主题曲】</strong></p>\r\n\r\n<p>OP：Stargazer</p>\r\n\r\n<p>唱：Larval Stage Planning</p>\r\n\r\n<p>ED：星屑のインターリュード</p>\r\n\r\n<p>唱：fhana</p>\r\n', '1', '102', '0', '0', '0', '', '2014-08-14 10:47:25'), ('53', '这是真爱！盘点羡煞旁人的校园情侣', '15', '无属性', '真爱,cp', '真爱,cp', '/uploads/20140814/20140814105137495.jpg', '腾讯动漫', 'admin', '纯纯的爱恋，青涩的初恋，校园中的点点滴滴，那段青葱的过往，那段美好的时光，都将成为我们日后回忆的美好记忆，不敢开口的，不好意思的，害羞的，腼腆 的，还未说出口的还有已经说出口的感情随着时光的流逝慢慢', '<p>纯纯的爱恋，青涩的初恋，校园中的点点滴滴，那段青葱的过往，那段美好的时光，都将成为我们日后回忆的美好记忆，不敢开口的，不好意思的，害羞的，腼腆 的，还未说出口的还有已经说出口的感情随着时光的流逝慢慢淡去，能在青涩的校园生活中添加一段浪漫的爱情也是人生中的一大美好，接下来就为大家盘点二次元 中那些明里暗里成双成对的情侣们，请准备好墨镜~</p>\r\n\r\n<p>校园纯爱剧代表作《好想急死你》，传说中的&ldquo;贞子&rdquo;浓黑的长发，就算是在盛夏也是惨白的皮肤，阴沉的脸，连笑容都让人感到恐惧的女生&mdash;&mdash;黑沼爽子，一个早 已经被遗忘的名字，被大家称做&ldquo;贞子&rdquo;，从小学到高中都是如此，几乎没有人知道她的本名，天天都被人害怕着。其实她只是阴沉了一点，笑起来有点恐怖，周围 的空气流动比较诡异点而已。爽子很想很想和大家融洽的相处，很想很想尽自己的力量去帮助大家，她有一颗很温柔、善良、纯洁的心，但是却包裹在&ldquo;贞子&rdquo;的外 貌下&hellip;&hellip;就这样被大家误解了、害怕了。直到风早的出现，阳光耀眼的他，亲切度、爽朗度100%，会对着被称做&ldquo;贞子&rdquo;的爽子微笑，和她说话，发现她那颗纤 细而温柔的心，并且第一个叫出了她的名字&hellip;&hellip;&ldquo;爽朗王子&rdquo;和被称为&ldquo;女鬼贞子&rdquo;的校园爱情故事开始了~</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', '101', '0', '0', '0', '', '2014-08-14 10:51:55'), ('54', '《夏目友人帐》之带给他温暖的角色们', '15', '无属性', '夏目友人帐', '夏目友人帐', '/uploads/20140814/20140814105336978.jpg', '腾讯动漫', 'admin', '说起治愈番，大家最熟悉的就是《夏目友人帐》了，每一个故事看似不相连，却有着千丝万缕的关系，也许一开始你看着索然无味，但是看着看着你会发现感动是一 点一滴积累的，说夏目是治愈之王一点也不为过', '<p>说起治愈番，大家最熟悉的就是《夏目友人帐》了，每一个故事看似不相连，却有着千丝万缕的关系，也许一开始你看着索然无味，但是看着看着你会发现感动是一 点一滴积累的，说夏目是治愈之王一点也不为过。那些令我们哭过、笑过、伤心过、大笑过的角色们，不止治愈了主人公夏目贵志，也治愈了我们。下面就带大家一 起回忆配夏目走过春夏秋冬的角色们~</p>\r\n\r\n<p>&nbsp;作为带给夏目温暖的还一直陪在他身边的，娘口三三第二谁敢第一？斑是一只高级妖怪，被封印在招财猫里，因为夏目不小心弄断封印的绳子而被解放，作为宠物 猫和保镖与夏目一起生活着，但是因为多年被封印在招财猫中而被同化了，日常行为作风带有浓重的猫习气。自傲的他成为夏目的保镖后要夏目尊称他&ldquo;猫咪老 师&rdquo;，但很多时候都被戏弄。本与夏目约定其死后友人帐就归他，然而在与夏目相处中逐渐被感化。爱酗酒且酒品奇差，五音不全。喜欢吃馒头，与夏目表面上无时 无刻不在斗嘴，其实非常重视夏目的~</p>\r\n', '1', '105', '0', '0', '0', '', '2014-08-14 10:53:40'), ('55', '《魔法少女伊莉雅2》角色歌专辑十月发售', '18', '无属性', '魔法少女伊莉雅', '魔法少女伊莉雅2', '/uploads/20140814/20140814105556843.jpg', '腾讯动漫', 'admin', '于今年7月起开播的系列TV动画续作《Fate/kaleid liner 魔法少女☆伊莉雅 2wei！》公开了其角色歌曲CD“Prisma☆Love Parade”的具体发售时间，', '<p>于今年7月起开播的系列TV动画续作《Fate/kaleid liner 魔法少女☆伊莉雅 2wei！》公开了其角色歌曲CD&ldquo;Prisma☆Love Parade&rdquo;的具体发售时间，为10月29日、11月26日以及12月24日。正如大家所见，这次的伊莉雅二期角色曲专辑共分三张，vol.1将会在 10月29日最先发售，另外两张则分别会在随后的11月26日和12月24日发售。届时vol.1中会收录伊莉雅（CV：门胁舞以）以及小黑（CV：斋藤 千和）的个人角色歌曲，有兴趣的朋友可以通过官网查看。</p>\r\n\r\n<p>《Fate/kaleid liner 魔法少女☆伊莉雅 2wei!》改编自TYPE-MOON原作、广山弘作画的同名漫画，也是曾于2013年7月播放的电视动画《Fate/kaleid liner 魔法少女☆伊莉雅》的第二期作品。故事讲述一个就读穗群原学园的普通女孩伊莉雅，某天突然被万花筒之杖的人工天然精灵魔法红宝石强制缔结契约，成为了魔法 少女伊莉雅。她在万花筒之杖前任持有者远坂凛的命令下，开始被迫帮忙回收阶级卡片的故事。</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/20140814/20140814111203796.jpg\" style=\"height:650px; width:458px\" /></p>\r\n\r\n<p><strong>【STAFF】</strong></p>\r\n\r\n<p>原作：广山弘、TYPE-MOON</p>\r\n\r\n<p>企划：安田猛</p>\r\n\r\n<p>总监督：大沼心</p>\r\n\r\n<p>监督：神保昌登</p>\r\n\r\n<p>系列构成：井上坚二</p>\r\n\r\n<p>剧本：水濑叶月</p>\r\n\r\n<p>角色设计：牛岛希</p>\r\n\r\n<p>美术监督：立石健</p>\r\n\r\n<p>编辑：坪根健太郎</p>\r\n\r\n<p>音响监督：土屋雅纪</p>\r\n\r\n<p>音响制作：DAX Production</p>\r\n\r\n<p>音乐：加藤达也</p>\r\n\r\n<p>音乐制作：Lantis</p>\r\n\r\n<p>动画制作：SILVER LINK.</p>\r\n\r\n<p>OP：moving soul（栗林美奈实）</p>\r\n\r\n<p>ED：TWO BY TWO（幸田梦波）</p>\r\n\r\n<p><strong>【CAST】</strong></p>\r\n\r\n<p>伊莉雅丝菲尔&middot;冯&middot;艾因兹贝伦：门胁舞以</p>\r\n\r\n<p>美游&middot;艾蒂菲尔特：名冢佳织</p>\r\n\r\n<p>小黑：斋藤千和</p>\r\n\r\n<p>远坂凛：植田佳奈</p>\r\n\r\n<p>露维亚瑟琳塔&middot;艾蒂菲尔特：伊藤静</p>\r\n\r\n<p>红宝石之星：高野直子</p>\r\n\r\n<p>蓝宝石之星：松来未佑</p>\r\n\r\n<p>卫宫士郎：杉山纪彰</p>\r\n\r\n<p>莎拉：寺田春日</p>\r\n\r\n<p>莉丝：宫川美保</p>\r\n\r\n<p>藤村大河：伊藤美纪</p>\r\n\r\n<p>森山那奈龟：伊濑茉莉也</p>\r\n\r\n<p>岳间泽龙子：加藤英美里</p>\r\n\r\n<p>栗原雀花：伊藤加奈惠</p>\r\n\r\n<p>桂美美：佐藤聪美</p>\r\n\r\n<p>巴泽特&middot;弗拉加&middot;马克雷密斯：生天目仁美</p>\r\n\r\n<p>卡莲&middot;奥尔黛西亚：小清水亚美</p>\r\n\r\n<p>爱丽斯菲尔&middot;冯&middot;爱因兹贝伦：大原沙耶香</p>\r\n\r\n<p>卫宫切嗣：小山力也</p>\r\n', '1', '106', '0', '0', '0', '', '2014-08-14 10:56:04'), ('56', '《纯白交响曲》蓝光BOX将于平安夜发售', '18', '无属性', '纯白交响曲', '纯白交响曲', '/uploads/20140814/20140814105811724.jpg', '腾讯动漫', 'admin', '2011年10月，根据人气恋爱美少女游戏改编的同名动画《纯白交响曲》同广大动漫迷见面。这一部作品是由曾经负责过《只有神知道的世界》等大人气作品的manglobe进行制作', '<p>2011年10月，根据人气恋爱美少女游戏改编的同名动画《纯白交响曲》同广大动漫迷见面。这一部作品是由曾经负责过《只有神知道的世界》等大人气作品的manglobe进行制作，故事当中细腻的剧情刻画以及个性丰满的美少女们无不给观众留下了深刻的印象，当然作品最后的结局也引起了不少争议。而近日，官方宣布将在2014年12月24日发售该作品的蓝光BOX，在平安夜之际有了这样一部动画相伴，恐怕很多独守空闺的宅人们也能得到一丝安慰了吧？</p>\r\n\r\n<p>此次的蓝光BOX将收录本篇剧情（约282分钟、12集）以及约72分钟的映像特典。而其他特典方面将包括：</p>\r\n\r\n<p>1.动画版最新设计的外包装</p>\r\n\r\n<p>2.特制精美手册</p>\r\n\r\n<p>3. 映像特典《纯白白金》、另一个故事&ldquo;她的颜色是爱理&rdquo;、无字幕版主题曲画面、无字幕版片尾曲画面、MV（爱理/樱乃）、MV（安洁莉娜&middot;菜夏&middot;史威尔/天 羽美羽/纱凪）、安洁莉娜与樱乃的迎接大作战、欢迎来到干家、真人影像（小野凉子、吉田真弓、樱井好美）、结尾卡片等。</p>\r\n\r\n<p>《纯白交响曲》蓝光BOX售价为23760日元。</p>\r\n\r\n<p><strong>【剧情梗概】</strong></p>\r\n\r\n<p>男 主角瓜生新吾是&ldquo;各务台学园&rdquo;的普通学生。不过该学校由于各种原因的关系，在新学期开始的时候将同名叫&ldquo;结姬女子学园&rdquo;的名门女校进行合并。为了让学生能 够更加融洽地相处，校方在新学期开始之前实行了试行合并，包括新吾在内的数十名各务台学园生试验性地到结女学园上学。而男生的出现也在女校引发了不小的骚 动，众多个性丰富的妹子们也扎堆似的出现在了男主角的面前。那么包围在后宫般的环境当中，新吾又将从何选择呢&hellip;&hellip;</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/20140814/20140814111127464.jpg\" style=\"height:400px; width:640px\" /></p>\r\n\r\n<p><strong>【制作人员】</strong></p>\r\n\r\n<p>原作 ： Palette</p>\r\n\r\n<p>导演 ： 菅沼荣治</p>\r\n\r\n<p>人设&middot;总作画导演 ： 川村敏江</p>\r\n\r\n<p>系列构成 ： Team RIKKA</p>\r\n\r\n<p>道具设计 ： 新沼大祐</p>\r\n\r\n<p>美术导演 ： 佐藤步</p>\r\n\r\n<p>色彩设计 ： 中尾总子</p>\r\n\r\n<p>摄影导演 ： 高桥贤司</p>\r\n\r\n<p>编辑 ： 长坂智树</p>\r\n\r\n<p>音响导演 ： 矢野SATOSI</p>\r\n\r\n<p>音乐 ： 虹音</p>\r\n\r\n<p>制作人 ： 深尾聪志、冈田登志男、田中信作、樱井优香</p>\r\n\r\n<p>动画制作 ： 河内山隆、工藤博</p>\r\n\r\n<p>制作公司 ： Manglobe</p>\r\n\r\n<p>制作 ： 纯白交响曲制作委员会（Frontier Works、Media Factory、Lantis）</p>\r\n\r\n<p><strong>【声优名单】</strong></p>\r\n\r\n<p>瓜生新吾 ：水岛大宙</p>\r\n\r\n<p>濑名爱理 ：小野凉子</p>\r\n\r\n<p>瓜生樱乃 ：后藤麻衣</p>\r\n\r\n<p>天羽美羽 ：力丸乃梨子</p>\r\n\r\n<p>干纱凪 ：吉田真弓</p>\r\n\r\n<p>安洁莉娜&middot;菜夏&middot;史威尔 ：壹智村小真</p>\r\n\r\n<p>小熊喵、妈妈喵、濑名兰华 ：樱井浩美</p>\r\n\r\n<p>椋梨隼太 ：铃木达央</p>\r\n\r\n<p>八冢万智 ：瑞泽溪</p>\r\n\r\n<p>小野宫结月 ：田口宏子</p>\r\n\r\n<p>浅仓树 ：赤崎千夏</p>\r\n\r\n<p>雨石由香里、少女、打工者 ：辻步美</p>\r\n\r\n<p>雪森美津子、同班同学 ：三宅麻理惠</p>\r\n\r\n<p>风川真澄 ：横山菜菜</p>\r\n\r\n<p>水原浩一、男学生 ：逢坂良太</p>\r\n\r\n<p>佐佐木勇介、男学生 ：伊势文秀</p>\r\n\r\n<p>调理实习讲师 ：石田嘉代</p>\r\n\r\n<p>体育教师 ：冈田幸子</p>\r\n', '1', '113', '0', '0', '0', '', '2014-08-14 10:58:17'), ('57', '彩虹小马MY LITTLE PONY:评测 好玩易上瘾', '20', '无属性', '彩虹小马,MY LITTLE PONY', '彩虹小马,MY LITTLE PONY', '/uploads/20140814/20140814113456697.jpg', '腾讯动漫', 'admin', '彩虹小马(MYLITTLEPONY)是由著名的游戏公司开发公司gameloft最新推出的一款模拟经营类游戏今年正值彩虹小马系类动画片上映30 周年，这部在美国深受用户喜爱的动画篇', '<p>彩虹小马(MYLITTLEPONY)是由著名的游戏公司开发公司gameloft最新推出的一款模拟经营类游戏，今年正值彩虹小马系类动画片上映30 周年，这部在美国深受用户喜爱的动画篇，在美国的地位和喜羊羊与灰太狼在中国的地位是一样的，所以这款游戏在上市的时候就会用户广大的玩家基础。在这款游 戏玩家将会扮演一只名叫TwilightSparkle的小马，在众多朋友的帮助下建造一个属于自己的小马乐园，最终打败将黑暗笼罩整个 Ponyville大陆的梦魇之月，将光明和友谊从新带回这个大陆上。当玩家在连续建造乐园之后就会产生疲劳，而彩虹小马中还拥有三款小游戏，以供玩家消 遣。今天小编为大家带来的这篇彩虹小吗评测，让大家对这款gameloft新游有一个详细的了解。</p>\r\n\r\n<p>彩虹的小马的游戏背景是，梦颜之月在被禁锢在月亮之中已经过去了数个世纪，而现在梦魇之月从月亮上逃了出来，并将黑夜笼罩了整个Ponyville大陆， 而且只有TwilightSparkle以及她的好友才可以将Ponyville从梦魇之月的手中解放出来，将光明和友谊从新带回到这片大陆上。彩虹小马 (MYLITTLEPONY)作为一款模拟经营类游戏和之前热门的模拟经营类游戏《恶魔大作战monsterlife》、《幸福街 HappyStreet》相比丝毫的不逊色。《恶魔大作战monsterlife》是一款以怪兽养成为主线的模拟游戏，《幸福街HappyStreet》 的游戏特点是横版经营，而今天的主角《彩虹小马MYLITTLEPONY》则是一款以迷你游戏为特点的模拟经营类游戏，这款游戏将主线任务、模拟经营、迷 你游戏三者结合在了一起，向玩家呈现出一款轻松可以的新游戏。</p>\r\n\r\n<p><strong>游戏的主线任务：重返光明</strong></p>\r\n\r\n<p>　　大家都知道很大的模拟经营游戏都会有一个主 线任务，《彩虹小马MYLITTLEPONY》也是继承了模拟经营游戏的特点，这款游戏的主主线任务和游戏剧情仅仅相连：曾经掌管黑暗的 NightmareMoon在最近的几个世纪里一直被封印在月亮上，现在她从月亮上逃了出来，并将Ponyville笼罩在黑暗之中，而我们作为彩虹小马 游戏中的主角TwilightSparkle，我们需要在朋友们的帮助下，将Ponyville从新多回来，将光明和友谊从新带回Ponyville大 陆，所以这款游戏不不是表面上那种以建造更多的房屋、赚更多的钱为目标的，所以这款游戏的可玩性还是比较高的。</p>\r\n\r\n<p><strong>模拟经营：小马的奇幻世界</strong></p>\r\n\r\n<p>　　彩虹小马这款游戏的主角是几只可爱的小马， 它们分别是TwilightSparkle、RainbowDash,、AppleJack、Rarity,、Fluttershy和 PinkiePie，这几只小马都拥有属于自己的&ldquo;看家本领&rdquo;，当它们在不同的岗位上工作时就会有不同的效果。在游戏中的建筑物也是拥有不同的风格的，风 车、樱桃屋、柠檬店、胡萝卜农场等都是非常的甜美可爱，这款游戏对女性玩家的吸引力更高。</p>\r\n\r\n<p><strong>　　迷你游戏：激活你的兴趣</strong></p>\r\n\r\n<p>　　在彩虹小马游戏中还有顶皮球、接苹果、彩虹之翼三款迷你游戏，这三款游戏需要玩家在建造商店、完成任务、迎接新的伙伴任务都完成之后才可以开启这些迷你游戏，这样的游戏设定可以帮助玩家缓解长时间游戏带来的枯燥。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1', '104', '0', '0', '0', '', '2014-08-14 11:36:16');
COMMIT;

-- ----------------------------
--  Table structure for `cms_level`
-- ----------------------------
DROP TABLE IF EXISTS `cms_level`;
CREATE TABLE `cms_level` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(20) NOT NULL,
  `level_info` varchar(200) NOT NULL,
  `permission` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_level`
-- ----------------------------
BEGIN;
INSERT INTO `cms_level` VALUES ('1', '普通管理员', '除了不能操作其他管理员以为，其他功能都能操作', ''), ('2', '超级管理员', '最大权限，只有一个超管的情况下，不能删除自己', '1,2,3,4,5,6,7,8,9,10,11,12,13,14'), ('3', '发帖专员', '可以发表文章，修改和删除的权限', ''), ('4', '评论专员', '可以评论哦', '1,2,3,4,5'), ('5', '会员专员', '只有管理会员的权限', '1,2,3'), ('10', '后台游客', '只有访问权限', '1');
COMMIT;

-- ----------------------------
--  Table structure for `cms_link`
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `webname` varchar(20) NOT NULL,
  `weburl` varchar(100) NOT NULL,
  `logourl` varchar(100) NOT NULL,
  `user` varchar(20) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_link`
-- ----------------------------
BEGIN;
INSERT INTO `cms_link` VALUES ('1', '网易新闻', 'http://163.com', '', '丁磊', '1', '1', '2014-05-28 14:40:03'), ('2', '优酷视频', 'http://youku.com', '/images/youku.png', '古永锵', '2', '1', '2014-05-28 14:41:26'), ('3', '搜狐', 'http://sohu.com', '', '张朝阳', '1', '1', '2014-05-28 16:14:58'), ('4', '中央电视', 'http://cctv.com', '', '习', '1', '1', '2014-05-28 16:15:45'), ('6', '阿里巴巴', 'http://alibaba.com', '/images/alibaba.png', '马云', '2', '1', '2014-05-28 16:17:49');
COMMIT;

-- ----------------------------
--  Table structure for `cms_manage`
-- ----------------------------
DROP TABLE IF EXISTS `cms_manage`;
CREATE TABLE `cms_manage` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(20) NOT NULL,
  `admin_pass` char(40) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `login_count` smallint(5) NOT NULL DEFAULT '0',
  `last_ip` varchar(20) NOT NULL DEFAULT '000.000.000.000',
  `last_time` datetime NOT NULL,
  `reg_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_manage`
-- ----------------------------
BEGIN;
INSERT INTO `cms_manage` VALUES ('1', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '35', '127.0.0.1', '2014-08-14 10:05:56', '2014-03-27 15:19:54'), ('2', 'oliver', '7c4a8d09ca3762af61e59520943dc26494f8941b', '5', '1', '127.0.0.1', '2014-04-24 08:51:52', '2014-03-27 15:23:59'), ('3', '我是MT', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-03-27 15:24:28'), ('4', '樱木花道', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', '赤木晴子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:55:30'), ('10', '流川枫', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:58:38'), ('29', '宫城良田', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 13:55:04'), ('34', '蜡笔小新', '7c4a8d09ca3762af61e59520943dc26494f8941b', '10', '3', '192.168.1.177', '2014-06-01 18:56:25', '2014-04-17 11:19:41'), ('35', '赤木刚宪', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:58');
COMMIT;

-- ----------------------------
--  Table structure for `cms_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(20) NOT NULL,
  `nav_info` varchar(200) NOT NULL,
  `pid` mediumint(8) NOT NULL DEFAULT '0',
  `sort` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_nav`
-- ----------------------------
BEGIN;
INSERT INTO `cms_nav` VALUES ('1', '日本动漫', '日本动漫', '0', '1'), ('2', '小马版', '小马版', '0', '2'), ('3', '其他杂谈', '其他杂谈', '0', '3'), ('14', '综合资讯', '综合资讯', '1', '1'), ('15', '精彩漫评', '精彩漫评', '1', '2'), ('16', '业界消息', '业界消息', '1', '3'), ('18', '漫闻快报', '漫闻快报', '1', '4'), ('20', 'Pony', 'Pony', '2', '20');
COMMIT;

-- ----------------------------
--  Table structure for `cms_permission`
-- ----------------------------
DROP TABLE IF EXISTS `cms_permission`;
CREATE TABLE `cms_permission` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_permission`
-- ----------------------------
BEGIN;
INSERT INTO `cms_permission` VALUES ('1', '后台登录', '后台登录'), ('2', '清理缓存', '清理缓存'), ('3', '管理员管理', '管理员管理'), ('4', '等级管理', '等级管理'), ('5', '权限设定', '权限设定'), ('6', '网站导航', '网站导航'), ('7', '文档操作', '文档操作'), ('8', '评论审核', '评论审核'), ('9', '轮播器管理', '轮播器管理'), ('10', '广告管理', '广告管理'), ('11', '投票管理', '投票管理'), ('12', '审核友情连接', '审核友情连接'), ('13', '会员管理', '会员管理'), ('14', '系统配置文件管理', '系统配置文件管理');
COMMIT;

-- ----------------------------
--  Table structure for `cms_rotation`
-- ----------------------------
DROP TABLE IF EXISTS `cms_rotation`;
CREATE TABLE `cms_rotation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(100) NOT NULL,
  `title` varchar(20) NOT NULL,
  `info` varchar(200) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_rotation`
-- ----------------------------
BEGIN;
INSERT INTO `cms_rotation` VALUES ('2', '/uploads/20140521/20140521144601369.jpg', '444', '5555', '0', 'rotation.php?action=showss', '2014-05-21 14:46:04'), ('3', '/uploads/20140521/20140521154112950.jpg', '12345', 'dddd', '1', 'tteee', '2014-05-21 15:41:35');
COMMIT;

-- ----------------------------
--  Table structure for `cms_system`
-- ----------------------------
DROP TABLE IF EXISTS `cms_system`;
CREATE TABLE `cms_system` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `webname` varchar(100) NOT NULL,
  `page_size` tinyint(2) NOT NULL COMMENT '//普通分页',
  `article_size` tinyint(2) NOT NULL COMMENT '//文章分页',
  `nav_size` tinyint(2) NOT NULL COMMENT '//主导航前台显示个数',
  `updir` varchar(100) NOT NULL COMMENT '//上传的主目录',
  `ro_time` tinyint(2) NOT NULL COMMENT '//轮播器速度',
  `ro_num` tinyint(2) NOT NULL COMMENT '//轮播器个数',
  `adver_text_num` tinyint(2) NOT NULL COMMENT '//文字广告的个数',
  `adver_pic_num` tinyint(2) NOT NULL COMMENT '//图片广告的个数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_system`
-- ----------------------------
BEGIN;
INSERT INTO `cms_system` VALUES ('1', 'PPPony', '10', '8', '10', '/uploads/', '3', '3', '5', '3');
COMMIT;

-- ----------------------------
--  Table structure for `cms_tag`
-- ----------------------------
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE `cms_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(20) NOT NULL,
  `count` smallint(6) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_tag`
-- ----------------------------
BEGIN;
INSERT INTO `cms_tag` VALUES ('6', '纯白交响曲', '4'), ('7', '魔法少女伊莉雅', '1'), ('8', '夏目友人帐', '1');
COMMIT;

-- ----------------------------
--  Table structure for `cms_user`
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `pass` char(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `face` varchar(10) NOT NULL,
  `question` varchar(20) NOT NULL,
  `answer` varchar(20) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `time` char(10) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_user`
-- ----------------------------
BEGIN;
INSERT INTO `cms_user` VALUES ('5', 'xiaoA', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'sss@sina.com', '23.gif', '您父亲的姓名', 'nini', '1', '1399604713', '2014-05-07 14:49:25'), ('6', '黑崎一护', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'heiqi@sina.com', '11.gif', '您父亲的姓名', '同行', '1', '1399604754', '2014-05-08 10:15:13'), ('7', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yingtao@sina.com', '09.gif', '您父亲的姓名', '同行', '1', '1407987750', '2014-05-08 10:16:25'), ('8', '路飞', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'lufei@sina.com', '07.gif', '您父亲的姓名', '同行', '1', '1407987904', '2014-05-08 14:15:17'), ('9', '山本', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'shanben@sina.com', '04.gif', '', '', '1', '1399604802', '2014-05-09 09:41:33'), ('11', '呵呵', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'hehe@sina.com', '13.gif', '您父亲的姓名', '不知道', '1', '', '2014-05-14 09:56:45'), ('12', 'bbq', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'bbq@sina.com', '03.gif', '您配偶的性别', '男', '5', '', '2014-05-14 10:11:24');
COMMIT;

-- ----------------------------
--  Table structure for `cms_vote`
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote`;
CREATE TABLE `cms_vote` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `info` varchar(200) NOT NULL,
  `vid` mediumint(8) NOT NULL DEFAULT '0' COMMENT '//主题或者项目',
  `count` smallint(6) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `cms_vote`
-- ----------------------------
BEGIN;
INSERT INTO `cms_vote` VALUES ('2', '你最喜欢的小马', '你最喜欢的小马', '0', '0', '1', '2014-05-27 16:03:10'), ('4', '小蝶', '小蝶', '2', '5', '0', '2014-05-27 16:42:32'), ('5', '苹果杰克', '苹果杰克', '2', '1', '0', '2014-05-27 16:43:57'), ('6', '云宝黛西', '云宝黛西', '2', '2', '0', '2014-05-27 17:08:20'), ('7', '暮光闪闪', '暮光闪闪', '2', '8', '0', '2014-05-27 17:10:08'), ('9', '瑞瑞', '瑞瑞', '2', '1', '0', '2014-08-14 11:03:49'), ('10', 'Pinkpie', 'Pinkpie', '2', '0', '0', '2014-08-14 11:04:17');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
