// JokeProvider.swift

import Foundation

class JokeProvider {
    static let shared = JokeProvider()
    
    private let jokes = [
        "Why don't scientists trust atoms? Because they make up everything.",
        "Why did the chicken go to the seance? To talk to the other side.",
        "Why do we never tell secrets on a farm? Because the potatoes have eyes and the corn has ears.",
        "I told my wife she was drawing her eyebrows too high. She looked surprised."
    ]
    
    private init() {}
    
    func getRandomJoke() -> String {
        return jokes.randomElement()!
    }
}
