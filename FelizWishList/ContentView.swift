//
//  ContentView.swift
//  FelizWishList
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject
    var network: Network
    
    private let userId = "76561198091131287"
//    private let userId = "76561198071756100"
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(network.games.enumerated()), id: \.offset) { index, game in
                    GameCell(
                        model: GameCellModel(
                            image: game.capsule,
                            title: game.name,
                            reviews: game.reviewDesc,
                            releaseDate: game.releaseString
                        )
                    )
                    .onAppear {
                        if index == network.games.count - 1 {
                            fetchData()
                        }
                    }
                }
                if !network.hasFinished && !network.hasError {
                    ProgressView()
                        .id(UUID())
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                if network.hasError {
                    Button("retry") {
                        fetchData()
                    }
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Wishlist")
        }.onAppear {
            fetchData()
        }
    }
    
    private func fetchData() {
        network.fetchGames(userId)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
