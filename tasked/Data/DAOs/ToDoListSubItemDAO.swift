import Foundation

protocol ToDoListSubItemDAO {
    func getAllToDoListSubItems()

    func createToDoListItem(_ task: String, itemToAttach: ToDoListItem)

    func deleteItem(item: ToDoListSubItem)

    func updateItem(item: ToDoListSubItem, updatedState: Bool)
}