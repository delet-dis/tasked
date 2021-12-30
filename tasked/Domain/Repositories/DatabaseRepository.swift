import SwiftUI
import UIKit

final class DatabaseRepository: ToDoListItemDAO, ToDoListSubItemDAO {
    @Environment(\.managedObjectContext) private var viewContext

    func getAllToDoListItems() {
        do {
            let items = try viewContext.fetch(ToDoListItem.fetchRequest())
        } catch {
            print("Error getting ToDoListItems")
        }
    }

    func getAllToDoListSubItems() {
        do {
            let subItems = try viewContext.fetch(ToDoListSubItem.fetchRequest())
        } catch {
            print("Error getting ToDoListSubItems")
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
}