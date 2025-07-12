
import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView(.vertical) {

            ForEach(sampleNotifications, id: \.id){ notification in
                HStack(alignment: .top, spacing: 10) {

                    Image(systemName: "exclamationmark")
                        .font(.system(size: 20))
                        .padding()
                        .background(Circle().fill(Color("kPrimary")))
                        .foregroundColor(.white)

                    VStack(alignment: .leading, spacing: 4) {  //
                        Text(notification.content)
                            .font(.system(size: 16,weight: .bold))
                            .foregroundColor(.black)
                            .bold()
                     
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    HStack(alignment:.bottom, spacing: 4) {
                        Text(formattedDate(notification.date))
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                            .bold()
                    }
                    .frame(width: 95, alignment: .center)
                }
                .padding()
            }
        }

    }
    
    private func formattedDate(_ date: Date) -> String {
        let now = Date()
        let difference = now.timeIntervalSince(date)

        let formatter = DateFormatter()
        
        if difference > 86400 { // 86400 saniye = 24 saat
            formatter.dateStyle = .short
            formatter.timeStyle = .none
        } else {
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        }

        return formatter.string(from: date)
    }

}

#Preview {
    NotificationsView()
}
