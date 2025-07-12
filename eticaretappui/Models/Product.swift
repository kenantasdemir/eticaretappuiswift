

import Foundation

struct Product:Identifiable{
    var id = UUID()
    var name :String
    var image:String
    var description:String
    var supplier:String
    var price:Int
    var width:String
    var height:String
    var diameter:String
}

var productList:[Product] = [
    Product(
          name: "Luna Deri Koltuk",
          image: "ucluderikoltuk",
          description: "Yüksek kaliteli gerçek deri ile kaplanmış, zarif ve modern bir koltuk. Geniş oturma alanı ve yumuşak dokusuyla maksimum konfor sunar.",
          supplier: "Nova Mobilya",
          price: 12499,
          width: "220 cm",
          height: "85 cm",
          diameter: "140 cm"
      ),
      Product(
          name: "Mila Tekli Koltuk",
          image: "images",
          description: "Minimalist tasarımıyla öne çıkan Mila tekli koltuk, hem klasik hem çağdaş alanlara uyum sağlar.",
          supplier: "Moderno",
          price: 5799,
          width: "90 cm",
          height: "95 cm",
          diameter: "90 cm"
      ),
      Product(
          name: "Retro Ahşap Sandalye",
          image: "retrosandalye",
          description: "Doğal ceviz ağacından üretilmiş, retro stil bir sandalye. Yemek odalarına sıcak bir hava katar.",
          supplier: "VintageCraft",
          price: 1899,
          width: "45 cm",
          height: "88 cm",
          diameter: "65 cm"
      ),
      Product(
          name: "Aura Sehpa",
          image: "aurasehpa",
          description: "Yuvarlak formu ve metal ayaklarıyla dikkat çeken Aura sehpa, modern oturma odaları için ideal.",
          supplier: "Dekora",
          price: 2199,
          width: "-",
          height: "45 cm",
          diameter: "60 cm"
      ),
      Product(
          name: "Nora Deri L Koltuk",
          image: "kosekoltuk",
          description: "Geniş aileler için tasarlanmış L şeklinde gerçek deri koltuk. Rahat oturumu ve şık tasarımı ile salonların vazgeçilmezi.",
          supplier: "Luxe Living",
          price: 18499,
          width: "280 cm",
          height: "90 cm",
          diameter: "200 cm"
      ),
      Product(
          name: "Blok Orta Sehpa",
          image: "blokorta2",
          description: "Masif ahşaptan yapılmış blok tasarımı ile rustik ve güçlü bir duruş sergiler.",
          supplier: "Ahşap Atölye",
          price: 2999,
          width: "100 cm",
          height: "40 cm",
          diameter: "70"
      ),
    Product(
          name: "Blok Orta Sehpa",
          image: "bloksehpa1",
          description: "Masif ahşaptan yapılmış blok tasarımı ile rustik ve güçlü bir duruş sergiler.",
          supplier: "Ahşap Atölye",
          price: 2999,
          width: "100 cm",
          height: "40 cm",
          diameter: "70 cm"
      ),
      Product(
          name: "Minimalist Kitaplık",
          image: "minimalkitaplik",
          description: "Metal ve ahşap birleşimiyle modern yaşam alanları için ideal kitaplık.",
          supplier: "Urban Mobilya",
          price: 1999,
          width: "80 cm",
          height: "180 cm",
          diameter: "120"
      ),
      Product(
          name: "Yuvarlak Yemek Masası",
          image: "yuvarlakyemek",
          description: "4 kişilik yuvarlak yemek masası, naturel ceviz renkte kaplama.",
          supplier: "Liva Mobilya",
          price: 4999,
          width: "200 cm",
          height: "75 cm",
          diameter: "120 cm"
      ),
      Product(
          name: "Retro Berjer",
          image: "deritekli",
          description: "Kadife kumaşı ve zarif ayak yapısıyla nostaljik bir konfor sunar.",
          supplier: "VintageLife",
          price: 2799,
          width: "85 cm",
          height: "95 cm",
          diameter: "85 cm"
      ),
      Product(
          name: "Modüler TV Ünitesi",
          image: "tvunite",
          description: "Duvara monte edilebilir, raflı ve çekmeceli modüler TV ünitesi.",
          supplier: "Dekorix",
          price: 3299,
          width: "180 cm",
          height: "50 cm",
          diameter: "130 cm"
      )
]
