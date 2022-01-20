import Foundation

extension MainView{
    class ViewModel: ObservableObject{
        @Published var isNewItemCellDisplaying: Bool = false
    }
}
