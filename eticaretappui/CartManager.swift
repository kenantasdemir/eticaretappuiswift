
import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [CartItem] = []
    @Published private(set) var total: Int = 0

    func addToCart(product: Product) {
        if let index = products.firstIndex(where: { $0.product.id == product.id }) {
            products[index].quantity += 1
        } else {
            products.append(CartItem(product: product, quantity: 1))
        }
        total += product.price
    }

    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.product.id == product.id }) {
            let item = products[index]
            total -= item.product.price

            if item.quantity > 1 {
                products[index].quantity -= 1
            } else {
                products.remove(at: index)
            }
        }
    }

    func quantity(for product: Product) -> Int {
        products.first(where: { $0.product.id == product.id })?.quantity ?? 0
    }

    func contains(_ product: Product) -> Bool {
        products.contains(where: { $0.product.id == product.id })
    }
}


