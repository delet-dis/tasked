import Foundation

class ListCellSubViewModel: ObservableObject{
    @Published var displayingItem: ToDoListSubItemUnwrapped
    
    init(displayingItem: ToDoListSubItemUnwrapped) {
        self.displayingItem = displayingItem
    }
}
