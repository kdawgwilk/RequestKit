import XCTest
@testable import RequestKit

class ConfigurationTests: XCTestCase {
    static var allTests : [(String, (ConfigurationTests) -> () throws -> Void)] {
        return [
            ("testDefaultImplementation", testDefaultImplementation),
            ("testCustomImplementation", testCustomImplementation),
        ]
    }

    func testDefaultImplementation() throws {
        let config = TestConfiguration("1234", url: "https://github.com")
        XCTAssertEqual(config.apiEndpoint, "https://github.com")
        XCTAssertEqual(config.accessToken, "1234")
        XCTAssertEqual(config.accessTokenFieldName, "access_token")
    }

    func testCustomImplementation() {
        let config = TestCustomConfiguration("1234", url: "https://github.com")
        XCTAssertEqual(config.apiEndpoint, "https://github.com")
        XCTAssertEqual(config.accessToken, "1234")
        XCTAssertEqual(config.accessTokenFieldName, "custom_field")
    }
}

class TestConfiguration: Configuration {

    var apiEndpoint: String
    var accessToken: String?

    init(_ token: String, url: String) {
        apiEndpoint = url
        accessToken = token
    }
}

class TestCustomConfiguration: Configuration {

    var apiEndpoint: String
    var accessToken: String?

    init(_ token: String, url: String) {
        apiEndpoint = url
        accessToken = token
    }

    var accessTokenFieldName: String {
        return "custom_field"
    }
}
