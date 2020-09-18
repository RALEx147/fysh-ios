// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "734abae50bd52c0b75634c1c31451106"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Record.self)
  }
}