//
//  HomeWorker.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright (c) 2023 Cassio Sousa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit


protocol HomeWorkerLogic {
    func fetchStatements( completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void )
}

final class HomeWorker {
    private let statementsRepository: StatementsRepositoryProtocol

    init(statementsRepository: StatementsRepositoryProtocol) {
        self.statementsRepository = statementsRepository
    }

}

extension HomeWorker: HomeWorkerLogic {
    func fetchStatements( completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void ) {
        statementsRepository.fetch(statements: .statementsRequest, completion: completion)
    }
}
