//
//  MapboxUIExtension.swift
//  
//
//  Created by Robert Alexander on 10/11/20.
//

import Mapbox

extension ViewController: MGLMapViewDelegate {
	
	func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "map", ofType: "geojson")!)

        let source = MGLShapeSource(identifier: "reaches", url: url, options: nil)
        style.addSource(source)
        
        let layer = MGLFillStyleLayer(identifier: "Reaches", source: source)
        layer.fillColor = NSExpression(forKeyPath: "fill")
        layer.fillOpacity = NSExpression(forConstantValue: 0.5)
        style.insertLayer(layer, below: style.layer(withIdentifier: "com.mapbox.annotations.points")!)
        self.overlay = layer
        if !UserDefaults.standard.bool(forKey: "overlaytoggle") {
            self.overlay.isVisible = false
        }
	}

	func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
		return true
	}
	
	
}
