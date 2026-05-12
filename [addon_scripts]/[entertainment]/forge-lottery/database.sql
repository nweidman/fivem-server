CREATE TABLE `lottery_daily` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`time` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `lottery_week` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`name` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`type` LONGTEXT NOT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `lottery_week_time` (
	`time` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `lottery_week_win` (
	`identifier` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`name` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`claimed` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `lottery_win` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`name` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`amount` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;