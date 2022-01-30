import SwiftUI

struct TasksListView: View {
    @ObservedObject var viewModel: TaskListViewModel

    init(viewModel: TaskListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(0 ..< viewModel.listWrappedCellViewModels.count, id: \.self) { viewModelIndex in
                VStack {
                    if let processingViewModel = viewModel.listWrappedCellViewModels[viewModelIndex] {
                        ListWrappedCellView(viewModel: processingViewModel)
                    }
                }
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView(viewModel: TaskListViewModel())
    }
}
