import CoreData
import Foundation

extension ListWrappedCellView {
    class ViewModel: ObservableObject {
        @Published var toDoItem: ToDoListItemUnwrapped

        @Published private(set) var toDoSubItems: [ToDoListSubItemUnwrapped]?

        @Published var isNewItemCellDisplaying: Bool = false

        init(toDoItem: ToDoListItemUnwrapped) {
            self.toDoItem = toDoItem
            
            toDoSubItems = toDoItem.associatedSubItems
        }

        func updateItem(_ item: ToDoListItemUnwrapped){
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
        
        private func toggleSubItems(itemToToggle: ToDoListItem, toggleState: Bool){
            itemToToggle.getAssociatedSubTasks()?.forEach{
                DatabaseRepository.shared.updateItem($0, updatedState: toggleState)
            }
        }
    }
}
