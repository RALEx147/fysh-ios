//
//  MapboxUIExtension.swift
//  
//
//  Created by Robert Alexander on 10/11/20.
//

import Mapbox

extension ViewController: MGLMapViewDelegate {
	
	func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let urls = Bundle.main.urls(forResourcesWithExtension: "geojson", subdirectory: "ReachGeoJSONs")
        
        for i in urls! {
            let source = MGLShapeSource(identifier: "reaches", url: i, options: nil)
            style.addSource(source)
            
            let layer = MGLFillStyleLayer(identifier: "Reaches", source: source)
            layer.fillColor = NSExpression(forConstantValue: UIColor(red: 0.91, green: 0.46, blue: 0.12, alpha: 1.00))
            layer.fillOpacity = NSExpression(forConstantValue: 0.3)
            style.insertLayer(layer, below: style.layer(withIdentifier: "com.mapbox.annotations.points")!)
        }
	}

	func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
		return true
	}
	
	
}
