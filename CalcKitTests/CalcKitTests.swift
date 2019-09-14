import XCTest

class CalcKitTests: XCTestCase {
    ///
    private let calc = Calculator()

    /**
     Product equals '0', when input is empty.
     */ 
    func testEmptyStringIsZero() {
        XCTAssertEqual(try calc.multiply(""), 0)
    }

    /**
     Product equals '1', when input is '1'.
     */ 
    func testOneIsOne() {
        XCTAssertEqual(try calc.multiply("1"), 1)
    }

    /**
     Product equals '6', when input is '2,3'.
     */ 
    func testTwoTimesThreeIsSix() {
        XCTAssertEqual(try calc.multiply("2,3"), 6)
    }

    /**
     Product is sane, when input has more than 2 factors.
     */ 
    func testUsingManyFactors() {
        XCTAssertEqual(try calc.multiply("2,3,2,3"), 36)
    }

    /**
     Exception is thrown, when input is invalid.
     */ 
    func testInvalidInput() {
        XCTAssertThrowsError(try calc.multiply("1,A"))
    }

    /**
     Product equals '0.125', when input repeatedly fractionalized.
     */ 
    func testDecimal() {
        XCTAssertEqual(try calc.multiply("2,0.25,0.25"), 0.125)
    }

    /**
     Quotient equals '2', when input is '6,3'.
     */ 
    func testDivisionOfInput() {
        XCTAssertEqual(try calc.divide("6,3"), 2)
    }

    /**
     Exception is thrown, when input is invalid.
     */ 
    func testDivideByZero() {
        XCTAssertThrowsError(try calc.divide("6,0"))
    }

    /**
     Sum equals '2', when input is '1,1'.
     */ 
    func testAdditionOfInput() {
        XCTAssertEqual(try calc.add("1,1"), 2)
    }

    /**
     Difference equals '2', when input is '3,1'.
     */ 
    func testSubtractionOfInput() {
        XCTAssertEqual(try calc.subtract("3,1"), 2)
    }
}
