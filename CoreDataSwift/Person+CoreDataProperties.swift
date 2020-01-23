//
//  Person+CoreDataProperties.swift
//  CoreDataSwift
//
//  Created by U.M. Hamidul islam on 1/23/20.
//  Copyright © 2020 SH Hridoy. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
