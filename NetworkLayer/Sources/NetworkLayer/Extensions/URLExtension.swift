import Foundation

extension URL {
    var toURLRequest: URLRequest {
        return URLRequest(url: self)
    }

    func withPathComponents(_ pathComponents: [String]) -> URL {
        return pathComponents.reduce(self) { $0.appendingPathComponent($1) }
    }

    func withQueries(_ queries: [String: String]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }
        components.queryItems = queries.map { key, value in URLQueryItem(name: key, value: value) }

        return components.url
    }
}
