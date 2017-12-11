/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : mymoney

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-12-11 13:46:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_code_name_unique` (`code`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('5', 'ad', 'Andorra');
INSERT INTO `countries` VALUES ('6', 'ad', 'Angola');
INSERT INTO `countries` VALUES ('222', 'ae', 'United Arab Emirates');
INSERT INTO `countries` VALUES ('1', 'af', 'Afghanistan');
INSERT INTO `countries` VALUES ('9', 'ag', 'Antigua and Barbuda');
INSERT INTO `countries` VALUES ('7', 'ai', 'Anguilla');
INSERT INTO `countries` VALUES ('2', 'al', 'Albania');
INSERT INTO `countries` VALUES ('11', 'am', 'Armenia');
INSERT INTO `countries` VALUES ('152', 'an', 'Netherlands Antilles');
INSERT INTO `countries` VALUES ('8', 'aq', 'Antarctica');
INSERT INTO `countries` VALUES ('10', 'ar', 'Argentina');
INSERT INTO `countries` VALUES ('4', 'as', 'American Samoa');
INSERT INTO `countries` VALUES ('14', 'at', 'Austria');
INSERT INTO `countries` VALUES ('13', 'au', 'Australia');
INSERT INTO `countries` VALUES ('12', 'aw', 'Aruba');
INSERT INTO `countries` VALUES ('15', 'az', 'Azerbaijan');
INSERT INTO `countries` VALUES ('27', 'ba', 'Bosnia and Herzegowina');
INSERT INTO `countries` VALUES ('19', 'bb', 'Barbados');
INSERT INTO `countries` VALUES ('18', 'bd', 'Bangladesh');
INSERT INTO `countries` VALUES ('21', 'be', 'Belgium');
INSERT INTO `countries` VALUES ('34', 'bf', 'Burkina Faso');
INSERT INTO `countries` VALUES ('33', 'bg', 'Bulgaria');
INSERT INTO `countries` VALUES ('17', 'bh', 'Bahrain');
INSERT INTO `countries` VALUES ('35', 'bi', 'Burundi');
INSERT INTO `countries` VALUES ('23', 'bj', 'Benin');
INSERT INTO `countries` VALUES ('24', 'bm', 'Bermuda');
INSERT INTO `countries` VALUES ('32', 'bn', 'Brunei Darussalam');
INSERT INTO `countries` VALUES ('26', 'bo', 'Bolivia');
INSERT INTO `countries` VALUES ('30', 'br', 'Brazil');
INSERT INTO `countries` VALUES ('16', 'bs', 'Bahamas');
INSERT INTO `countries` VALUES ('25', 'bt', 'Bhutan');
INSERT INTO `countries` VALUES ('29', 'bv', 'Bouvet Island');
INSERT INTO `countries` VALUES ('28', 'bw', 'Botswana');
INSERT INTO `countries` VALUES ('20', 'by', 'Belarus');
INSERT INTO `countries` VALUES ('22', 'bz', 'Belize');
INSERT INTO `countries` VALUES ('38', 'ca', 'Canada');
INSERT INTO `countries` VALUES ('46', 'cc', 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES ('50', 'cd', 'Congothe Democratic Republic of the');
INSERT INTO `countries` VALUES ('41', 'cf', 'Central African Republic');
INSERT INTO `countries` VALUES ('49', 'cg', 'Congo');
INSERT INTO `countries` VALUES ('205', 'ch', 'Switzerland');
INSERT INTO `countries` VALUES ('53', 'ci', 'Cote d\'Ivoire');
INSERT INTO `countries` VALUES ('51', 'ck', 'Cook Islands');
INSERT INTO `countries` VALUES ('43', 'cl', 'Chile');
INSERT INTO `countries` VALUES ('37', 'cm', 'Cameroon');
INSERT INTO `countries` VALUES ('44', 'cn', 'China');
INSERT INTO `countries` VALUES ('47', 'co', 'Colombia');
INSERT INTO `countries` VALUES ('52', 'cr', 'Costa Rica');
INSERT INTO `countries` VALUES ('55', 'cu', 'Cuba');
INSERT INTO `countries` VALUES ('39', 'cv', 'Cabo Verde');
INSERT INTO `countries` VALUES ('45', 'cx', 'Christmas Island');
INSERT INTO `countries` VALUES ('56', 'cy', 'Cyprus');
INSERT INTO `countries` VALUES ('57', 'cz', 'Czech Republic');
INSERT INTO `countries` VALUES ('81', 'de', 'Germany');
INSERT INTO `countries` VALUES ('59', 'dj', 'Djibouti');
INSERT INTO `countries` VALUES ('58', 'dk', 'Denmark');
INSERT INTO `countries` VALUES ('60', 'dm', 'Dominica');
INSERT INTO `countries` VALUES ('61', 'do', 'Dominican Republic');
INSERT INTO `countries` VALUES ('3', 'dz', 'Algeria');
INSERT INTO `countries` VALUES ('63', 'ec', 'Ecuador');
INSERT INTO `countries` VALUES ('68', 'ee', 'Estonia');
INSERT INTO `countries` VALUES ('64', 'eg', 'Egypt');
INSERT INTO `countries` VALUES ('234', 'eh', 'Western Sahara');
INSERT INTO `countries` VALUES ('67', 'er', 'Eritrea');
INSERT INTO `countries` VALUES ('196', 'es', 'Spain');
INSERT INTO `countries` VALUES ('69', 'et', 'Ethiopia');
INSERT INTO `countries` VALUES ('73', 'fi', 'Finland');
INSERT INTO `countries` VALUES ('72', 'fj', 'Fiji');
INSERT INTO `countries` VALUES ('70', 'fk', 'Falkland Islands (Malvinas)');
INSERT INTO `countries` VALUES ('140', 'fm', 'Micronesia Federated States of');
INSERT INTO `countries` VALUES ('71', 'fo', 'Faroe Islands');
INSERT INTO `countries` VALUES ('74', 'fr', 'France');
INSERT INTO `countries` VALUES ('78', 'ga', 'Gabon');
INSERT INTO `countries` VALUES ('223', 'gb', 'United Kingdom');
INSERT INTO `countries` VALUES ('86', 'gd', 'Grenada');
INSERT INTO `countries` VALUES ('80', 'ge', 'Georgia');
INSERT INTO `countries` VALUES ('75', 'gf', 'French Guiana');
INSERT INTO `countries` VALUES ('82', 'gh', 'Ghana');
INSERT INTO `countries` VALUES ('83', 'gi', 'Gibraltar');
INSERT INTO `countries` VALUES ('85', 'gl', 'Greenland');
INSERT INTO `countries` VALUES ('79', 'gm', 'Gambia');
INSERT INTO `countries` VALUES ('90', 'gn', 'Guinea');
INSERT INTO `countries` VALUES ('87', 'gp', 'Guadeloupe');
INSERT INTO `countries` VALUES ('66', 'gq', 'Equatorial Guinea');
INSERT INTO `countries` VALUES ('84', 'gr', 'Greece');
INSERT INTO `countries` VALUES ('195', 'gs', 'South Georgia and the South Sandwich');
INSERT INTO `countries` VALUES ('89', 'gt', 'Guatemala');
INSERT INTO `countries` VALUES ('88', 'gu', 'Guam');
INSERT INTO `countries` VALUES ('91', 'gw', 'Guinea-Bissau');
INSERT INTO `countries` VALUES ('92', 'gy', 'Guyana');
INSERT INTO `countries` VALUES ('97', 'hk', 'Hong Kong');
INSERT INTO `countries` VALUES ('94', 'hm', 'Heard and Mc Donald Islands');
INSERT INTO `countries` VALUES ('96', 'hn', 'Honduras');
INSERT INTO `countries` VALUES ('54', 'hr', 'Croatia (Hrvatska)');
INSERT INTO `countries` VALUES ('93', 'ht', 'Haiti');
INSERT INTO `countries` VALUES ('98', 'hu', 'Hungary');
INSERT INTO `countries` VALUES ('101', 'id', 'Indonesia');
INSERT INTO `countries` VALUES ('104', 'ie', 'Ireland');
INSERT INTO `countries` VALUES ('105', 'il', 'Israel');
INSERT INTO `countries` VALUES ('100', 'in', 'India');
INSERT INTO `countries` VALUES ('31', 'io', 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES ('103', 'iq', 'Iraq');
INSERT INTO `countries` VALUES ('102', 'ir', 'Iran (Islamic Republic of)');
INSERT INTO `countries` VALUES ('99', 'is', 'Iceland');
INSERT INTO `countries` VALUES ('106', 'it', 'Italy');
INSERT INTO `countries` VALUES ('107', 'jm', 'Jamaica');
INSERT INTO `countries` VALUES ('109', 'jo', 'Jordan');
INSERT INTO `countries` VALUES ('108', 'jp', 'Japan');
INSERT INTO `countries` VALUES ('111', 'ke', 'Kenya');
INSERT INTO `countries` VALUES ('116', 'kg', 'Kyrgyzstan');
INSERT INTO `countries` VALUES ('36', 'kh', 'Cambodia');
INSERT INTO `countries` VALUES ('112', 'ki', 'Kiribati');
INSERT INTO `countries` VALUES ('48', 'km', 'Comoros');
INSERT INTO `countries` VALUES ('179', 'kn', 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES ('113', 'kp', 'Korea Democratic People\'s Republic of');
INSERT INTO `countries` VALUES ('114', 'kr', 'Korea Republic of');
INSERT INTO `countries` VALUES ('115', 'kw', 'Kuwait');
INSERT INTO `countries` VALUES ('40', 'ky', 'Cayman Islands');
INSERT INTO `countries` VALUES ('110', 'kz', 'Kazakhstan');
INSERT INTO `countries` VALUES ('117', 'la', 'LaoPeople\'s Democratic Republic');
INSERT INTO `countries` VALUES ('119', 'lb', 'Lebanon');
INSERT INTO `countries` VALUES ('180', 'lc', 'Saint Lucia');
INSERT INTO `countries` VALUES ('123', 'li', 'Liechtenstein');
INSERT INTO `countries` VALUES ('197', 'lk', 'Sri Lanka');
INSERT INTO `countries` VALUES ('121', 'lr', 'Liberia');
INSERT INTO `countries` VALUES ('120', 'ls', 'Lesotho');
INSERT INTO `countries` VALUES ('124', 'lt', 'Lithuania');
INSERT INTO `countries` VALUES ('125', 'lu', 'Luxembourg');
INSERT INTO `countries` VALUES ('118', 'lv', 'Latvia');
INSERT INTO `countries` VALUES ('122', 'ly', 'Libyan Arab Jamahiriya');
INSERT INTO `countries` VALUES ('145', 'ma', 'Morocco');
INSERT INTO `countries` VALUES ('142', 'mc', 'Monaco');
INSERT INTO `countries` VALUES ('141', 'md', 'Moldova Republic of');
INSERT INTO `countries` VALUES ('128', 'mg', 'Madagascar');
INSERT INTO `countries` VALUES ('134', 'mh', 'Marshall Islands');
INSERT INTO `countries` VALUES ('127', 'mk', 'Macedonia');
INSERT INTO `countries` VALUES ('132', 'ml', 'Mali');
INSERT INTO `countries` VALUES ('147', 'mm', 'Myanmar');
INSERT INTO `countries` VALUES ('143', 'mn', 'Mongolia');
INSERT INTO `countries` VALUES ('126', 'mo', 'Macao');
INSERT INTO `countries` VALUES ('160', 'mp', 'Northern Mariana Islands');
INSERT INTO `countries` VALUES ('135', 'mq', 'Martinique');
INSERT INTO `countries` VALUES ('136', 'mr', 'Mauritania');
INSERT INTO `countries` VALUES ('144', 'ms', 'Montserrat');
INSERT INTO `countries` VALUES ('133', 'mt', 'Malta');
INSERT INTO `countries` VALUES ('137', 'mu', 'Mauritius');
INSERT INTO `countries` VALUES ('131', 'mv', 'Maldives');
INSERT INTO `countries` VALUES ('129', 'mw', 'Malawi');
INSERT INTO `countries` VALUES ('139', 'mx', 'Mexico');
INSERT INTO `countries` VALUES ('130', 'my', 'Malaysia');
INSERT INTO `countries` VALUES ('146', 'mz', 'Mozambique');
INSERT INTO `countries` VALUES ('148', 'na', 'Namibia');
INSERT INTO `countries` VALUES ('153', 'nc', 'New Caledonia');
INSERT INTO `countries` VALUES ('156', 'ne', 'Niger');
INSERT INTO `countries` VALUES ('159', 'nf', 'Norfolk Island');
INSERT INTO `countries` VALUES ('157', 'ng', 'Nigeria');
INSERT INTO `countries` VALUES ('155', 'ni', 'Nicaragua');
INSERT INTO `countries` VALUES ('151', 'nl', 'Netherlands');
INSERT INTO `countries` VALUES ('161', 'no', 'Norway');
INSERT INTO `countries` VALUES ('150', 'np', 'Nepal');
INSERT INTO `countries` VALUES ('149', 'nr', 'Nauru');
INSERT INTO `countries` VALUES ('158', 'nu', 'Niue');
INSERT INTO `countries` VALUES ('154', 'nz', 'New Zealand');
INSERT INTO `countries` VALUES ('162', 'om', 'Oman');
INSERT INTO `countries` VALUES ('165', 'pa', 'Panama');
INSERT INTO `countries` VALUES ('168', 'pe', 'Peru');
INSERT INTO `countries` VALUES ('76', 'pf', 'French Polynesia');
INSERT INTO `countries` VALUES ('166', 'pg', 'Papua New Guinea');
INSERT INTO `countries` VALUES ('169', 'ph', 'Philippines');
INSERT INTO `countries` VALUES ('163', 'pk', 'Pakistan');
INSERT INTO `countries` VALUES ('171', 'pl', 'Poland');
INSERT INTO `countries` VALUES ('199', 'pm', 'St. Pierre and Miquelon');
INSERT INTO `countries` VALUES ('170', 'pn', 'Pitcairn');
INSERT INTO `countries` VALUES ('173', 'pr', 'Puerto Rico');
INSERT INTO `countries` VALUES ('172', 'pt', 'Portugal');
INSERT INTO `countries` VALUES ('164', 'pw', 'Palau');
INSERT INTO `countries` VALUES ('167', 'py', 'Paraguay');
INSERT INTO `countries` VALUES ('174', 'qa', 'Qatar');
INSERT INTO `countries` VALUES ('175', 're', 'Reunion');
INSERT INTO `countries` VALUES ('176', 'ro', 'Romania');
INSERT INTO `countries` VALUES ('177', 'ru', 'Russian Federation');
INSERT INTO `countries` VALUES ('178', 'rw', 'Rwanda');
INSERT INTO `countries` VALUES ('185', 'sa', 'Saudi Arabia');
INSERT INTO `countries` VALUES ('192', 'sb', 'Solomon Islands');
INSERT INTO `countries` VALUES ('187', 'sc', 'Seychelles');
INSERT INTO `countries` VALUES ('200', 'sd', 'Sudan');
INSERT INTO `countries` VALUES ('204', 'se', 'Sweden');
INSERT INTO `countries` VALUES ('189', 'sg', 'Singapore');
INSERT INTO `countries` VALUES ('198', 'sh', 'St. Helena');
INSERT INTO `countries` VALUES ('191', 'si', 'Slovenia');
INSERT INTO `countries` VALUES ('202', 'sj', 'Svalbard and Jan Mayen Islands');
INSERT INTO `countries` VALUES ('190', 'sk', 'Slovakia (Slovak Republic)');
INSERT INTO `countries` VALUES ('188', 'sl', 'Sierra Leone');
INSERT INTO `countries` VALUES ('183', 'sm', 'San Marino');
INSERT INTO `countries` VALUES ('186', 'sn', 'Senegal');
INSERT INTO `countries` VALUES ('193', 'so', 'Somalia');
INSERT INTO `countries` VALUES ('201', 'sr', 'Suriname');
INSERT INTO `countries` VALUES ('184', 'st', 'Sao Tome and Principe');
INSERT INTO `countries` VALUES ('65', 'sv', 'El Salvador');
INSERT INTO `countries` VALUES ('206', 'sy', 'Syrian Arab Republic');
INSERT INTO `countries` VALUES ('203', 'sz', 'Swaziland');
INSERT INTO `countries` VALUES ('218', 'tc', 'Turks and Caicos Islands');
INSERT INTO `countries` VALUES ('42', 'td', 'Chad');
INSERT INTO `countries` VALUES ('77', 'tf', 'French Southern Territories');
INSERT INTO `countries` VALUES ('211', 'tg', 'Togo');
INSERT INTO `countries` VALUES ('210', 'th', 'Thailand');
INSERT INTO `countries` VALUES ('208', 'tj', 'Tajikistan');
INSERT INTO `countries` VALUES ('212', 'tk', 'Tokelau');
INSERT INTO `countries` VALUES ('62', 'tl', 'East Timor');
INSERT INTO `countries` VALUES ('217', 'tm', 'Turkmenistan');
INSERT INTO `countries` VALUES ('215', 'tn', 'Tunisia');
INSERT INTO `countries` VALUES ('213', 'to', 'Tonga');
INSERT INTO `countries` VALUES ('216', 'tr', 'Turkey');
INSERT INTO `countries` VALUES ('214', 'tt', 'Trinidad and Tobago');
INSERT INTO `countries` VALUES ('219', 'tv', 'Tuvalu');
INSERT INTO `countries` VALUES ('207', 'tw', 'Taiwan');
INSERT INTO `countries` VALUES ('209', 'tz', 'Tanzania United Republic of');
INSERT INTO `countries` VALUES ('221', 'ua', 'Ukraine');
INSERT INTO `countries` VALUES ('220', 'ug', 'Uganda');
INSERT INTO `countries` VALUES ('225', 'um', 'United States Minor Outlying Islands');
INSERT INTO `countries` VALUES ('224', 'us', 'United States');
INSERT INTO `countries` VALUES ('226', 'uy', 'Uruguay');
INSERT INTO `countries` VALUES ('227', 'uz', 'Uzbekistan');
INSERT INTO `countries` VALUES ('95', 'va', 'Holy See (Vatican City State)');
INSERT INTO `countries` VALUES ('181', 'vc', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES ('229', 've', 'Venezuela');
INSERT INTO `countries` VALUES ('231', 'vg', 'Virgin Islands (British)');
INSERT INTO `countries` VALUES ('232', 'vi', 'Virgin Islands (U.S.)');
INSERT INTO `countries` VALUES ('230', 'vn', 'Vietnam');
INSERT INTO `countries` VALUES ('228', 'vu', 'Vanuatu');
INSERT INTO `countries` VALUES ('233', 'wf', 'Wallis and Futuna Islands');
INSERT INTO `countries` VALUES ('182', 'ws', 'Samoa');
INSERT INTO `countries` VALUES ('235', 'ye', 'Yemen');
INSERT INTO `countries` VALUES ('138', 'yt', 'Mayotte');
INSERT INTO `countries` VALUES ('236', 'yu', 'Serbia');
INSERT INTO `countries` VALUES ('194', 'za', 'South Africa');
INSERT INTO `countries` VALUES ('237', 'zm', 'Zambia');
INSERT INTO `countries` VALUES ('238', 'zw', 'Zimbabwe');

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `bonus` int(11) NOT NULL,
  `bonus_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_country_code_foreign` (`country_code`),
  CONSTRAINT `customers_country_code_foreign` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2017_12_09_130904_create_countries_table', '1');
INSERT INTO `migrations` VALUES ('2', '2017_12_09_134000_create_customers_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_12_09_134108_create_transactions_table', '1');

-- ----------------------------
-- Table structure for `transactions`
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `type` enum('withdrawal','deposit','bonus') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('success','fail') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_customer_id_created_at_type_unique` (`customer_id`,`created_at`,`type`),
  CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of transactions
-- ----------------------------
