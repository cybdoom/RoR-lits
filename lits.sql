-- MySQL dump 10.13  Distrib 5.1.42, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: lits
-- ------------------------------------------------------
-- Server version	5.1.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'home','',''),(2,'services','',''),(3,'works','',''),(4,'about','',''),(5,'404','Page not found','Oops... Something went wrong');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Rails 4.1.0: Spring, Variants, Enums, Mailer previews, secrets.yml','<p>Rails 4.1.0 might carry a minor version bump, but there\'s nothing minor about the bag of goodies it carries. It simply means that upgrading from 4.0.x should be a relatively mild affair as most of the changes are additions or improvements, not backwards-incompatible changes. Let\'s go over some of those new goodies.</p>\r\n\r\n<p><strong>Spring</strong> is our new application preloader. It makes running tests, rake, and generators much faster on large applications. You could think of what we had before as the CGI-mode of the command-line. Every time you ran rake, your entire application would be loaded from scratch, only to be thrown out as soon as the command finished. With Spring, your application is a persistent process that can be reused across commands, so only the first run is slow. And we automatically detect code changes, and reload just those parts. It makes a big difference!</p>\r\n\r\n<p><strong>Variants</strong> allows you to have different templates and action responses for the same mime type (say, HTML). This is a magic bullet for any Rails app that\'s serving mobile clients. You can now have individual templates for the desktop, tablet, and phone views while sharing all the same controller logic. This is the secret sauce behind Basecamp\'s hybrid native/HTML strategy for mobile apps: One Rails app serving desktop browsers, mobile browsers, native mobile apps. The reuse benefits are immense and the productivity boost staggering. Really.</p>\r\n\r\n<p><strong>Enums</strong> wraps the pattern of having a status field constrained to just a few options. It\'s just enough syntactic sugar to make tinyint-backed status fields taste delicious while still reaping the optimization benefit of avoiding repeated status strings. Poor man\'s state machine? Nah, Just Enough for Most of the Time.</p>\r\n\r\n<p><strong>Mailer previews</strong> make it dead simple to visually iterate over your Action Mailer views with test data, so you can get the same work flow as you have for any other view in your app. Make a change, reload to see it. Easy as pie. And certainly a lot better than either starting with static files that then have to be converted to mailer templates, or trying to copy\'n\'paste the HTML out of the log files to view them in a browser (come on, you\'ve been there!).</p>\r\n\r\n<p>Finally, we\'ve committed to moving production passwords out of your application repository with two changes. The first is <strong>secrets.yml</strong>, which gives you one place and one convenient interface to access secrets that have been set either via ENV variables or deployment scripts. By default it\'s used for the secret token guarding cookie integrity, but you can use it for whatever else you need in your app. Second is that we\'ve added support for database URLs in database.yml, and that we by default will be referring to ENV-backed URLs in the generated files. Hurray security!</p>\r\n\r\n<p>Now that\'s just a quick look in the goodie bag. If you want the play-by-play, you can have a look through <a href=\"https://github.com/rails/rails/compare/4-0-stable...v4.1.0\">the 5,200 commits we\'ve done between 4-0-stable and v4.1.0</a>. That\'s right, five thousand. Witness the firepower of this armed and fully operational community!</p>\r\n\r\n<p>You can also digest the changes, and see some real code, by diving into Yves\' and Godfrey\'s splendid work on the <a href=\"http://edgeguides.rubyonrails.org/4_1_release_notes.html\">release notes for 4.1 as a guide</a> and the <a href=\"http://coherence.io/blog/2013/12/17/whats-new-in-rails-4-1.html\">feature walk-through</a>.</p>\r\n\r\n<p>The gems are now on RubyGems, so <code>gem install rails</code> will get you the latest. Or you can use the v4.1.0 tag.</p>\r\n<p><a href=\"http://weblog.rubyonrails.org/2014/4/8/Rails-4-1/\">Source</a></p>','2014-04-09 10:41:37','2014-04-24 09:57:15','','');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140326123728'),('20140327151208'),('20140331110212'),('20140401124052'),('20140423140828'),('20140424094418');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `header` text,
  `body` text,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_mode` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `big_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Ruby On Rails','Expert Ruby on Rails development team','<h2>\r\n  Ruby On Rails full cycle development and service\r\n</h2>\r\n<p>\r\nWe create the best quality products for a good price, due to the well-organized\r\nsystem of cooperation. We create the best web-projects of any complexity in\r\nRuby on Rails.\r\n</p>\r\n<p>\r\nTalented staff located in Eastern Europe allows us to offer you the best hourly\r\nrates. Quality control at every stage of the project implementation ensures the\r\nbest quality of the product.\r\n</p>\r\n<p>\r\nWe guarantee the best quality products at a good price:<br />\r\n3+ experienced Ruby on Rails developer – 40 USD per hour<br />\r\n5+ experienced Ruby on Rails developer – 45 USD per hour\r\n</p>\r\n<p>\r\nEvery product of Logic IT Staff benefits from our technical support in the future,\r\nso that you can always get free consultations on each and every challenging\r\nsituation.\r\n</p>\r\n<p>\r\n  <ul class=\"list-style\">\r\n    <li class=\"check-list\">Best quality</li>\r\n    <li class=\"check-list\">Experienced and talented team</li>\r\n    <li class=\"check-list\">Customer-friendly price</li>\r\n    <li class=\"check-list\">Well-organized cooperation system</li>\r\n    <li class=\"check-list\">Long-term support for your project</li>\r\n    <li class=\"check-list\">Full control over your projects and development team</li>\r\n    <li class=\"check-list\">Clean and thoroughly documented code</li>\r\n    <li class=\"check-list\">Working with Agile</li>\r\n    <li class=\"check-list\">Working with startups</li>\r\n    <li class=\"check-list\">Expert consulting</li>\r\n  </ul>\r\n</p>','/images/service7.png','rails','','2014-03-28 08:33:00','2014-05-16 08:14:22','/images/service7_big.png'),(2,'Unity Game development','Full cycle Unity Game development and solutions','<h2>Full cycle Unity Game development\r\nand solutions</h2>\r\n<p>\r\nOur team has experience in establishing and building our own products,\r\nunderstanding the whole process — we know how to take an idea and transform\r\nit into a product, and we know how to take that product and market it to the\r\nworld. Many of the projects are protected by NDA, but some of the projects are\r\npresented below:\r\n</p>\r\n<h3>Angry Heroes, 2012-2013</h3>\r\n<p>\r\nCross-platform MMORPG game<br />\r\n<strong>Technologies: Ruby on Rails, MySQL, Redis, Unity3D</strong>\r\n</p>\r\n<h3>Slot Maniacs, 2009-2010</h3>\r\n<p>\r\nSlot machine stimulator<br />\r\n<strong>Technology: Unity3D</strong>\r\n</p>\r\n<p>\r\nWe provide a full range of Unity Game development solutions as following:<br />\r\n<ul>\r\n<li>1. Author\'s artistic concept and unique graphic style of your game;</li>\r\n<li>2. Optimization of the monetization of the game keeping the game balance;</li>\r\n<li>3. Prelaunch marketing;</li>\r\n<li>4. Creating multimedia promotional materials (videos, memes, banners,\r\nposters, etc.);</li>\r\n<li>5. Full cycle of Unity3D development;</li>\r\n<li>6. Cross platform and QA testing;</li>\r\n<li>7. Publishing in the mobile stores such as app store, google play market, WP\r\nstore;</li>\r\n<li>8. Stylistic and linguistic localization;</li>\r\n<li>9. Promotion in the mobile stores such as app store, google play market, WP\r\nstore;</li>\r\n<li>10. Business analysis;</li>\r\n<li>11. Creating an effective advertising campaign;</li>\r\n<li>12. Release updates;</li>\r\n<li>13. Support of all gaming processes;</li>\r\n<li>14. Training your team;</li>\r\n<li>15. Increasing ARPU;</li>\r\n<li>16. SMM and SEO;</li>\r\n<li>17. Analytics;</li>\r\n<li>18. Stimulating donates activity;</li>\r\n<li>19. Creating and expanding partner network;</li>\r\n<li>20. Increasing user traffic;</li>\r\n<li>21. Architectural design.</li>\r\n</ul>\r\n</p>\r\n<p>\r\n<ul class=\"list-style\">\r\n  <li class=\"check-list\">We know how to take an idea and transform it into a product</li>\r\n  <li class=\"check-list\">We know how to take the product and market it to the world</li>\r\n  <li class=\"check-list\">Our team has experience in establishing and building our own\r\nproducts</li>\r\n  <li class=\"check-list\">Professional unity developers and artists</li>\r\n  <li class=\"check-list\">Long-term support and expert consulting</li>\r\n  <li class=\"check-list\">Best quality and good price</li>\r\n</ul>\r\n</p>','/images/service4.png','games','','2014-03-31 12:04:30','2014-05-16 08:16:40','/images/service4_big.png'),(3,'eCommerce','Development, optimization and consulting','<h2>The heart of your ecommerce solution</h2>\r\n<p>\r\nWe provide Website Design, Search Engine, Content and PPC Marketing,\r\neCommerce Solutions and Expert Consulting.\r\n</p>\r\n<p>\r\nOur talented staff allows you the unique possibility to create eCommerce\r\nsoftware on CMS Magento with a team as per the requirements of your project.\r\nYou are free to opt for hiring a highly specialized dedicated team for developing\r\neCommerce software and CMS Magento projects that will let you save your\r\nmoney and expand the team’s productivity while controlling the working\r\nprocess in any comfortable format for you, accommodating your schedule and\r\nlanguage requirements.\r\n</p>\r\n<p>\r\nWe will help you to create a successful online business.\r\n<ul class=\"list-style\">\r\n<li class=\"check-list\">Expert consulting</li>\r\n<li class=\"check-list\">Search Engine optimization</li>\r\n<li class=\"check-list\">Content Marketing</li>\r\n<li class=\"check-list\">SMM</li>\r\n<li class=\"check-list\">PPC Marketing</li>\r\n<li class=\"check-list\">Website Design (Creative/Responsive/Mobile)</li>\r\n<li class=\"check-list\">Google Analytics consulting</li>\r\n<li class=\"check-list\">Video marketing strategy</li>\r\n<li class=\"check-list\">Developing eCommerce software (HTML5/CSS/PHP/RUBY on\r\nRAILS/JavaScript)</li>\r\n<li class=\"check-list\">Magento Development</li>\r\n<li class=\"check-list\">Custom solutions</li>\r\n</ul>\r\n</p>','/images/service3.png','ecommerce','','2014-03-31 12:07:23','2014-05-16 08:31:36','/images/service3_big.png'),(4,'Mobile applications','    ','<p>\r\nLITS carries out projects of any difficulty and complexity. We ensure the best\r\nquality and the best professionals in the sphere of IT.\r\n</p>\r\n<p>\r\nProvision of full-cycle mobile application development for Android, iOS,\r\nWindows Phone.\r\n</p>\r\n<p>\r\nLogic IT Staff offers full cycle service of IT development. We join and support\r\nyour project at any stage or implement your ideas from the very scratch to the\r\nsuccessful product.\r\n</p>','/images/service2.png','mobile_apps','','2014-03-31 12:12:24','2014-04-03 12:57:01','/images/service2_big.png'),(5,'PHP Web development',' ','<p>\r\nWe provide PHP and MySQL web development services with a wide experience\r\nin PHP programming.\r\n</p>\r\n<p>\r\nEvery product of Logic IT Staff benefits from our technical support in the future,\r\nso that you can always get free consultations on each and every challenging\r\nsituation.\r\n</p>\r\n<p>\r\n<ul class=\"list-style\">\r\n<li class=\"check-list\">Highly experienced PHP development team</li>\r\n<li class=\"check-list\">Best quality</li>\r\n<li class=\"check-list\">Highly competitive price</li>\r\n<li class=\"check-list\">Excellent communication</li>\r\n<li class=\"check-list\">Full control over your projects and development team</li>\r\n<li class=\"check-list\">Well-organized cooperation system</li>\r\n<li class=\"check-list\">Long term support for your project</li>\r\n<li class=\"check-list\">Clean and thoroughly documented code</li>\r\n</ul>\r\n</p>','/images/service1.png','php','','2014-03-31 12:13:57','2014-04-03 13:01:34','/images/service1_big.png'),(7,'Startup','We can help you transform your idea into a stunning project.','<p>\r\nWho could understand the problems and needs of startups better than those who have successfully negotiated the whole journey from idea to realization?\r\n</p>\r\n<p>\r\nOur journey of realization for startups started many years ago.  We started with wap games and wap portals. For the last few years, we have been working on a game startup Angry Heroes, as well as Slot Maniacs.  These games are available on all popular mobile platforms, as well as in web and social networks.\r\n</p>\r\n<p>\r\nThe budget for these start-ups has already exceeded $1 million.  The number of users exceeds 50,000 and it is growing rapidly.\r\n</p>\r\n<p>\r\nWe offer and encourage you to use our resources, our ready and capable team. Whether you need a full range of solutions from concept to implementation and promotion , or you need a developer or development team under your full control - with product development at a fixed cost and support provided - our well-organized team that consists of : Ruby on Rails (JS) developers , Unity3d (C #) developers, testers , artists and designers will be delighted to offer you their expertise and professionalism.\r\n</p>\r\n<p>\r\nWe aim to support startups, so you can turn to us for advice, and we will be happy to share our wealth of experience with you.\r\n</p>\r\n','/images/service8.png','startup','slide-left','2014-05-16 08:13:53','2014-05-16 08:53:09','/images/service8_big.png'),(8,'Product','Full cycle solutions, from concept to implementation and promotion.','<p>\r\n  <ul class=\"list-style\">\r\n    <li class=\"check-list\">Development according to your technical specification. Fixed project cost.</li>\r\n    <li class=\"check-list\">Development of technical specifications and design. With further development, or without it.</li>\r\n    <li class=\"check-list\">Full cycle solutions, from concept to implementation and promotion.</li>\r\n</ul>\r\n</p> \r\n\r\n\r\n','/images/service9.png','product','slide-top','2014-05-16 08:20:26','2014-05-16 08:53:27','/images/service9_big.png'),(9,'Staff','A full and highly specialized dedicated team.','<p>\r\n  <ul class=\"list-style\">\r\n    <li class=\"check-list\">Dedicated individual. With the ability to transfer full control to the customer.</li>\r\n    <li class=\"check-list\">Dedicated team. With the ability to transfer full control to the customer.</li>\r\n    <li class=\"check-list\">Work on projects on an hourly basis.</li>\r\n    <li class=\"check-list\">Support option and possibility of refactoring existing code.</li>\r\n  </ul>\r\n</p>','/images/service10.png','staff','slide-right','2014-05-16 08:30:24','2014-05-16 08:53:42','/images/service10_big.png');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$73.SwJBeU9vugnRXyvSkDOfibp8BfIuqvjvq9iK1SfdTAnt4PrtQy','2014-03-26 14:53:29','2014-03-26 14:53:29'),(2,'lex','$2a$10$r27RJaHwszjUPUhbUYACpuJCSaBaCltD7pwoLQn15kmM5huUC4eUm','2014-03-27 14:46:38','2014-03-27 14:46:38'),(4,'seo','$2a$10$SP3g2Ki69Zl99zMBUKyqcO4/fYVjqOJRlf7/X2DS/mAb6taTTDW52','2014-04-24 09:02:20','2014-04-24 09:02:20'),(5,'ura','$2a$10$8kT.3E3/JOlQzbD3ruc/H.V9dwH/5pNdwvjxTZET4YFUH2OEQNOWG','2014-06-02 08:31:40','2014-06-02 08:31:40'), (6, 'yuri', '$2a$10$KOUUAFLQyfiFoAuUi.ZkFOer7XzeNN/n7vFD8SFxbYs.4d37RmBuq', '2014-07-31 17:48:59', '2014-07-31 17:48:59');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-18 18:58:03
