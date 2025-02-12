//
//  LoginPresenter.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic {
    func displayUser(response: Login.FetchUser.Response)
    func resolveLogin(response: Login.Login.Response)
}

final class LoginPresenter {
    weak var viewController: LoginDisplayLogic?
}

// MARK: - Logics

extension LoginPresenter: LoginPresentationLogic {

    func resolveLogin(response: Login.Login.Response){
        viewController?.resolveLogin(viewModel:response.toViewModel())
    }

    func displayUser(response: Login.FetchUser.Response) {
        viewController?.displayUser(viewModel: .init(user: response.user))
    }
}

