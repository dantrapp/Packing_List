//
//  MapView.swift
//  Packing List
//
//  Created by Will Hustle on 1/6/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //add class Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        //initialize the MapView as parent
        init(_ parent: MapView) {
            self.parent = parent
        }
        //get coordinates
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        //modify the annotation
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) ->
        MKMapView {
            let mapView = MKMapView()
            //add mapView delegate
            mapView.delegate = context.coordinator
            
            //add annotation for cuty
            let annotation = MKPointAnnotation()
            annotation.title = "London"
            annotation.subtitle = "Capital Of England"
            annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
            mapView.addAnnotation(annotation) //drop the pin on London
            
            return mapView
    }
    
    func updateUIView(_ view: MKMapView,
                      context: Context) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
