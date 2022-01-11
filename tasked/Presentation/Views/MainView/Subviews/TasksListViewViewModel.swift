import CoreData
import Foundation

extension TasksListView {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItemsWrapped: [ToDoListItem] = []

        init() {
            loadDatabaseRecordings()
            initDatabaseChangesObserver()
        }

        func initDatabaseChangesObserver() {
            NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(managedObjectContextObjectsDidChange(_:)),
                    name: Notification.Name.NSManagedObjectContextObjectsDidChange,
                    object: DatabaseRepository.shared.viewContext)
        }

        @objc private func managedObjectContextObjectsDidChange(_ notification: Notification) {
            loadDatabaseRecordings()
        }
        
        private func loadDatabaseRecordings(){
            toDoItemsWrapped = DatabaseRepository.shared.getAllToDoListItems() ?? []
        }
    }
}
