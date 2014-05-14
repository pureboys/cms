/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-05-14 16:52:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_comment`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
INSERT INTO `cms_comment` VALUES ('4', '樱桃小丸子', '国人民解放军军事学院中美防务关系研究中心研究员赵蔚彬表示，房峰辉此次访美恰逢其时，将释放有信心推进中美两军关系的积极信号、削弱企图炒作“中国威胁”的言论', '0', '1', '49', '2014-05-14 15:10:53');
INSERT INTO `cms_comment` VALUES ('5', '樱桃小丸子', 'wwwwwwwwwwwwwwww', '0', '1', '49', '2014-05-14 15:16:38');
INSERT INTO `cms_comment` VALUES ('6', '游客', 'mytest', '0', '1', '49', '2014-05-14 16:48:02');

-- ----------------------------
-- Table structure for `cms_content`
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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_content
-- ----------------------------
INSERT INTO `cms_content` VALUES ('44', 'HBuilder：最快的Web开发IDE', '14', '无属性', '前端开发,HBuilder,Web开发', '前端开发,HBuilder', '/uploads/20140504/20140504131722895.png', '移动开发', 'admin', 'HBuilder是DCloud推出的一款支持HTML5的Web开发IDE。快，是HBuilder的最大优势，通过完整的语法提示和代码输入法、代码块等，大幅提升HTML、js、css的开发效率。同时，它还包括最全面的语法库和浏览器兼容性数据。', '<p>从Frontpage、Dreamweaver、UE，到Sublime Text和JetBrains的WebStorm，Web编程的IDE已经更换了几批。HBuilder是<a href=\"http://www.dcloud.io/\" target=\"_blank\">DCloud</a>（数 字天堂）推出一款支持HTML5的Web开发IDE。&ldquo;快，是HBuilder的最大优势，通过完整的语法提示和代码输入法、代码块及很多配 套，HBuilder能大幅提升HTML、js、css的开发效率。&rdquo;问到HBuilder的优势时，DCloud CEO王安表示。</p>\r\n\r\n<p>在HBuilder里预置了一个hello HBuilder的工程，用户敲这几十行代码后会发现，HBuilder比其他开发工具至少快5倍。&ldquo;最全的浏览器兼容性数据、开发手机App等很多特点也都是HBuilder强于竞品的地方&rdquo;，王安表示。</p>\r\n\r\n<p>以 &ldquo;快&rdquo;为核心的HBuilder，引入了&ldquo;快捷键语法&rdquo;的概念，巧妙地解决了困扰许多开发者的快捷键过多而记不住的问题。开发者只需要记住几条语法，就可 以快速实现跳转、转义和其他操作。比如alt+[是跳转到括号，alt+&rsquo;是跳转到引号，alt+字母是跳转菜单项，而alt+左则是跳转到上一次光标位 置。而Ctrl则是各种操作，比如ctrl+d就是删除一行。shift则是转义，比如shift+回车是&lt;br/&gt;，shift+空格 是&amp;nbsp;。</p>\r\n\r\n<p>另外，HBuilder的生态系统可能是最丰富的Web IDE生态系统，因为它同时兼容Eclipse插件和Ruby Bundle。SVN、git、ftp、PHP、less等各种技术都有Eclipse插件。</p>\r\n\r\n<p>HBuilder 的编写用到了Java、C、Web和Ruby。HBuilder本身主体是由Java编写，它基于Eclipse，所以顺其自然地兼容了Eclipse的 插件。但因为Java效率太低，所以用C写了启动器。HBuilder柔和的绿色界面设计需要动态调节屏幕亮度，它还支持手机数据线真机联调，而这些都是 用C写的。</p>\r\n\r\n<p>HBuilder很多界面，比如用户信息界面都是使用Web技术来做的，既漂亮，开发起来又快。最后，代码块、快捷配置命令脚本，都是用Ruby开发的。</p>\r\n\r\n<p>&ldquo;这4种技术各有各的用途，我们团队内部也灵活运用，HBuilder的架构支持不同的技术互相融合通信。至于我们的技术选型原则，首先满足用户需求，然后我们内部用什么技术能更快完成就会选什么技术&rdquo;，王安解释道。</p>\r\n\r\n<p><strong>最大的难题：js解析</strong></p>\r\n\r\n<p>HBuilder 第一个版本发布到现在，DCloud以每周一版的速度已经发布了20多个版本。主要更新包括支持边看边改、插件安装、App打包平台开放、代码块自定义开 放。&ldquo;但是最主要的工作还是在努力把亮点做到极致，从第一个版本发布，我们能提升一倍的web开发效率，到现在可以提升5倍&rdquo;王安说道。</p>\r\n\r\n<p>DCloud在开发HBuilder的过程中遇到了不少难题，比如 web语法库和浏览器兼容库的建立，从W3C的HTML、JavaScript、CSS的正式标准和推荐标准，到ECMAScript中浏览器支持的部分，还有各大浏览器的扩展语法，Webkit、moz、ms的HTML、JS、CSS， 想集齐这些语法，不仅仅是工作量的问题。而每个语法在每个浏览器的每个版本上是否能运行，得到这个数据也是前人未能突破的挑战。还好这个难题目前已经被解决。</p>\r\n\r\n<p>&ldquo;当前困扰我们最大的难题还是js解析&rdquo;王安坦言道。</p>\r\n\r\n<p>目 前其他开发工具都不能有效的识别代码里的js对象，要不没有提示，要不全提示，甚至有的随意提示用户输入过的词。而DCloud在识别用户写的js方面下 了很大的功夫，比如var e = document.getElementById(&quot;e&quot;)，e或许是一个div也可能是input，那么e设置属性时，就需要准确识别e到底是什么，才 能给出有效精准的提示。</p>\r\n\r\n<p>&ldquo;我们已经克服了很多挑战，即使很复杂的写法document.querySelector(&quot;div:not(#a1) .class1&quot;)，HBuilder也知道这个对象到底是什么&rdquo;。</p>\r\n\r\n<p>当 然把精准识别做到极致，必然带来一个烦恼，就是性能下降。当用户快速敲代码时，无法接受延迟提示，也就是说，复杂的识别运算要在毫秒级完成，这种挑战非常 大。为此需要不停的优化算法甚至重构。&ldquo;目前我们还在路上艰难前行，但我们相信终究会克服这个挑战，届时开发者们将得到又快又准的提示，而我们也给竞品铸 造了难以超越的壁垒&rdquo;，王安表示。</p>\r\n\r\n<p><strong>目前Web开发领域格局</strong></p>\r\n\r\n<p>目前主流的前端开发工具有Sublime为代表的文 本编辑器，以及Webstorm、Brackets、Dreamweaver、vs等IDE。但说道为HTML5设计或做了特殊优化的，只有 HBuilder、Webstorm和Brackets。从用户群和优缺点角度，主流的开发工具总结如下表（仅收集小部分开发者的意见，如对工具有更多看 法，欢迎评论）：</p>\r\n', '0', '181', '0', '2', '2', 'blue', '2014-05-04 13:20:33');
INSERT INTO `cms_content` VALUES ('45', '必须Mark！最佳HTML5应用开发工具推荐', '15', '无属性', '开发工具', '开发工具推荐', '/uploads/20140504/20140504135135979.jpg', '', 'admin', 'HTML5自诞生以来，作为新一代的Web标准，越来越受开发人员及设计师的欢迎。其强大的兼容性，一次开发，到处使用，大大减少了跨平台开发人员的数量及成本。特别在如今日新月异的移动时代，HTML5的才能更加得以体现。', '<p>HTML5自诞生以来，作为新一代的Web标准，越来越受开发人员及设计师的欢迎。其强大的兼容性，一次开发，到处使用，大大减少了跨平台开发人员的数量及成本。特别是在如今日新月异的移动时代，除了iOS、Android两大平台，还有Windows Phone、Blackberry、Bada等多个竞争，恰恰给了HTML5展现才能的机会。本文就搜集了十款HTML5工具，希望能对大家的开发工作有所帮助。</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/20140504/20140504135313305.jpg\" style=\"height:219px; width:500px\" /></p>\r\n', '1', '101', '0', '0', '0', '', '2014-05-04 13:53:35');
INSERT INTO `cms_content` VALUES ('46', 'Unity“三巨头”：全心全意为开发者服务', '13', '无属性', '移动开发', '移动开发,UniteUnite', '', 'csdn', 'admin', '近期，在北京举行的2014年Unity亚洲开发者大会，吸引了众多国内游戏开发者的参与。游戏引擎并非只有Unity一个，那为何Unity会脱颖而出广受好评？对此，Unity“三巨头”接受采访，畅谈Unity的存在意义以及发展策略。 ', '<p>近期，在北京国家会议中心举行的2014年Unity亚洲开发者大会，吸引了众多国内游戏开发者的参与。目前，游戏引擎并非只有Unity一个，那为何 Unity会脱颖而出广受好评？CSDN记者采访了Unity全球CEO David Helgason、Unity亚太区总裁John Goodale及Unity大中华区总裁符国新（Allen）先生，请他们深入畅谈Unity的存在意义以及发展策略。</p>\r\n\r\n<p><strong>CSDN移动：首先问一下David先生，目前在游戏引擎方面，并不只有Unity，那Unity凭借哪些特性和优势，使开发者选择Unity呢？</strong></p>\r\n\r\n<p><strong>David：</strong>我 想，要是把所有的特点都列出来，清单肯定非常长。核心的来讲，就是多样性和集成方式，我们现在做2D，可以和3D进行完美的结合，这些都是特点。另外我想 强调的是，我们有着非常好的性能，还有一个重点就是多平台。我们可以进行很多无缝的导入，比如说在设备方面包括PC、Mac以及各种各样的智能手机，而平 台方面并不仅仅只有Android和iOS，还包括其他的平台。</p>\r\n\r\n<p><strong><strong>CSDN移动</strong>：不同的平台面对的用户和操控方式都不一样，比如说目前正在兴起的操控平台和手机完全不一样，Unity如何引导开发者面对这些改变呢？</strong></p>\r\n\r\n<p><strong>David：</strong>其实我们专注于多平台和研究已经很长时间了，我们和国际主流的知名电视制造商也有合作，这方面积累了很多经验，尤其在中国，我们注重和主要的合作伙伴进行这方面的研究。</p>\r\n\r\n<p><strong><strong>CSDN移动</strong>：下面我问一下John，现在移动市场的发展导致开发者无论从数量和经验上都比较缺少，可能开发者生态圈比较乱。那Unity是通过哪些措施促进开发者质量的提高，从而规范开发者的生态？</strong></p>\r\n\r\n<p><strong>John：</strong>这 个问题问的好。其实我们要帮助开发者提高的，并不是他们技能本身，而是希望帮助他们进行技能的迁移。我在亚洲工作的经验大概有25年，我发现亚洲开发者技 术和素质还是相当高的，对于这点我非常满意。因为现在我们要做一些不同的东西，在技术方面存在一定的迁移性。尤其在中国，我们有不同的开发环境，所以原来 的技术需要做一些迁移，这是跟之前不同的，也是需要我们下一步要注意的。</p>\r\n\r\n<p>在Unity这边，我们也是希望可以帮助大家进行技术的迁移，把它 使用到一些新的平台上。David也提到过多平台这方面，我们一直非常注重，所以也希望可以使用很多Unity独到的方式和工具，帮助大家进行平台的开 发，再把开发好的东西迁移到移动平台上去，这些都可以使用unity的工具和方法进行帮助。</p>\r\n\r\n<p>在中国我们这边的支持团队，他们的工作是非常重要的，而且到目前为止效果也非常好。他们可以帮助各位开发者，将他们的开发产品进行非常好的优化，然后做跨平台的推广，整体来说这边的工作还是非常不错的，中国这边的效果也很好。</p>\r\n\r\n<p><strong><strong><strong>CSDN移动</strong></strong>：Unity引擎是3D的，但是亚洲市场比较流行2D，针对亚洲市场或者具体针对中国市场，有没有本土化的特征或者特别的策略？</strong></p>\r\n\r\n<p><strong>David：</strong>首 先Unity在这方面做了非常多的工作，希望尽量可以把我们的产品和我们的工具做到最好。之前也开发了很多关于2D方面的工具，但是我们认为技术有待加 强。另外在中国，我们为广大的开发者提供了非常多的支持，也帮助他们尽量的与一些平台和地方的行业进行接触和连接，便于他们取得成功。同时还有非常好的培 训系统，可以带给大家。我们在这边有非常多的适应当地的文件，还有其他的一些内容，都是可以帮助中国开发者的，即便他们不懂英文，也可以顺利进行下去。</p>\r\n\r\n<p><strong>Allen：</strong>国 内认为2D是主流，但是如果看PC上的游戏，端游也好，页游也好，走向3D的游戏居多。PC 3D的过程已经开始转过来了，100%里面的游戏，百分之七八十的PC游戏不是3D。国内手游之所以保持2D为主，主要是低端机和网速有问题，因为 WiFi的普及率不足够。如果看看这一年，首先，你发现红米手机799、899已经很普及了，红米手机跑3D游戏完全没有问题。第二，大城市WiFi普及 率非常高。第三，好多平台公司，不管是百度也好，还是360都在普及路由器，再加上移动马上推4G，而且本身所谓的低端机已经逐渐被淘汰了。</p>\r\n\r\n<p>基 于这几个点，国内今年3D趋势非常明显。如果现在你看每个月新出的游戏里面，将近50%以上都是3D。如果你看日本、韩国，都是以3D为主的游戏。为什 么？因为消费者玩家的口味越来越重。就像以前我们看2D的电影，但是看完3D电影以后很难转回2D电影，消费者口味一直在加强。整个趋势走向3D化是不可 逆转的。当然，肯定也有一些2D游戏存在，但消费者的口味再加上硬件，以及周围的系统成熟，趋势是很明显的。不过基于这个点，Unity虽然看重这个趋 势，但我们10月份会发布2D工具，因为我们意识到了行业转型是需要时间的，我们不能主导行业过程，我们要把最好的工具给开发者，这样，开发者就可以用我 们的工具开发2D游戏，也可以开发3D游戏。</p>\r\n\r\n<p><strong>CSDN移动：关于定价策略的问题，从原来的很贵到现在比较便宜，还有的是分成，还有的是免费的。中国的厂商畅游出了一个游戏也是免费的，Unity对这方面有没有什么对策，或者之后会不会改变自己的销售策略？</strong></p>\r\n\r\n<p><strong>David：</strong>市 场永远存在竞争者，现在有一些人在做开源引擎。我们一直期待可以做出价格比较合理，性能也越来越好的游戏引擎给开发者，在当中也融入越来越多的创新。 2009年我们就推出免费的版本，推广度还是不错的，功能也非常强大，我们每年都在不断的更新，希望可以加入更多的内容。刚才您也有提到Cocos2D， 它是免费的版本，也是做的比较成功的。我们也逐渐拿到一些市场份额，因为我们是更好的开发工具。Unreal是最贵的开发工具，总行业总收入占到了5%， 我们在近期推出了收费的东西，他们做的也越来越好，接受程度越来越高。</p>\r\n\r\n<p>我们在这边的愿望，在未来发展不是把重点放在定价上，而是希望可以通 过我们的努力，帮助开发者越来越容易，越来越方便地开发出成功的产品。所以我们才推出了Asset Store，大家可以在这里面进行任何活动，帮助他们省下很多的时间和金钱。Everyplay这样的产品，加速了他们的成功，同时也不用支付费用。</p>\r\n\r\n<p><strong>Allen：</strong>竞 争对手永远都会有，手游出来之后，加上游戏机的引入，现在需要的是速游，速度跟精品，把精品做好之后，同时加上速度，更符合市场的需求。现在做的好的技术 公司，或者是竞争引擎公司，核心点第一是谁的速度足够快。第二是速度代表创新的速度，因为研发新的工具，一定要有速度去更新。Unity在2年之内，已经 有19个版本更新，这是速度的更新，同时招到全球最强的引擎开发者开发，这些都是大笔的投入。Unity全球在引擎研发团队上，人数已经是第一多了，我们 150多个人只做研发引擎。</p>\r\n\r\n<p>如果分析市场的话，一个团队在做产品的时候，引擎的投入其实是最低的一部分，能力是最高的。这些成本加上引擎再 加上市场推广，把这些列出来，引擎投入只是一小部分。如果Unity引擎可以让开发者的周期越短，同时效益更高，整个成本节省远远大于那一点点软件的投入 比例。所以很多游戏公司，虽然价格上是个噱头，如果分析整个形势，最贵的就是市场推广，第二是人力成本，第三才是技术的投入。</p>\r\n\r\n<p><strong>CSDN移动：中国的一些游戏厂商已经开始转向做资源平台了，Unity也推出了Unity Cloud，你们怎么看待这个平台市场，Unity Cloud，可以帮助开发者实现什么，带来什么样的变革？</strong></p>\r\n\r\n<p><strong>Allen：</strong>Unity 做事，从技术底层，让玩家更加有社交的功能，同时这些游戏也可以在云上面做交叉推广的功能。Unity云的平台定位跟国内的手游平台定位不一样，国内平台 定位是面向消费者的平台，是发号平台。Unity更多的是游戏和游戏之间的交叉推广，虽然都叫平台，但是平台的定位也不一样。所谓的交叉推广平台也好，社 交平台也好，我们跟国内各家平台战略合作，通过他们面向消费者的资源，把我们这块的技术融合到他们的平台上，让开发者最快速度能找到需要的消费者的资源。</p>\r\n\r\n<p><strong>CSDN移动：不知道三位是不是参与Unity的技术工作。如果有一款游戏在iPhone平台比较火，我想移植到其他所有的平台，Unity是不是提供这样的逆向工程?会不会有多设备结合的游戏开发接口给开发者使用?</strong></p>\r\n\r\n<p><strong>David：</strong>其 实是不可以的，但是你们可以选Unity的工具重新做游戏，我们提供的一些技术和服务要完成这个内容也是非常快的，可以把它迁移到Android等其他的 手机平台上。你也可以使用今年要推出的新产品。另外使用Unity还有一个好处，如果你把它迁移到Android，使用Unity可以非常快速帮你完成， 但是如果不用的话，你就要开发两套完全不同的代码系统。</p>\r\n\r\n<p><strong>CSDN移动：对于非法使用Unity看法是什么？Asset Store价值如何？</strong></p>\r\n\r\n<p><strong>David：</strong>我首先回答第一个关于版权的问题。我不赞同非法使用，因为我认为Unity可以带给开发者的价值是非常高的，在制作过程中可以帮他们省掉大量的时间，大家应该对于我们表示出一定的尊重。</p>\r\n\r\n<p>其 实我觉得Asset Store非常好，更新速率非常高。因为有成千上万的开发者都给Asset Store贡献内容，Asset Store不是我们自己做的自主开发，但是它的价值是非常高的，而且它也是非常稳定的内容，里面有很多东西都是开源的。广大的开发者，如果发现有地方需要 改进的话，人人都可以参与其中。</p>\r\n\r\n<p><strong>CSDN移动：展位上有很多教育或者是其他方面的展示，这些在Unity游戏引擎里面，收入占比会是多少？会不会成为你们中国地区2014年主要的发展方向？</strong></p>\r\n\r\n<p><strong>Allen：</strong>两 年前到中国，短短24个月之内，我们业务成长速度是4倍。主要是增值服务，第一块是教育，我们有授权培训中心，我们有考试认证体系，学生可以考试，这些都 是付费服务。我们也有专业技术服务，比如说大公司、中型公司、小公司，碰到问题我们都有技术团队进行支持，这里面也有收费的体系。我们也有一个非游戏解决 方案团队，解决方案团队做的是项目，把一些合作伙伴硬件结合在一起，把一些项目做完以后给我们企业用户。我们还有游戏发行服务，把好的游戏带到国内本地 化，和发行商合作，把一些游戏分发给消费者，通过这个合作，我们也是用分成比例的方式进行实现。这8个月以来增长速度非常快，已经远远超于我们的预期。</p>\r\n\r\n<p><strong>CSDN移动：这算不算是中国市场的特色呢？</strong></p>\r\n\r\n<p><strong>Allen：</strong>这 些业务都是在中国创造的。在中国创造，现在我们带到海外教育这块，我们跟韩国，新加坡，跟不同的国家，甚至美国，把我们的书，把我们的内容编译成英语，我 们把它当地化，把这些资源给海外Unity办公室，希望他们推动这个事。但是我们的认证是全球的认证体系。这套认证考题都是由我们统一研发团队制作出来。 游戏发行服务这块，我们跟美国是同时起步的，解决方案这块，是我们在中国成立的。近期宣布的Unity基金，也是中国成立的。</p>\r\n\r\n<p><strong>CSDN移动：关于Unity未来的发展方向。Cocos2D作为触控科技公司，他们把业务分成三块，云平台这块基本上算是子业务，Unity也在做自己的云平台，Unity未来的定位是不是不光是引擎方面，也会开展其他的业务，甚至出自己的游戏？</strong></p>\r\n\r\n<p><strong>David：</strong>我 们这边不会做自己的游戏。其实我们Unity要做的事就是帮助开发者做的越来越好，让他们越来越成功，不管使用我们的免费版本，还是付费版本，还是使用我 们Asset Store里面的东西或者用Everyplay等等，所有这些东西，都是希望他们获得自己越来越多的成功。</p>\r\n\r\n<p><strong>Allen：</strong>Unity 其实是12年的公司，我们经常谈到技术累积花了十几年才累积起来，好多公司说做引擎，但是如果放一小部分人做引擎，你说我支持引擎哪个品牌，其实要走的路 还需要很长的时间，这些引擎的累积，技术的累积确实很多。今天早上大家在会场上看到我们做出一个画面公里数，实时渲染那个游戏，看起来容易，但是后面的技 术累积确实是150个人，在全球各地，12个分公司做出来的。永远都有人说有竞争，我们很欢迎竞争对手，只有有了竞争对手，我们才会做的更好。</p>\r\n\r\n<p>我 们把几款游戏带到海外，还跟好几款本地的团队合作，把他们的游戏放到不同的商城，包括跟海外团队的合作，我们把国外的游戏引到其他的市场。刚开始把好游戏 带到国内，但是现在国内的水平逐渐提高了，国内有很多好的游戏，我们想把它带到海外，我们是发行服务商，因为我们做的事是把好的游戏以最方便的方式带到当 地的市场，并不是做发行商。</p>\r\n\r\n<p>我们跟平台的合作，并不是我们选的，我们把好多款游戏拿到Facebook上面做，由Facebook出钱，了解这款游戏，我们负责技术支持这块。</p>\r\n\r\n<p><strong>David：</strong>把中国的好游戏介绍到国外，这个我们会做，也会总结我们要做的事情，帮助我们的开发者，把他们的游戏做的越来越好。</p>\r\n', '1', '144', '0', '0', '0', '', '2014-05-04 13:58:10');
INSERT INTO `cms_content` VALUES ('47', '全球移动广告现状报告：哪种平台、应用最赚钱', '13', '加粗', '移动开发,移动广告', '移动开发,移动广告,ios', '', '', 'admin', '著名移动广告平台Opera Mediaworks发布2014年第一季度移动广告现状报告。Android毫无悬念地成为了使用最广泛的智能设备系统，并以42.83%的流量份额首次赶超iOS，但说到哪个平台最赚钱？还非iOS莫属', '<p>近日，著名移动广告平台Opera Mediaworks发布了2014年第一季度的移动广告现状报告。报告指出，在继上一季度成为全球第一大移动平台之后，Android毫无悬念地成为了 使用最为广泛的智能设备系统，并且，以42.83%的移动广告流量份额首次赶超iOS。但说到哪个平台广告最赚钱？还非iOS莫属，其营收份额比为 52.27%，而Android仅为33.46%</p>\r\n\r\n<p>相比<a href=\"http://operamediaworks.com/insights/sma_Q4_2013.html\" target=\"_blank\"><strong>2013年Q4季度</strong></a>，Android 平台无论是流量还是收入方面，都有着非常大的飞跃，分别增加了5.12和1.73个百分点。相比BlackBerry和Windows等其他平台的双重萎 缩，几度&ldquo;被倒下&rdquo;的塞班却是坚挺依旧，与上一季度相比，流量和营收分别增长了1.62和0.3个百分点。</p>\r\n', '1', '103', '0', '2', '1', '', '2014-05-04 13:59:31');
INSERT INTO `cms_content` VALUES ('49', 'PHP arsort() 函数', '19', '推荐,头条', 'arsort', 'arsort', '/uploads/20140507/20140507110318175.jpg', 'admin', 'admin', 'PHP arsort() 函数', '<p>PHP arsort() 函数</p>\r\n', '0', '248', '250', '2', '4', 'blue', '2014-05-06 10:34:05');

-- ----------------------------
-- Table structure for `cms_level`
-- ----------------------------
DROP TABLE IF EXISTS `cms_level`;
CREATE TABLE `cms_level` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(20) NOT NULL,
  `level_info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_level
