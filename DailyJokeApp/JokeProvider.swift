// JokeProvider.swift

import Foundation

// MARK: - JokeProvider

/// A class that provides jokes by fetching them from an API.
class JokeProvider {
    static let shared = JokeProvider()
    
    private init() {}
    
    /// Fetches a random joke from the JokeAPI and calls the completion handler with the joke.
    ///
    /// - Parameter completion: A closure that takes a single `String` argument, which is the fetched joke.
    func getRandomJoke(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=single") else {
            completion("Error: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion("Error: \(error.localizedDescription)")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion("Error: No data received")
                }
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(JokeResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(jsonResult.joke)
                }
            } catch {
                DispatchQueue.main.async {
                    completion("Error: Failed to decode JSON")
                }
            }
        }.resume()
    }
}

// MARK: - JokeResponse

/// A structure that represents the response format from the JokeAPI.
struct JokeResponse: Codable {
    let joke: String
}
