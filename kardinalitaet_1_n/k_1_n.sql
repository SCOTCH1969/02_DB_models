-- Vorbereitung
USE design;
DROP TABLE IF EXISTS kittens;
DROP TABLE IF EXISTS cats;

-- Mastertabelle: CATS unverändert
CREATE TABLE cats
(
  id        INT         NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- Mastertabelle: Struktur

DESCRIBE design.cats;

INSERT INTO cats (id, cat_name,fur_color) VALUES (DEFAULT, "Grizabella", "white");
INSERT INTO cats (id, cat_name,fur_color) VALUES (DEFAULT, "Mausi", "striped");

-- Mastertabelle: Inhalte 

SELECT * FROM design.cats;

-- Detailtabelle: Kittens

CREATE TABLE kittens
(
  id          INT         NOT NULL AUTO_INCREMENT,
  kitten_name VARCHAR(45) NOT NULL,
  fur_color   VARCHAR(45) NOT NULL,
  cats_id     INT         NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE kittens
  ADD CONSTRAINT FK_cats_TO_kittens
    FOREIGN KEY (cats_id)
    REFERENCES cats (id);

-- Detailtabelle: Struktur

DESCRIBE design.kittens;

-- Detailtabelle: Inserts

INSERT INTO kittens (id, kitten_name, fur_color, cats_id) VALUES (DEFAULT, "Grizzi_1", "white", 1);
INSERT INTO kittens (id, kitten_name, fur_color, cats_id) VALUES (DEFAULT, "Grizzi_2", "white", 1);
INSERT INTO kittens (id, kitten_name, fur_color, cats_id) VALUES (DEFAULT, "Mausini", "striped", 2);


-- Detailtabelle: Inhalte
SELECT * FROM design.kittens;
