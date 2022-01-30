import Foundation

class MainViewModel: ObservableObject {
    @Published private(set) var tasksListViewModel = TaskListViewModel()
    @Published private(set) var emptyListCellViewModel = EmptyListCellViewModel()

    @Published var isNewItemCellDisplaying: Bool = false
}
