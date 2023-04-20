//
//  TabbarView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 20/04/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FormView()
                .tabItem({
                    Label("home", systemImage: "house")

                })

            Profile()
                .tabItem({
                    Label("Profile", systemImage: "person.circle")
                })
            
            Profile()
                .tabItem({
                    Label("Profile", systemImage: "person.circle")
                })
            
            Profile()
                .tabItem({
                    Label("Profile", systemImage: "person.circle")
                })
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct Profile: View {
    var body: some View {
        ZStack {
            Text("Profile")
        }
    }
}

