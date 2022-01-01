import Foundation

extension TasksListView{
    class ViewModel: ObservableObject{
        @Published private(set) var toDoItems: [ToDoListItemUnwrapped] = []
    }
}
