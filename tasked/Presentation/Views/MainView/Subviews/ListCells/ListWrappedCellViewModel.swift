import CoreData
import Foundation

extension ListWrappedCellView {
    class ViewModel: ObservableObject {
        @Published var toDoItem: ToDoListItemUnwrapped{
            didSet{
                toDoSubItems = toDoItem.associatedSubItems
            }
        }

        @Published private(set) var toDoSubItems: [ToDoListSubItemUnwrapped]?

        @Published var isNewItemCellDisplaying: Bool = false

        init(toDoItem: ToDoListItemUnwrapped) {
            self.toDoItem = toDoItem
            
            self.toDoSubItems = toDoItem.associatedSubItems
        }

        func toggleItem() {
            if let toDoItemId = toDoItem.id {
                if let itemToToggle = DatabaseRepository.shared.getToDoListItemById(id: toDoItemId) {
                    DatabaseRepository.shared.updateItem(item: itemToToggle, updatedState: !itemToToggle.isDone)
                }
            }
        }
    }
}
