import SwiftUI

final class DatabaseRepository: ToDoListItemDAO, ToDoListSubItemDAO {
    @Environment(\.managedObjectContext) private var viewContext

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

    func getAllToDoListSubItems() -> [ToDoListSubItem]? {
        do {
            return try viewContext.fetch(ToDoListSubItem.fetchRequest())
        } catch {
            print("Error getting ToDoListSubItems")

            return nil
        }
    }

    func getAssociatedSubTasksWithItem(_ item: ToDoListItem) -> [ToDoListSubItem]? {
        guard let unwrappedArray = item.subItemsLink else {
            return nil
        }

        return unwrappedArray.map {
            $0 as! ToDoListSubItem
        }
    }

    func createToDoListItem(_ task: String) {
        let newItem = ToDoListItem(context: viewContext)
        newItem.task = task

        saveContext()
    }

    func createToDoListItem(_ task: String, itemToAttach: ToDoListItem) {
        let newSubItem = ToDoListSubItem(context: viewContext)
        newSubItem.task = task

        itemToAttach.addToSubItemsLink(newSubItem)

        saveContext()
    }

    func deleteItem(item: ToDoListItem) {
        viewContext.delete(item)

        saveContext()
    }

    func deleteItem(item: ToDoListSubItem, parentItem: ToDoListItem) {
        parentItem.removeFromSubItemsLink(item)

        viewContext.delete(item)

        saveContext()
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

    private func unwrapToDoListItem(_ item: ToDoListItem) -> ToDoListItemUnwrapped {
        ToDoListItemUnwrapped(
                task: item.task,
                isDone: item.isDone,
                associatedSubItems: getAssociatedSubTasksWithItem(item)?.map {
                    unwrapToDoListSubItem($0)
                }
        )
    }

    private func unwrapToDoListSubItem(_ item: ToDoListSubItem) -> ToDoListSubItemUnwrapped {
        ToDoListSubItemUnwrapped(
                task: item.task,
                isDone: item.isDone
        )
    }
}
