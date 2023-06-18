//
//  HomeModels.swift
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

enum Home
{
    // MARK: Use cases

    enum GetStatements
    {
        struct Request{}

        struct Response{
            let success: Bool
            let errorMessage: String?
            let statements: [StatementsModel]

            init(success: Bool = true, errorMessage: String? = nil, statements: [StatementsModel] = []) {
                self.success = success
                self.errorMessage = errorMessage
                self.statements = statements
            }
        }

        struct StatementViewModel: Equatable {
            let type: String
            let description: String
            let date: String
            let value: String

            init(type: String, description: String, date: String, value: String) {
                self.type = type
                self.description = description
                self.date = date
                self.value = value
            }
        }

        struct ViewModel{

            // MARK: - Properties

            let statements: [Home.GetStatements.StatementViewModel]
            let success: Bool

            // MARK: - Inits

            init(statements: [Home.GetStatements.StatementViewModel], success: Bool) {
                self.statements = statements
                self.success = success
            }
        }
    }

    enum GetAccount
    {
        struct Request{}

        struct Response{
            let userAccount: UserAccountModel

            init(userAccount: UserAccountModel) {
                self.userAccount = userAccount
            }
        }

        struct ViewModel: Equatable {

            // MARK: - Properties

            let name: String
            let agency: String
            let accountNumber: String
            let balance: String

            // MARK: - Inits

            init() {
                self.init(name: "", agency: "", accountNumber: "", balance: "")
            }

            init(name: String,
                 agency: String,
                 accountNumber: String,
                 balance: String){
                self.name = name
                self.agency = agency
                self.accountNumber = accountNumber
                self.balance = balance
            }
        }
    }
}
