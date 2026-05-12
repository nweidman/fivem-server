
CREATE TABLE IF NOT EXISTS `nass_musicplayer_likedsongs` (
  `identifier` varchar(60) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nass_musicplayer_playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nass_musicplayer_recentlyplayed` (
  `identifier` varchar(60) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nass_musicplayer_installed` (
  `plate` varchar(50) NOT NULL,
  `installed` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


ALTER TABLE `nass_musicplayer_recentlyplayed` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `nass_musicplayer_playlists` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE `nass_musicplayer_likedsongs` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;