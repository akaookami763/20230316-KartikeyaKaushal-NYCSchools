//
//  SchoolSearchInteractor.swift
//  NYC Youths
//
//  Created by Kartikeya Kaushal on 3/15/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//


protocol SchoolSearchBusinessLogic
{
    func performStartingActions()
    
    func performSchoolSearch(text: String)
    
    func performSchoolDetailsAcquisition(name: String)
}

protocol SchoolSearchDataStore
{
    var schools: [SchoolData] {get}
}

class SchoolSearchInteractor: SchoolSearchBusinessLogic, SchoolSearchDataStore, SchoolSearchWorkerDelegate
{
    var schools: [SchoolData] = []
    
    var presenter: SchoolSearchPresentationLogic?
    var worker: SchoolSearchWorker?
    
    // MARK: Do something
    
    func performStartingActions()
    {
        worker = SchoolSearchWorker(delegate: self)
        worker?.getData()
    }
    
    func performSchoolSearch(text: String) {
        var filteredSchools: [SchoolData] = self.schools
        if(text.count > 1) {
            filteredSchools = schools.filter { school in
                school.schoolName.contains(text)
            }
        }
        presenter?.presentSchoolData(data: filteredSchools)
    }
    
    func performSchoolDetailsAcquisition(name: String) {
        let school = schools.filter { schoolInfo in
            schoolInfo.schoolName == name
        }[0]
        
        presenter?.presentSchoolDetails(school: school)
    }
    
    // MARK: Worker Delegate Functions
    
    func handleSchoolData(_ data: [SchoolData]) {
        schools = data
        presenter?.presentSchoolData(data: data)
    }
    
    func handleError(_ error: Error) {
        print("Got an error getting data: \(error)")
    }
}
