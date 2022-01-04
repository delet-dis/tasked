import Foundation

extension ToDoListItem{
    func unwrapped() -> ToDoListItemUnwrapped{
        ToDoListItemUnwrapped(
                id: self.id,
                task: self.task!,
                isDone: self.isDone,
                associatedSubItems: getAssociatedSubTasks()?.map {
                    $0.unwrapped()
                }
        )
    }
    
    private func getAssociatedSubTasks() -> [ToDoListSubItem]?{
        guard let unwrappedArray = self.subItemsLink else {
            return nil
        }

        return unwrappedArray.map {
            $0 as! ToDoListSubItem
        }
    }
}
