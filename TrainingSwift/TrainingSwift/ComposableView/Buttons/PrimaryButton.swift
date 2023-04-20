//
//  PrimaryButton.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 20/04/23.
//

import SwiftUI

struct PrimaryButton: View {
    init(title: String, type: ButtonType = .fill, isInfinity: Bool = true, onTap: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.isInfinity = isInfinity
        self.onTap = onTap
    }

    var title: String
    var type: ButtonType = .fill
    var isInfinity: Bool = true
    var onTap: () -> Void
    var foregroundColor: Color {
        return type == .fill ? .white : .blue
    }

    var backgroundColor: Color {
        return type == .fill ? .blue : .clear
    }

    var body: some View {
        HStack {
            Button(action: { onTap() }, label: {
                Text(title)
                    .if(isInfinity) {
                        $0.frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(12)
                    .foregroundColor(foregroundColor)
                    .background(backgroundColor)
                    .cornerRadius(8.0)
                    .padding(.horizontal, 20)

            })
        }
    }

    enum ButtonType {
        case link
        case fill
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Title", onTap: { })
    }
}
