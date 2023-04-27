//
//  PokemonDetailView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 27/04/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ApiViewModel
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(viewModel.abilities.enumerated()), id: \.offset) { _, item in
                    Text(item.ability?.name ?? "")
                }
            }
        }.task {
            await viewModel.getPokemonDetail()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}
