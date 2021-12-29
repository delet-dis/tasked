//
//  ToDoListItem+CoreDataProperties.swift
//  tasked
//
//  Created by Igor Efimov on 29.12.2021.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var id: Int32
    @NSManaged public var task: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var sibItemsLink: NSOrderedSet?

}

// MARK: Generated accessors for sibItemsLink
extension ToDoListItem {

    @objc(insertObject:inSibItemsLinkAtIndex:)
    @NSManaged public func insertIntoSibItemsLink(_ value: ToDoListSubItem, at idx: Int)

    @objc(removeObjectFromSibItemsLinkAtIndex:)
    @NSManaged public func removeFromSibItemsLink(at idx: Int)

    @objc(insertSibItemsLink:atIndexes:)
    @NSManaged public func insertIntoSibItemsLink(_ values: [ToDoListSubItem], at indexes: NSIndexSet)

    @objc(removeSibItemsLinkAtIndexes:)
    @NSManaged public func removeFromSibItemsLink(at indexes: NSIndexSet)

    @objc(replaceObjectInSibItemsLinkAtIndex:withObject:)
    @NSManaged public func replaceSibItemsLink(at idx: Int, with value: ToDoListSubItem)

    @objc(replaceSibItemsLinkAtIndexes:withSibItemsLink:)
    @NSManaged public func replaceSibItemsLink(at indexes: NSIndexSet, with values: [ToDoListSubItem])

    @objc(addSibItemsLinkObject:)
    @NSManaged public func addToSibItemsLink(_ value: ToDoListSubItem)

    @objc(removeSibItemsLinkObject:)
    @NSManaged public func removeFromSibItemsLink(_ value: ToDoListSubItem)

    @objc(addSibItemsLink:)
    @NSManaged public func addToSibItemsLink(_ values: NSOrderedSet)

    @objc(removeSibItemsLink:)
    @NSManaged public func removeFromSibItemsLink(_ values: NSOrderedSet)

}

extension ToDoListItem : Identifiable {

}
