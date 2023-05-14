import Foundation

public class Configuration {
    public var apiKey: String?
    public var apiBase: String
    public var verbose: Bool

    public init(apiKey: String? = nil,
                apiBase: String = "https://api.bloodbath.io/rest",
                verbose: Bool = false) {
        self.apiKey = apiKey
        self.apiBase = apiBase
        self.verbose = verbose
    }
}
