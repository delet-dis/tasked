//
//  ToDoListItem+CoreDataProperties.swift
//  tasked
//
//  Created by Igor Efimov on 30.12.2021.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var task: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var subItemsLink: NSOrderedSet?

}

// MARK: Generated accessors for subItemsLink
extension ToDoListItem {

    @objc(insertObject:inSubItemsLinkAtIndex:)
    @NSManaged public func insertIntoSubItemsLink(_ value: ToDoListSubItem, at idx: Int)

    @objc(removeObjectFromSubItemsLinkAtIndex:)
    @NSManaged public func removeFromSubItemsLink(at idx: Int)

    @objc(insertSubItemsLink:atIndexes:)
    @NSManaged public func insertIntoSubItemsLink(_ values: [ToDoListSubItem], at indexes: NSIndexSet)

    @objc(removeSubItemsLinkAtIndexes:)
    @NSManaged public func removeFromSubItemsLink(at indexes: NSIndexSet)

    @objc(replaceObjectInSubItemsLinkAtIndex:withObject:)
    @NSManaged public func replaceSubItemsLink(at idx: Int, with value: ToDoListSubItem)

    @objc(replaceSubItemsLinkAtIndexes:withSubItemsLink:)
    @NSManaged public func replaceSubItemsLink(at indexes: NSIndexSet, with values: [ToDoListSubItem])

    @objc(addSubItemsLinkObject:)
    @NSManaged public func addToSubItemsLink(_ value: ToDoListSubItem)

    @objc(removeSubItemsLinkObject:)
    @NSManaged public func removeFromSubItemsLink(_ value: ToDoListSubItem)

    @objc(addSubItemsLink:)
    @NSManaged public func addToSubItemsLink(_ values: NSOrderedSet)

    @objc(removeSubItemsLink:)
    @NSManaged public func removeFromSubItemsLink(_ values: NSOrderedSet)

}

extension ToDoListItem : Identifiable {

}
