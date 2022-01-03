import Foundation
import CoreData

protocol ToDoListItemDAO {
    func getAllToDoListItems() -> [ToDoListItem]?

    func createToDoListItem(_ task: String)

    func deleteItem<T:NSManagedObject>(item: T)

    func updateItem(item: ToDoListItem, updatedState: Bool)
}
