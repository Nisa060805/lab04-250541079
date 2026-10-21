CREATE TABLE IF NOT EXISTS uyeler (
    uye_id SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    dogum_yili INT
);

CREATE TABLE IF NOT EXISTS egitmenler (
    egitmen_id SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    brans VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS salonlar (
    salon_id SERIAL PRIMARY KEY,
    ad VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dersler (
    ders_id SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    ucret NUMERIC(10,2),
    egitmen_id INT REFERENCES egitmenler(egitmen_id),
    salon_id INT REFERENCES salonlar(salon_id)
);

CREATE TABLE IF NOT EXISTS kayitlar (
    kayit_id SERIAL PRIMARY KEY,
    uye_id INT REFERENCES uyeler(uye_id),
    ders_id INT REFERENCES dersler(ders_id),
    tarih DATE
);

INSERT INTO uyeler (ad, dogum_yili) VALUES
('Ahmet Yilmaz', 1998),
('Ayse Kaya', 2002),
('Mehmet Demir', 2001),
('Fatma Celik', 1995),
('Ali Ozturk', 2004);

INSERT INTO egitmenler (ad, brans) VALUES
('Canan Arslan', 'Yüzme'),
('Murat Yildiz', 'Fitness'),
('Sibel Sahin', 'Pilates'),
('Emre Aydin', 'Yüzme');

INSERT INTO salonlar (ad) VALUES
('A Salonu'),
('B Salonu'),
('C Salonu');

INSERT INTO dersler (ad, ucret, egitmen_id, salon_id) VALUES
('Temel Yüzme', 500, 1, 1),
('Ileri Yüzme', 750, 4, 1),
('Fitness 101', 300, 2, 2),
('Aletli Pilates', 600, 3, 3),
('Crossfit', 450, 2, 2);

INSERT INTO kayitlar (uye_id, ders_id, tarih) VALUES
(1, 1, '2026-01-15'),
(2, 1, '2026-01-20'),
(2, 2, '2026-02-10'),
(3, 3, '2026-02-15'),
(5, 4, '2026-03-01');
