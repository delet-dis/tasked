import Foundation

class EmptyListCellViewModel: ObservableObject {
    @Published var enteredText: String = ""
    
    @Published var isActive: Bool = false

    func addItem() {
        DatabaseRepository.shared.createToDoListItem(enteredText)
    }

    func clearEnteredValue() {
        enteredText = ""
    }
}
