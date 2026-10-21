SELECT u.ad AS uye_adi, d.ad AS ders_adi, k.tarih FROM kayitlar k JOIN uyeler u ON k.uye_id = u.uye_id JOIN dersler d ON k.ders_id = d.ders_id;
SELECT d.ad AS ders_adi, e.ad AS egitmen_adi, s.ad AS salon_adi FROM dersler d JOIN egitmenler e ON d.egitmen_id = e.egitmen_id JOIN salonlar s ON d.salon_id = s.salon_id;
SELECT u.ad FROM uyeler u LEFT JOIN kayitlar k ON u.uye_id = k.uye_id WHERE k.kayit_id IS NULL;
SELECT e.ad AS egitmen_adi, COUNT(k.kayit_id) AS toplam_kayit FROM egitmenler e JOIN dersler d ON e.egitmen_id = d.egitmen_id JOIN kayitlar k ON d.ders_id = k.ders_id GROUP BY e.egitmen_id, e.ad ORDER BY toplam_kayit DESC;
