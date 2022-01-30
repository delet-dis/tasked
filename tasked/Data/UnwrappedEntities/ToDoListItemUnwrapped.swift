import CoreData
import Foundation

struct ToDoListItemUnwrapped: Hashable, Identifiable {
    let id: NSManagedObjectID?
    let task: String
    let isDone: Bool
    let associatedSubItems: [ToDoListSubItemUnwrapped]?

    init(id: NSManagedObjectID? = nil, task: String, isDone: Bool = false, associatedSubItems: [ToDoListSubItemUnwrapped]? = nil) {
        self.id = id
        self.task = task
        self.isDone = isDone
        self.associatedSubItems = associatedSubItems
    }
}
