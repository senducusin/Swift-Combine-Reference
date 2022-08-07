import UIKit
import Combine

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
}

func getPosts() -> AnyPublisher<[Post], Error> {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        fatalError("Invalid URL")
    }
    
    return URLSession.shared.dataTaskPublisher(for: url).map {
        $0.data
    }
    .decode(type: [Post].self, decoder: JSONDecoder())
    .eraseToAnyPublisher()
}

let cancellable = getPosts().sink { _ in } receiveValue: { data in
    print(data)
}

