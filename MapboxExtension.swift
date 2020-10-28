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
		layer.fillColor = NSExpression(forConstantValue: UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00))
		layer.fillOpacity = NSExpression(forConstantValue: 0.2)
		style.addLayer(layer)
	}

	func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
		return true
	}
	
	
}
