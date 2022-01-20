import Foundation
import CoreData

protocol ToDoListSubItemDAO {
    func getAllToDoListSubItems() -> [ToDoListSubItem]?
    
    func getToDoListSubItemById(_ id: NSManagedObjectID) -> ToDoListSubItem?

    func createToDoListSubItem(_ task: String, itemToAttach: ToDoListItem)

    func deleteItem<T:NSManagedObject>(_ item: T)

    func updateItem(_ item: ToDoListSubItem, updatedState: Bool)
}
