SELECT ad, dogum_yili FROM uyeler WHERE dogum_yili >= 2000;
SELECT MIN(ucret) AS en_dusuk_ucret, MAX(ucret) AS en_yuksek_ucret, SUM(ucret) AS toplam_ucret FROM dersler;
SELECT brans, COUNT(*) AS egitmen_sayisi FROM egitmenler GROUP BY brans ORDER BY egitmen_sayisi DESC;
SELECT s.ad, COUNT(d.ders_id) AS ders_sayisi FROM salonlar s JOIN dersler d ON s.salon_id = d.salon_id GROUP BY s.salon_id, s.ad HAVING COUNT(d.ders_id) > 3;
