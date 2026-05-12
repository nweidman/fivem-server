CREATE TABLE IF NOT EXISTS `lation_chopshopv2` (
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `exp` int(11) NOT NULL DEFAULT 0,
  `vehicles` int(11) NOT NULL DEFAULT 0,
  `parts` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;