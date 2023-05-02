//
//  BiometricAuthView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 02/05/23.
//

import SwiftUI

struct BiometricAuthView: View {
    @StateObject var viewModel = BiometricViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                PrimaryButton(title: "Login with biometrics") {
                    viewModel.VerifyBiometrics()
                }

            }.navigationTitle("Biometric Auth")
                .navigationDestination(isPresented: $viewModel.isBiometricSuccess, destination: {
                    BiometricSuccessView()
                })
        }
    }
}

struct BiometricAuthView_Previews: PreviewProvider {
    static var previews: some View {
        BiometricAuthView()
    }
}

struct BiometricSuccessView: View {
    var body: some View {
        VStack {
            Text("Biometric Success!!")
        }
    }
}
