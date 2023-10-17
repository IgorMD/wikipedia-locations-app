import Foundation

public enum NetworkError: Error, Equatable {
    case badRequest
    case apiError(message: String?, code: Int)
    case noDataError
    case statusCode(Int)
    case unknown

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest, .badRequest):
            return true
        case (.noDataError, .noDataError):
            return true
        case (.apiError(let lhsMessage, let lhsCode), .apiError(let rhsMessage, let rhsCode)):
            return lhsMessage == rhsMessage && lhsCode == rhsCode
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }

}
