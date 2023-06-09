//
//  SchoolDetailsInteractor.swift
//  NYC Youths
//
//  Created by Kartikeya Kaushal on 3/17/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SchoolDetailsBusinessLogic
{
  func doSomething(request: SchoolDetails.Something.Request)
}

protocol SchoolDetailsDataStore
{
  //var name: String { get set }
}

class SchoolDetailsInteractor: SchoolDetailsBusinessLogic, SchoolDetailsDataStore
{
  var presenter: SchoolDetailsPresentationLogic?
  var worker: SchoolDetailsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: SchoolDetails.Something.Request)
  {
    worker = SchoolDetailsWorker()
    worker?.doSomeWork()
    
    let response = SchoolDetails.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
