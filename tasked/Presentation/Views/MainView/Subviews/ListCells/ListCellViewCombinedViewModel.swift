import CoreData
import Foundation

extension ListCellViewCombined {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItem: ToDoListItemUnwrapped
        
        private let toDoItemWrapped: ToDoListItem

        init(toDoItemWrapped: ToDoListItem) {
            self.toDoItemWrapped = toDoItemWrapped
            
            self.toDoItem = toDoItemWrapped.unwrapped()
            
            initDatabaseEntityChangesObserver()
        }

        private func initDatabaseEntityChangesObserver() {
            let observer = CoreDataContextObserver(context: DatabaseRepository.shared.viewContext)
            
            observer.observeObject(object: toDoItemWrapped){ object, state in
                self.toDoItem = (object as! ToDoListItem).unwrapped()
            }
        }
    
    }
}
