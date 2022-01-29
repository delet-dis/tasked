import CoreData
import Foundation

class TaskListViewModel: ObservableObject {
    @Published var listWrappedCellViewModels: [ListWrappedCellViewModel?] = []

    @Published private(set) var toDoItems: [ToDoListItemUnwrapped] = []

    init() {
        initNestedViewModels()
        loadDatabaseRecordings()
        initDatabaseChangesObserver()
    }

    func initDatabaseChangesObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(managedObjectContextObjectsDidChange(_:)),
            name: Notification.Name.NSManagedObjectContextDidSave,
            object: DatabaseRepository.shared.viewContext)
    }

    @objc private func managedObjectContextObjectsDidChange(_ notification: Notification) {
        loadDatabaseRecordings()
    }

    private func initNestedViewModels() {
        loadDatabaseRecordings()
    }

    private func loadDatabaseRecordings() {
        toDoItems = getToDoListItems()

        listWrappedCellViewModels = [ListWrappedCellViewModel?](repeating: nil, count: toDoItems.count)

        for (index, element) in toDoItems.enumerated() {
            listWrappedCellViewModels[index] = ListWrappedCellViewModel(toDoItem: element)
        }
    }

    private func getToDoListItems() -> [ToDoListItemUnwrapped] {
        DatabaseRepository.shared.getAllToDoListItemsUnwrapped() ?? []
    }
}
