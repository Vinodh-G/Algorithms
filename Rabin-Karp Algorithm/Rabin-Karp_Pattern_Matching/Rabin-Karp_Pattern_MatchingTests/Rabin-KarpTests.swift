//
//  Rabin-KarpTests.swift
//  Rabin-Karp_Pattern_MatchingTests
//
//  Created by Vinodh Govindaswamy on 29/11/19.
//  Copyright © 2019 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import Rabin_Karp_Pattern_Matching

class Rabin_KarpTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMatchingPatternIndexsVerifySpuriousHits() {
        let string = "ccaccaaedba"
        let pattern = "dba"
        let indexs = string.matchingPatternIndexs(for: pattern)
        XCTAssertEqual(indexs, 8)
    }

    func testMatchingPatternIndexsVerify$index() {
        let string = "ccaccaewqe$aedba"
        let pattern = "$ae"
        let indexs = string.matchingPatternIndexs(for: pattern)
        XCTAssertEqual(indexs, 10)
    }

    func testMatchingPatternIndexsVerifyUnicodeChar() {
        let string = "ccaccaewqŚedba"
        let pattern = "ebd"
        let indexs = string.matchingPatternIndexs(for: pattern)
        XCTAssertEqual(indexs, nil)
    }

}
