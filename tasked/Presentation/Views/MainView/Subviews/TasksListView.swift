import SwiftUI

struct TasksListView: View {
    @StateObject private var tasksListViewModel = Self.ViewModel()
    
    var body: some View {
        List{
            ForEach(tasksListViewModel.toDoItems, id: \.self){toDoItem in
                ListCellViewCombined(item: toDoItem)
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        TasksListView()
    }
}
