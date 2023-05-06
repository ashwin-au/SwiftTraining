//
//  MatchedGeometry.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 06/05/23.
//

import SwiftUI

struct MatchedGeometry: View {
    @Namespace var namespace
    @State var showRectangle = true
    var body: some View {
        VStack {
            if showRectangle {
                RectangleView(namespace: namespace)
            } else {
                Spacer()
                CircleView(namespace: namespace)
                    
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6, blendDuration: 0.2)) {
                self.showRectangle.toggle()
            }
        }
    }
}

struct MatchedGeometry_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometry()
    }
}

struct RectangleView: View {
    var namespace: Namespace.ID
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 280, height: 300)
                    .matchedGeometryEffect(id: "Object", in: namespace)
                Image.paperPlane
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "icon", in: namespace)
            }
            Text("Rectangle")
                .font(.title.bold())
                .matchedGeometryEffect(id: "text", in: namespace)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CircleView: View {
    var namespace: Namespace.ID
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "Object", in: namespace)
                Image.trash
                    .font(.largeTitle)
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            Text("Rectangle")
                .font(.title.bold())
                .matchedGeometryEffect(id: "icon", in: namespace)
//            Spacer()
        }
    }
}
