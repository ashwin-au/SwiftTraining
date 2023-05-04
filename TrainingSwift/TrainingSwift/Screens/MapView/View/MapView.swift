//
//  MapView.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 04/05/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: viewModel.location, annotationContent: { city in
                MapAnnotation(coordinate: city.coordinate, content: {
                    AnnotationView(data: city)
                })

            })
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct AnnotationView: View {
    let data: MapModel
    @State var isToolTipVisible = false
    var body: some View {
        VStack {
            CardView(backgroundColor: .clear, cornerRadius: 10, padding: 12, stroke: .clear) {
                cityDetail
            }.background(.ultraThinMaterial.opacity(0.8))
                .cornerRadius(10)
                .opacity(isToolTipVisible == true ? 1 : 0)

            mapMarker
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        self.isToolTipVisible.toggle()
                    }
                }
        }
    }

    @ViewBuilder
    var cityDetail: some View {
        VStack(alignment: .leading) {
            Text("City: \(data.city)")
            Text("Latitude: \(data.latitude)")
            Text("Longitude: \(data.longitude)")
        }
    }

    @ViewBuilder
    var mapMarker: some View {
        VStack {
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -4)
        }
    }
}
