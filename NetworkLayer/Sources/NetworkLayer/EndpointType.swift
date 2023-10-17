import Foundation

public protocol EndpointType {
    var host: String { get }
    var pathComponents: [String] { get }
    var httpMethod: HTTPMethod { get }
    var queries: [String: String] { get }
}

extension EndpointType {
    public var urlRequest: URLRequest? {
        return URL(string: host)?
            .withPathComponents(pathComponents)
            .withQueries(queries)?
            .toURLRequest
            .withMethod(httpMethod)
    }
}
