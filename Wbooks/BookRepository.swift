//
//  BookRepository.swift
//  Wbooks
//
//  Created by Juan Martín Gordo on 19/04/2021.
//

import Alamofire

// MARK: Protocols
protocol BookRepositoryType {
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void)
    func postBook(book: NewBook, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}

protocol RentRepositoryType {
    func postRent(book: Book, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void)
}

protocol CommentRepositoryType {
    func fetchComments(bookID: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void)
}

protocol UserRepositoryType {
    func fetchUser(userID: Int, onSuccess: @escaping (User) -> Void, onError: @escaping (Error) -> Void)
}

struct BookRepository: BookRepositoryType, RentRepositoryType, CommentRepositoryType, UserRepositoryType {
    
    // MARK: Properties
    private static let baseUrl = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let books = "/books"
    private static let rents = "/rents"
    private static let comments = "/comments"
    private static let users = "/users"
    

    // MARK: Actions
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: BookRepository.baseUrl + BookRepository.books)!
        AF.request(url, method: .get).responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []),
                          let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                        onError(RepositoryError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
        }
    }
    
    func postRent(book: Book, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: BookRepository.baseUrl + BookRepository.rents)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fromDate = Date()
        let toDate = Calendar.current.date(byAdding: .day, value: 1, to: fromDate)
        let params: [String : Any] = ["user_id" : "10",
                                      "book_id" : book.id,
                                      "from" : formatter.string(from: fromDate),
                                      "to" : formatter.string(from: toDate!)]
        
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
    
    func fetchComments(bookID: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: BookRepository.baseUrl + BookRepository.books + "/\(bookID)" + BookRepository.comments)!
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONcomments = try? JSONSerialization.data(withJSONObject: value, options: []),
                      let comments = try? JSONDecoder().decode([Comment].self, from: JSONcomments) else {
                    onError(RepositoryError.decodeError)
                    return
                }
                onSuccess(comments)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func fetchUser(userID: Int, onSuccess: @escaping (User) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: BookRepository.baseUrl + BookRepository.users + "/\(userID)")!
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case.success(let value):
                guard let JSONuser = try? JSONSerialization.data(withJSONObject: value, options: []), let user = try? JSONDecoder().decode(User.self, from: JSONuser) else {
                    onError(RepositoryError.decodeError)
                    return
                }
                onSuccess(user)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func postBook(book: NewBook, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let params: [String : Any] = ["title" : book.title,
                                      "author" : book.author,
                                      "year" : book.year,
                                      "genre" : book.genre,
                                      "image" : "",
                                      "status" : "Available"]
        let url = URL(string: BookRepository.baseUrl + BookRepository.books)!
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            do {
                switch response.result {
                case.success(_):
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

    // MARK: Errors
    enum RepositoryError: Error {
        case decodeError
    }

}


