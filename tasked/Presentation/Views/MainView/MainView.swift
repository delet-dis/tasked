import SwiftUI

struct MainView: View {
    @State private var todo: String = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "TTFirsNeue-Bold", size: 32)!]
    }

    var body: some View {
        NavigationView {
            ScrollView {
                    TasksListView()
                        .navigationTitle(NSLocalizedString("ApplicationName", comment: ""))
                    
                    TextField("Todo", text: $todo)
                    
                    Button("Save"){
                        DatabaseRepository.shared.createToDoListItem(todo)
                    }
                    
                    Spacer()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
