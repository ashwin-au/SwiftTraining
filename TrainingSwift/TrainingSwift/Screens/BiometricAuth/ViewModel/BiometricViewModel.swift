//
//  BiometricViewModel.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 02/05/23.
//

import Foundation
import LocalAuthentication

class BiometricViewModel: ObservableObject {
    @Published var isBiometricSuccess = false

    func VerifyBiometrics() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Need biometric to validate user"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply:  { [weak self] biometricSuccess, error in
                
                DispatchQueue.main.async {
                    if biometricSuccess {
                        self?.isBiometricSuccess = true
                    } else {
                        print((error?.localizedDescription ?? "") + " Biometric Failed!")
                    }
                }
            })
            
        } else {
            print("Biometrics not found")
        }
    }
}
