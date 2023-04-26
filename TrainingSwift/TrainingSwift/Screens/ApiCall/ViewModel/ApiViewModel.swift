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
    private let url = "https://pokeapi.co/api/v2/pokemon"

    func fetchPokemon(url: String) async -> (Result<Data, NetworkError>)  {
        guard let url = URL(string: url) else { return .failure(.badURL) }
        let urlRequest = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            return .success(data)
        } catch {
            print("Network error")
            return .failure(.networkError)
        }
    }
    
    func parseJson() async -> (Result<[Results], NetworkError>) {
        let urlResponse = await self.fetchPokemon(url: url)
        switch urlResponse {
        case .success(let data):
            self.model = try? JSONDecoder().decode(PokemonModel.self, from: data)
            return .success( self.model?.results ?? [])
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getPokemon() async {
        let response = await parseJson()
        switch response {
        case .success(let data):
            self.result = data
        case .failure(let error):
            print(error.rawValue)
        }
    }
        
}

//"https://pokeapi.co/api/v2/pokemon"

enum NetworkError: String, Error {
    case networkError = "Network Error"
    case badURL = "Check the url string"
    case other = "Something went wrong"
}
