//
//  FelizWishListApp.swift
//  FelizWishList
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

@main
struct FelizWishListApp: App {
    var network = Network()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
