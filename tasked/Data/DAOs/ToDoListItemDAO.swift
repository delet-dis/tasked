import Foundation
import CoreData

protocol ToDoListItemDAO {
    func getAllToDoListItems() -> [ToDoListItem]?

    func createToDoListItem(_ task: String)
    
    func getToDoListItemById(_ id: NSManagedObjectID) -> ToDoListItem?

    func deleteItem<T:NSManagedObject>(_ item: T)

    func updateItem(_ item: ToDoListItem, updatedState: Bool)
}
