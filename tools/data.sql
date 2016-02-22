INSERT INTO farmers ( id, name, age, location ) VALUES 
(1, 'Finnebar', 47, 'MI'), 
(2, 'Bear', 60, 'AK'),
(3, 'Iguana', 41, 'FL'),
(4, 'Alex', 33, 'GA'),
(5, 'Amanda', 24, 'OH'),
(6, 'Sophie', 24, 'CT'),
(7, 'Rosey', 91, 'GA'),
(8, 'Victoria', 23, 'OR'),
(9, 'Franz', 100, 'FL'),
(10, 'Hermione', 30, 'ND'),


INSERT INTO crops ( id, name, boxes, price) VALUES 
(1, 'carrots', 10, 2), 
(2, 'carrots', 3, 3),
(3, 'lettuce', 1, 1),
(4, 'lettuce', 30, 1),
(5, 'lettuce', 20, 2),
(6, 'arugala', 7, 4),
(7, 'spinach', 9, 1),
(8, 'spinach', 11, 2);
(9, 'alfalfa', 4, 3),
(10, 'radishes', 19, 6);

INSERT INTO inventory ( id, crops_id, farmer_id) VALUES 
(1, 2, 2), 
(2, 3, 2),
(3, 1, 8),
(4, 10, 6),
(5, 9, 7),
(6, 7, 4),
(7, 6, 1),
(8, 5, 2);
(9, 4, 3),
(10, 8, 6);