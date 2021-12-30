import Foundation

struct ToDoListSubItemUnwrapped {
    let task: String?
    let isDone: Bool?
    
    init(task: String?, isDone: Bool? = false) {
        self.task = task
        self.isDone = isDone
    }
}
