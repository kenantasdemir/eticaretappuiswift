import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    let slides: [String] = ["fn1", "fn2", "fn3", "fn4", "fn5"]

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<slides.count, id: \.self) { index in
                ZStack(alignment: .bottom) {
                    Image(slides[index])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    
                    HStack(spacing: 8) {
                        ForEach(0..<slides.count, id: \.self) { dotIndex in
                            Circle()
                                .fill(currentIndex == dotIndex ? Color("kPrimary") : Color("kSecondary"))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(.bottom, 12)
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never)) // native swipe, ama dotları gizle
        .frame(height: 220)
        .onAppear {
            // Otomatik kaydırma
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % slides.count
                }
            }
        }
    }
}
