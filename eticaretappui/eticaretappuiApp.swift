

import SwiftUI

@main
struct eticaretappuiApp: App {
    
    @StateObject private var cartManager = CartManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(cartManager)
    }
}
