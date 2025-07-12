

import SwiftUI

struct ContentView: View {
    
  
    @State var currentTab:Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    
    var body: some View {
        TabView(selection: $currentTab){
                
          
            
            HomePageView().tag(Tab.Home)
            
            SearchPageView()
                .tag(Tab.Search)
            
            NotificationsView()
                .tag(Tab.Notification)
            
            CartPageView()
                .tag(Tab.Cart)
            
            ProfilePageView()
                .tag(Tab.Profile)
        }.overlay(
            HStack(spacing:0){
                ForEach(Tab.allCases,id: \.rawValue){ tab in
                    TabButton(tab:tab)
                }.padding(.vertical)
                .padding(.bottom,getSafeArea().bottom == 0 ? 5: (getSafeArea().bottom)-15)
                    .background(Color("kSecondary"))
            },
            alignment: .bottom
        ).ignoresSafeArea(.all,edges: .bottom)
    }
    
    func TabButton(tab:Tab)->some View{
        GeometryReader{ proxy in
            Button(action: {
                withAnimation(.spring()){
                    currentTab = tab
                }
            }, label: {
                VStack(spacing:0){
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue).resizable()
                        .foregroundColor(Color("kPrimary"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width:25,height: 25)
                        .frame(maxWidth:.infinity)
                        .background(
                            ZStack{
                                if currentTab == tab{
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    Text(tab.TabName).foregroundColor(.primary)
                                        .font(.footnote)
                                        .padding(.top,50)
                                    
                                }
                            }
                        ).contentShape(Rectangle())
                        .offset(y:currentTab == tab ? -15:0)
                       
                    
                }
            })
        }
        .frame(height:25)
    }
}

#Preview {
    ContentView()
        
}


enum Tab:String,CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var TabName:String {
        switch self{
        case .Home:
            return "Anasayfa"
        case .Search:
            return "Ara"
        case .Notification:
            return "Bildirimler"
        case .Cart:
            return "Sepet"
        case .Profile:
            return "Profil"
        }
    }
}


extension View{
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}

struct MaterialEffect:UIViewRepresentable{
    var style:UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
