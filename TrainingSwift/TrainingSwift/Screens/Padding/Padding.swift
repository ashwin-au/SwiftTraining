//
//  Padding.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 24/04/23.
//

import SwiftUI

struct Padding: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(0 ..< 10, id: \.self) { _ in
                    Text("someView")
                        .padding()
                        .foregroundColor(.white)
                        .font(.title)
                        .background(Color.red)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            .background(Color.clear)
        }.background(Image("75"))
    }
}

struct Padding_Previews: PreviewProvider {
    static var previews: some View {
        Padding()
    }
}
