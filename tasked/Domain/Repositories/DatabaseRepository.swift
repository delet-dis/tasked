import CoreData
import Foundation

final class DatabaseRepository: ToDoListItemDAO, ToDoListSubItemDAO {
    private let persistentContainer: NSPersistentContainer
    
    let viewContext: NSManagedObjectContext
    
    static let shared = DatabaseRepository()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "CoreDataModels")
        persistentContainer.loadPersistentStores{description, error in
            if let error = error {
                print("Unable to initialize CoreData stack \(error.localizedDescription)")
            }
        }
        
        viewContext = persistentContainer.viewContext
    }

    func getAllToDoListItemsUnwrapped() -> [ToDoListItemUnwrapped]? {
        guard let unwrappedArray = getAllToDoListItems() else {
            return nil
        }

        return unwrappedArray.map {
            unwrapToDoListItem($0)
        }
    }

    func getAllToDoListSubItemsUnwrapped() -> [ToDoListSubItemUnwrapped]? {
        guard let unwrappedArray = getAllToDoListSubItems() else {
            return nil
        }

        return unwrappedArray.map {
            unwrapToDoListSubItem($0)
        }
    }

    func getAllToDoListItems() -> [ToDoListItem]? {
        do {
            return try viewContext.fetch(ToDoListItem.fetchRequest())
        } catch {
            print("Error getting ToDoListItems")

            return nil
        }
    }
    
    func getToDoListItemById(id: NSManagedObjectID) -> ToDoListItem? {
        do {
            return try viewContext.existingObject(with: id) as? ToDoListItem
        } catch {
            print("Error getting ToDoListItem")

            return nil
        }
    }

    func getAllToDoListSubItems() -> [ToDoListSubItem]? {
        do {
            return try viewContext.fetch(ToDoListSubItem.fetchRequest())
        } catch {
            print("Error getting ToDoListSubItems")

            return nil
        }
    }
    
    func getToDoListSubItemById(id: NSManagedObjectID) -> ToDoListSubItem? {
        do {
            return try viewContext.existingObject(with: id) as? ToDoListSubItem
        } catch {
            print("Error getting ToDoListSubItem")

            return nil
        }
    }

    func createToDoListItem(_ task: String) {
        let newItem = ToDoListItem(context: viewContext)
        newItem.task = task

        saveContext()
    }

    func createToDoListSubItem(_ task: String, itemToAttach: ToDoListItem) {
        let newSubItem = ToDoListSubItem(context: viewContext)
        newSubItem.task = task

        itemToAttach.addToSubItemsLink(newSubItem)

        saveContext()
    }

    func deleteItem<T: NSManagedObject>(item: T) {
        viewContext.delete(item)

        saveContext()
    }
    
    func deleteItemById(id: NSManagedObjectID) {
        if let itemToDelete = getToDoListItemById(id: id) {
            deleteItem(item: itemToDelete)
        }
    }
    
    func deleteSubItemById(id: NSManagedObjectID) {
        if let itemToDelete = getToDoListSubItemById(id: id) {
            deleteItem(item: itemToDelete)
        }
    }

    func updateItem(item: ToDoListItem, updatedState: Bool) {
        item.isDone = updatedState

        saveContext()
    }

    func updateItem(item: ToDoListSubItem, updatedState: Bool) {
        item.isDone = updatedState

        saveContext()
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context")
        }
    }
    
    private func getAssociatedSubTasksWithItem(_ item: ToDoListItem) -> [ToDoListSubItem]? {
        guard let unwrappedArray = item.subItemsLink else {
            return nil
        }

        return unwrappedArray.map {
            $0 as! ToDoListSubItem
        }
    }

    private func unwrapToDoListItem(_ item: ToDoListItem) -> ToDoListItemUnwrapped {
        ToDoListItemUnwrapped(
                task: item.task!,
                isDone: item.isDone,
                associatedSubItems: getAssociatedSubTasksWithItem(item)?.map {
                    unwrapToDoListSubItem($0)
                }
        )
    }

    private func unwrapToDoListSubItem(_ item: ToDoListSubItem) -> ToDoListSubItemUnwrapped {
        ToDoListSubItemUnwrapped(
                task: item.task!,
                isDone: item.isDone
        )
    }
}
