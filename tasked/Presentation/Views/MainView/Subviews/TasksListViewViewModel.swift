import CoreData
import Foundation
import SwiftUI

extension TasksListView {
    class ViewModel: ObservableObject {
        @Published private(set) var toDoItems: [ToDoListItemUnwrapped] = []

        
    }
}
