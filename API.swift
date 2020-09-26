//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil) {
    graphQLMap = ["id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var temp: String {
    get {
      return graphQLMap["temp"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "temp")
    }
  }

  public var latitude: String? {
    get {
      return graphQLMap["latitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: String? {
    get {
      return graphQLMap["longitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var time: String? {
    get {
      return graphQLMap["time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }
}

public struct ModelRecordConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(temp: ModelStringInput? = nil, latitude: ModelStringInput? = nil, longitude: ModelStringInput? = nil, time: ModelStringInput? = nil, and: [ModelRecordConditionInput?]? = nil, or: [ModelRecordConditionInput?]? = nil, not: ModelRecordConditionInput? = nil) {
    graphQLMap = ["temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "and": and, "or": or, "not": not]
  }

  public var temp: ModelStringInput? {
    get {
      return graphQLMap["temp"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "temp")
    }
  }

  public var latitude: ModelStringInput? {
    get {
      return graphQLMap["latitude"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: ModelStringInput? {
    get {
      return graphQLMap["longitude"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var time: ModelStringInput? {
    get {
      return graphQLMap["time"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }

  public var and: [ModelRecordConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRecordConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRecordConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRecordConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRecordConditionInput? {
    get {
      return graphQLMap["not"] as! ModelRecordConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct UpdateRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, temp: String? = nil, latitude: String? = nil, longitude: String? = nil, time: String? = nil) {
    graphQLMap = ["id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var temp: String? {
    get {
      return graphQLMap["temp"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "temp")
    }
  }

  public var latitude: String? {
    get {
      return graphQLMap["latitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: String? {
    get {
      return graphQLMap["longitude"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var time: String? {
    get {
      return graphQLMap["time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }
}

public struct DeleteRecordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelRecordFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, temp: ModelStringInput? = nil, latitude: ModelStringInput? = nil, longitude: ModelStringInput? = nil, time: ModelStringInput? = nil, and: [ModelRecordFilterInput?]? = nil, or: [ModelRecordFilterInput?]? = nil, not: ModelRecordFilterInput? = nil) {
    graphQLMap = ["id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var temp: ModelStringInput? {
    get {
      return graphQLMap["temp"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "temp")
    }
  }

  public var latitude: ModelStringInput? {
    get {
      return graphQLMap["latitude"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var longitude: ModelStringInput? {
    get {
      return graphQLMap["longitude"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var time: ModelStringInput? {
    get {
      return graphQLMap["time"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }

  public var and: [ModelRecordFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRecordFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRecordFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRecordFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRecordFilterInput? {
    get {
      return graphQLMap["not"] as! ModelRecordFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public final class CreateRecordMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateRecord($input: CreateRecordInput!, $condition: ModelRecordConditionInput) {\n  createRecord(input: $input, condition: $condition) {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public var input: CreateRecordInput
  public var condition: ModelRecordConditionInput?

  public init(input: CreateRecordInput, condition: ModelRecordConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createRecord", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createRecord: CreateRecord? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createRecord": createRecord.flatMap { $0.snapshot }])
    }

    public var createRecord: CreateRecord? {
      get {
        return (snapshot["createRecord"] as? Snapshot).flatMap { CreateRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createRecord")
      }
    }

    public struct CreateRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class UpdateRecordMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateRecord($input: UpdateRecordInput!, $condition: ModelRecordConditionInput) {\n  updateRecord(input: $input, condition: $condition) {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public var input: UpdateRecordInput
  public var condition: ModelRecordConditionInput?

  public init(input: UpdateRecordInput, condition: ModelRecordConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateRecord", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateRecord: UpdateRecord? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateRecord": updateRecord.flatMap { $0.snapshot }])
    }

    public var updateRecord: UpdateRecord? {
      get {
        return (snapshot["updateRecord"] as? Snapshot).flatMap { UpdateRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateRecord")
      }
    }

    public struct UpdateRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class DeleteRecordMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteRecord($input: DeleteRecordInput!, $condition: ModelRecordConditionInput) {\n  deleteRecord(input: $input, condition: $condition) {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public var input: DeleteRecordInput
  public var condition: ModelRecordConditionInput?

  public init(input: DeleteRecordInput, condition: ModelRecordConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteRecord", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteRecord: DeleteRecord? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteRecord": deleteRecord.flatMap { $0.snapshot }])
    }

    public var deleteRecord: DeleteRecord? {
      get {
        return (snapshot["deleteRecord"] as? Snapshot).flatMap { DeleteRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteRecord")
      }
    }

    public struct DeleteRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class GetRecordQuery: GraphQLQuery {
  public static let operationString =
    "query GetRecord($id: ID!) {\n  getRecord(id: $id) {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getRecord", arguments: ["id": GraphQLVariable("id")], type: .object(GetRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getRecord: GetRecord? = nil) {
      self.init(snapshot: ["__typename": "Query", "getRecord": getRecord.flatMap { $0.snapshot }])
    }

    public var getRecord: GetRecord? {
      get {
        return (snapshot["getRecord"] as? Snapshot).flatMap { GetRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getRecord")
      }
    }

    public struct GetRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ListRecordsQuery: GraphQLQuery {
  public static let operationString =
    "query ListRecords($filter: ModelRecordFilterInput, $limit: Int, $nextToken: String) {\n  listRecords(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      temp\n      latitude\n      longitude\n      time\n      createdAt\n      updatedAt\n    }\n    nextToken\n  }\n}"

  public var filter: ModelRecordFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelRecordFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listRecords", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listRecords: ListRecord? = nil) {
      self.init(snapshot: ["__typename": "Query", "listRecords": listRecords.flatMap { $0.snapshot }])
    }

    public var listRecords: ListRecord? {
      get {
        return (snapshot["listRecords"] as? Snapshot).flatMap { ListRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listRecords")
      }
    }

    public struct ListRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRecordConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRecordConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Record"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("temp", type: .nonNull(.scalar(String.self))),
          GraphQLField("latitude", type: .scalar(String.self)),
          GraphQLField("longitude", type: .scalar(String.self)),
          GraphQLField("time", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
          self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var temp: String {
          get {
            return snapshot["temp"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "temp")
          }
        }

        public var latitude: String? {
          get {
            return snapshot["latitude"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "latitude")
          }
        }

        public var longitude: String? {
          get {
            return snapshot["longitude"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "longitude")
          }
        }

        public var time: String? {
          get {
            return snapshot["time"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "time")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class OnCreateRecordSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateRecord {\n  onCreateRecord {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateRecord", type: .object(OnCreateRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateRecord: OnCreateRecord? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateRecord": onCreateRecord.flatMap { $0.snapshot }])
    }

    public var onCreateRecord: OnCreateRecord? {
      get {
        return (snapshot["onCreateRecord"] as? Snapshot).flatMap { OnCreateRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateRecord")
      }
    }

    public struct OnCreateRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnUpdateRecordSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateRecord {\n  onUpdateRecord {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateRecord", type: .object(OnUpdateRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateRecord: OnUpdateRecord? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateRecord": onUpdateRecord.flatMap { $0.snapshot }])
    }

    public var onUpdateRecord: OnUpdateRecord? {
      get {
        return (snapshot["onUpdateRecord"] as? Snapshot).flatMap { OnUpdateRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateRecord")
      }
    }

    public struct OnUpdateRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class OnDeleteRecordSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteRecord {\n  onDeleteRecord {\n    __typename\n    id\n    temp\n    latitude\n    longitude\n    time\n    createdAt\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteRecord", type: .object(OnDeleteRecord.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteRecord: OnDeleteRecord? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteRecord": onDeleteRecord.flatMap { $0.snapshot }])
    }

    public var onDeleteRecord: OnDeleteRecord? {
      get {
        return (snapshot["onDeleteRecord"] as? Snapshot).flatMap { OnDeleteRecord(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteRecord")
      }
    }

    public struct OnDeleteRecord: GraphQLSelectionSet {
      public static let possibleTypes = ["Record"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("temp", type: .nonNull(.scalar(String.self))),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, temp: String, latitude: String? = nil, longitude: String? = nil, time: String? = nil, createdAt: String, updatedAt: String) {
        self.init(snapshot: ["__typename": "Record", "id": id, "temp": temp, "latitude": latitude, "longitude": longitude, "time": time, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var temp: String {
        get {
          return snapshot["temp"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "temp")
        }
      }

      public var latitude: String? {
        get {
          return snapshot["latitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return snapshot["longitude"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "longitude")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}