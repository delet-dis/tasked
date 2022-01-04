import CoreData
import Foundation

extension ListCellViewCombined {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItem: ToDoListItemUnwrapped
        
        private let toDoItemWrapped: ToDoListItem

        init(toDoItemWrapped: ToDoListItem) {
            self.toDoItemWrapped = toDoItemWrapped
            
            self.toDoItem = toDoItemWrapped.unwrapped()
        }
        
        func toggleItem(){
            DatabaseRepository.shared.updateItem(item: toDoItemWrapped, updatedState: !toDoItem.isDone)
        }
    }
}
