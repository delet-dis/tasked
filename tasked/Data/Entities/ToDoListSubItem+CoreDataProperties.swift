//
//  ToDoListSubItem+CoreDataProperties.swift
//  tasked
//
//  Created by Igor Efimov on 29.12.2021.
//
//

import Foundation
import CoreData


extension ToDoListSubItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListSubItem> {
        return NSFetchRequest<ToDoListSubItem>(entityName: "ToDoListSubItem")
    }

    @NSManaged public var id: Int32
    @NSManaged public var task: String?
    @NSManaged public var isDone: Bool

}

extension ToDoListSubItem : Identifiable {

}
