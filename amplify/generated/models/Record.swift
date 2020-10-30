// swiftlint:disable all
import Amplify
import Foundation

public struct Record: Model {
  public let id: String
  public var temp: String
  public var latitude: String?
  public var longitude: String?
  public var time: String?
  public var stream: String?
  public var reach: String?
  public var date: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      temp: String,
      latitude: String? = nil,
      longitude: String? = nil,
      time: String? = nil,
      stream: String? = nil,
      reach: String? = nil,
      date: Temporal.DateTime? = nil) {
      self.id = id
      self.temp = temp
      self.latitude = latitude
      self.longitude = longitude
      self.time = time
      self.stream = stream
      self.reach = reach
      self.date = date
  }
}