

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var cartManager:CartManager
    var product:Product
    
    @State private var addedToCart: Bool = false

    
    var body: some View {
        ZStack{
            Color("kSecondary")
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading){
                    Image(product.image)
                        .resizable()
                        .frame(width: 175,height: 160)
                        .cornerRadius(12)
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical,1)
                    Text(product.supplier)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.vertical,0.5)
                    Text("₺ \(product.price)")
                        .foregroundColor(.black)
                        .bold()
                    
                }
                
               
                
              
                
                if cartManager.contains(product) {
                    Image(systemName: "checkmark")
                        .font(.system(size: 10))
                               .padding()
                               .background(Circle().fill(Color.green))
                               .foregroundColor(.white)
                } else {
                 
                    Button(action: {
                        cartManager.addToCart(product: product)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color("kPrimary"))
                            .frame(width:35,height: 35)
                            .padding(.trailing)
                    }
                }


            }
        }
        .frame(width: 185,height: 260)
        .cornerRadius(15)
    }
}

#Preview {
    ProductCardView(product: productList[0])
       
}
