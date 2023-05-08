//
//  LottieAnimationExample.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 08/05/23.
//

import SwiftUI

struct LottieAnimationExample: View {
    @State var isPaused: Bool = false
    var body: some View {
        VStack {
            LottieView(filename: "rocket.json", isPaused: isPaused)
                .frame(width: 300, height: 300)
            Spacer()
            
            PrimaryButton(title: "play Lottie") {
                self.isPaused.toggle()
            }
        }
    }
}

struct LottieAnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        LottieAnimationExample()
    }
}
