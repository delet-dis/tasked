import Foundation
import CoreData

protocol ToDoListSubItemDAO {
    func getAllToDoListSubItems() -> [ToDoListSubItem]?
    
    func getToDoListSubItemById(id: NSManagedObjectID) -> ToDoListSubItem?

    func createToDoListSubItem(_ task: String, itemToAttach: ToDoListItem)

    func deleteItem<T:NSManagedObject>(item: T)

    func updateItem(item: ToDoListSubItem, updatedState: Bool)
}
