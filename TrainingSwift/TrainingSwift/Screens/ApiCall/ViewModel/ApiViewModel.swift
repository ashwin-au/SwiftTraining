//
//  ApiViewModel.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 25/04/23.
//

import Foundation

@MainActor
class ApiViewModel: ObservableObject {
    @Published var result = [Results]()
    @Published var model: PokemonModel?

    func fetchPokemon() {
        let urlString = "https://pokeapi.co/api/v2/pokemon"
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, _ in
            if let dataResponse = data {
                self.model = try? JSONDecoder().decode(PokemonModel.self, from: dataResponse)
                self.result = self.model?.results ?? []
            }
        }).resume()
    }
}
