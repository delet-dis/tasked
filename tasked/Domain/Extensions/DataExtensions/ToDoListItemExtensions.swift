import Foundation

extension ToDoListItem {
    func unwrapped() -> ToDoListItemUnwrapped {
        ToDoListItemUnwrapped(
            id: objectID,
            task: task!,
            isDone: isDone,
            associatedSubItems: getAssociatedSubTasks()?.map {
                $0.unwrapped()
            }
        )
    }

    func getAssociatedSubTasks() -> [ToDoListSubItem]? {
        guard let unwrappedArray = subItemsLink else {
            return nil
        }

        return unwrappedArray.map {
            $0 as! ToDoListSubItem
        }
    }
}
