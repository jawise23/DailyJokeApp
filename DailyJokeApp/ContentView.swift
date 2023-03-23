import SwiftUI

// MARK: - ContentView

/// A view displaying a joke and a button to fetch a new one.
struct ContentView: View {
    @State private var joke = "Tap the button to get a joke!"
    
    var body: some View {
        VStack {
            Text(joke)
                .font(.largeTitle)
                .padding()
                .multilineTextAlignment(.center)
            
            Button(action: fetchJoke) {
                Text("Get a joke")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
    
    /// Fetches a random joke and updates the `joke` state property.
    private func fetchJoke() {
        JokeProvider.shared.getRandomJoke { newJoke in
            joke = newJoke
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
