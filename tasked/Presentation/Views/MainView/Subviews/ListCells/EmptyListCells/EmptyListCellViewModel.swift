import Foundation

class EmptyListCellViewModel: ObservableObject {
    @Published var enteredText: String = ""

    func addItem() {
        DatabaseRepository.shared.createToDoListItem(enteredText)
    }

    func clearEnteredValue() {
        enteredText = ""
    }
}
