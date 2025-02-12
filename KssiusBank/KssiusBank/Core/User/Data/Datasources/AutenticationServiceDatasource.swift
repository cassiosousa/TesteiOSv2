//
//  AutenticationServiceDatasource.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

final class AuthenticationServiceDatasource: AuthenticationServiceDatasourceProtocol {

    // MARK: - Properties
    private let networkService: NetworkService<UserAccountModel>

    // MARK: - Inits
    init(networkService: NetworkService<UserAccountModel>) {
        self.networkService = networkService
    }
}

// MARK: - Operations
extension AuthenticationServiceDatasource {

    func perform(login: BankApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, BankFailure>) -> Void) {
        networkService.request(endpoint: login.endpoint, payload: data ) { result in
            switch(result) {
            case .success(let model):
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            case .failure( _):
                DispatchQueue.main.async {
                    completion(.failure(.network(.init())))
                }
            }
        }
    }
}
