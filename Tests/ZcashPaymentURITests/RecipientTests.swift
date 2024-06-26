//
//  RecipientTests.swift
//  
//
//  Created by Francisco Gindre on 2023-11-07.
//

import XCTest
@testable import ZcashPaymentURI
final class RecipientTests: XCTestCase {
    func testRecipientInitNilWhenValidationFails() {
        XCTAssertNil(RecipientAddress(value: "asdf", validating: { _ in false }))
    }

    func testRecipientInitNotNilWhenValidationFails() {
        let expected = "asdf"
        let recipient = RecipientAddress(value: expected, validating: { _ in true })

        XCTAssertNotNil(recipient)
        XCTAssertEqual(recipient?.value, "asdf")
    }

    func testRecipientInitNotNilWhenNoValidationProvided() {
        let expected = "asdf"
        let recipient = RecipientAddress(value: expected)

        XCTAssertNotNil(recipient)
        XCTAssertEqual(recipient?.value, "asdf")
    }
}
