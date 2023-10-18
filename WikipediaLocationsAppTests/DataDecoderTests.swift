//
//  DataDecoderTests.swift
//  WikipediaLocationsAppTests
//
//  Created by Igor Atamanciuc on 18/10/2023.
//

import XCTest
@testable import WikipediaLocationsApp

struct TestType: Decodable, Equatable {
    let data: String
    let count: Int
}

final class DataDecoderTests: XCTestCase {
    func test_givenValidData_whenDecoding_thenCorrectTypeShouldBeReturned() {
        let validData = """
                            {
                                "data": "some value",
                                "count": 1
                            }
                            """.data(using: .utf8)
        
        let testType: Result<TestType, ApiError> = DataDecoder.decode(for: .success(validData!))
        
        let expectedType = Result<TestType, ApiError>.success(TestType(data: "some value", count: 1))
        XCTAssertEqual(expectedType, testType)
    }
    
    func test_givenInvalidData_whenDecoding_thenDecodingErrorShouldBeReturned() {
        let invalidData = """
                                "data" = "some value",
                                "count" =  1
                            }
                            """.data(using: .utf8)
        
        let testType: Result<TestType, ApiError> = DataDecoder.decode(for: .success(invalidData!))
        
        let expectedType = Result<TestType, ApiError>.failure(.decodingError)
        XCTAssertEqual(expectedType, testType)
    }
    
    func test_givenFailureResult_whenDecoding_thenSomethingWentWrongShouldBeReturned() {
        let testType: Result<TestType, ApiError> = DataDecoder.decode(for: .failure(.noDataError))
        
        let expectedType = Result<TestType, ApiError>.failure(.somethingWhenWrong)
        XCTAssertEqual(expectedType, testType)
    }
}
