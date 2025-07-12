
import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cartManager:CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0 {
                ForEach(cartManager.products,id: \.id){ product in
                    CartProductView(product: product.product)
                }
                HStack{
                    Text("Toplam : ")
                    Spacer()
                    Text("₺ \(cartManager.total)")
                        .bold()
                    
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
                
            }else{
                Text("Sepetiniz boş")
            }
        }
        .navigationTitle(Text("Sepetim"))
        .padding(.top)
    }
}

#Preview {
    CartView()
}
