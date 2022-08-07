import UIKit
import Combine

// MARK: - Min / Max
private func min() {
    let publisher = [1, -45, 3, 45, 100].publisher
    
    publisher
        .min() // max()
        .sink {
            print($0)
        }
}

// MARK: First / Last
private func first() {
    let publisher = ["A", "B", "C", "D"].publisher
    
    publisher
        .first() // last(). Add where predicate for more conditions
        .sink {
            print($0)
        }
}

// MARK: - Output
private func output() {
    let publisher = ["A", "B", "C", "D"].publisher
    
    publisher.output(at: 2)
        .sink {
            print($0)
        }
    
    publisher.output(in: (0...2))
        .sink {
            print($0)
        }
}

// MARK: - Count
private func count() {
    let publisher = ["A", "B", "C", "D"].publisher
    
    publisher.count()
        .sink {
            print($0)
        }
}

// MARK: - Contains
private func contains() {
    let publisher = ["A", "B", "C", "D"].publisher
    
    publisher.contains("C")
        .sink {
            print($0)
        }
}

// MARK: All satisfy
private func allSatisfy() {
    let publisher = [2, 2, 4, 4, 6, 6, 8].publisher
    
    publisher.allSatisfy {
        $0 % 2 == 0
    }.sink {
        print($0)
    }
}

// MARK: Reduce
private func reduce() {
    let publisher = [1, 2, 3, 4, 5, 6, 7, 8].publisher
    
    publisher.reduce(0) { accumulator, value in
        print("Accumulator: \(accumulator) and value is \(value)")
        return accumulator + value
    }.sink {
        print($0)
    }
}

// MARK: - Results
//min()
//first()
//output()
//count()
//contains()
//allSatisfy()
reduce()
