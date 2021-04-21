//
//  BookRepository.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import Alamofire

struct BookRepository: BookRepositoryType {

    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books")!
        AF.request(url, method: .get).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []),
                          let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                        onError(BookError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
        }
    }

    enum BookError: Error {
        case decodeError
    }

}

protocol BookRepositoryType {

    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void)

}
