import Foundation

class EmptyListCellSubViewModel: ObservableObject {
    @Published var enteredText: String = ""

    @Published private(set) var toDoItem: ToDoListItemUnwrapped
    
    @Published var isActive: Bool

    init(toDoItem: ToDoListItemUnwrapped, isActive: Bool) {
        self.toDoItem = toDoItem
        self.isActive = isActive
    }

    func addSubItemToItem() {
        if !enteredText.isEmpty {
            if let toDoItemId = toDoItem.id {
                if let item = DatabaseRepository.shared.getToDoListItemById(toDoItemId) {
                    DatabaseRepository.shared.createToDoListSubItem(enteredText, itemToAttach: item)
                }
            }

            clearEnteredValue()
        }
    }

    func clearEnteredValue() {
        enteredText = ""
    }
}
