

import SwiftUI

struct ProfilePageView: View {

    @State private var showActions = false
    @State private var selectedOption: String?

    var body: some View {

        NavigationStack {
            VStack(spacing: 20) {

                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)

                    Text("Kenan Taşdemir")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("kenant103@gmail.com")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.top, 40)

                Divider().padding(.horizontal)

                List {
                    Section {
                        NavigationLink(
                            destination: Text("Hesap Bilgileri Sayfası")
                        ) {
                            Label("Hesabım", systemImage: "person")
                        }

                        NavigationLink(
                            destination: Text("Sipariş Geçmişi Sayfası")
                        ) {
                            Label("Siparişlerim", systemImage: "bag")
                        }

                        NavigationLink(destination: CardsPageView()) {
                            Label("Kartlarım", systemImage: "creditcard")
                        }.navigationTitle("Kartlarım")

                    }

                    Section {
                        NavigationLink(destination: Text("Ayarlar Sayfası")) {
                            Label("Ayarlar", systemImage: "gear")
                        }

                        Button(action: {
                            showActions = true
                        }) {
                            Label(
                                "Çıkış Yap",
                                systemImage: "arrow.backward.circle"
                            )
                            .foregroundColor(.red)
                        }.confirmationDialog(
                            "Gerçekten çıkış yapmak istiyor musun? ", isPresented: $showActions,
                            titleVisibility: .visible
                        ) {
                            Button("Evet", role: .destructive) {
                                selectedOption = "Logout"
                            }

                            Button("Hayır") {
                                selectedOption = "StayAsLoggedIn"
                            }

                            Button("İptal", role: .cancel) {}
                        }
                        
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Profil")
        }
    }

}

#Preview {
    ProfilePageView()
}


/*
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button("Show Bottom Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            BottomSheetView()
                .presentationDetents([.medium, .large]) // iOS 16+
        }
    }
}

struct BottomSheetView: View {
    var body: some View {
        VStack {
            Text("This is a bottom sheet")
                .font(.title)
                .padding()
            Spacer()
        }
        .presentationDragIndicator(.visible)
    }
}
*/



/*
IOS 14 ve öncesi
 .alert(isPresented: $showAlert) {
     Alert(
         title: Text("Warning"),
         message: Text("Are you sure you want to delete this?"),
         primaryButton: .destructive(Text("Delete")),
         secondaryButton: .cancel()
     )
 }

 */


/*
 IOS 13-14
 @State private var showSheet = false

 var body: some View {
     Button("Show Sheet") {
         showSheet = true
     }
     .actionSheet(isPresented: $showSheet) {
         ActionSheet(
             title: Text("Choose Action"),
             buttons: [
                 .default(Text("Edit")) { /* Edit işlemi */ },
                 .destructive(Text("Delete")) { /* Delete işlemi */ },
                 .cancel()
             ]
         )
     }
 }

 */
