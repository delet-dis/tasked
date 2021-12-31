import Foundation

func getMockListCellViewData() -> ToDoListItemUnwrapped {
    let displayingSubItems = [
        ToDoListSubItemUnwrapped(task: "Test first subTask", isDone: true),
        ToDoListSubItemUnwrapped(task: "Test second subTask", isDone: false)
    ]
    
    let displayingItem = ToDoListItemUnwrapped(task: "Test task", associatedSubItems: displayingSubItems)

    return displayingItem
}
