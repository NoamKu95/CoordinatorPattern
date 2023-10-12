//
//  AuthRepository.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//

import Foundation

final class AuthRepository {
    
    func getUserToken() async throws -> String {
        
        // .. actually get token ..
        
        return "token"
    }
    
    func login() async throws -> User {
        
        // .. send actual api call to login ..
        let request = ExampleRequest()
        let result = await NetworkManager.shared.sendRequest(request)
        
        switch result {
        case .success(let response):
            
            // .. for this demo - to initate user session is still active ..
            let defaults = UserDefaults.standard
            defaults.set("true", forKey: "isLoggedIn")
            
            return User(firstName: "Jane", lastName: "Doe", gender: .female, height: 175, weight: 75) // .. return from response ..
        case .failure(let failure):
            throw failure
        }
    }
    
    func register(newUser: User) async throws -> User {
        
        // .. send actual api call to register with the data about the user ..
        let request = ExampleRequest()
        let result = await NetworkManager.shared.sendRequest(request)
        
        switch result {
        case .success(let response):
            
            // .. for this demo - to initate user session is still active ..
            let defaults = UserDefaults.standard
            defaults.set("true", forKey: "isLoggedIn")
            
            return newUser // .. return from response ..
        case .failure(let failure):
            throw failure
        }
    }
    
    func sendNewPassword() async throws {
        
        // .. send actual api call to get a new password for the user ..
    }
}
