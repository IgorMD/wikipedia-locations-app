import Foundation

public protocol URLSessionType {
    func perform(with request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionType {
    public func perform(with request: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await data(for: request)
        return (data, response)
    }
}
