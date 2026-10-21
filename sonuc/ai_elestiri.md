### Yapay Zeka Sorgu Eleştirisi ve Karşılaştırması

Soru 3.3 metni (CTE şartından söz edilmeden) yapay zekaya verildi ve üretmesi istenen sorgu çalıştırıldı.

Yapay Zeka Sorgusu:
SELECT u.ad, COUNT(k.kayit_id) AS kayit_sayisi
FROM uyeler u
JOIN kayitlar k ON u.uye_id = k.uye_id
GROUP BY u.uye_id, u.ad
ORDER BY kayit_sayisi DESC
LIMIT 1;

**Eleştiri ve Karşılaştırma:**
1. **Beraberlik Yanılgısı:** Yapay zekanın yazdığı sorguda `LIMIT 1` kullanıldığı için, en çok kayıt yaptıran birden fazla üye olduğunda sadece 1 tanesini döndürür, diğerini eler. Bu durum yanlış sonuç verir.
2. **CTE Üstünlüğü:** Bizim CTE (`WITH`) kullanarak yazdığımız sorgu, maksimum kayıt sayısına eşit olan tüm kullanıcıları listeler.
3. **Okunabilirlik:** CTE kullanımı mantığı adımlara böldüğü için sorgunun okunabilirliğini artırır.
