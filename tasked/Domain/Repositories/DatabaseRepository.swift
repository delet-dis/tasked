import CoreData
import Foundation

final class DatabaseRepository: ToDoListItemDAO, ToDoListSubItemDAO {
    private let persistentContainer: NSPersistentContainer

    let viewContext: NSManagedObjectContext

    static let shared = DatabaseRepository()

    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataModels")
        persistentContainer.loadPersistentStores { _, error in
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
            $0.unwrapped()
        }
    }

    func getAllToDoListSubItemsUnwrapped() -> [ToDoListSubItemUnwrapped]? {
        guard let unwrappedArray = getAllToDoListSubItems() else {
            return nil
        }

        return unwrappedArray.map {
            $0.unwrapped()
        }
    }

    func getAllToDoListItems() -> [ToDoListItem]? {
        do {
            let processingRequest = ToDoListItem.fetchRequest()
            let sort = NSSortDescriptor(key: #keyPath(ToDoListItem.addedDate), ascending: true)

            processingRequest.sortDescriptors = [sort]

            return try viewContext.fetch(processingRequest)
        } catch {
            print("Error getting ToDoListItems")

            return nil
        }
    }

    func getToDoListItemById(_ id: NSManagedObjectID) -> ToDoListItem? {
        do {
            return try viewContext.existingObject(with: id) as? ToDoListItem
        } catch {
            print("Error getting ToDoListItem")

            return nil
        }
    }

    func getAllToDoListSubItems() -> [ToDoListSubItem]? {
        do {
            let processingRequest = ToDoListSubItem.fetchRequest()
            let sort = NSSortDescriptor(key: #keyPath(ToDoListSubItem.addedDate), ascending: false)

            processingRequest.sortDescriptors = [sort]

            return try viewContext.fetch(processingRequest)
        } catch {
            print("Error getting ToDoListSubItems")

            return nil
        }
    }

    func getToDoListSubItemById(_ id: NSManagedObjectID) -> ToDoListSubItem? {
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
        newItem.isDone = false
        newItem.addedDate = Date()

        saveContext()
    }

    func createToDoListSubItem(_ task: String, itemToAttach: ToDoListItem) {
        let newSubItem = ToDoListSubItem(context: viewContext)
        newSubItem.task = task
        newSubItem.isDone = false
        newSubItem.addedDate = Date()

        itemToAttach.addToSubItemsLink(newSubItem)

        saveContext()
    }

    func deleteItem<T: NSManagedObject>(_ item: T) {
        viewContext.delete(item)

        saveContext()
    }

    func deleteItemById(_ id: NSManagedObjectID) {
        if let itemToDelete = getToDoListItemById(id) {
            deleteItem(itemToDelete)
        }
    }

    func deleteSubItemById(_ id: NSManagedObjectID) {
        if let itemToDelete = getToDoListSubItemById(id) {
            deleteItem(itemToDelete)
        }
    }

    func updateItem(_ item: ToDoListItem, updatedState: Bool) {
        item.isDone = updatedState

        saveContext()
    }

    func updateItem(_ item: ToDoListSubItem, updatedState: Bool) {
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
}
