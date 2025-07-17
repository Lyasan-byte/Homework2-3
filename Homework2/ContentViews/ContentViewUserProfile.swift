import SwiftUI

struct ContentViewProfile: View {
    var user: User
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        ZStack {
            // Основной контент
            Group {
                switch appState.currentScreen {
                case .profile:
                    profileContentView
                case .favorites:
                    ContentViewFavorites()
                case .main:
                    ContentViewBooks()
                }
            }
            
            // Навигационная панель
            VStack {
                Spacer()
                HStack {
                    Button(action: { appState.currentScreen = .main }) {
                        Image(systemName: "menucard")
                            .font(.system(size: 22))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button(action: { appState.currentScreen = .favorites }) {
                        Image(systemName: "heart")
                            .font(.system(size: 22))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button(action: { appState.currentScreen = .profile }) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 22))
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.black)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    private var profileContentView: some View {
        VStack {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left.to.line.compact")
                        .font(.system(size: 18))
                        .foregroundStyle(Color.white)
                }
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading, 30)
            
            VStack {
                if user.name == "Laysan" {
                    Image(.laysan)
                        .resizable()
                        .frame(width: 250, height: 330)
                        .clipShape(Circle())
                    
                    Text(user.name)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30))
                        .italic()
                        .fontWeight(.bold)
                    
                    Text(user.bio)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .padding(.top, 0.1)
                } else {
                    Image(.byte)
                        .resizable()
                        .frame(width: 250, height: 330)
                        .clipShape(Circle())
                    
                    Text(user.name)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30))
                        .italic()
                        .fontWeight(.bold)
                    
                    Text(user.bio)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                        .padding(.top, 0.1)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    ContentViewProfile(user: User(name: "Byte", bio: "Description", password: "123"))
        .environmentObject(AppState())
}
