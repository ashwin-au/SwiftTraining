//
//  Halfsheet.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 03/05/23.
//

import SwiftUI

struct HalfSheet: View {
    @State var showSheet = false
    @State var showAlert = false
    var description = "This is a custom Alert created for study purpose. scfds dsf ewd wefwf reer fwe scfds dsf ewd wefwf reer fwe scfds dsf ewd wefwf reer fwe scfds dsf ewd wefwf reer fwe"
    var body: some View {
        VStack {
            PrimaryButton(title: "show bottom sheet") {
                self.showSheet = true
            }
            PrimaryButton(title: "show Alert") {
                self.showAlert = true
            }
            
            if showAlert {
                CustomAlertView(title: "Custom Alert!", description: description, showAlert: $showAlert)
            }
        }
        .sheet(isPresented: $showSheet) {
            BottomSheetView()
                .presentationDetents([.fraction(0.75)])
                .presentationDragIndicator(.visible)
                
        }
        
    }
}

struct Halfsheet_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheet()
    }
}

struct BottomSheetView: View {
    var body: some View {
        VStack {
            Text("Bottom sheet")
        }
    }
}
