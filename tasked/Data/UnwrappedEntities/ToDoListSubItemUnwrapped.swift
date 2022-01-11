import Foundation
import CoreData

struct ToDoListSubItemUnwrapped:Hashable, Identifiable {
    let id: NSManagedObjectID?
    let task: String
    let isDone: Bool
    
    init(id: NSManagedObjectID? = nil, task: String, isDone: Bool = false) {
        self.id = id
        self.task = task
        self.isDone = isDone
    }
}
