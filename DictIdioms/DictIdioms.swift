//
//  Dict.swift
//  DictIdioms
//
//  Created by Wayne Yeh on 2017/9/8.
//  Copyright © 2017年 Wayne Yeh. All rights reserved.
//

import CoreData

class DictIdioms {
    lazy var entityName = String(describing: type(of: self))
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.entityName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    func add(location: CLLocation, type: LocationType) {
        guard let data = NSEntityDescription.insertNewObject(forEntityName: entityName, into: this) as? LocationPoint else { return }
        
        data.initFromLocation(location: location)
        data.type = type.rawValue
        data.create = NSDate()
        
        UNUserNotificationCenter
            .title(type.rawValue)
            .subtitle(location.coordinate.latitude.description)
            .body(location.description)
            .post()
        
        NotificationCenter.default.post(name: Notification.Name(ViewController.UpdateDataTable), object: location)
    }
}
