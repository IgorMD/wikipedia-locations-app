import Foundation

public protocol NetworkType {
    func request(with endpoint: EndpointType) async -> Result<Data, NetworkError>
}

public final class Network: NetworkType {
    public func request(with endpoint: EndpointType) async -> Result<Data, NetworkError> {
        guard let request = endpoint.urlRequest else {
            return .failure(.badRequest)
        }
        
        do {
            let (data, response) = try await urlSession.perform(with: request)
            if let response = response as? HTTPURLResponse,
               !response.statusCode.isSuccessStatusCode {
                let errorMessage = String(data: data, encoding: .utf8)
                return .failure(.apiError(message: errorMessage, code: response.statusCode))
            }
            return .success(data)
        } catch {
            return .failure(.unknown)
        }
       
    }
    
    private let urlSession: URLSessionType

    public init(session: URLSessionType = URLSession.shared) {
        urlSession = session
    }
}
