import Foundation

public class BloodbathSwift {
    public static let shared = BloodbathSwift()

    public var config = Configuration()

    private init() {}

    public func event() -> Event {
        return Event(config: config)
    }
}
