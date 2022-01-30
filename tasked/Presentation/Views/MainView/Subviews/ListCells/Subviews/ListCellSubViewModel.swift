import Foundation

class ListCellSubViewModel: ObservableObject {
    @Published var displayingItem: ToDoListSubItemUnwrapped {
        didSet {
            isActive = displayingItem.isDone
        }
    }

    @Published var isActive: Bool

    init(displayingItem: ToDoListSubItemUnwrapped) {
        self.displayingItem = displayingItem
        self.isActive = displayingItem.isDone
    }

    func toggleItem() {
        if let toDoSubItemId = displayingItem.id {
            if let itemToToggle = DatabaseRepository.shared.getToDoListSubItemById(toDoSubItemId) {
                let toggleState = !itemToToggle.isDone

                DatabaseRepository.shared.updateItem(itemToToggle, updatedState: toggleState)
            }
        }
    }
}
