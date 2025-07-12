
import Foundation

struct NotificationModel: Identifiable {

    var id = UUID()
    var content: String
    var date: Date
}

let sampleNotifications: [NotificationModel] = [
    NotificationModel(
        content: "Yeni kampanyamız başladı! %30'a varan indirimleri kaçırma.",
        date: Date().addingTimeInterval(-3600)
    ),
    NotificationModel(
        content: "Sepetinde bekleyen ürünlerde stoklar tükenmek üzere!",
        date: Date().addingTimeInterval(-86400)
    ),
    NotificationModel(
        content: "Kargo yola çıktı! Siparişin 2 gün içinde elinde olacak.",
        date: Date().addingTimeInterval(-18000)
    ),
    NotificationModel(
        content:
            "Yeni ürünler eklendi: Evinize şıklık katacak dekorlar şimdi stokta.",
        date: Date().addingTimeInterval(-7200)
    ),
    NotificationModel(
        content: "Üyeliğine özel kupon tanımlandı: ALISVERIS50",
        date: Date().addingTimeInterval(-432000)
    ),
    NotificationModel(
        content: "Yeni kampanyamız başladı! %30'a varan indirimleri kaçırma.",
        date: Date().addingTimeInterval(-3600)
    ),
    NotificationModel(
        content: "Sepetinde bekleyen ürünlerde stoklar tükenmek üzere!",
        date: Date().addingTimeInterval(-86400)
    ),
    NotificationModel(
        content: "Kargo yola çıktı! Siparişin 2 gün içinde elinde olacak.",
        date: Date().addingTimeInterval(-18000)
    ),
    NotificationModel(
        content:
            "Yeni ürünler eklendi: Evinize şıklık katacak dekorlar şimdi stokta.",
        date: Date().addingTimeInterval(-7200)
    ),
    NotificationModel(
        content: "Üyeliğine özel kupon tanımlandı: ALISVERIS50",
        date: Date().addingTimeInterval(-432000)
    ),

    NotificationModel(
        content:
            "Hesabınızla giriş yapıldı. Siz değilseniz lütfen şifrenizi değiştirin.",
        date: Date().addingTimeInterval(-60 * 5)
    ),
    NotificationModel(
        content: "Favori ürününüz yeniden stokta! Şimdi sipariş verin.",
        date: Date().addingTimeInterval(-60 * 30)
    ),
    NotificationModel(
        content: "Bu hafta sonu tüm sehpalarda %20 indirim!",
        date: Date().addingTimeInterval(-60 * 60 * 6)
    ),
    NotificationModel(
        content: "Kampanyalar bitti, ama yeni fırsatlar yolda!",
        date: Date().addingTimeInterval(-60 * 60 * 12)
    ),
    NotificationModel(
        content: "Siparişin teslim edildi. Umarız memnun kalmışsındır.",
        date: Date().addingTimeInterval(-60 * 60 * 24)
    ),
    NotificationModel(
        content: "Profil bilgilerinizi güncelleyin ve %10 indirim kazanın.",
        date: Date().addingTimeInterval(-60 * 60 * 36)
    ),
    NotificationModel(
        content: "Yeni kullanıcı yorumları seni bekliyor.",
        date: Date().addingTimeInterval(-60 * 60 * 48)
    ),
    NotificationModel(
        content: "Ücretsiz kargo fırsatının bitmesine son 12 saat!",
        date: Date().addingTimeInterval(-60 * 60 * 72)
    ),
    NotificationModel(
        content: "Mobil uygulamamıza özel kupon: MOBIL10",
        date: Date().addingTimeInterval(-60 * 60 * 96)
    ),
    NotificationModel(
        content: "Ürünün iade süresi dolmak üzere. Detayları kontrol et.",
        date: Date().addingTimeInterval(-60 * 60 * 120)  
    ),
]
