import Foundation

protocol ToDoListSubItemDAO {
    func getAllToDoListSubItems() -> [ToDoListSubItem]?

    func createToDoListSubItem(_ task: String, itemToAttach: ToDoListItem)

    func deleteItem(item: ToDoListSubItem, parentItem: ToDoListItem)

    func updateItem(item: ToDoListSubItem, updatedState: Bool)
}
