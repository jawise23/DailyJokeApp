// ContentView.swift

import SwiftUI

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
    
    func fetchJoke() {
        joke = JokeProvider.shared.getRandomJoke()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
