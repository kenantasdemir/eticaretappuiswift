

import SwiftUI

struct CardsPageView: View {

    @State var expandCards: Bool = false
    @State var currentCard: Card?
    @State var showDetailCard: Bool = false
    @Namespace var animation

    var body: some View {
        VStack(spacing: 0) {
            headerView()

            ScrollView(.vertical, showsIndicators: false) {
                cardsListView()
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)

            actionButton()
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(content: detailOverlayView)
    }


    @ViewBuilder
    func headerView() -> some View {
        Text("Kayıtlı kartlarım")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(
                maxWidth: .infinity,
                alignment: expandCards ? .leading : .center
            )
            .overlay(alignment: .trailing) {
                Button {
                    withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                        expandCards = false
                    }
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.blue, in: Circle())
                }
                .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                .offset(x: expandCards ? 10 : 15)
                .opacity(expandCards ? 1 : 0)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
    }


    @ViewBuilder
    func cardsListView() -> some View {
        VStack(spacing: 0) {
            ForEach(savedCards) { card in
                cardViewFor(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            currentCard = card
                            showDetailCard = true
                        }
                    }
            }
        }
        .overlay {
            Rectangle()
                .fill(.black.opacity(expandCards ? 0 : 0.01))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        expandCards = true
                    }
                }
        }
        .padding(.top, expandCards ? 30 : 0)
    }

 
    @ViewBuilder
    func cardViewFor(card: Card) -> some View {
        if currentCard?.id == card.id && showDetailCard {
            CardView(card: card)
                .opacity(0)
        } else {
            CardView(card: card)
                .matchedGeometryEffect(id: card.id, in: animation)
        }
    }

   
    @ViewBuilder
    func actionButton() -> some View {
        Button {
            expandCards = false
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.white)
                .padding(20)
              
                .background(.blue, in: Circle())
        }
        .rotationEffect(.init(degrees: expandCards ? 180 : 0))
        .scaleEffect(expandCards ? 0.01 : 1)
        .opacity(!expandCards ? 1 : 0)
        .frame(height: expandCards ? 0 : nil)
        .padding(.bottom, expandCards ? 0 : 70)
    }

    
    @ViewBuilder
    func CardView(card: Card) -> some View {
        GeometryReader { proxy in
            let rect = proxy.frame(in: .named("SCROLL"))
            let offset = CGFloat(getIndex(Card: card) * (expandCards ? 10 : 70))

            ZStack(alignment: .bottomLeading) {
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                VStack(alignment: .leading, spacing: 10) {
                    Text(card.name).fontWeight(.bold)
                    Text(customisedCardNumber(number: card.cardNumber))
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .padding()
                .padding(.bottom, 10)
                .foregroundColor(.white)
            }
            .offset(y: expandCards ? offset : -rect.minY + offset)
        }
        .frame(height: 200)
    }

   
    @ViewBuilder
    func detailOverlayView() -> some View {
        if let currentCard = currentCard, showDetailCard {
            DetailView(
                currentCard: currentCard,
                showDetailCard: $showDetailCard,
                animation: animation
            )
        }
    }


    func getIndex(Card: Card) -> Int {
        return savedCards.firstIndex { $0.id == Card.id } ?? 0
    }
}

func customisedCardNumber(number: String) -> String {
    var newValue: String = ""
    let maxCount = number.count - 4
    number.enumerated().forEach { value in
        if value.offset >= maxCount {
            let string = String(value.element)
            newValue.append(contentsOf: string)
        } else {
            let string = String(value.element)
            if string == " " {
                newValue.append(contentsOf: " ")
            }
            newValue.append(contentsOf: "*")
        }
    }
    return newValue
}

#Preview {
    CardsPageView()
}

struct DetailView: View {
    var currentCard: Card
    @Binding var showDetailCard: Bool
    var animation: Namespace.ID

    @State var showExpenseView: Bool = false

    var body: some View {
        VStack {
            CardView().matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showDetailCard = false
                    }
                }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {

                }.padding()
            }
            .frame(maxWidth: .infinity)
            .background(
                Color.white
                    .clipShape(
                        RoundedRectangle(cornerRadius: 25, style: .continuous))

            )
            .padding([.horizontal, .top])
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    @ViewBuilder
    func CardView() -> some View {
        ZStack(alignment: .bottomLeading) {
            Image(currentCard.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 10) {
                Text(currentCard.name).fontWeight(.bold)
                
                Text(customisedCardNumber(number: currentCard.cardNumber))
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .padding()
            .padding(.bottom, 10)
            .foregroundColor(.white)
        }
    }
}
