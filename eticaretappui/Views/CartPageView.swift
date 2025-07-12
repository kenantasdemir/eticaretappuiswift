import SwiftUI

struct CartPageView: View {
    
    @EnvironmentObject private var cartManager:CartManager
    @State private var showAlert:Bool = false
    @State private var pendingDeleteProduct: Product? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical) {
                    
                  
                    
                    ForEach(cartManager.products, id: \.id) { item in
                        let product = item.product
                        NavigationLink {
                            ProductDetailsView(product: product)
                        } label: {
                            HStack(alignment: .top, spacing: 10) {
                                Image(product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal, 3)
                                    .frame(width: 70)
                                    .cornerRadius(9)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(product.name)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .bold()
                                    Text("Toplam: ₺ \(item.quantity * product.price)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                
                                HStack(spacing: 4) {
                                    Button {
                                        cartManager.addToCart(product: product)
                                    } label: {
                                        Image(systemName: "plus.circle")
                                    }
                                    
                                    Text("\(item.quantity)").font(.system(.title3)).bold()
                                        .frame(minWidth: 30, alignment: .center) // sabit genişlik
                                    
                                    Button {
                                        if cartManager.quantity(for: product) == 1 {
                                           
                                            pendingDeleteProduct = product
                                            showAlert = true
                                        } else {
                                         
                                            cartManager.removeFromCart(product: product)
                                        }
                                    } label: {
                                        Image(systemName: "minus.circle")
                                    }
                                    .alert("Ürünü sepetten çıkarmak istiyor musun?", isPresented: $showAlert) {
                                        Button("İptal", role: .cancel) { }
                                        Button("Evet", role: .destructive) {
                                            if let productToRemove = pendingDeleteProduct {
                                                cartManager.removeFromCart(product: productToRemove)
                                            }
                                        }
                                    } message: {
                                        Text("Bu üründen sadece 1 tane kaldı. Sepetten tamamen çıkarmak ister misin?")
                                    }

                                }
                                .frame(width: 60, alignment: .center)
                            }
                            .padding()
                        }
                    }
              
                 

                }
            
                Divider()

                VStack {
                    Text("Toplam: ₺\(cartManager.total)")
                        .font(.headline)
             
                    PaymentButton(action: {
                       
                    })
                    .frame(height: 45)
                }
                .padding()
                .padding(.bottom, 40)
                .background(Color.white.shadow(radius: 3))
                             .safeAreaInset(edge: .bottom) {
                                 Color.clear.frame(height: 0)
                             }
                
            }
        }
    }
}

#Preview {
    CartPageView()
}
