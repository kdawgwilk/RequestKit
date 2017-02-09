import XCTest
@testable import RequestKitTests

XCTMain([
     testCase(ConfigurationTests.allTests),
     testCase(JSONPostRouterTests.allTests),
     testCase(RouterTests.allTests),
])
