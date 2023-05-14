import XCTest
@testable import BloodbathSwift

final class BloodbathSwiftTests: XCTestCase {
    var bloodbath: Bloodbath!

    override func setUp() {
        super.setUp()
        bloodbath = BloodbathSwift.shared
        bloodbath.config.apiKey = "test-api-key"
    }

    override func tearDown() {
        bloodbath = nil
        super.tearDown()
    }

    func testScheduleEvent() {
        let expectation = self.expectation(description: "Schedule Event")
        let event = Event(args: ["key": "value"])
        bloodbath.event().schedule(event: event) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFindEvent() {
        let expectation = self.expectation(description: "Find Event")
        bloodbath.event().find(id: "test-event-id") { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testListEvents() {
        let expectation = self.expectation(description: "List Events")
        bloodbath.event().list() { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testCancelEvent() {
        let expectation = self.expectation(description: "Cancel Event")
        bloodbath.event().cancel(id: "test-event-id") { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTFail("Error: \(error)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
