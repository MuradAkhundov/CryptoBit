//
//  TopMoversItemView.swift
//  CryptoBit
//
//  Created by Murad Akhundov on 13.12.24.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin : Coin
    var body: some View {
        VStack(alignment: .leading) {
            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom , 4)
            
            // Coin info
            HStack {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(String(coin.currentPrice.toCurrency()))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Coin percent change
            Text(String(coin.priceChangePercentage24H.toPercent()))
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                .font(.title2)
        }
        .frame(width: 140,height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4),lineWidth: 2)
        )

    }
}

//#Preview {
//create mock data for coin
//    TopMoversItemView()
//}
