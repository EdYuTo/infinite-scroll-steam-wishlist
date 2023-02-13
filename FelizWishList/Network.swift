//
//  Network.swift
//  FelizWishList
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

class Network: ObservableObject {
    private var page = 0

    @Published
    var games = [Game]()
    
    @Published
    var hasFinished = false
    
    @Published
    var hasError = false
        
    func fetchGames(_ userId: String = "76561198071756100") {
        hasError = false
        guard let url = URL(string: "https://store.steampowered.com/wishlist/profiles/\(userId)/wishlistdata?p=\(page)") else {
            hasError = true
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if error != nil {
                self?.hasError = true
                return
            }
            guard let data = data else {
                self?.hasError = true
                return
            }
            if let response = try? JSONDecoder().decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self?.games.append(contentsOf: response.values)
                    self?.page += 1
                }
            } else if let response = try? JSONDecoder().decode([Game].self, from: data), response.isEmpty {
                self?.hasFinished = true
            } else {
                self?.hasError = true
            }
        }
        task.resume()
    }
}
