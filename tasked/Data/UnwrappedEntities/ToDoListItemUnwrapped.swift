import Foundation

struct ToDoListItemUnwrapped:Hashable {
    let task: String
    let isDone: Bool
    let associatedSubItems: [ToDoListSubItemUnwrapped]?

    init(task: String, isDone: Bool = false, associatedSubItems: [ToDoListSubItemUnwrapped]? = nil) {
        self.task = task
        self.isDone = isDone
        self.associatedSubItems = associatedSubItems
    }
}
