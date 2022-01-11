import SwiftUI

struct TasksListView: View {
    @StateObject private var viewModel = Self.ViewModel()
    
    var body: some View {
        LazyVStack{
            ForEach(viewModel.toDoItems){toDoItem in
                VStack {
                    ListWrappedCellView(item: toDoItem)
                }
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView()
    }
}
