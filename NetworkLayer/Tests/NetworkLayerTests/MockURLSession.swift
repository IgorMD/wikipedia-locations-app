@testable import NetworkLayer
import Foundation

final class MockURLSession: URLSessionType {
    func perform(with request: URLRequest) async throws -> (Data, URLResponse) {
        if responseStub == nil, networkError == nil {
            throw NSError(domain: "Error", code: 400)
        }
        if let networkError = networkError {
            throw networkError
        }
        
        return responseStub!
    }
    
    var responseStub: (Data, URLResponse)?
    var networkError: NetworkError?
}

