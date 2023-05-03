//
//  NavigationSheet.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 03/05/23.
//

import SwiftUI

struct NavigationSheet: View {
    @State var showSheet = false
    
    var body: some View {
        VStack {
            PrimaryButton(title: "open sheet") {
                self.showSheet = true
            }
        }
        .fullScreenCover(isPresented: $showSheet) {
            CustomSheet(close: $showSheet)
        }
//        .sheet(isPresented: $showSheet) {
//            CustomSheet()
//        }
    }
}

struct NavigationSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSheet()
    }
}

struct CustomSheet: View {
    @Binding var close: Bool
    var body: some View {
        VStack {
            Text("Custom Sheet")
            PrimaryButton(title: "close") {
              close = false
            }
        }
    }
}
