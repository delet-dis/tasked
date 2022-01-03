import CoreData
import Foundation
import SwiftUI

extension TasksListView {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItems: [ToDoListItemUnwrapped] = []

        init() {
            initDatabaseChangesObserver()
        }

        func initDatabaseChangesObserver() {
            NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(managedObjectContextObjectsDidChange(_:)),
                    name: Notification.Name.NSManagedObjectContextObjectsDidChange,
                    object: DatabaseRepository.shared.viewContext)
        }

        @objc func managedObjectContextObjectsDidChange(_ notification: Notification) {

        }
    }
}
