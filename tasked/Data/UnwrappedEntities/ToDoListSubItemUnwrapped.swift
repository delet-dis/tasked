import Foundation

struct ToDoListSubItemUnwrapped:Hashable, Identifiable {
    let id: ObjectIdentifier?
    let task: String
    let isDone: Bool
    
    init(id: ObjectIdentifier? = nil, task: String, isDone: Bool = false) {
        self.id = id
        self.task = task
        self.isDone = isDone
    }
}
