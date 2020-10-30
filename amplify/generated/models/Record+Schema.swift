// swiftlint:disable all
import Amplify
import Foundation

extension Record {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case temp
    case latitude
    case longitude
    case time
    case stream
    case reach
    case date
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let record = Record.keys
    
    model.pluralName = "Records"
    
    model.fields(
      .id(),
      .field(record.temp, is: .required, ofType: .string),
      .field(record.latitude, is: .optional, ofType: .string),
      .field(record.longitude, is: .optional, ofType: .string),
      .field(record.time, is: .optional, ofType: .string),
      .field(record.stream, is: .optional, ofType: .string),
      .field(record.reach, is: .optional, ofType: .string),
      .field(record.date, is: .optional, ofType: .dateTime)
    )
    }
}