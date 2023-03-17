//
//  SchoolDetailsViewController.swift
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

protocol SchoolDetailsDisplayLogic: AnyObject
{
    func displaySomething(viewModel: SchoolDetails.Something.ViewModel)
}

class SchoolDetailsViewController: UIViewController, SchoolDetailsDisplayLogic
{
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    var interactor: SchoolDetailsBusinessLogic?
    var router: (NSObjectProtocol & SchoolDetailsRoutingLogic & SchoolDetailsDataPassing)?
    
    var schoolDetails: SchoolData!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = SchoolDetailsInteractor()
        let presenter = SchoolDetailsPresenter()
        let router = SchoolDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        schoolNameLabel.text = schoolDetails.schoolName
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = SchoolDetails.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: SchoolDetails.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}