//
//  BookRepository.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import Alamofire

struct BookRepository: BookRepositoryType, RentRepositoryType {
    
    // MARK: Properties
    private static let baseUrl = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let books = "/books"
    private static let rents = "/rents"

    // MARK: Actions
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: BookRepository.baseUrl + BookRepository.books)!
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
    
    func postRent(with params: Parameters, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: BookRepository.baseUrl + BookRepository.rents)!
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            do {
                switch response.result {
                case .success(_):
                    onSuccess()
                case .failure(let error):
                    onError(error)
                }
            } catch {
                onError(error)
                return
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

protocol RentRepositoryType {
    func postRent(with params: Parameters, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}
