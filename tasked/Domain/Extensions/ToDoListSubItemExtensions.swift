import Foundation

extension ToDoListSubItem{
    func unwrapped() -> ToDoListSubItemUnwrapped{
        ToDoListSubItemUnwrapped(
                id: self.objectID,
                task: self.task!,
                isDone: self.isDone
        )
    }
}
