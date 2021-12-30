import Foundation

typealias MockListCellViewData = (item: ToDoListItemUnwrapped, subItems: [ToDoListSubItemUnwrapped])

func getMockListCellViewData() -> MockListCellViewData {
    let displayingItem = ToDoListItemUnwrapped(task: "Test task")

    let displayingSubItems = [
        ToDoListSubItemUnwrapped(task: "Test first subTask", isDone: true),
        ToDoListSubItemUnwrapped(task: "Test second subTask", isDone: false)
    ]

    return (displayingItem, displayingSubItems)
}
