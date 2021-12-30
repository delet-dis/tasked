import Foundation

protocol ToDoListItemDAO {
    func getAllToDoListItems()

    func createToDoListItem(_ task: String)

    func deleteItem(item: ToDoListItem)

    func updateItem(item: ToDoListItem, updatedState: Bool)
}