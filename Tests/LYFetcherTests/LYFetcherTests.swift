//
//  LYFetcherTests.swift
//  LYFetcherTests
//
//  Created by 張居正 on 2024/10/5.
//

import XCTest
@testable import LYFetcher

final class LYFetcherTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testFetchNewestSpeech() async throws {
        print(await FetchNewestSpeech())
    }

    func testFetchAllLegislatorInfo() async throws {
        print(await FetchAllLegislatorInfo())
    }
    
    func testFetchFullVideoInfo() async throws {
        print(await FetchNewestMeeting())
    }
    
    func testAllMeetingTypeName() async throws {
        // 列出近半年有幾種影片類型
        let url = URL(string: "https://data.ly.gov.tw/odw/ID148Action.action?term=&sessionPeriod=&meetingDateS=113/02/01&meetingDateE=113/10/31&meetingTime=&legislatorName=&fileType=json")!
        let data = try! await FetchData(LegislatorSpeech.self, from: url).dataList
        print(Set(data.map { $0.meetingTypeName }))
        // result: ["社會福利及衛生環境委員會", "院會", "全院委員會", "教育及文化委員會", "交通委員會", "經濟委員會", "財政委員會", "內政委員會", "司法及法制委員會", "外交及國防委員會", "程序委員會"]
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
