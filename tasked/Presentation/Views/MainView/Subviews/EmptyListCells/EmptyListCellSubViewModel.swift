import Foundation

extension EmptyListCellSubView {
    class ViewModel: ObservableObject {
        @Published var enteredText: String = ""

        @Published private(set) var toDoItem: ToDoListItemUnwrapped

        init(toDoItem: ToDoListItemUnwrapped) {
            self.toDoItem = toDoItem
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
        
        func clearEnteredValue(){
            enteredText = ""
        }
    }
}
