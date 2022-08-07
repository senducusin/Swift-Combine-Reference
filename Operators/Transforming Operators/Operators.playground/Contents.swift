import Combine
import Foundation

// MARK: - Collect
func collect() {
    ["A", "B", "C", "D", "E"].publisher.collect(2).sink {
        print($0)
    }
}

// MARK: - Map
func map() {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    [123, 45, 67].publisher.map {
        formatter.string(from: NSNumber(integerLiteral: $0))
    }.sink { spelledOutNumber in
        print(spelledOutNumber)
    }
}

// MARK: - Map KeyPath
func mapKeyPath() {
    struct Point {
        let x: Int
        let y: Int
    }
    
    let publisher = PassthroughSubject<Point, Never>()
    publisher.map(\.x, \.y).sink{ x, y in
        print("x is \(x) and y is \(y)")
    }
    
    publisher.send(Point(x: 2, y: 10))
}

// MARK: - FlatMap
func flatMap() {
    struct School {
        let name: String
        let numberOfStudents: CurrentValueSubject<Int, Never>
        
        init(name: String, numberOfStudents: Int) {
            self.name = name
            self.numberOfStudents = CurrentValueSubject(numberOfStudents)
        }
    }
    
    let citySchool = School(name: "Lorma Colleges", numberOfStudents: 200)
    let school = CurrentValueSubject<School, Never>(citySchool)
    
    school
        .flatMap{
            $0.numberOfStudents
        }
        .sink {
        print($0)
    }
    
    let townSchool = School(name: "Saint Louis College", numberOfStudents: 100)
    school.value = townSchool
    
    citySchool.numberOfStudents.value += 1
    townSchool.numberOfStudents.value += 3
}

// MARK: - ReplaceNil
func replaceNil() {
    ["A", "B", "C", nil, "E"].publisher.replaceNil(with: "D")
        .map{ $0! }
        .sink {
            print($0)
        }
}

// MARK: - ReplaceEmpty
func replaceEmpty() {
    let empty = Empty<Int, Never>()
    
    empty
        .replaceEmpty(with: 1)
        .sink {
        print($0)
    } receiveValue: {
        print($0)
    }
}

// MARK: - Scan
func scan() {
    let publisher = (1...10).publisher
    
    publisher.scan([]) { numbers, value -> [Int] in
        numbers + [value]
    }.sink {
        print($0)
    }
}

/// Print result here
// collect()
// map()
// mapKeyPath()
// flatMap()
// replaceNil()
// replaceEmpty()
scan()
