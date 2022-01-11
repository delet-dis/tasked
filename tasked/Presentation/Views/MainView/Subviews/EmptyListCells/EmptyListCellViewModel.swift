import Foundation

extension EmptyListCellView {
    class ViewModel: ObservableObject {
        @Published var enteredText: String = ""
    }
}
