//
//  SwiftUIView.swift
//  CryptoBit
//
//  Created by Murad Akhundov on 15.12.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {

    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()

    init() {
        fetchCoinData()
    }
    
    func fetchCoinData(){
        // Since api is public, the file is not added to GITIGNORE
        // Api fetching logic should be placed in network , datasource module.
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=100&page=1&price_change_percentage=1h"
        
        guard let url = URL(string : urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG : Response code \(response.statusCode)")
            }
            
            guard let data = data else { return }
         
            
            do {
                let coins = try JSONDecoder().decode([Coin].self,from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("DEBUG: Error decode fail \(error)")

            }
        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
