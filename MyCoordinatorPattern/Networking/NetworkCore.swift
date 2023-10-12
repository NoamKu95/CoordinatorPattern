//
//  NetworkCore.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

typealias Headers = [String : String]

enum MethodAPI: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Error {
    case someError(String)
}

protocol Requestable {
    associatedtype ReturnType: Decodable
    var method: MethodAPI { get }
    var baseURL: String { get }
    var endpoint: String { get }
    var headers: Headers { get }
    var paramsData: Encodable? { get set }
}
