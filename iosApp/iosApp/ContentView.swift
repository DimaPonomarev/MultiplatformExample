import SwiftUI
//import shared

struct LoginScreen: View {
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false
    @State private var isSuccessfulAlertShowed: Bool = false
    
    private var isButtonEnabled: Bool {
        get {
            !isLoading && !login.isEmpty && !password.isEmpty
        }
    }
    
    var body: some View {
        Group {
            VStack(spacing: 8.0) {
                TextField("Login", text: $login)
                    .textFieldStyle(.roundedBorder)
                    .disabled(isLoading)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .disabled(isLoading)
                
                Button(
                    action: {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isLoading = false
                            isSuccessfulAlertShowed = true
                        }
                    }, label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Login")
                        }
                    }
                ).disabled(!isButtonEnabled)
            }.padding()
        }.alert(
            "Login successful",
            isPresented: $isSuccessfulAlertShowed
        ) {
            Button("Close", action: { isSuccessfulAlertShowed = false })
        }
    }
}
