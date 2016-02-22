CREATE TABLE farmers (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    location TEXT,
);

CREATE TABLE crops (
    id INTEGER PRIMARY KEY,
    name TEXT,
    boxes INTEGER,
    price INTEGER
);

CREATE TABLE inventory (
    id INTEGER PRIMARY KEY,
    crops_id INTEGER,
    farmer_id INTEGER
);
