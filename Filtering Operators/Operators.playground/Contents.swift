import UIKit
import Combine

// MARK: - Filter
private func filter() {
    let numbers = (1...20).publisher
    
    numbers.filter { $0 % 2 == 0 }
        .sink {
            print($0)
        }
}

// MARK: - Remove duplicates
private func removeDuplicates() {
    let words = "apple apple fruit apple mango watermelon apple".components(separatedBy: " ").publisher
    
    
    /// Removes duplicate value in sequence only, not in the entire array
    words
        .removeDuplicates()
        .sink{
            print($0)
        }
}

// MARK: - Compact map
private func compactMap() {
    _ = ["a", "1.24", "b", "3.45", "6.7"].publisher
        .compactMap{ Float($0) }
        .sink { print($0) }
}

// MARK: - Ignore output
private func ignoreOutput() {
    let numbers = (1...5000).publisher
    
    numbers
        .ignoreOutput()
        .sink(receiveCompletion: { print($0) },
              receiveValue: { print($0) })
}

// MARK: - First
private func first() {
    let numbers = (1...9).publisher
    
    numbers.first(where: { $0 % 2 == 0 })
        .sink{ print($0) }
}

// MARK: - Last
private func last() {
    let numbers = (1...9).publisher
    
    numbers
        .last(where: { $0 % 2 == 0 })
        .sink{ print($0) }
}

// MARK: - Drop first
private func dropFirst() {
    let numbers = (1...10).publisher
    
    numbers.dropFirst(5)
        .sink { print($0) }
}

// MARK: - Drop while
private func dropWhile() {
    let numbers = (1...10).publisher
    
    numbers
        .drop(while: { $0 % 3 != 0 })
        .sink {
            print($0)
        }
}

// MARK: - Drop until output from
private func dropUntilOutputFrom() {
    let isReady = PassthroughSubject<Void, Never>()
    let taps = PassthroughSubject<Int, Never>()
    
    /// Prints ONLY if a notification from isReady is sent
    taps.drop(untilOutputFrom: isReady).sink {
        print($0)
    }
    
    (1...10).forEach { n in
        taps.send(n)
        
        if n == 3 {
            isReady.send()
        }
    }
}

// MARK: - Prefix
private func prefix() {
    let numbers = (1...10).publisher
    
    numbers
        .prefix(2)
        .sink {
        print($0)
    }
}

// MARK: - Testing
private func challenge() {
    let numbers = (1...100).publisher
    
    numbers
        .dropFirst(50)
        .prefix(20)
        .filter { $0 % 2 == 0 }
        .sink {
            print($0)
        }
}
// MARK: - Results
//filter()
//removeDuplicates()
//compactMap()
//ignoreOutput()
//first()
//last()
//dropFirst()
//dropWhile()
//dropUntilOutputFrom()
//prefix()
//challenge()
