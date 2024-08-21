-- Vorbereitungen
USE design;

DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS servants;

-- Mastertabelle: unverändert

CREATE TABLE IF NOT EXITS cats
(
  id        INT     NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR NOT NULL,
  fur_color VARCHAR NOT NULL,
  PRIMARY KEY (id)
);
-- Detailtabelle: Verbindung zur Mastertabelle über Fremdschlüssel
CREATE TABLE servants
(
  id           INT     NOT NULL AUTO_INCREMENT,
  servant_name VARCHAR NOT NULL,
  yrs_servant  TINYINT NOT NULL,
  id           INT     NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE servants
  ADD CONSTRAINT FK_cats_TO_servants
    FOREIGN KEY (id)
    REFERENCES cats (id);

DESCRIBE design.cats;
DESCRIBE design.servants;
