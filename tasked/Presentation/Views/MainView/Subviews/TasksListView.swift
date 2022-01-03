import SwiftUI

struct TasksListView: View {
    @StateObject private var tasksListViewModel = Self.ViewModel()
    
    var body: some View {
        LazyVStack{
            ForEach(tasksListViewModel.toDoItems){toDoItem in
                VStack {
                    ListCellViewCombined(item: toDoItem)
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
