

import SwiftUI

struct SearchPageView: View {

    
    @EnvironmentObject private var cartManager:CartManager
 


    var body: some View {

        NavigationStack{
            VStack {

                SearchView().padding()

                ScrollView(.vertical) {
           
                    ForEach(productList, id: \.id) { product in
                        ZStack {
                  
                            NavigationLink {
                                ProductDetailsView(product: product)
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)

                            
                            
               
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
                                    
                                    Text(product.description.truncated(limit: 20))
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .opacity(0.3)
                                       
                                    Text("₺ \(product.price)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)

                        
                                Button {
                                    cartManager.addToCart(product: product)
                                } label: {
                                    if cartManager.contains(product){
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 20))
                                            .padding()
                                            .background(Circle().fill(Color(.green)))
                                            .foregroundColor(.white)
                                    }else{
                                        Image(systemName: "cart.badge.plus")
                                            .font(.system(size: 20))
                                            .padding()
                                            .background(Circle().fill(Color("kPrimary")))
                                            .foregroundColor(.white)
                                    }
                             
                                }
                                .buttonStyle(PlainButtonStyle()) 
                                .frame(width: 60, alignment: .center)
                            }
                            .padding()
                        }
                    }

                    
                }

            }
        }

    }
}

extension String {
    func truncated(limit: Int) -> String {
        if self.count > limit {
            let index = self.index(self.startIndex, offsetBy: limit)
            return String(self[..<index]) + "..."
        } else {
            return self
        }
    }
}


#Preview {
    SearchPageView()
}
