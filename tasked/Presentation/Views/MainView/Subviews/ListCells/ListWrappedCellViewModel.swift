import CoreData
import Foundation

class ListWrappedCellViewModel: ObservableObject {
    @Published private(set) var emptyListCellSubViewModel: EmptyListCellSubViewModel

    @Published private(set) var toDoItem: ToDoListItemUnwrapped

    @Published var isNewItemCellDisplaying: Bool = false

    @Published private(set) var listCellSubviewsViewModels: [ListCellSubViewModel?] = []

    init(toDoItem: ToDoListItemUnwrapped) {
        self.toDoItem = toDoItem

        emptyListCellSubViewModel = EmptyListCellSubViewModel(toDoItem: toDoItem)

        updateListCellSubviewsViewModels()
    }

    private func updateListCellSubviewsViewModels() {
        if let toDoSubItems = toDoItem.associatedSubItems {
            listCellSubviewsViewModels = [ListCellSubViewModel?](repeating: nil, count: toDoSubItems.count)

            for (index, element) in toDoSubItems.enumerated() {
                listCellSubviewsViewModels[index] = ListCellSubViewModel(displayingItem: element)
            }
        }
    }

    func updateItem(_ item: ToDoListItemUnwrapped) {
        toDoItem = item

        updateListCellSubviewsViewModels()
    }

    func toggleItem() {
        if let toDoItemId = toDoItem.id {
            if let itemToToggle = DatabaseRepository.shared.getToDoListItemById(toDoItemId) {
                let toggleState = !itemToToggle.isDone

                DatabaseRepository.shared.updateItem(itemToToggle, updatedState: toggleState)

                toggleSubItems(itemToToggle: itemToToggle, toggleState: toggleState)
            }
        }
    }

    private func toggleSubItems(itemToToggle: ToDoListItem, toggleState: Bool) {
        itemToToggle.getAssociatedSubTasks()?.forEach {
            DatabaseRepository.shared.updateItem($0, updatedState: toggleState)
        }
    }

    func toggleSubItem(_ item: ToDoListSubItemUnwrapped) {
        if let toDoSubItemId = item.id {
            if let item = DatabaseRepository.shared.getToDoListSubItemById(toDoSubItemId) {
                DatabaseRepository.shared.updateItem(item, updatedState: !item.isDone)
            }
        }
    }

    func deleteItem() {
        if let toDoItemId = toDoItem.id {
            DatabaseRepository.shared.deleteItemById(toDoItemId)
        }
    }
}
