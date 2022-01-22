import Foundation

class MainViewModel: ObservableObject {
    @Published var tasksListViewModel = TaskListViewModel()
    @Published var emptyListCellViewModel = EmptyListCellViewModel()

    @Published var isNewItemCellDisplaying: Bool = false
}
