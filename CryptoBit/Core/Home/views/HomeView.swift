//
//  HomeVIew.swift
//  CryptoBit
//
//  Created by Murad Akhundov on 13.12.24.
//

//CG-rSq98rpJMzbeSHwxGqGc8co5
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
              //top movers view
                TopMoversView(viewModel: viewModel)
                
                Divider()
              //all coins view
                AllCoinsView(viewModel: viewModel)
            }
            .navigationTitle("CryptoBit")
        }
    }
}

#Preview {
    HomeView()
}
