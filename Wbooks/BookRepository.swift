//
//  BookRepository.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import Alamofire

struct BookRepository: BookRepositoryType, RentRepositoryType {

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
    
    func postRent(with params: Parameters, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/rents")!
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            do {
                switch response.result {
                case .success(let value):
                    guard let _ = try JSONSerialization.jsonObject(with: response.data!) as? [String: Any], let JSONData = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted), let _ = String(data: JSONData, encoding: .utf8) else {
                                print("Error: could not convert JSON data to String")
                                return
                    }
                    onSuccess()
                case .failure(let error):
                    onError(error)
                }
            } catch {
                print("There as an error converting the JSON data")
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
