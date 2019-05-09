//: [Previous](@previous)
import UIKit
import XCTest

class Solution {
  static func numMovesStonesII(_ stones: [Int]) -> [Int] {
    //let stones = stones
    var sortedStones = stones.sorted()
    print("sorted is: \(sortedStones)")
    var response = [Int.max, Int.min]
    
    for (index, stone) in sortedStones.enumerated() {
      if (index + 1 >= sortedStones.count) {
        break;
      }
      var spacesBetween = sortedStones[index+1] - stone - 1
      if (spacesBetween < response[0]) {
        response[0] = sortedStones[index+1] - stone - 1
        print("Min = \(response[0])")
      }
      if (spacesBetween > response[1]) {
        response[1] = sortedStones[index+1] - stone - 1
        print("Max = \(response[1])")
      }
    }
    if response[0] == 0 && (response[1] == 1 || response[1] == 2) {
      response[0] = response[1]
    }
//    if response[1] > 2 {
//      response[0] = 2
//    }
    response[1] = Solution.getMax(sortedStones)
    print(Solution.getMax(sortedStones))
    return response
    
  }
  
  static func getMax(_ stones: [Int]) -> Int {
    let gapToLose = min(stones[1] - stones[0] - 1, stones[stones.count-1] - stones[stones.count-2]-1)
    var maximum = 0
    for (index, stone) in stones.enumerated() {
      if (index + 1 >= stones.count) {
        break;
      }
      maximum += stones[index+1] - stone - 1
    }
    return maximum - gapToLose
  }
  
}

// MARK: Test

class MyTests : XCTestCase {
  
  func testOneAndTwoStoneMoves() {
    // Given
    let array = [7,4,9]
    // When
    let answer = Solution.numMovesStonesII(array)
    
    // Then
    XCTAssertEqual([1,2], answer, "\(answer) was the answer and should have been [1,2]")
  }
  
  func testTwoAndTreeStoneMoves() {
    // Given
    let array = [6,5,4,3,10]
    // When
    let answer = Solution.numMovesStonesII(array)
    
    // Then
    XCTAssertEqual([2,3], answer, "\(answer) was the answer and should have been [2,3]")
  }
  
  func testZeroStoneMoves() {
    // Given
    let array = [100,101,104,102,103]
    // When
    let answer = Solution.numMovesStonesII(array)
    
    // Then
    XCTAssertEqual([0,0], answer, "\(answer) was the answer and should have been [0,0]")
  }
  
  func testOneStoneMoves() {
    // Given
    let array = [8,7,6,5,10]
    // When
    let answer = Solution.numMovesStonesII(array)
    
    // Then
    XCTAssertEqual([1,1], answer, "\(answer) was the answer and should have been [1,1]")
  }
  
  func testTwoStoneMoves() {
    // Given
    let array = [8,7,6,5,11]
    // When
    let answer = Solution.numMovesStonesII(array)
    
    // Then
    XCTAssertEqual([2,2], answer, "\(answer) was the answer and should have been [2,2]")
  }
  
  func testFourWithGoodSpacesStoneMoves() {
    // Given
    let array = [5,1,9,15]
    // When
    let answer = Solution.numMovesStonesII(array)
    
    // Then
    XCTAssertEqual([3,8], answer, "\(answer) was the answer and should have been [2,2]")
  }
  
  func testLongStoneMoves() {
    // Given
    let array = [872744873,407745415,920265824,78944478,811582493,159387457,73610667,679739704,934249520,484866256,806947986,515330462,635589397,454065412,623990088,702300851,680116257,956576624,627580519,862260761,535974224,610386154,147996010,995188988,697589181,774334991,975600945,349769864,439419437,759685564,468162177,245675630,618666885,534580630,600325762,986524516,161373519,515248771,925900095,557803426,201601082,982652719,295010345,293049701,338675863,649482376,24971924,518429551,298902749,525841475,207922745,786121605,278541349,171822421,3627955,941822192,327185070,282505850,375060226,263830781,375519322,394162353,159428107,698554237,386248496,401174973,713865493,151618885,43008984,135449254,903873357,926871727,700962,415801910,241575747,913603096,921875839,515695485,801132907,210025056,991525254,776633422,319846045,510206317,433255537,964734911,487539862,958994600,267736477,640426157,348772981,813284734,165097998,328011830,107586878,920355296,822257896,74535996,508877402,55905987,912504311,238858217,101604373,866717345,889976872,236460070,243264031,676579831,222034958,233732642,746488332,719718853,630787678,511639505,672351188,959300625,169663603,191716458,681437267,415179364,252436682,427793128,335408586,585450571,894449031]
    // When
    let answer = Solution.numMovesStonesII(array)

    // Then
    XCTAssertEqual([124,991560910], answer, "\(answer) was the answer and should have been [124,991560910]")
  }
  
}


class PlaygroundTestObserver : NSObject, XCTestObservation {
  func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
    print("Test failed on line \(lineNumber): \(testCase.name ), \(description)")
  }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)

struct TestRunner {
  
  func runTests(testClass:AnyClass) {
    print("Running test suite \(testClass)")
    
    let tests = testClass as! XCTestCase.Type
    let testSuite = tests.defaultTestSuite
    testSuite.run()
    let run = testSuite.testRun as! XCTestSuiteRun
    
    print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
  }
}

TestRunner().runTests(testClass:MyTests.self)


//: [Next](@next)
