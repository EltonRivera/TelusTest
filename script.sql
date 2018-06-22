CREATE DATABASE  IF NOT EXISTS `voting` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `voting`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: voting
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_area_country1_idx` (`country_id`),
  CONSTRAINT `fk_area_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Zon Occidental',1),(2,'Zona Central',1),(3,'Zona Oriental',1),(4,'Región I o Metropolitana',2),(5,'Región II o Norte',2),(6,'Región III o Nororiental',2),(7,'Región IV o Suroriental',2),(8,'Región V o Central',2),(9,'Región VI o Suroccidental',2),(10,'Región VII o Noroccidental',2),(11,'Región VIII o Petén',2);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `committee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_candidate_committee1_idx` (`committee_id`),
  CONSTRAINT `fk_candidate_committee1` FOREIGN KEY (`committee_id`) REFERENCES `committee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (37,'Bryar','Gamble',9),(38,'Driscoll','Parker',26),(39,'Freya','Crane',53),(40,'Beverly','Day',71),(41,'Naomi','Trevino',8),(42,'Baker','Meadows',65),(43,'Vivien','Whitley',29),(44,'Simon','Knapp',60),(45,'Rooney','Barry',6),(46,'Raymond','Lindsey',20),(47,'Jillian','Garcia',42),(48,'Jada','French',62),(49,'Blair','Reilly',13),(50,'Blythe','Erickson',11),(51,'Colette','Savage',10),(52,'Beau','Schultz',37),(53,'Donna','Combs',29),(54,'Guy','Chang',69),(55,'Jescie','Joseph',64),(56,'Kay','Wynn',41),(57,'Noelani','Estrada',26),(58,'Emma','Paul',59),(59,'Xerxes','Nicholson',42),(60,'Olympia','Emerson',41),(61,'Knox','Fischer',6),(62,'Giacomo','Oliver',39),(63,'Urielle','Shepherd',56),(64,'Hadley','Spence',1),(65,'Theodore','Santos',34),(66,'Reed','Cruz',15),(67,'Forrest','Bass',20),(68,'Zeph','Vega',58),(69,'Maxine','Juarez',68),(70,'Alden','Benjamin',40),(71,'Julie','Berg',49),(72,'Quentin','Mcconnell',46),(73,'Gannon','Mcknight',25),(74,'Cade','Leon',50),(75,'Kenneth','Gordon',68),(76,'Kelly','Mccray',47),(77,'Lenore','Lloyd',11),(78,'Tasha','Foley',6),(79,'Zelenia','Sparks',50),(80,'Regina','Russell',62),(81,'Dolan','Combs',72),(82,'Reed','Mills',66),(83,'Colby','Ramirez',25),(84,'Madeson','Dorsey',23),(85,'Dana','Nichols',28),(86,'Aimee','Bernard',24),(87,'Destiny','Reyes',72),(88,'Todd','Lindsay',22),(89,'Maxwell','Gallegos',15),(90,'Tana','Christensen',26),(91,'Rhoda','Gallegos',3),(92,'Lillith','Chandler',50),(93,'Fletcher','Mccarty',57),(94,'Christen','Gates',30),(95,'Vaughan','Alvarado',70),(96,'Florence','Beard',2),(97,'Guinevere','Harris',52),(98,'Adele','Henson',7),(99,'Tiger','Good',17),(100,'Brittany','George',34),(101,'Kyle','Pope',68),(102,'Chava','Ballard',38),(103,'Renee','Dickson',34),(104,'Scarlett','Cline',22),(105,'Portia','Guzman',57),(106,'Nicholas','Lambert',57),(107,'Leo','Phelps',67),(108,'Tarik','Serrano',11),(109,'Molly','Faulkner',65),(110,'Laura','Dotson',37),(111,'Priscilla','Hendrix',42),(112,'April','Saunders',8),(113,'Kaseem','Christian',29),(114,'Tamekah','Hamilton',20),(115,'Jordan','Dodson',65),(116,'Ocean','Dawson',72),(117,'Prescott','Durham',66),(118,'Brent','Randolph',69),(119,'Sopoline','Buckner',72),(120,'Lev','Kidd',13),(121,'Ann','Reid',39),(122,'Urielle','Campos',41),(123,'Kimberley','Sharp',20),(124,'Cally','Nelson',37),(125,'Sage','Cote',67),(126,'Rebekah','Maddox',52),(127,'Aspen','Guzman',48),(128,'Brittany','Rose',61),(129,'Latifah','Espinoza',52),(130,'Adrian','Wiggins',65),(131,'Melvin','Bradshaw',21),(132,'Xerxes','Kelley',24),(133,'Gloria','Bell',4),(134,'Zeus','Byrd',20),(135,'Alden','Dale',60),(136,'Neville','Webster',50),(137,'Hammett','Vasquez',32),(138,'Leigh','Espinoza',41),(139,'Ursula','Vega',66),(140,'Daphne','George',27),(141,'Philip','Nicholson',36),(142,'Christine','Knight',29),(143,'Anjolie','Foley',3),(144,'Pamela','Cabrera',39),(145,'Lucian','Hall',71),(146,'Ava','Mosley',2),(147,'Nehru','Prince',16),(148,'Coby','Lamb',35),(149,'Roanna','Espinoza',57),(150,'Amber','Hurley',56),(151,'Ivan','Daniels',13),(152,'Cynthia','Talley',23),(153,'Sierra','Webster',3),(154,'Yuri','Simmons',31),(155,'Lewis','Goodman',11),(156,'Ariel','Herrera',32),(157,'Ferdinand','Kennedy',26),(158,'Karleigh','Ware',14),(159,'Lionel','Pitts',37),(160,'Mufutau','Hopper',44),(161,'Perry','Bradshaw',68),(162,'Leandra','Spence',68),(163,'Kenyon','Moon',63),(164,'Wanda','Whitney',59),(165,'Jorden','Bruce',36),(166,'Allen','Caldwell',67),(167,'Chaney','Talley',17),(168,'Cecilia','Coffey',38),(169,'Irene','Cross',50),(170,'Cruz','Rogers',46),(171,'Jasper','Nicholson',52),(172,'Leroy','Cruz',59),(173,'William','West',40),(174,'Rana','Downs',27),(175,'Rowan','Shields',30),(176,'Risa','Nash',13),(177,'Skyler','Gould',1),(178,'Rhea','Macias',43),(179,'Lance','Finley',9),(180,'Blair','Phelps',47),(181,'Eaton','Conley',7),(182,'Cameron','Aguilar',6),(183,'Ginger','Graves',53),(184,'Kasimir','Dickson',53),(185,'Zane','Wells',15),(186,'Eliana','Jenkins',63),(187,'Aquila','Calhoun',51),(188,'Noelani','Ray',26),(189,'Adara','Mccullough',25),(190,'Athena','Thomas',54),(191,'Ralph','Bradford',16),(192,'Fredericka','Riggs',19),(193,'Mary','Mcknight',32),(194,'Chava','Gould',17),(195,'Haviva','Branch',51),(196,'Xyla','Long',43),(197,'Constance','Brock',31),(198,'Doris','Duran',40),(199,'Uma','Waters',65),(200,'Xenos','Foreman',36),(201,'Lance','Sandoval',68),(202,'Farrah','Jennings',6),(203,'Justine','Coffey',24),(204,'Denton','Hogan',29),(205,'Nola','Daniels',2),(206,'Kai','Terrell',12),(207,'Margaret','Booth',27),(208,'Colt','Cobb',36),(209,'Ariel','West',58),(210,'Graiden','Douglas',37),(211,'Haley','Davidson',50),(212,'Pandora','Lane',40),(213,'Ivor','Sandoval',23),(214,'Micah','Peters',70),(215,'David','Campos',12),(216,'Iris','Clayton',62),(217,'Christine','Farmer',34),(218,'Christen','Pollard',8),(219,'Melissa','Salas',39),(220,'Adena','Cardenas',28),(221,'Lareina','Jenkins',28),(222,'Walter','Mccarty',12),(223,'Nell','Powell',5),(224,'Mark','Jenkins',59),(225,'Armando','Miller',65),(226,'Tucker','Garner',24),(227,'Laura','Sosa',44),(228,'Paloma','Noel',51),(229,'Echo','Rodriquez',17),(230,'Audra','Pickett',22),(231,'Tyrone','Fry',41),(232,'Kameko','Villarreal',53),(233,'Petra','Shannon',38),(234,'Judah','Holder',10),(235,'Zenia','Gordon',15),(236,'Jackson','Sampson',49),(237,'Hoyt','Nieves',17),(238,'Noah','Duffy',69),(239,'Jeremy','Gay',5),(240,'Tyrone','Henson',69),(241,'Hayes','Buckley',62),(242,'Alexa','Watkins',65),(243,'Hu','Eaton',13),(244,'Yoshio','Beard',23),(245,'Bradley','Pope',20),(246,'Helen','Price',32),(247,'Jessica','Newman',26),(248,'Rachel','Singleton',32),(249,'Vladimir','Sawyer',8),(250,'Solomon','Ortiz',60),(251,'Angela','Fleming',38),(252,'Rhonda','Travis',6),(253,'Brock','Miles',42),(254,'Norman','Harrell',14),(255,'Kathleen','Curtis',29),(256,'Allen','Blankenship',32),(257,'Willow','Knight',38),(258,'Teegan','Browning',4),(259,'Gannon','Hester',46),(260,'Celeste','Schwartz',36),(261,'Ramona','Rice',9),(262,'Hunter','Mcclure',52),(263,'Harriet','Benton',34),(264,'Natalie','Morin',46),(265,'Lyle','Harris',60),(266,'Kaye','Mccall',58),(267,'Jack','Mercer',51),(268,'Lance','Gallagher',27),(269,'Kennan','Kelley',39),(270,'Rana','Leblanc',36),(271,'Joel','Sutton',20),(272,'Allistair','Bowers',14),(273,'Mara','Shaw',58),(274,'Gareth','Richard',20),(275,'Fulton','West',24),(276,'Cathleen','Wong',15),(277,'Alexander','Garrison',59),(278,'Basia','Walter',42),(279,'Venus','Dale',70),(280,'Piper','Montgomery',56),(281,'Risa','Lopez',49),(282,'George','Richardson',55),(283,'Idola','Goodwin',11),(284,'Xena','Cole',25),(285,'Halee','Elliott',12),(286,'Abigail','Rivers',44),(287,'Bradley','Brewer',4),(288,'Whitney','Holland',23),(289,'Brian','Brown',37),(290,'Lee','Mclean',14),(291,'Ingrid','Massey',28),(292,'Tashya','Lynch',4),(293,'Julie','Burks',61),(294,'Boris','Ruiz',32),(295,'Timothy','Hartman',4),(296,'Gretchen','Townsend',53),(297,'Kai','Burks',8),(298,'Lisandra','Hatfield',59),(299,'Erin','Roth',49),(300,'Demetrius','Morrow',41),(301,'Beatrice','Mueller',66),(302,'Casey','Ferguson',49),(303,'Barbara','Lawson',28),(304,'Ainsley','Malone',62),(305,'Rogan','Mcdonald',30),(306,'Montana','Ayers',24),(307,'Candice','Guzman',40),(308,'Desiree','Branch',27),(309,'Kaye','Griffin',5),(310,'Armand','Daugherty',10),(311,'Rae','Donaldson',50),(312,'Stella','Levy',54),(313,'Gannon','Carroll',59),(314,'Josephine','Cantu',58),(315,'Oscar','Black',38),(316,'September','Joyner',30),(317,'Buckminster','Sykes',17),(318,'Aladdin','Carpenter',6),(319,'Jescie','Gould',12),(320,'Naomi','Ramirez',57),(321,'Carter','Best',62),(322,'Sheila','Dodson',25),(323,'Fredericka','Reeves',33),(324,'Trevor','Herrera',46),(325,'Xena','Wilcox',60),(326,'Dante','Rogers',9),(327,'Mia','Mcneil',68),(328,'Patrick','Weaver',20),(329,'Nerea','Espinoza',18),(330,'Hayfa','Trujillo',49),(331,'Nora','Edwards',52),(332,'McKenzie','Mcknight',69),(333,'Kameko','Castaneda',51),(334,'Asher','Garrison',9),(335,'Neville','Leonard',14),(336,'Avye','Michael',44),(337,'Fallon','Paul',19),(338,'Unity','Morrison',61),(339,'Allen','Reese',13),(340,'Norman','Heath',33),(341,'Trevor','Barrett',46),(342,'Macy','Armstrong',25),(343,'Boris','Stokes',50),(344,'Boris','Osborn',26),(345,'Ivana','Santos',45),(346,'Nathan','Santiago',56),(347,'Sophia','Miranda',18),(348,'Darius','Delaney',4),(349,'Isaiah','Lott',57),(350,'Caryn','Kemp',10),(351,'Anika','Holmes',46),(352,'Roanna','Gallagher',14),(353,'Indigo','Shaw',14),(354,'Willa','Johnston',50),(355,'Theodore','Jordan',64),(356,'Gabriel','Wells',21),(357,'Plato','Conrad',3),(358,'Cruz','Bryan',27),(359,'Imani','Ortega',61),(360,'Keiko','Morales',50),(361,'Zahir','Waters',60),(362,'Kimberley','Sexton',53),(363,'Jenette','Hubbard',9),(364,'Ivory','Cameron',51),(365,'Evangeline','Stout',27),(366,'Glenna','Evans',24),(367,'Rebecca','Parrish',55),(368,'Cathleen','Simon',51),(369,'Gage','Wyatt',23),(370,'Elaine','Head',31),(371,'Jonah','Hernandez',56),(372,'Ava','May',34),(373,'Jonah','Emerson',69),(374,'Jaquelyn','Martinez',36),(375,'Quail','Booth',63),(376,'Haley','Browning',63),(377,'Leandra','Irwin',12),(378,'Madaline','Barnes',21),(379,'Hermione','Stephenson',40),(380,'Akeem','Mckenzie',70),(381,'Brandon','Bray',2),(382,'Isabelle','Perez',38),(383,'Calvin','Randolph',28),(384,'Ashely','Mcfarland',28),(385,'Yvette','Dunn',17),(386,'Ruby','Schultz',42),(387,'Hayes','Mccoy',39),(388,'Hall','Clayton',64),(389,'Victor','Weiss',22),(390,'Isadora','Cochran',63),(391,'Ria','Hartman',4),(392,'Imelda','Frost',24),(393,'Suki','Peck',8),(394,'Chanda','Yang',63),(395,'Burke','Wheeler',60),(396,'Perry','Davenport',57),(397,'Octavia','Horton',72),(398,'Mohammad','Mullen',58),(399,'Nomlanga','Marshall',69),(400,'Victor','Banks',11),(401,'Veronica','Whitney',17),(402,'Adara','Franco',62),(403,'Amir','Cortez',54),(404,'Kirby','Winters',12),(405,'Maite','Benton',7),(406,'Hu','Mcclain',61),(407,'Brett','Miles',6),(408,'Amy','Medina',72),(409,'Tatum','Berger',50),(410,'Nomlanga','Sexton',62),(411,'Tatiana','Herring',29),(412,'Kai','Salas',64),(413,'Malik','Pearson',60),(414,'Carson','Douglas',35),(415,'Scarlett','Reese',40),(416,'Madaline','Adkins',19),(417,'Preston','Norton',10),(418,'Isabelle','Casey',44),(419,'Cassidy','Hebert',57),(420,'Maia','Conley',7),(421,'Moses','Aguilar',63),(422,'Cora','Forbes',47),(423,'Maryam','Jimenez',66),(424,'Cynthia','Gaines',28),(425,'Connor','Barlow',47),(426,'Robin','Burt',11),(427,'Kibo','Williamson',3),(428,'Alice','Mcleod',69),(429,'Velma','Odonnell',33),(430,'Lawrence','Atkinson',22),(431,'Shad','Price',10),(432,'Lewis','Hewitt',41),(433,'Justina','House',11),(434,'Ina','Dunn',21),(435,'Michael','Mcconnell',5),(436,'Victoria','Bush',38),(437,'Garrison','Foley',54),(438,'Alden','Irwin',52),(439,'Olivia','Watts',47),(440,'Tatyana','Wade',22),(441,'Ingrid','Hardin',27),(442,'Kuame','Hartman',32),(443,'Cameron','Frazier',10),(444,'Jael','Hansen',4),(445,'Adele','Jacobson',62),(446,'Cynthia','Rosales',14),(447,'Bryar','Curry',56),(448,'Clark','Grant',41),(449,'Renee','Ruiz',51),(450,'Gavin','Rodriquez',65),(451,'Rebekah','Bruce',5),(452,'Alma','Lyons',30),(453,'Heidi','Whitney',13),(454,'Steven','Harvey',54),(455,'Damian','Frazier',4),(456,'Abbot','Knox',19),(457,'Alyssa','Bowers',25),(458,'Phoebe','Robertson',55),(459,'Lee','Conley',68),(460,'Isabelle','Copeland',32),(461,'Abigail','Clayton',71),(462,'Minerva','Hull',25),(463,'Calvin','House',33),(464,'Rae','Mcclain',60),(465,'Dora','Yates',2),(466,'Ann','Payne',47),(467,'Irma','Cross',64),(468,'Kylee','Knapp',8),(469,'Ina','Graves',8),(470,'Burton','Shepard',10),(471,'McKenzie','Ochoa',47),(472,'Miriam','Lowery',10),(473,'Maris','Burgess',66),(474,'Daphne','Morrison',14),(475,'Brenda','Holcomb',20),(476,'Shelly','Garrison',67),(477,'Grace','Cantrell',56),(478,'Jacob','Pickett',62),(479,'Coby','Carroll',60),(480,'Charles','Reynolds',49),(481,'Unity','Mcmillan',22),(482,'Kiayada','Lewis',13),(483,'Bevis','Miles',68),(484,'Mary','Key',46),(485,'Hamish','Fry',45),(486,'Venus','Lancaster',60),(487,'Kalia','Page',58),(488,'Nita','Charles',43),(489,'Cassidy','Hull',23),(490,'Desirae','Mcknight',68),(491,'Alan','Gonzalez',19),(492,'Otto','Watson',42),(493,'Emery','Nguyen',59),(494,'Irene','Blake',31),(495,'Jonah','Weber',44),(496,'Jordan','Yang',60),(497,'Donovan','Mcclure',54),(498,'Hiroko','Church',60),(499,'Frances','Reed',18),(500,'Fallon','Frank',68),(501,'September','Middleton',19),(502,'Wesley','Pollard',46),(503,'Ali','Dennis',19),(504,'Ayanna','Gay',56),(505,'Lucian','Chapman',35),(506,'Robert','Hinton',37),(507,'Amela','Lindsay',21),(508,'Fuller','Hensley',21),(509,'Kameko','Branch',23),(510,'Linda','Taylor',16),(511,'Cheyenne','Woodward',55),(512,'Aurora','Atkins',11),(513,'Savannah','Morgan',49),(514,'Byron','Miles',39),(515,'Lacey','Hubbard',4),(516,'Jena','Alford',31),(517,'Amanda','Rios',56),(518,'MacKenzie','Browning',33),(519,'Evelyn','Rivas',13),(520,'Zelenia','Page',70),(521,'Farrah','Mueller',67),(522,'Dai','Snider',56),(523,'Anne','Reeves',64),(524,'Clarke','Middleton',47),(525,'Galena','Silva',33),(526,'Cheyenne','Turner',10),(527,'David','Albert',44),(528,'Addison','Glass',69),(529,'Kiona','Ferrell',30),(530,'Eliana','Pope',24),(531,'Justin','Buck',72),(532,'Jesse','Washington',36),(533,'Cyrus','Clayton',41),(534,'Cullen','Velez',35),(535,'Cameran','Mclaughlin',47),(536,'Drake','Knight',50),(537,'Yoshi','Chase',12),(538,'Bianca','Ellis',27),(539,'Briar','Koch',51),(540,'Sacha','Pruitt',50),(541,'Stacy','Lynn',39),(542,'Matthew','Vaughan',45),(543,'Odessa','Puckett',68),(544,'Savannah','Savage',30),(545,'Desirae','Emerson',70),(546,'Nola','Castro',39),(547,'Dominic','Sargent',18),(548,'Garrison','Strickland',17),(549,'Dominique','Kelly',33),(550,'Sonia','Boyer',53),(551,'Valentine','Stuart',25),(552,'Carissa','Middleton',28),(553,'Reece','Levine',60),(554,'Rose','Gonzalez',67),(555,'Rachel','Buck',47),(556,'Cruz','Taylor',20),(557,'Bernard','Chavez',63),(558,'Jana','Fry',39),(559,'Buckminster','Cruz',48),(560,'Deanna','Camacho',44),(561,'Deacon','Guzman',63),(562,'Carol','Nicholson',64),(563,'Darrel','Macdonald',17),(564,'Aubrey','Preston',38),(565,'Gannon','Stokes',60),(566,'Tamara','Hodge',69),(567,'Raya','Harper',4),(568,'Sasha','Newman',62),(569,'Beau','Frank',5),(570,'Kenyon','Carver',58),(571,'Thor','Wong',1),(572,'Penelope','Stephens',32),(573,'Gwendolyn','Kelly',56),(574,'Myles','Avery',10),(575,'Erasmus','Rhodes',36),(576,'Alexandra','Bright',5),(577,'Jackson','Brooks',14),(578,'Kylee','Oneill',58),(579,'Joelle','Brady',55),(580,'Abigail','Buck',64),(581,'Bernard','Hinton',34),(582,'Maya','Richardson',29),(583,'Quincy','Briggs',70),(584,'Simone','Huff',71),(585,'Kelly','Mathews',71),(586,'Quon','Hester',49),(587,'Alan','Sullivan',10),(588,'Graham','Gay',2),(589,'Josiah','Sullivan',61),(590,'Tyrone','Hancock',4),(591,'Maxine','Whitfield',15),(592,'Chanda','Walsh',45),(593,'Madison','Wiley',15),(594,'Nita','Hunt',38),(595,'Elmo','Park',14),(596,'Kellie','Chandler',30),(597,'Veda','Long',53),(598,'Daniel','Mcbride',11),(599,'Warren','Winters',35),(600,'Kamal','Petty',67),(601,'Leonard','Williamson',47),(602,'Ocean','Melton',34),(603,'Lilah','Dunlap',54),(604,'Emmanuel','Bolton',70),(605,'Nayda','Slater',66),(606,'Celeste','Bradshaw',10),(607,'Zelenia','Hartman',48),(608,'Ryder','Brewer',47),(609,'Stacy','Williams',61),(610,'Adam','Newman',37),(611,'Pascale','Ortega',48),(612,'Beatrice','Blankenship',58),(613,'Merritt','Barrera',20),(614,'Sybil','Mejia',58),(615,'Owen','Mooney',27),(616,'Harriet','Maynard',26),(617,'Libby','Miles',72),(618,'Erica','Burgess',69),(619,'Audra','Santana',22),(620,'Jillian','Hahn',47),(621,'Barrett','Steele',55),(622,'Galvin','Oneill',62),(623,'Erin','Barber',32),(624,'Mikayla','Hart',45),(625,'Isabella','Mccoy',26),(626,'Melanie','Hall',39),(627,'Karleigh','Schmidt',48),(628,'Ainsley','Duran',34),(629,'Shad','Gates',51),(630,'Ali','Swanson',59),(631,'Chiquita','Church',33),(632,'Faith','Holden',54),(633,'Kim','Steele',7),(634,'Gregory','Beard',45),(635,'Willa','Lindsay',54),(636,'Keefe','Bolton',42),(637,'Sierra','Dillon',22),(638,'Harding','Maldonado',65),(639,'Emma','Dawson',68),(640,'Beck','Sweet',7),(641,'Mohammad','Benjamin',72),(642,'Kylee','Mckinney',72),(643,'Carol','Cameron',13),(644,'Sasha','Rosales',34),(645,'Amal','Larsen',43),(646,'Eve','Fernandez',64),(647,'Brady','Richardson',40),(648,'Xena','Shaffer',30),(649,'Mari','Boone',31),(650,'Mary','Berry',61),(651,'Tanek','Allison',70),(652,'Gail','Quinn',28),(653,'Sydnee','West',1),(654,'Lamar','Richard',13),(655,'Hannah','Rowland',3),(656,'Shafira','Hayden',62),(657,'Chester','Ortega',59),(658,'Zia','Carson',50),(659,'Nathan','Perry',21),(660,'Noble','Monroe',1),(661,'Madeson','Stout',28),(662,'Zachery','Patterson',5),(663,'Sybil','Long',50),(664,'Hayley','Solis',32),(665,'Daquan','Wolfe',21),(666,'Aurelia','Gordon',55),(667,'Celeste','Mejia',60),(668,'Kameko','Harrington',22),(669,'Hermione','Frye',40),(670,'Melissa','West',18),(671,'Portia','Stark',71),(672,'Jaime','Oconnor',71),(673,'Mikayla','Howe',28),(674,'Xena','Harper',42),(675,'Jayme','Simmons',45),(676,'Iris','Clemons',72),(677,'Zoe','Kirkland',57),(678,'Tanner','Ball',36),(679,'Samantha','Rosales',8),(680,'Tamara','Gordon',72),(681,'Ian','Jacobson',39),(682,'Phelan','Lewis',28),(683,'Bruno','Kirk',50),(684,'Herrod','Delacruz',61),(685,'Yen','Slater',36),(686,'Giselle','Norton',55),(687,'Jillian','Blair',27),(688,'Kyle','Perez',13),(689,'Price','Kent',24),(690,'Yuli','Horne',38),(691,'Mohammad','Singleton',21),(692,'Steel','Irwin',2),(693,'Cadman','Graves',18),(694,'Zelda','Lindsey',39),(695,'Lydia','Mcconnell',15),(696,'Yvonne','Ellison',27),(697,'Odessa','Suarez',23),(698,'Colette','Young',64),(699,'Ira','Sullivan',31),(700,'Kylee','Stark',48),(701,'Grady','Washington',64),(702,'Blake','Larsen',3),(703,'Tarik','Hays',10),(704,'Yasir','Fuentes',8),(705,'Bruce','Irwin',31),(706,'Chantale','Sweeney',49),(707,'Kalia','Maldonado',16),(708,'Wyoming','Vang',34),(709,'Tiger','Tucker',1),(710,'Imani','Schroeder',17),(711,'Yen','Benton',31),(712,'Hammett','Benjamin',35),(713,'Zenaida','Carver',45),(714,'Grace','Goodman',66),(715,'Hedwig','Booker',67),(716,'Basia','Navarro',49),(717,'Linus','Terrell',48),(718,'Sasha','Neal',34),(719,'Porter','Farrell',34),(720,'Geoffrey','Walter',21),(721,'Colin','Stephens',25),(722,'Pearl','Walsh',28),(723,'Merrill','Adkins',67),(724,'Magee','Miranda',22),(725,'Ginger','Warner',17),(726,'Lyle','Fields',13),(727,'Mechelle','Randolph',31),(728,'Lev','Prince',35),(729,'Amal','Clay',34),(730,'Justin','Tucker',23),(731,'Ori','Cardenas',33),(732,'Remedios','Franco',69),(733,'Tatum','Romero',8),(734,'Micah','Marshall',42),(735,'Blythe','House',9),(736,'Ila','Lowe',49),(737,'Orla','Hardy',50),(738,'Aristotle','Burns',63),(739,'Stacey','Tate',34),(740,'Britanney','Nieves',1),(741,'Harrison','Knox',42),(742,'Hedy','Cooper',12),(743,'Nigel','Shepard',16),(744,'Shea','Walter',56),(745,'Gretchen','Jensen',8),(746,'Nathaniel','Summers',31),(747,'Katell','Townsend',20),(748,'Kimberly','Ortiz',42),(749,'Ross','Donovan',61),(750,'Rooney','Kent',35),(751,'Kennedy','Blevins',60),(752,'Griffin','Glass',72),(753,'Maxwell','Franco',10),(754,'Jane','Duke',7),(755,'Abdul','Stokes',36),(756,'Chaim','Fleming',1),(757,'Cheyenne','Norton',66),(758,'Juliet','Yates',14),(759,'Burke','Glover',42),(760,'Dean','Crawford',29),(761,'Len','Gray',61),(762,'Leonard','Rowe',50),(763,'Hanna','Wiggins',68),(764,'Colt','Sutton',68),(765,'Samuel','Evans',39),(766,'Marny','Gilbert',22),(767,'Chava','Parker',62),(768,'Dexter','Vazquez',69),(769,'Madonna','Gamble',62),(770,'Lester','Reyes',11),(771,'Plato','Mendez',18),(772,'Demetrius','Knight',11),(773,'Ruby','Estrada',58),(774,'Hollee','Dorsey',11),(775,'Giacomo','Figueroa',55),(776,'Chantale','Larsen',19),(777,'George','Yang',71),(778,'Marsden','Gutierrez',48),(779,'Bianca','Mathews',55),(780,'Dawn','Rogers',25),(781,'Zelda','Rosa',48),(782,'Leilani','Hurley',15),(783,'Zachary','Stafford',47),(784,'Jarrod','Pennington',26),(785,'Kenyon','Powell',31),(786,'Dylan','Zamora',30),(787,'Felix','Sexton',26),(788,'Orli','Boone',60),(789,'Mari','Ferrell',69),(790,'Malik','Frazier',23),(791,'Elmo','Barry',46),(792,'Meredith','England',62),(793,'Tanya','Wolfe',20),(794,'Elaine','Cooke',72),(795,'Germane','Sampson',43),(796,'Keelie','Goff',31),(797,'Genevieve','Chen',37),(798,'Hilary','Noel',26),(799,'Raja','Owens',63),(800,'Lois','Hayden',7),(801,'Laith','Luna',41),(802,'Ciara','Shaw',36),(803,'Michael','Fisher',15),(804,'Daphne','Wong',27),(805,'Akeem','Grimes',41),(806,'Macy','Snider',41),(807,'Alfonso','Anthony',15),(808,'Halee','Floyd',8),(809,'Britanni','Ayala',2),(810,'Beverly','Conrad',39),(811,'Sophia','Dixon',27),(812,'Michelle','Terrell',38),(813,'Farrah','Morris',6),(814,'Ezra','Estes',40),(815,'Quin','Mitchell',29),(816,'Amela','Dunlap',56),(817,'Piper','Salazar',9),(818,'Warren','Chan',24),(819,'Hollee','Jenkins',37),(820,'Uma','Chapman',26),(821,'Chelsea','Dominguez',43),(822,'Olympia','Hansen',29),(823,'Erasmus','Kline',21),(824,'Laith','Goff',52),(825,'Wendy','Dalton',70),(826,'Cassady','Jefferson',63),(827,'Yasir','Pope',70),(828,'Chiquita','Avery',44),(829,'Alden','Griffith',69),(830,'Hadassah','Cabrera',23),(831,'Debra','Lang',15),(832,'Brian','Rhodes',1),(833,'Ira','Buck',69),(834,'Ray','Moreno',61),(835,'Deacon','Roach',62),(836,'Carolyn','Wheeler',18),(837,'Wing','Becker',9),(838,'Kirk','James',7),(839,'Lillian','Stein',64),(840,'Calvin','Mckee',34),(841,'Renee','Hawkins',56),(842,'Tallulah','Jefferson',24),(843,'Brittany','Pollard',69),(844,'Yael','Daugherty',25),(845,'Stephanie','Lopez',16),(846,'Jael','Noble',64),(847,'Chantale','Copeland',3),(848,'Carol','Cummings',12),(849,'Colorado','Haynes',13),(850,'Ima','Clarke',7),(851,'Cally','Hill',19),(852,'Sydney','Charles',12),(853,'Eleanor','Mcknight',53),(854,'Ciara','Nash',28),(855,'Sheila','Morgan',16),(856,'Wyatt','Weeks',26),(857,'Charles','Watts',40),(858,'Dean','Gordon',47),(859,'Burton','Scott',38),(860,'Rinah','Downs',9),(861,'Yuli','Hinton',58),(862,'Kim','Love',56),(863,'Abraham','Raymond',16),(864,'Evan','Hendrix',17),(865,'Baker','Bishop',51),(866,'Samuel','Potts',1),(867,'Blair','Acevedo',7),(868,'Dale','Mullen',67),(869,'Serina','Mcfarland',54),(870,'Aretha','Serrano',46),(871,'Destiny','Maxwell',15),(872,'Rhea','Gamble',72),(873,'Gillian','Hyde',20),(874,'Brent','Gross',6),(875,'Jamal','Parrish',61),(876,'Eric','Bruce',10),(877,'Bell','Castaneda',58),(878,'Wallace','Mills',41),(879,'Dylan','Chan',58),(880,'Isabelle','Austin',61),(881,'Dominique','Humphrey',65),(882,'Kevin','Morrow',50),(883,'Jane','Moreno',33),(884,'Isabella','Shepherd',55),(885,'Dennis','Watson',39),(886,'Graham','Guerrero',60),(887,'Lyle','Miranda',2),(888,'Althea','Rogers',38),(889,'Upton','Barnett',13),(890,'Ezra','Cameron',46),(891,'Connor','Wilson',66),(892,'Oleg','Peterson',43),(893,'Ryder','Buckner',6),(894,'Indigo','Mooney',60),(895,'Coby','Hendricks',61),(896,'Chaim','Knapp',27),(897,'Julian','Tillman',29),(898,'Virginia','Weeks',58),(899,'Mark','Rush',47),(900,'Derek','Holloway',47),(901,'Nigel','Emerson',16),(902,'Joan','Jarvis',5),(903,'Burke','Sellers',18),(904,'Plato','Macdonald',68),(905,'Nathan','Cooley',42),(906,'Mollie','Sparks',8),(907,'Sylvester','Potts',46),(908,'Shellie','Harvey',68),(909,'Dora','Dawson',12),(910,'Dorothy','Barber',53),(911,'Colt','Le',36),(912,'Duncan','Cross',28),(913,'Keegan','Farmer',72),(914,'Jacob','Burke',58),(915,'Laurel','Marsh',36),(916,'Deirdre','Odonnell',50),(917,'Sopoline','Horne',38),(918,'Vance','Long',69),(919,'Yvette','Parsons',25),(920,'Wylie','Rhodes',21),(921,'Paki','Fitzgerald',60),(922,'Kelly','Stevenson',17),(923,'Frances','Day',53),(924,'Chandler','Tucker',25),(925,'Brody','Alvarez',50),(926,'Kamal','Washington',59),(927,'Arthur','Spears',30),(928,'Donovan','Gill',28),(929,'Marny','Strickland',36),(930,'Xandra','Greene',68),(931,'Ora','Monroe',45),(932,'Raymond','Hahn',50),(933,'Duncan','Vance',48),(934,'Nicole','Mason',18),(935,'Malachi','Davis',34),(936,'Aquila','Jones',29),(937,'Kameko','Riggs',43),(938,'Brian','Pugh',24),(939,'Yasir','Rollins',37),(940,'Lacy','Huff',65),(941,'James','Page',41),(942,'Austin','Potts',2),(943,'Tana','Miranda',61),(944,'Rashad','Boyer',70),(945,'Dominique','Mckinney',27),(946,'Amity','William',24),(947,'Yoko','Buck',48),(948,'Madison','Valentine',63),(949,'Noel','Barr',57),(950,'Grant','Cabrera',34),(951,'Tate','Hopkins',54),(952,'Catherine','Howe',18),(953,'Fletcher','Mckee',49),(954,'Alma','Orr',67),(955,'Francis','Keith',34),(956,'Faith','Aguilar',64),(957,'Imani','Dixon',39),(958,'Imogene','Parker',13),(959,'Jena','Morrison',65),(960,'Dorian','Hampton',44),(961,'Christen','Yates',23),(962,'Belle','Mullins',52),(963,'Len','Wilcox',48),(964,'Idona','Welch',7),(965,'Uma','Rollins',21),(966,'Fallon','Humphrey',58),(967,'Odessa','Talley',60),(968,'Emily','Strickland',5),(969,'Adara','Mosley',46),(970,'Lee','Scott',41),(971,'Aaron','Carlson',47),(972,'Leila','Marsh',40),(973,'Rinah','Vincent',41),(974,'Kenyon','Barker',66),(975,'Herrod','Atkins',58),(976,'Laurel','Flowers',49),(977,'Inga','Palmer',33),(978,'Jasper','Rasmussen',64),(979,'Dean','Odonnell',18),(980,'Price','Medina',45),(981,'Lester','Jordan',40),(982,'Jade','Oliver',3),(983,'Chadwick','Cooper',21),(984,'Wallace','Goff',42),(985,'Sonya','Lowery',5),(986,'Jorden','Murphy',70),(987,'Maite','Andrews',14),(988,'Inga','Gibson',35),(989,'Jacqueline','Terrell',37),(990,'Leandra','Dyer',6),(991,'Yen','Morales',23),(992,'Destiny','Mcbride',8),(993,'Kirby','Petersen',72),(994,'Ayanna','Nelson',57),(995,'Anastasia','Mcmillan',42),(996,'Nissim','Griffin',37),(997,'Morgan','Rose',5),(998,'Gregory','Wilkerson',59),(999,'Jacob','Daniels',70),(1000,'Dorian','Burnett',2),(1001,'Gavin','Parsons',24),(1002,'Herrod','Mcmahon',6),(1003,'Alisa','Rush',20),(1004,'Brett','Best',7),(1005,'Germane','Bell',42),(1006,'Indigo','Knight',70),(1007,'Jessamine','Horton',39),(1008,'Lilah','King',44),(1009,'Kiayada','Bernard',52),(1010,'Faith','Coleman',45),(1011,'Chloe','Dixon',56),(1012,'Jonas','Ware',37),(1013,'Cassandra','Mccormick',29),(1014,'Fatima','Lang',29),(1015,'Tyler','Pickett',70),(1016,'Tate','Morris',57),(1017,'Dorothy','Richmond',5),(1018,'Ifeoma','Hendricks',52),(1019,'Jerry','Rivera',15),(1020,'Scarlet','Richardson',52),(1021,'Simone','Macdonald',31),(1022,'Luke','Roberts',12),(1023,'Scott','Fuentes',38),(1024,'Denton','Roberts',1),(1025,'Imelda','Silva',47),(1026,'Burton','Edwards',55),(1027,'Malcolm','Tate',65),(1028,'Dahlia','Buchanan',9),(1029,'Leila','Crosby',35),(1030,'Eden','Fitzpatrick',50),(1031,'Shannon','Tanner',54),(1032,'Nyssa','Bentley',19),(1033,'Rhiannon','Rodgers',30),(1034,'Amaya','Cotton',27),(1035,'Caldwell','Kirk',26),(1036,'Aurora','Cook',38);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_committee_department1_idx` (`department_id`),
  CONSTRAINT `fk_committee_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee`
