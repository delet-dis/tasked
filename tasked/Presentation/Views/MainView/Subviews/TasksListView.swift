import SwiftUI

struct TasksListView: View {
    @StateObject private var viewModel = Self.ViewModel()
    
    var body: some View {
        LazyVStack{
            ForEach(viewModel.toDoItemsWrapped){toDoItem in
                VStack {
                    ListCellViewCombined(wrappedItem: toDoItem)
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
