import Foundation

extension ToDoListSubItem{
    func unwrapped() -> ToDoListSubItemUnwrapped{
        ToDoListSubItemUnwrapped(
                id: self.id,
                task: self.task!,
                isDone: self.isDone
        )
    }
}
