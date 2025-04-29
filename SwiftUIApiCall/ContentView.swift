import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List(userViewModel.userData) { user in
                VStack(alignment: .leading, spacing: 8) {
                    Text("User Id: \(user.id)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    Text("User Name: \(user.name)")
                        .foregroundColor(.black)
                    Text("Email: \(user.email)")
                        .foregroundColor(.green)
                    Text("User Active: \(user.isActive ? "Yes" : "No")")
                        .foregroundColor(.red)
                }
                .padding()
            }
            .onAppear {
                userViewModel.fetchUsersData { }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
