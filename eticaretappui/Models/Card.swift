

import SwiftUI

struct Card:Identifiable{
    var id = UUID().uuidString
    var name:String
    var cardNumber:String
    var cardImage:String
}


let savedCards: [Card] = [
    Card(
        name: "Kenan Taşdemir",
        cardNumber: "1234 1234 1234 1234",
        cardImage: "Card1" 
    ),
    Card(
        name: "Kenan Taşdemir",
        cardNumber: "5678 5678 5678 5678",
        cardImage: "Card2"
    ),
    Card(
        name: "Kenan Taşdemir",
        cardNumber: "9012 9012 9012 9012",
        cardImage: "Card3"
    )
]
