//
//  NetworkManager.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func sendRequest<R: Requestable>(
        _ request: R,
        _ cancellableTask: ((URLSessionTask) -> Void)? = nil
    ) async -> Result<R.ReturnType?, NetworkError> {
        
        // create url ..
        // create method, headers & params ..
        // send request ..
        
        do {
            let decodedData: R.ReturnType // decode the data ..
            return .success(nil) // return the data ..
        } catch let error {
            return .failure(.someError(error.localizedDescription))
        }
    }
    
    static func cancelAllTaskRequests() { // TODO: noamku - when using?
        // code..
    }
}