--

LOCK TABLES `committee` WRITE;
/*!40000 ALTER TABLE `committee` DISABLE KEYS */;
INSERT INTO `committee` VALUES (1,'Penatibus Et Industries',1),(2,'At Corporation',2),(3,'Sem LLP',3),(4,'Adipiscing Enim Mi Limited',4),(5,'Sociosqu Inc.',5),(6,'Accumsan Foundation',6),(7,'Eu Odio Tristique Associates',7),(8,'Integer Mollis Integer Ltd',8),(9,'Lacus Nulla Corp.',9),(10,'Aliquet Foundation',10),(11,'Arcu Inc.',11),(12,'Consectetuer Incorporated',12),(13,'Eget Incorporated',13),(14,'A Mi Ltd',14),(15,'Eu Tellus Associates',15),(16,'Ultricies Dignissim Lacus Limited',16),(17,'Ante LLC',17),(18,'Feugiat Lorem Ipsum LLP',18),(19,'Nisl Sem Consequat Company',19),(20,'Ut Lacus Nulla Inc.',20),(21,'Ligula Limited',21),(22,'Vulputate Eu Odio Incorporated',22),(23,'Tincidunt Nunc Ac Industries',23),(24,'Sit Amet Nulla Institute',24),(25,'A Inc.',25),(26,'Mus Company',26),(27,'Ante Maecenas Mi Consulting',27),(28,'Class Aptent Corp.',28),(29,'Elit Ltd',29),(30,'Molestie Ltd',30),(31,'Cursus PC',31),(32,'Adipiscing Corp.',32),(33,'Consectetuer Mauris Corporation',33),(34,'Integer Mollis PC',34),(35,'Diam Pellentesque Habitant Ltd',35),(36,'Vivamus Nibh Dolor Industries',36),(37,'Lorem Ipsum Dolor Foundation',1),(38,'Nec Associates',2),(39,'Cursus LLP',3),(40,'Proin Eget Odio Foundation',4),(41,'Quisque Fringilla Euismod PC',5),(42,'At PC',6),(43,'Nunc Interdum Feugiat Incorporated',7),(44,'Cras Sed Consulting',8),(45,'Semper Et Lacinia Industries',9),(46,'Metus PC',10),(47,'Donec Corp.',11),(48,'Vitae Orci Associates',12),(49,'Non Sollicitudin A Corp.',13),(50,'Egestas Sed Institute',14),(51,'Diam Corp.',15),(52,'Elit A Feugiat Institute',16),(53,'Ante Nunc Company',17),(54,'Sed Id Institute',18),(55,'Luctus Ut LLP',19),(56,'Donec Institute',20),(57,'Amet Massa Limited',21),(58,'Enim Mauris Ltd',22),(59,'Accumsan Sed Foundation',23),(60,'Libero Donec Consectetuer LLC',24),(61,'Ut Sem Nulla Ltd',25),(62,'Urna Incorporated',26),(63,'Cras Dolor Corp.',27),(64,'Sollicitudin Orci Sem Foundation',28),(65,'Sem Magna Nec Foundation',29),(66,'Sem Eget Massa LLP',30),(67,'Blandit Enim Consequat Industries',31),(68,'Sociis Natoque Penatibus Limited',32),(69,'Nibh Phasellus Company',33),(70,'Augue Id LLP',34),(71,'Lacus LLP',35),(72,'Donec Feugiat LLP',36);
/*!40000 ALTER TABLE `committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'El slavador'),(2,'Guatemala');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_area1_idx` (`area_id`),
  CONSTRAINT `fk_department_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Ahuachapán',1),(2,'Sonsonate',1),(3,'Santa Ana',1),(4,'Cabañas',2),(5,'Chalatenango',2),(6,'Cuscatlán',2),(7,'La Libertad',2),(8,'La Paz',2),(9,'San Salvador',2),(10,'San Vicente',2),(11,'Morazán',3),(12,'San Miguel',3),(13,'Usulután',3),(14,'La Unión',3),(15,'Guatemala',4),(16,'Alta Verapaz',5),(17,'Baja Verapaz',5),(18,'Chiquimula',6),(19,'El Progreso',6),(20,'Izabal',6),(21,'Zacapa',6),(22,'Jutiapa',7),(23,'Jalapa',7),(24,'Santa Rosa',7),(25,'Chimaltenango',8),(26,'Sacatepéquez',8),(27,'Escuintla',8),(28,'Quetzaltenango',9),(29,'Retalhuleu',9),(30,'San Marcos',9),(31,'Suchitepéquez',9),(32,'Sololá',9),(33,'Totonicapán',9),(34,'Huehuetenango',10),(35,'Quiché',10),(36,'Petén',11);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elector`
--

DROP TABLE IF EXISTS `elector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surnames` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_document` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_elector_country1_idx` (`country_id`),
  CONSTRAINT `fk_elector_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elector`
--

LOCK TABLES `elector` WRITE;
/*!40000 ALTER TABLE `elector` DISABLE KEYS */;
INSERT INTO `elector` VALUES (1,'Elton','Rivera','eltonalexanderrivera@gmail.com','543753781',1),(2,'Josue Alexánder','Mejía López','Josuealexander15@hotmail.com','3242535',2);
/*!40000 ALTER TABLE `elector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `elector_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  KEY `fk_user_elector_idx` (`elector_id`),
  CONSTRAINT `fk_user_elector` FOREIGN KEY (`elector_id`) REFERENCES `elector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'elton.rivera','$2a$10$4gibOOhjynGo5YG3fdOliuGpNHx8Tjwv/yI/hVjF9DQMm8Xk3C1R.',1),(2,'josue.mejia','$2a$10$tsW3sciHrvluwjkii5b8WeSjQubgu19PJfpswVYEXK/rhiqHcUU7m',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elector_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vote` (`elector_id`,`candidate_id`),
  KEY `fk_elector_has_candidate_candidate1_idx` (`candidate_id`),
  KEY `fk_elector_has_candidate_elector1_idx` (`elector_id`),
  CONSTRAINT `fk_elector_has_candidate_candidate1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_elector_has_candidate_elector1` FOREIGN KEY (`elector_id`) REFERENCES `elector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (3,2,489,'2018-06-22 02:51:55'),(4,2,493,'2018-06-22 02:52:01'),(5,2,591,'2018-06-22 03:42:50'),(6,2,262,'2018-06-22 03:48:05');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'voting'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-22  3:48:56
