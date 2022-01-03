import Foundation

struct ToDoListItemUnwrapped:Hashable, Identifiable {
    let id: ObjectIdentifier?
    let task: String
    let isDone: Bool
    let associatedSubItems: [ToDoListSubItemUnwrapped]?

    init(id: ObjectIdentifier? = nil, task: String, isDone: Bool = false, associatedSubItems: [ToDoListSubItemUnwrapped]? = nil) {
        self.id = id
        self.task = task
        self.isDone = isDone
        self.associatedSubItems = associatedSubItems
    }
}