-- ----------------------------
INSERT INTO `cms_level` VALUES ('1', '普通管理员', '除了不能操作其他管理员以为，其他功能都能操作');
INSERT INTO `cms_level` VALUES ('2', '超级管理员', '最大权限，只有一个超管的情况下，不能删除自己');
INSERT INTO `cms_level` VALUES ('3', '发帖专员', '可以发表文章，修改和删除的权限');
INSERT INTO `cms_level` VALUES ('4', '评论专员', '可以评论哦');
INSERT INTO `cms_level` VALUES ('5', '会员专员', '只有管理会员的权限');
INSERT INTO `cms_level` VALUES ('10', '后台游客', '只有访问权限');

-- ----------------------------
-- Table structure for `cms_manage`
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
-- Records of cms_manage
-- ----------------------------
INSERT INTO `cms_manage` VALUES ('1', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '13', '127.0.0.1', '2014-05-14 09:02:35', '2014-03-27 15:19:54');
INSERT INTO `cms_manage` VALUES ('2', 'oliver', '7c4a8d09ca3762af61e59520943dc26494f8941b', '5', '1', '127.0.0.1', '2014-04-24 08:51:52', '2014-03-27 15:23:59');
INSERT INTO `cms_manage` VALUES ('3', '我是MT', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-03-27 15:24:28');
INSERT INTO `cms_manage` VALUES ('4', '樱木花道', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `cms_manage` VALUES ('5', '赤木晴子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `cms_manage` VALUES ('8', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:55:30');
INSERT INTO `cms_manage` VALUES ('10', '流川枫', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:58:38');
INSERT INTO `cms_manage` VALUES ('29', '宫城良田', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 13:55:04');
INSERT INTO `cms_manage` VALUES ('34', '蜡笔小新', '7c4a8d09ca3762af61e59520943dc26494f8941b', '10', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:41');
INSERT INTO `cms_manage` VALUES ('35', '赤木刚宪', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:58');

-- ----------------------------
-- Table structure for `cms_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(20) NOT NULL,
  `nav_info` varchar(200) NOT NULL,
  `pid` mediumint(8) NOT NULL DEFAULT '0',
  `sort` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_nav
-- ----------------------------
INSERT INTO `cms_nav` VALUES ('1', '军事动态', '军事方面的新闻', '0', '1');
INSERT INTO `cms_nav` VALUES ('2', '八卦娱乐', '娱乐界的狗仔新闻', '0', '2');
INSERT INTO `cms_nav` VALUES ('3', '时尚女人', '关于时尚和女人的信息', '0', '3');
INSERT INTO `cms_nav` VALUES ('4', '科技频道', '关于科技方面的信息', '0', '4');
INSERT INTO `cms_nav` VALUES ('5', '智能手机', '关于智能手机方面的推荐', '0', '5');
INSERT INTO `cms_nav` VALUES ('6', '美容护肤', '美容护肤', '0', '6');
INSERT INTO `cms_nav` VALUES ('7', '热门汽车', '热门汽车', '0', '7');
INSERT INTO `cms_nav` VALUES ('8', '房产家居', '房产家居', '0', '8');
INSERT INTO `cms_nav` VALUES ('9', '读书教育', '读书教育', '0', '9');
INSERT INTO `cms_nav` VALUES ('11', '股票基金', '股票基金', '0', '11');
INSERT INTO `cms_nav` VALUES ('13', '中国军事', '中国军事', '1', '5');
INSERT INTO `cms_nav` VALUES ('14', '美国军事', '美国军事', '1', '1');
INSERT INTO `cms_nav` VALUES ('15', '韩国军事', '韩国军事', '1', '2');
INSERT INTO `cms_nav` VALUES ('16', '日本军事', '日本军事', '1', '3');
INSERT INTO `cms_nav` VALUES ('18', '越南军事', '越南军事', '1', '4');
INSERT INTO `cms_nav` VALUES ('19', '朝鲜军事', '朝鲜军事', '1', '19');

-- ----------------------------
-- Table structure for `cms_user`
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
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('5', 'xiaoA', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'sss@sina.com', '23.gif', '您父亲的姓名', 'nini', '1', '1399604713', '2014-05-07 14:49:25');
INSERT INTO `cms_user` VALUES ('6', '黑崎一护', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'heiqi@sina.com', '11.gif', '您父亲的姓名', '同行', '1', '1399604754', '2014-05-08 10:15:13');
INSERT INTO `cms_user` VALUES ('7', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yingtao@sina.com', '09.gif', '您父亲的姓名', '同行', '1', '1400051425', '2014-05-08 10:16:25');
INSERT INTO `cms_user` VALUES ('8', '路飞', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'lufei@sina.com', '07.gif', '您父亲的姓名', '同行', '1', '1399604779', '2014-05-08 14:15:17');
INSERT INTO `cms_user` VALUES ('9', '山本', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'shanben@sina.com', '04.gif', '', '', '1', '1399604802', '2014-05-09 09:41:33');
INSERT INTO `cms_user` VALUES ('11', '呵呵', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'hehe@sina.com', '13.gif', '您父亲的姓名', '不知道', '1', '', '2014-05-14 09:56:45');
INSERT INTO `cms_user` VALUES ('12', 'bbq', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'bbq@sina.com', '03.gif', '您配偶的性别', '男', '5', '', '2014-05-14 10:11:24');
