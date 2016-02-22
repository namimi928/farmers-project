CREATE TABLE farmers (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    location TEXT,
);

CREATE TABLE crops (
    id INTEGER PRIMARY KEY,
    name TEXT,
    price INTEGER,
    farmer_id INTEGER
);