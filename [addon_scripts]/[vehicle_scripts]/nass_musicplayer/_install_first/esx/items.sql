DELETE FROM items WHERE name = 'smallspeaker';
DELETE FROM items WHERE name = 'mediumspeaker';
DELETE FROM items WHERE name = 'largespeaker';
DELETE FROM items WHERE name = 'car_radio';

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('smallspeaker', 'Small Speaker', 10),
	('mediumspeaker', 'Medium Speaker', 25),
	('largespeaker', 'Large Speaker', 45),
	('car_radio', 'Car Radio', 10);
	