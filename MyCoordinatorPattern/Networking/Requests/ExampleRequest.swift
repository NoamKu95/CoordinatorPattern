//
//  ExampleRequest.swift
//  MyCoordinatorPattern
//
//  Created by Noam Kurtzer on 08/10/2023.
//


struct ExampleRequest: Requestable {
    typealias ReturnType = ExampleResponse
    
    var method: MethodAPI = .get
    var baseURL: String = "my_base_url"
    var endpoint: String = "/v1/relevant_endpoint_name"
    var headers: Headers = [:]
    var paramsData: Encodable? = nil
    
    init (userToken: String? = nil) {
        headers = [
            "Authorization" : "Bearer \(userToken ?? "")",
            "Content-Type" : "application/json",
        ]
    }
}
