-- MySQL dump 10.13  Distrib 5.6.20, for Win64 (x86_64)
--
-- Host: localhost    Database: realmd
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `gmlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `failed_logins` int(11) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_realm_id` int(11) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mutetime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_gmlevel` (`gmlevel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'ADMINISTRATOR','a34b29541b87b7e4823683ce6c7bf6ae68beaaac',3,'','0','0','','2005-09-01 00:00:00','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),(2,'GAMEMASTER','7841e21831d7c6bc0b57fbe7151eb82bd65ea1f9',2,'','0','0','','2005-09-01 00:00:00','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),(3,'MODERATOR','a7f5fbff0b4eec2d6b6e78e38e8312e64d700008',1,'','0','0','','2005-09-01 00:00:00','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),(4,'PLAYER','3ce8a96d17c5ae88a30681024e86279f1a38c041',0,'','0','0','','2005-09-01 00:00:00','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_banned` (
  `id` int(11) unsigned NOT NULL COMMENT 'Account identifier',
  `bandate` bigint(40) NOT NULL DEFAULT '0',
  `unbandate` bigint(40) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`),
  CONSTRAINT `account_banned_ibfk_1` FOREIGN KEY (`id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocsfields`
--

DROP TABLE IF EXISTS `dbdocsfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocsfields` (
  `fieldId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Id for this field',
  `languageId` int(11) NOT NULL DEFAULT '0' COMMENT 'dbdocsLanguageId to link to. (Normallu 0 = English)',
  `tableName` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the table to link to',
  `fieldName` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the field to link the note to',
  `fieldComment` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Main field Note',
  `fieldNotes` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Additional Field Notes',
  PRIMARY KEY (`fieldId`,`languageId`),
  KEY `fieldId` (`fieldId`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocsfields`
--

LOCK TABLES `dbdocsfields` WRITE;
/*!40000 ALTER TABLE `dbdocsfields` DISABLE KEYS */;
INSERT INTO `dbdocsfields` VALUES (1,0,'account','active_realm_id','Unique ID of the realm server','This references the realmlist tables unique ID of the realm server on which the account is currently active. This will allow the game client to connect to the realm the account was active on at the last login.'),(2,0,'account','email','The e-mail address associated with this account.','The e-mail address associated with this account.'),(3,0,'account','expansion','Which expansion\'s content a user has access to.','The field controls to which expansion\'s content a user has access. By default this is set to 0, allowing access to vanilla WoW content. In mangos-zero, other values can be ignored, since there is no expansion.<br />\r\n'),(4,0,'account','failed_logins','The number of failed logins attempted on the account.','The number of failed logins attempted on the account. Monitoring this field may help spotting users who try to gain access to accounts which are not their own, or who have forgotten their passwords.'),(5,0,'account','gmlevel','The account security level.','The account security level. Different levels have access to different commands. The individual level required for a command is defined in the Mangos command table. Valid values are:<br />\r\n'),(6,0,'account','id','The unique account ID.','The unique account ID.'),(7,0,'account','joindate','The date when the account was created.','The date when the account was created.'),(8,0,'account','last_ip','The last IP used by the person who last logged into the account.','The last IP used by the person who last logged into the account.'),(9,0,'account','last_login','The date when the account was last logged into.','The date when the account was last logged into.'),(10,0,'account','locale','The locale used by the client logged into this account.','The locale used by the client logged into this account. If multiple locale data has been configured and added to the world servers, the world servers will return the proper locale strings to the client. \r\n'),(11,0,'account','locked','Indicates whether the account has been locked or not.','Boolean 0 or 1 controlling if the account has been locked or not.'),(12,0,'account','mutetime','The time, in Unix time, when the account will be unmuted.','The time, in Unix time, when the account will be unmuted.<br/>\r\n<pre>SELECT `username`, FROM_UNIXTIME(`mutetime`) FROM `account`;</pre>\r\n'),(13,0,'account','s','Session \'Salt\' Value.','Session \'Salt\' Value. Initially a randomly generated value, which when applied against the SHA1 hash of the username / password combo (See account.sha_pass_hash) produces the validation hash (See account.v).\r\n'),(14,0,'account','sessionkey','The Session Key.','The SessionKey - this is the validated result of the login negotiation. This allows disconnected clients to reconnection to their previous session.'),(15,0,'account','sha_pass_hash','This field contains the encrypted password.','This field contains the encrypted password. The encryption is SHA1 and is in the following format: username:password. The SQL to create the password (or to compare with the current hash) is:\r\n<pre>SELECT SHA1(CONCAT(UPPER(`username`), \':\', UPPER({pass})));</pre>'),(16,0,'account','username','The account user name.','The account user name.'),(17,0,'account','v','The validated Hash Value.','The validated Hash Value, this is created by using the \'Salt\' value (See account.s) applied to the username/password SHA1 hash (See account.sha_pass_hash).'),(18,0,'account_banned','active','Is the ban is currently active or not.','This is a Boolean field controlling if the ban is currently active or not.<br />\r\n'),(19,0,'account_banned','bandate','The date when the account was banned, in Unix time.','The date when the account was banned, in Unix time.'),(20,0,'account_banned','bannedby','The character that banned the account.','The character with the rights to the .ban command that banned the account.'),(21,0,'account_banned','banreason','The reason for the ban.','The reason for the ban.'),(22,0,'account_banned','id','The account ID (See account.id).','The account ID (See account.id).'),(23,0,'account_banned','unbandate','The date when the account will be automatically unbanned.','The date when the account will be automatically unbanned, in Unix time. A value less than the current date means, in effect, a permanent ban.'),(24,0,'dbdocsfields','fieldComment','Main field Note','Main field Note'),(25,0,'dbdocsfields','fieldName','The fieldname in the table to link the note to.','The fieldname in the table to link the note to.'),(26,0,'dbdocsfields','fieldNotes','The Field Note text','The Field Note text'),(27,0,'dbdocsfields','tableName','The table name to link the note to.','The table name to link the note to.'),(28,0,'dbdocssubtables','subTableContent','The Sub Table Content','The Sub Table Content'),(29,0,'dbdocssubtables','subTableId','The Lookup Id of the subTable','This is the Lookup Id of the subTable'),(30,0,'dbdocssubtables','subTableName','The Name of the SubTable','The Name of the SubTable'),(31,0,'dbdocssubtables','subTableTemplate','The SubTable Template','The SubTable Template, Used to create the SubTableContent field content'),(32,0,'dbdocstable','tableName','The table name to link the note to.','The table name to link the note to.'),(33,0,'dbdocstable','tableNotes','The table note text.','The table note text.'),(34,0,'ip_banned','bandate','The date when the IP was first banned, in Unix time.','The date when the IP was first banned, in Unix time.'),(35,0,'ip_banned','bannedby','The name of the character that banned the IP.','The name of the character that banned the IP. The character should belong to an account with the rights to the .ban command in-game.'),(36,0,'ip_banned','banreason','The reason given for the IP ban.','The reason given for the IP ban.'),(37,0,'ip_banned','ip','The IP address that is banned.','The IP address that is banned.'),(38,0,'ip_banned','unbandate','The date when the IP will be unbanned in Unix time.','The date when the IP will be unbanned in Unix time. Any date that is set lower than the current date basically classifies as a permanent ban as it will never auto expire.'),(39,0,'realmcharacters','acctid','The account ID (See account.id).','The account ID (See account.id).'),(40,0,'realmcharacters','numchars','The number of characters the account has on the realm.','The number of characters the account has on the realm.'),(41,0,'realmcharacters','realmid','The ID of the realm (See realmlist.id).','The ID of the realm (See realmlist.id).'),(42,0,'realmd_db_version','required_20140607_Realm_Resync','zzzz','zzzz'),(43,0,'realmd_db_version','required_z2426_01_realmd_relations','The Version of the Realm Database','The Version of the Realm Database'),(44,0,'realmlist','address','The public IP address of the world server.','The public IP address of the world server. 127.0.0.1 works for LAN play only.'),(45,0,'realmlist','allowedSecurityLevel','Minimum account (see account.gmlevel) required for accounts to log in.','The minimum account (see account.gmlevel) required for accounts to log in to this realm. Normally 0 - that means normal players allowed on this realm. Just useful if you make a GM-only developement realm.<br />\nChanging this value will automatically update the visible in-game realm list, but the realm server must be restarted for it to take effect.'),(46,0,'realmlist','icon','The icon of the realm.','The icon of the realm.<br />\r\n'),(47,0,'realmlist','id','The realm ID.','The realm ID. This number is unique for every realm and it MUST correlate with the RealmID configuration value in mangosd.conf.'),(48,0,'realmlist','name','The name of the realm.','The name of the realm. This will appear in the realm selection list as well as in the character selection screen.'),(49,0,'realmlist','population','Show the current population.','This field shows the current population and is automatically updated at regular intervals and will . The formula to calculate the value in this field is:<br />\r\n<pre>playerCount / maxPlayerCount * 2</pre><br />\r\n'),(50,0,'realmlist','port','The port that the world server is running on.','The port that the world server is running on. Default is 8085. If you will run more than one world server on the same machine, e.g. develop and production, they will all need to use a different port.'),(51,0,'realmlist','realmbuilds','The accepted client builds that the realm will accept.','The accepted client builds that the realm will accept. (You can see this version at the clients left lower corner when starting.)<br />\r\nThe format is version No. {space} version No. (i.e. space separated) <pre>xxxx xxxx xxxx</pre><br />\r\nAcceptable values are:\r\n'),(52,0,'realmlist','realmflags','Supported masks for the realm, based on the table below.','Supported masks for the realm, based on the table below.<br />\r\n'),(53,0,'realmlist','timezone','The realm timezone.','The realm timezone, it will be displayed in the tabs of the realmlist.<br />\r\n'),(54,0,'uptime','maxplayers','The maximum number of players connected','The maximum number of players connected'),(55,0,'uptime','realmid','The realm id (See realmlist.id).','The realm id (See realmlist.id).'),(56,0,'uptime','startstring','The time when the server started, formated as a readable string.','The time when the server started, formated as a readable string.'),(57,0,'uptime','starttime','The time when the server was started, in Unix time.','The time when the server was started, in Unix time.'),(58,0,'uptime','uptime','The uptime of the server, in seconds.','The uptime of the server, in seconds.');
/*!40000 ALTER TABLE `dbdocsfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocsfields_localised`
--

DROP TABLE IF EXISTS `dbdocsfields_localised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocsfields_localised` (
  `fieldId` int(11) NOT NULL COMMENT 'dbdocsfields.fieldId to link to.',
  `languageId` int(11) NOT NULL COMMENT 'dbdocsLanguageId to link to. (Normallu 0 = English)',
  `fieldNotes` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Additional Field Notes',
  `fieldComment` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Main field Note',
  PRIMARY KEY (`fieldId`,`languageId`),
  KEY `fieldId` (`fieldId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocsfields_localised`
--

LOCK TABLES `dbdocsfields_localised` WRITE;
/*!40000 ALTER TABLE `dbdocsfields_localised` DISABLE KEYS */;
INSERT INTO `dbdocsfields_localised` VALUES (1,2,'R','Identifiant unique du royaume'),(2,2,'L\'adress e-mail associ','L\'adresse e-mail associ'),(3,2,'Ce champ contr','Indique l\'extension '),(4,2,'Le nombre de connexion ','Le nombre de connexion '),(5,2,'Niveau de s','Niveau de s'),(6,2,'L\'identifiant unique du compte.','L\'identifiant unique du compte.'),(7,2,'Date ','Date '),(8,2,'Derni','Derni'),(9,2,'Derni','Derni'),(10,2,'Si plusieurs configurations linguistiques sont configur','D'),(11,2,'0 = Compte actif, 1 = Compte bloqu','Indique si le compte est bloqu'),(12,2,'Le moment, en format Unix, lors duquel ce compte ne sera plus r','Le moment, en format Unix, lors duquel ce compte ne sera plus r'),(13,2,'Variable de session (Salt). Initialement g','Variable de session (Salt).'),(14,2,'Cl','Cl'),(15,2,'Mot de passe encrypt','Mot de passe encrypt'),(16,2,'Le nom du compte.','Le nom du compte.'),(17,2,'La valeur hash valid','La valeur hash valid'),(18,2,'Indique si le compte est actuellement banni.<br />\r\n','Indique si le compte est actuellement banni.'),(19,2,'Date de bannissement du compte, en format Unix.','Date de bannissement du compte, en format Unix.'),(20,2,'Nom du bannisseur. (Doit avoir le droit d\'ex','Nom du bannisseur.'),(21,2,'Raison du bannissement.','Raison du bannissement.'),(22,2,'Identifiant du compte (Voir account.id).','Identifiant du compte (Voir account.id).'),(23,2,'Date de suppression automatique du bannissement, en format Unix. Une valeur inf','Date de suppression automatique du bannissement.'),(24,2,'zzzz','zzzz'),(25,2,'Le nom du champ ','Le nom du champ '),(26,2,'Le texte de la note.','Le texte de la note.'),(27,2,'Le nom de la table ','Le nom de la table '),(28,2,'Le texte de la note.','Le texte de la note.'),(29,2,'Le nom de la table ','Le nom de la table '),(30,2,'zzzz','zzzz'),(31,2,'L\'identifiant ','L\'identifiant '),(32,2,'zzzz','zzzz'),(33,2,'zzzz','zzzz'),(34,2,'L\'identifiant ','L\'identifiant '),(35,2,'zzzz','zzzz'),(36,2,'Le nom de la table ','Le nom de la table '),(37,2,'Le texte de la note de la table.','Le texte de la note de la table.'),(38,2,'Le nom de la table ','Le nom de la table '),(39,2,'Le texte de la note de la table.','Le texte de la note de la table.'),(40,2,'La premi','La premi'),(41,2,'Le nom du personnage qui a banni cette IP (doit avoir le droit d\'ex','Le nom du personnage qui a banni cette IP.'),(42,2,'La raison du bannissement de l\'IP.','La raison du bannissement de l\'IP.'),(43,2,'L\'adresse IP bannie.','L\'adresse IP bannie.'),(44,2,'Date ','Date '),(45,2,'Identifiant du compte (voir account.id).','Identifiant du compte (voir account.id).'),(46,2,'Nombre de personnages pour ce compte sur le royaume.','Nombre de personnages pour ce compte sur le royaume.'),(47,2,'Identifiant du royaume. (voir realmlist.id).','Identifiant du royaume. (voir realmlist.id).'),(48,2,'Version de la base de donn','Version de la base de donn'),(49,2,'Version de la base de donn','Version de la base de donn'),(50,2,'Adresse IP publique du serveur monde. 127.0.0.1 fonctionne uniquement en LAN.','Adresse IP publique du serveur monde.'),(51,2,'Niveau de s','Niveau de s'),(52,2,'L\'ic','L\'ic'),(53,2,'Identifiant du royaume. Cette valeur est unique pour chaque royaume et DOIT ','Identifiant du royaume.'),(54,2,'Le nom du royaume. Apparait dans la liste de s','Le nom du royaume.'),(55,2,'Ce champ indique la population actuelle et est mis ','Indique la population actuelle.'),(56,2,'Port de communication du royaume (default: 8085). Si plusieurs royaumes doivent tourner sur la m','Le port de communication du royaume.'),(57,2,'Les versions de clients accept','Les versions de clients accept'),(58,2,'Masques support','Masques support'),(59,2,'Le fuseau horaire du royaume, sera affich','Le fuseau horaire du royaume.'),(60,2,'Le nombre maximum de joueurs connect','Le nombre maximum de joueurs connect'),(61,2,'Identifiant du royaume (voir realmlist.id).','Identifiant du royaume (voir realmlist.id).'),(62,2,'Date de d','Date de d'),(63,2,'Date de d','Date de d'),(64,2,'Temps d\'activit','Temps d\'activit');
/*!40000 ALTER TABLE `dbdocsfields_localised` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocslanguage`
--

DROP TABLE IF EXISTS `dbdocslanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocslanguage` (
  `LanguageId` int(11) NOT NULL COMMENT 'LanguageId for this Language',
  `LanguageName` varchar(30) NOT NULL COMMENT 'The Language Name',
  PRIMARY KEY (`LanguageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocslanguage`
--

LOCK TABLES `dbdocslanguage` WRITE;
/*!40000 ALTER TABLE `dbdocslanguage` DISABLE KEYS */;
INSERT INTO `dbdocslanguage` VALUES (0,'English'),(1,'Korean'),(2,'French'),(3,'German'),(4,'Chinese'),(5,'Taiwanese'),(6,'Spanish (Spain)'),(7,'Spanish (Latin America)'),(8,'Russian');
/*!40000 ALTER TABLE `dbdocslanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocssubtables`
--

DROP TABLE IF EXISTS `dbdocssubtables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocssubtables` (
  `subTableId` int(11) NOT NULL COMMENT 'Unique Lookup Id',
  `languageId` int(11) NOT NULL DEFAULT '0' COMMENT 'dbdocsLanguageId to link to. (Normally 0 = English)',
  `subTableName` varchar(80) DEFAULT NULL COMMENT 'Description of Content',
  `subTableContent` text NOT NULL COMMENT 'The Sub Table Content',
  `subTableTemplate` text NOT NULL COMMENT 'The Sub Table Template',
  PRIMARY KEY (`subTableId`,`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocssubtables`
--

LOCK TABLES `dbdocssubtables` WRITE;
/*!40000 ALTER TABLE `dbdocssubtables` DISABLE KEYS */;
INSERT INTO `dbdocssubtables` VALUES (1,0,'GM Levels','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Description</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Player</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Moderator</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'left\' valign=\'middle\'>Gamemaster</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'left\' valign=\'middle\'>Administrator</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>Access control within the world server console only</td></tr>\r\n</table>\r\n','Value|<Description\r\n0|Player\r\n1|Moderator\r\n2|Gamemaster\r\n3|Administrator\r\n4|Access control within the world server console only'),(2,0,'Expansions','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Expansion</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>World of Warcraft *</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>Burning Crusade </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n2</td><td align=\'left\' valign=\'middle\'>Wrath of the Lich King </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n3</td><td align=\'left\' valign=\'middle\'>Cataclysm </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n4</td><td align=\'left\' valign=\'middle\'>Mists of Pandaria</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n5</td><td align=\'left\' valign=\'middle\'>Warlords of Draenor</td></tr>\r\n</table>','Value|<Expansion\r\n0|World of Warcraft *\r\n1|Burning Crusade \r\n2|Wrath of the Lich King \r\n3|Cataclysm \r\n4|Mists of Pandaria\r\n5|Warlords of Draenor'),(3,0,'Languages','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Language</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>English </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>Korean </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n2</td><td align=\'left\' valign=\'middle\'>French </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n3</td><td align=\'left\' valign=\'middle\'>German </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n4</td><td align=\'left\' valign=\'middle\'>Chinese </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n5</td><td align=\'left\' valign=\'middle\'>Taiwanese </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n6</td><td align=\'left\' valign=\'middle\'>Spanish Spain </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n7</td><td align=\'left\' valign=\'middle\'>Spanish Latin America </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n8</td><td align=\'left\' valign=\'middle\'>Russian </td></tr>\r\n</table>\r\n','Value|<Language\r\n0|English \r\n1|Korean \r\n2|French \r\n3|German \r\n4|Chinese \r\n5|Taiwanese \r\n6|Spanish Spain \r\n7|Spanish Latin America \r\n8|Russian'),(4,0,'Ban Status','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Ban Active</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Ban Inactive</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'></tr>\r\n</table>','Value|<Meaning\r\n0|Ban Active\r\n1|Ban Inactive'),(5,0,'Realm Type/Icon','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Icon</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Normal</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>PvP</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>Normal</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>6</td><td align=\'left\' valign=\'middle\'>RP</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'left\' valign=\'middle\'>RP PvP</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'></tr>\r\n</table>','Icon|<Meaning\r\n0|Normal\r\n1|PvP\r\n4|Normal\r\n6|RP\r\n8|RP PvP'),(6,0,'Realm Flags','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th align=\'left\'><b>Meaning</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0x1</td><td align=\'left\' valign=\'middle\'>Invalid - Do Not show in Realm List</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>0x2</td><td align=\'left\' valign=\'middle\'>Offline - Set by mangosd</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0x4</td><td align=\'left\' valign=\'middle\'>Show version and build in Realm List</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>0x20</td><td align=\'left\' valign=\'middle\'>New Players - New Players Only</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0x40</td><td align=\'left\' valign=\'middle\'>Recommended - sets the recommended option</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'></tr>\r\n</table>','Value|<Meaning\r\n0x1|Invalid - Do Not show in Realm List\r\n0x2|Offline - Set by mangosd\r\n0x4|Show version and build in Realm List\r\n0x20|New Players - New Players Only\r\n0x40|Recommended - sets the recommended option'),(7,0,'Timezones','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>TimezoneId</b></th>\r\n<th align=\'left\'><b>Displayed Name</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Development</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'left\' valign=\'middle\'>United States</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>3</td><td align=\'left\' valign=\'middle\'>Oceanic</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'left\' valign=\'middle\'>Latin America</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>5</td><td align=\'left\' valign=\'middle\'>Tournament</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>6</td><td align=\'left\' valign=\'middle\'>Korea</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>7</td><td align=\'left\' valign=\'middle\'>Tournament</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'left\' valign=\'middle\'>English</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>9</td><td align=\'left\' valign=\'middle\'>German</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>10</td><td align=\'left\' valign=\'middle\'>French</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>11</td><td align=\'left\' valign=\'middle\'>Spanish</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>12</td><td align=\'left\' valign=\'middle\'>Russian</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>13</td><td align=\'left\' valign=\'middle\'>Tournament</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>14</td><td align=\'left\' valign=\'middle\'>Taiwan</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>15</td><td align=\'left\' valign=\'middle\'>Tournament</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>16</td><td align=\'left\' valign=\'middle\'>China</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>17</td><td align=\'left\' valign=\'middle\'>CN1</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>18</td><td align=\'left\' valign=\'middle\'>CN2</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>19</td><td align=\'left\' valign=\'middle\'>CN3</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>20</td><td align=\'left\' valign=\'middle\'>CN4</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>21</td><td align=\'left\' valign=\'middle\'>CN5</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>22</td><td align=\'left\' valign=\'middle\'>CN6</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>23</td><td align=\'left\' valign=\'middle\'>CN7</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>24</td><td align=\'left\' valign=\'middle\'>CN8</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>25</td><td align=\'left\' valign=\'middle\'>Tournament</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>26</td><td align=\'left\' valign=\'middle\'>Test Server</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>27</td><td align=\'left\' valign=\'middle\'>Tournament</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>28</td><td align=\'left\' valign=\'middle\'>QA Server</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>29</td><td align=\'left\' valign=\'middle\'>CN9</td></tr>\r\n</table>\r\n','TimezoneId|<Displayed Name\r\n1|Development\r\n2|United States\r\n3|Oceanic\r\n4|Latin America\r\n5|Tournament\r\n6|Korea\r\n7|Tournament\r\n8|English\r\n9|German\r\n10|French\r\n11|Spanish\r\n12|Russian\r\n13|Tournament\r\n14|Taiwan\r\n15|Tournament\r\n16|China\r\n17|CN1\r\n18|CN2\r\n19|CN3\r\n20|CN4\r\n21|CN5\r\n22|CN6\r\n23|CN7\r\n24|CN8\r\n25|Tournament\r\n26|Test Server\r\n27|Tournament\r\n28|QA Server\r\n29|CN9'),(8,0,'Population Level','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Population</b></th>\r\n<th align=\'left\'><b>Displayed Population Level</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0.5</td><td align=\'left\' valign=\'middle\'>Low</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1.0</td><td align=\'left\' valign=\'middle\'>Medium</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>2.0</td><td align=\'left\' valign=\'middle\'>High</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'></tr>\r\n</table>','Population|<Displayed Population Level\r\n0.5|Low\r\n1.0|Medium\r\n2.0|High'),(9,0,'Realm Builds','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Core</b></th>\r\n<th align=\'left\'><b>Build Number(s)</b></th>\r\n<th align=\'left\'><b>Version Number</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>MangosZero</td><td align=\'left\' valign=\'middle\'>5875 6005 6141</td><td align=\'left\' valign=\'middle\'>Vanila 1.12.x</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>MangosOne</td><td align=\'left\' valign=\'middle\'>8606</td><td align=\'left\' valign=\'middle\'>TBC 2.4.3</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>MangosTwo</td><td align=\'left\' valign=\'middle\'>12340</td><td align=\'left\' valign=\'middle\'>WOTLK 3.3.5a</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>MangosThree</td><td align=\'left\' valign=\'middle\'>15595</td><td align=\'left\' valign=\'middle\'>Cataclysm 4.3.4</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>MangosFour</td><td align=\'left\' valign=\'middle\'>18414</td><td align=\'left\' valign=\'middle\'>Mists of Pandaria 5.4.8</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'></tr>\r\n</table>','Core|<Build Number(s)|<Version Number\r\nMangosZero|5875 6005 6141|Vanila 1.12.x\r\nMangosOne|8606|TBC 2.4.3\r\nMangosTwo|12340|WOTLK 3.3.5a\r\nMangosThree|15595|Cataclysm 4.3.4\r\nMangosFour|18414|Mists of Pandaria 5.4.8'),(10,0,'Class Stats Levels','<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Value</b></th>\r\n<th><b>Name</b></th>\r\n<th align=\'left\'><b>Description</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'center\' valign=\'middle\'>Warrior</td><td align=\'left\' valign=\'middle\'>Has increased health and no mana</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>2</td><td align=\'center\' valign=\'middle\'>Paladin</td><td align=\'left\' valign=\'middle\'>Has increased health and low mana</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>4</td><td align=\'center\' valign=\'middle\'>Rogue</td><td align=\'left\' valign=\'middle\'>Has increased damage, but lower armor</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>8</td><td align=\'center\' valign=\'middle\'>Mage</td><td align=\'left\' valign=\'middle\'>Has low health, but increased mana</td></tr>\r\n</table>','Value|Name|<Description\r\n1|Warrior|Has increased health and no mana\r\n2|Paladin|Has increased health and low mana\r\n4|Rogue|Has increased damage, but lower armor\r\n8|Mage|Has low health, but increased mana');
/*!40000 ALTER TABLE `dbdocssubtables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocssubtables_localised`
--

DROP TABLE IF EXISTS `dbdocssubtables_localised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocssubtables_localised` (
  `subTableId` int(11) NOT NULL COMMENT 'dbdocsSubtableId to link to',
  `languageId` int(11) NOT NULL DEFAULT '2' COMMENT 'dbdocsLanguageId to link to.',
  `subTableContent` text NOT NULL COMMENT 'The Sub Table Content',
  `subTableTemplate` text NOT NULL COMMENT 'The Sub Table Template',
  PRIMARY KEY (`subTableId`,`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocssubtables_localised`
--

LOCK TABLES `dbdocssubtables_localised` WRITE;
/*!40000 ALTER TABLE `dbdocssubtables_localised` DISABLE KEYS */;
INSERT INTO `dbdocssubtables_localised` VALUES (1,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Valeur</b></th>\r\n<th align=\'left\'><b>Description</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Joueur </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>Mod',''),(2,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Valeur</b></th>\r\n<th align=\'left\'><b>Extension</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>World of Warcraft *</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>Burning Crusade </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n2</td><td align=\'left\' valign=\'middle\'>Wrath of the Lich King </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n3</td><td align=\'left\' valign=\'middle\'>Cataclysm </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>\r\n4</td><td align=\'left\' valign=\'middle\'>Mists of Pandaria</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n5</td><td align=\'left\' valign=\'middle\'>Warlords of Draenor</td></tr>\r\n</table>',''),(3,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Valeur</b></th>\r\n<th align=\'left\'><b>Langue</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Anglais </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>\r\n1</td><td align=\'left\' valign=\'middle\'>Cor',''),(4,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Valeur</b></th>\r\n<th align=\'left\'><b>Description</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0</td><td align=\'left\' valign=\'middle\'>Bannissement actif </td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>Bannissement inactif </td></tr>\r\n<tr bgcolor=\'#FFFFEE\'></tr>\r\n</table>',''),(5,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Ic',''),(6,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Valeur</b></th>\r\n<th align=\'left\'><b>Description</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0x1</td><td align=\'left\' valign=\'middle\'>Invalide - Pas visible dans la liste</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>0x2</td><td align=\'left\' valign=\'middle\'>D',''),(7,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>ID Fuseau Horaire</b></th>\r\n<th align=\'left\'><b>Nom</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>1</td><td align=\'left\' valign=\'middle\'>D',''),(8,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Population</b></th>\r\n<th align=\'left\'><b>Niveau de population</b></th>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>0.5</td><td align=\'left\' valign=\'middle\'>Faible</td></tr>\r\n<tr bgcolor=\'#FEFEFF\'><td align=\'center\' valign=\'middle\'>1.0</td><td align=\'left\' valign=\'middle\'>Moyen</td></tr>\r\n<tr bgcolor=\'#FFFFEE\'><td align=\'center\' valign=\'middle\'>2.0</td><td align=\'left\' valign=\'middle\'>Elev',''),(9,2,'<table border=\'1\' cellspacing=\'1\' cellpadding=\'3\' bgcolor=\'#f0f0f0\'>\r\n<tr bgcolor=\'#f0f0ff\'>\r\n<th><b>Core</b></th>\r\n<th align=\'left\'><b>Num','');
/*!40000 ALTER TABLE `dbdocssubtables_localised` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocstable`
--

DROP TABLE IF EXISTS `dbdocstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocstable` (
  `tableId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of this entry',
  `languageId` int(11) NOT NULL DEFAULT '0' COMMENT 'The Language Id for the Notes (Normally 0 for English)',
  `tableName` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the table to add additional notes to',
  `tableNotes` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The additional note to be added to the table',
  PRIMARY KEY (`tableId`,`languageId`,`tableName`),
  KEY `tableId` (`tableId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocstable`
--

LOCK TABLES `dbdocstable` WRITE;
/*!40000 ALTER TABLE `dbdocstable` DISABLE KEYS */;
INSERT INTO `dbdocstable` VALUES (1,0,'account','This table holds information on all available accounts.'),(2,0,'account_banned','This table lists all of the accounts that have been banned along with the date when (or if) the ban will expire.'),(3,0,'dbdocsfields','This table is part of the implementation of the \'Mangos Database Documentation\' (MDD) Project.\r\n\r\nAn entry in this table provides a link to the table and field to allow additional notes to describe the field in the Wiki.'),(5,0,'dbdocssubtables','This table is part of the implementation of the \'Mangos Database Documentation\' (MDD) Project.\r\n\r\nAn entry in this table provides a table which dirctly replaces the link in the fieldnotes.'),(7,0,'dbdocstable','This table is part of the implementation of the \'Mangos Database Documentation\' (MDD) Project.\r\n\r\nAn entry in this table provides a additional notes field to describe the database in the Wiki.'),(9,0,'ip_banned','This table contains all of the banned IPs and the date when (or if) the ban will expire.'),(10,0,'realmcharacters','This table holds information on the number of characters each account has for each realm.'),(11,0,'realmd_db_version','This table contains the latest version of the database.'),(12,0,'realmlist','This table holds information for the realms.'),(13,0,'uptime','This table holds the uptime of all realms. Each realm will automatically update it\'s latest entry\'s value until it crashes and a new record is added. Doing so also some statistical/historical information is collected - about the availability of your machine.');
/*!40000 ALTER TABLE `dbdocstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbdocstable_localised`
--

DROP TABLE IF EXISTS `dbdocstable_localised`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbdocstable_localised` (
  `tableId` int(11) NOT NULL COMMENT 'The dbdocsTableId to link to',
  `languageId` int(11) NOT NULL DEFAULT '2' COMMENT 'The dbdocsLanguageId to link to',
  `tableNotes` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The additional note to be added to the table',
  PRIMARY KEY (`tableId`,`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbdocstable_localised`
--

LOCK TABLES `dbdocstable_localised` WRITE;
/*!40000 ALTER TABLE `dbdocstable_localised` DISABLE KEYS */;
INSERT INTO `dbdocstable_localised` VALUES (1,2,'Cette table contient toutes les informations relatives aux comptes.'),(2,2,'Cette table contient toutes les informations relatives aux comptes bannis ainsi que la dur'),(3,2,'Cette table est une partie de l\'impl'),(4,2,'Cette table est une partie de l\'impl'),(5,2,'Cette table est une partie de l\'impl'),(6,2,'Cette table est une partie de l\'impl'),(7,2,'Cette table est une partie de l\'impl'),(8,2,'Cette table est une partie de l\'impl'),(9,2,'Cette table contient toutes les IP bannies ainsi que la dur'),(10,2,'Cette table contient les informations relatives au nombre de personnages pour chaque compte et chaque royaume.'),(11,2,'Cette table contient la version de la base de donn'),(12,2,'Cette table contient les informations sur les royaumes.'),(13,2,'Cette table contient l\'information de disponibilit');
/*!40000 ALTER TABLE `dbdocstable_localised` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters` (
  `realmid` int(11) unsigned NOT NULL COMMENT 'Realm identifier',
  `acctid` int(11) unsigned NOT NULL COMMENT 'Account identifier',
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`),
  CONSTRAINT `realmcharacters_ibfk_1` FOREIGN KEY (`realmid`) REFERENCES `realmlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `realmcharacters_ibfk_2` FOREIGN KEY (`acctid`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmd_db_version`
--

DROP TABLE IF EXISTS `realmd_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmd_db_version` (
  `required_20140607_Realm_Resync` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Last applied sql update to DB';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmd_db_version`
--

LOCK TABLES `realmd_db_version` WRITE;
/*!40000 ALTER TABLE `realmd_db_version` DISABLE KEYS */;
INSERT INTO `realmd_db_version` VALUES (NULL);
/*!40000 ALTER TABLE `realmd_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Realm identifier',
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `realmflags` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT 'Supported masks: 0x1 (invalid, not show in realm list), 0x2 (offline, set by mangosd), 0x4 (show version and build), 0x20 (new players), 0x40 (recommended)',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `realmbuilds` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES (1,'mangos-zero','127.0.0.1',8085,0,2,0,0,0,'5875 6005');
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime` (
  `realmid` int(11) unsigned NOT NULL COMMENT 'Realm identifier',
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`starttime`),
  CONSTRAINT `uptime_ibfk_1` FOREIGN KEY (`realmid`) REFERENCES `realmlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-03 21:14:08
