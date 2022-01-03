import CoreData
import Foundation
import SwiftUI

extension TasksListView {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItems: [ToDoListItemUnwrapped] = []

        init(){
            initDastabaseChangesObserver()
        }
        
        func initDastabaseChangesObserver(){
            NotificationCenter.default.publisher(for: Notification.Name.NSManagedObjectContextObjectsDidChange, object: nil)
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: {_ in
                    self.toDoItems = DatabaseRepository.shared.getAllToDoListItemsUnwrapped() ?? []
                })
        }
        
        func managedObjectContextObjectsDidChange(notification: Notification){
            
        }
    }
}
