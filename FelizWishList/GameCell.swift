//
//  GameCell.swift
//  FelizWishList
//
//  Created by Edson Yudi Toma on 12/02/23.
//

import SwiftUI

struct GameCellModel {
    var image: String = "https://cdn.akamai.steamstatic.com/steam/apps/990080/header_292x136.jpg?t=1676056674"
    var title: String = "Hogwarts Legacy"
    var reviews: String = "VERY POSITIVE"
    var releaseDate: String = "10 FEB"
}

struct GameCell: View {
    let model: GameCellModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.image), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170, height: 80)
            }, placeholder: {
                ProgressView()
            })
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.title)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                    .padding(.bottom, 2)
                Text(model.reviews)
                Text(model.releaseDate)
            }
        }
    }
}

struct GameCell_Previews: PreviewProvider {
    static var previews: some View {
        GameCell(model: GameCellModel())
    }
}
