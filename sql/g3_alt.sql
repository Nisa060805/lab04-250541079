SELECT ad, ucret FROM dersler WHERE ucret > (SELECT AVG(ucret) FROM dersler);
SELECT ad FROM dersler WHERE egitmen_id IN (SELECT egitmen_id FROM egitmenler WHERE brans = 'Yüzme');
WITH UyeKayitSayilari AS (
    SELECT u.uye_id, u.ad, COUNT(k.kayit_id) AS kayit_sayisi
    FROM uyeler u JOIN kayitlar k ON u.uye_id = k.uye_id
    GROUP BY u.uye_id, u.ad
)
SELECT ad, kayit_sayisi FROM UyeKayitSayilari WHERE kayit_sayisi = (SELECT MAX(kayit_sayisi) FROM UyeKayitSayilari);
