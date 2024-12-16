//
//  CoinRowView.swift
//  CryptoBit
//
//  Created by Murad Akhundov on 14.12.24.
//

import SwiftUI
import Kingfisher
struct CoinRowView: View {

    let coin: Coin
    
    var body: some View {
        HStack {
            // market cap rank
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption)
                .foregroundColor(.gray)
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32,height: 32)
                .foregroundColor(.orange)
            // coin name info
            VStack(alignment: .leading , spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }.padding(.leading, 2)
            
            Spacer()
            // coin price info
            
            VStack(alignment: .trailing , spacing: 4){
                Text(String(coin.currentPrice.toCurrency()))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(String(coin.priceChangePercentage24H.toPercent()))
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }.padding(.leading, 2)
        }.padding(.horizontal)
        .padding(.vertical,4)
    }
}

//#Preview {
//    CoinRowView()
//}
