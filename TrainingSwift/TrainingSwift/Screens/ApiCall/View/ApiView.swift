//
//  ApiView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 25/04/23.
//

import SwiftUI

struct ApiView: View {
    @StateObject var viewModel = ApiViewModel()
    var body: some View {
        List(viewModel.result, id: \.self) {
            Text($0.name ?? "")
        }.task {
            await viewModel.getPokemon()
        }
    }
}

struct ApiView_Previews: PreviewProvider {
    static var previews: some View {
        ApiView()
    }
}
