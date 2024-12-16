//
//  AllCoinsView.swift
//  CryptoBit
//
//  Created by Murad Akhundov on 14.12.24.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel : HomeViewModel

    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("All Coins")
                .font(.headline).padding(.horizontal).padding(.vertical,2)

            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            
            ScrollView {
                VStack {
                    // since coin model has id we dont need to create \id.self
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
 
    
    

    }
}

//#Preview {
//    AllCoinsView()
//}
