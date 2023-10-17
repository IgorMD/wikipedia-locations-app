import Foundation

extension URLRequest {
    func withMethod(_ method: HTTPMethod) -> URLRequest {
        var request = self
        request.httpMethod = method.rawValue

        return request
    }
}
