//
//  CustomAlertView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 03/05/23.
//

import SwiftUI

struct CustomAlertView: View {
    var title: String
    var description: String
    @Binding var showAlert: Bool
    var layoutType: DisplayLayout = .horizontal
    var layout : AnyLayout {
        return layoutType == .horizontal ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
    }
    var body: some View {
        ZStack {
            CardView(foregroundColor: .white, backgroundColor: .secondaryBgColor, padding: 16, stroke: .clear, content: {
                VStack(spacing: 8) {
                    alertHeader
                    descriptionView
                    ButtonStack
                }.frame(maxWidth: .infinity)
            }).cornerRadius(8)
                .padding(.horizontal, 20)
        }
    }

    @ViewBuilder var alertHeader: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.title3.bold())
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showAlert = false
                }
            }, label: {
                Image(systemName: "multiply.circle.fill")
            }).foregroundColor(.red)
        }
    }

    @ViewBuilder var descriptionView: some View {
        Text(description)
            .font(.callout)
            .foregroundColor(.secondaryTextColor)
    }

    @ViewBuilder var ButtonStack: some View {
        layout {
            PrimaryButton(title: "Continue") {
                
            }
            PrimaryButton(title: "Cancel") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showAlert = false
                }
               
            }
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(title: "Custom Alert!", description: "This is a custom Alert created for study purpose. scfds dsf ewd wefwf reer fwe scfds dsf ewd wefwf reer fwe scfds dsf ewd wefwf reer fwe scfds dsf ewd wefwf reer fwe", showAlert: .constant(true), layoutType: .vertical)
    }
}

enum DisplayLayout {
    case horizontal
    case vertical
}
