//
//  CarazTests.swift
//  CarazTests
//
//  Created by HONORE Adeline on 23/03/2023.
//

import XCTest
@testable import Caraz

final class CarazTests: XCTestCase {

    // Given
    private var weather: WeatherService!
    private let cityID = 800
    
    private func initSUT(isFailed: Bool = false) {
        weather = WeatherService(network: NetworkFake(testCase: .weather, isFailed: isFailed))
    }
    
    override func tearDown() {
        super.setUp()
        weather = nil
    }
    
    func testWeatherShouldPostSuccess() {
        // Given
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataName() {
        // Given
        let nameReceived = "Paris"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().name, nameReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataTemperatureValue() {
        // Given
        let temperatureReceived = 282.7
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().main.temp, temperatureReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldPostSuccessOnDataIcon() {
        // Given
        let iconReceived = "01d"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().weather.first?.icon, iconReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testWeatherShouldReturnFailure() {
        // Given
        initSUT(isFailed: true)
        // When
        let expectation = XCTestExpectation(description: "Should return failure")
        // Then
        weather.getData(city: cityID) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
