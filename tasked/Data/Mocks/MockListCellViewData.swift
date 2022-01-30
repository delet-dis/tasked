import Foundation

func getMockListCellViewData() -> [ToDoListItemUnwrapped] {
    let displayingSubItems = [
        ToDoListSubItemUnwrapped(task: "Test first subTask", isDone: true),
        ToDoListSubItemUnwrapped(task: "Test second subTask", isDone: false)
    ]

    let displayingItems = [ToDoListItemUnwrapped(task: "Test task", associatedSubItems: displayingSubItems),
                           ToDoListItemUnwrapped(task: "second test task", associatedSubItems: displayingSubItems)]

    return displayingItems
}
