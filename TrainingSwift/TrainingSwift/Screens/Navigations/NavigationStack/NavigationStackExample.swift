//
//  NavigationStackExample.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 03/05/23.
//

import SwiftUI

struct NavigationStackExample: View {
    @State var navigateToNextView = false
    var body: some View {
        NavigationStack {
            VStack {
                PrimaryButton(title: "Navigate to second view") {
                    self.navigateToNextView = true
                }
            }
            .navigationDestination(isPresented: $navigateToNextView, destination: {
                SecondView()
            })
        }
    }
}

struct NavigationStackExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackExample()
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Text("SecondView")
            PrimaryButton(title: "close", isInfinity: false) {
              dismiss()
            }
        }
    }
}
