

import Foundation
import SwiftUI

struct HomePageView: View {
  
 
    var body: some View {
        NavigationStack {
            ScrollView{
                

            ZStack(alignment: .top) {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    AppBar()
                    SearchView()
                    ImageSliderView()
                    HStack {
                        Text("Diğer ürünler")
                            .font(.title2)
                            .fontWeight(.medium)

                        Spacer()
                        NavigationLink(destination:{
                            ProductsPageView()
                        },label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("kPrimary"))
                        })
                            
                        
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(productList, id: \.id) { product in
                                NavigationLink {
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product)
                                       
                                }

                            }
                        }
                        .padding(.horizontal)
                    }
                }

            }
            }
        }
    }
}

#Preview {
    HomePageView()
}

struct AppBar: View {

    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    Text("İstanbul, Türkiye")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                    NavigationLink(
                        destination: CartView()
                    ) {
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
                Text("En kaliteli ve uygun \nMobilyaları")
                    .font(.largeTitle.bold())
                    + Text(" bulun")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("kPrimary"))
            }
        }
        .padding()
       
    }
}

