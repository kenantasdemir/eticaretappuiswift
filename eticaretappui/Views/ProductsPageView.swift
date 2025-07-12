

import SwiftUI

struct ProductsPageView: View {
    
    @EnvironmentObject var cartManager:CartManager
    
    var column = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns:column, spacing: 20){
                    ForEach(productList, id: \.id){ product in
                        ProductCardView(product: product)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Tüm ürünler"))
        }
    }
}

#Preview {
    ProductsPageView()
}
