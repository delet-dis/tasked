import CoreData
import Foundation

class ListWrappedCellViewModel: ObservableObject {
    @Published var emptyListCellSubViewModel: EmptyListCellSubViewModel

    @Published var toDoItem: ToDoListItemUnwrapped

    @Published private(set) var toDoSubItems: [ToDoListSubItemUnwrapped]?

    @Published var isNewItemCellDisplaying: Bool = false {
        didSet {
            emptyListCellSubViewModel.isActive = isNewItemCellDisplaying
        }
    }

    init(toDoItem: ToDoListItemUnwrapped) {
        self.toDoItem = toDoItem

        toDoSubItems = toDoItem.associatedSubItems

        emptyListCellSubViewModel = EmptyListCellSubViewModel(toDoItem: toDoItem, isActive: false)
    }

    func updateItem(_ item: ToDoListItemUnwrapped) {
        toDoItem = item

        toDoSubItems = toDoItem.associatedSubItems
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
    
    func deleteItem(){
        if let toDoItemId = toDoItem.id {
            DatabaseRepository.shared.deleteItemById(toDoItemId)
        }
    }
}
