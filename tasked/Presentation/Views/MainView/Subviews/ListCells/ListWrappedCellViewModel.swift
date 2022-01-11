import CoreData
import Foundation
import SwiftUI

extension ListWrappedCellView {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItem: ToDoListItemUnwrapped

        init(toDoItem: ToDoListItemUnwrapped) {
            self.toDoItem = toDoItem
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
