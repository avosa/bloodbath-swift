# BloodbathSwift

The [BloodbathSwift](https://github.com/avosa/bloodbath-swift) library provides convenient access to the Bloodbath API from applications written in the Swift language. This library will eventually be moved [here](https://github.com/bloodbath-io).

## Installation

You can install BloodbathSwift as a dependency in your Swift project using Swift Package Manager. Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/avosa/bloodbath-swift.git", from: "1.0.0")
]
```

After updating your dependencies, run `swift build` to download and compile the dependencies.

## Usage

Once you have added BloodbathSwift to your dependencies, you can use it in your application as follows:

```swift
import BloodbathSwift
import Foundation

func scheduleEvent() {
    let event = BloodbathSwift.shared.event()
    let eventData: [String: Any] = [
        "scheduled_for": Date().addingTimeInterval(60),
        "headers": [:],
        "method": "post",
        "body": "some body content",
        "endpoint": "https://api.acme.com/path"
    ]

    event.schedule(args: eventData) { result in
        switch result {
        case .success(let data):
            print("Scheduled event: \(data)")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

func listEvents() {
    let event = BloodbathSwift.shared.event()
    event.list { result in
        switch result {
        case .success(let data):
            print("List of events: \(data)")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

func findEvent(id: String) {
    let event = BloodbathSwift.shared.event()
    event.find(id: id) { result in
        switch result {
        case .success(let data):
            print("Found event with ID \(id): \(data)")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

func cancelEvent(id: String) {
    let event = BloodbathSwift.shared.event()
    event.cancel(id: id) { result in
        switch result {
        case .success(let data):
            print("Cancelled event with ID \(id): \(data)")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

// Usage
BloodbathSwift.shared.config.apiKey = "my-api-key"

scheduleEvent()
listEvents()
findEvent(id: "event_id")
cancelEvent(id: "event_id")
```

Make sure to replace `"event_id"` with the actual ID of an event you want to find or cancel.

# Conclusion

BloodbathSwift is a powerful library that simplifies event scheduling and management. This README should have given you an idea of how to use it in your Swift applications. For more information, see the [official documentation](https://docs.bloodbath.io/).
