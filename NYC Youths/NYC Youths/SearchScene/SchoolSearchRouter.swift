//
//  SchoolSearchRouter.swift
//  NYC Youths
//
//  Created by Kartikeya Kaushal on 3/15/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SchoolSearchRoutingLogic
{
    func routeToSchoolDetails(segue: UIStoryboardSegue?, schoolData: SchoolData)
}

protocol SchoolSearchDataPassing
{
    var dataStore: SchoolSearchDataStore? { get }
}

class SchoolSearchRouter: NSObject, SchoolSearchRoutingLogic, SchoolSearchDataPassing
{
    weak var viewController: SchoolSearchViewController?
    var dataStore: SchoolSearchDataStore?
    
    func routeToSchoolDetails(segue: UIStoryboardSegue?, schoolData: SchoolData) {
        var destination: SchoolDetailsViewController!
        
        if let segue = segue {
            destination = (segue.destination as! SchoolDetailsViewController)
        }
        else {
            let storyboard = UIStoryboard(name: "SchoolDetails", bundle: nil)
            destination = storyboard.instantiateInitialViewController()
        }
        destination.schoolDetails = schoolData
        self.navigateToSchoolDetails(source: viewController!, destination: destination)
    }
    
    func navigateToSchoolDetails(source: SchoolSearchViewController, destination: SchoolDetailsViewController) {
        source.show(destination, sender: nil)
    }
}
