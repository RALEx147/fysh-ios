// swiftlint:disable all
import Amplify
import Foundation

public struct Record: Model, CustomStringConvertible {
	public let id: String
	public var temp: String
	public var latitude: String?
	public var longitude: String?
	public var time: String?
	
	public init(id: String = UUID().uuidString, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil) {
		self.id = id
		self.temp = temp
		self.latitude = latitude
		self.longitude = longitude
		self.time = time
	}
	
	public var description: String { return "Record- id: \(id), temp: \(temp), latitude: \(String(describing: latitude)), longitude: \(String(describing: longitude)), time: \(String(describing: time))" }
}
