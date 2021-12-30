import Foundation

protocol ToDoListItemDAO {
    func getAllToDoListItems() -> [ToDoListItem]?

    func createToDoListItem(_ task: String)

    func deleteItem(item: ToDoListItem)

    func updateItem(item: ToDoListItem, updatedState: Bool)
}