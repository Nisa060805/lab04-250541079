SELECT s.ad AS salon_adi, d.ad AS ders_adi, d.ucret, RANK() OVER (PARTITION BY d.salon_id ORDER BY d.ucret DESC) AS ucret_sirasi FROM dersler d JOIN salonlar s ON d.salon_id = s.salon_id;
WITH SiraliDersler AS (
    SELECT s.ad AS salon_adi, d.ad AS ders_adi, d.ucret, RANK() OVER (PARTITION BY d.salon_id ORDER BY d.ucret DESC) AS rnk FROM dersler d JOIN salonlar s ON d.salon_id = s.salon_id
)
SELECT salon_adi, ders_adi, ucret FROM SiraliDersler WHERE rnk = 1;
WITH AylikKayitlar AS (
    SELECT EXTRACT(MONTH FROM tarih)::int AS ay, COUNT(*) AS kayit_sayisi FROM kayitlar GROUP BY EXTRACT(MONTH FROM tarih)::int
)
SELECT ay, kayit_sayisi, kayit_sayisi - LAG(kayit_sayisi) OVER (ORDER BY ay) AS fark FROM AylikKayitlar ORDER BY ay;
