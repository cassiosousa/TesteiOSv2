//
//  HomeInteractor.swift
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

protocol HomeBusinessLogic
{
  func doSomething(request: Home.GetStatements.Request)
}

protocol HomeDataStore
{
  var userAccount: UserAccountModel? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
  var presenter: HomePresentationLogic?
  var worker: HomeWorker?
  var userAccount: UserAccountModel?
  
  // MARK: Do something
  
  func doSomething(request: Home.GetStatements.Request)
  {
    worker = HomeWorker()
    worker?.doSomeWork()
    
    let response = Home.GetStatements.Response(statements: [])
    presenter?.presentSomething(response: response)
  }
}
