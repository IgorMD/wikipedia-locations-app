import XCTest
@testable import NetworkLayer

private struct TestEndpoint: EndpointType {
    var host: String
    var pathComponents: [String]
    var httpMethod: HTTPMethod
    var queries: [String : String]
}

class NetworkLayerTests: XCTestCase {
    func test_badRequest_whenRequesting_shouldReturnBadRequestError() async {
        let endpoint = TestEndpoint(host: "",
                                  pathComponents: [],
                                  httpMethod: .post,
                                  queries: [:])
        let session = MockURLSession()
        session.networkError = NetworkError.badRequest
        let network = Network(session: session)
         let result = await network.request(with: endpoint)
        XCTAssertEqual(result, .failure(.badRequest))
    }

    func test_badResponse_whenRequestingData_shouldReturnBadStatusCode() async {
        let endpoint = TestEndpoint(
            host: "https://apple.com",
            pathComponents: [],
            httpMethod: .get,
            queries: [:]
        )
        let response = HTTPURLResponse(
            url: endpoint.urlRequest!.url!,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )

        let session = MockURLSession()
        session.responseStub = (Data(), response!)

        let networker = Network(session: session)
        let result = await networker.request(with: endpoint)

        XCTAssertEqual(result, .failure(.apiError(message: "", code: 404)))
    }

    func test_successResponse_whenRequestingData_shouldReturnCorrectData() async {
        let endpoint = TestEndpoint(
            host: "https://apple.com",
            pathComponents: [],
            httpMethod: .get,
            queries: [:]
        )
        let data =
        """
        {
          "data": {
            "id": 1,
            "status": 9999,
            "jobs": 999,
            "title": "99999",
          },
          "count": 100
        }
        """.data(using: .utf8)!

        let response = HTTPURLResponse(
            url: endpoint.urlRequest!.url!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let session = MockURLSession()

        session.responseStub = (data, response!)
        let networker = Network(session: session)
        
        let result = await networker.request(with: endpoint)
        XCTAssertEqual(result, .success(data))
    }


    func test_successResponse_whenDataIsMissing_shouldReturnNoDataError() async {
        let endpoint = TestEndpoint(
            host: "https://apple.com",
            pathComponents: [],
            httpMethod: .get,
            queries: [:]
        )

        let session = MockURLSession()
        let networker = Network(session: session)
        let result = await networker.request(with: endpoint)
        
        XCTAssertEqual(result, .failure(.unknown))
    }
}
