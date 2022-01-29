import Foundation

extension ToDoListSubItem{
    func unwrapped() -> ToDoListSubItemUnwrapped{
        ToDoListSubItemUnwrapped(
                id: objectID,
                task: task!,
                isDone: isDone
        )
    }
}
