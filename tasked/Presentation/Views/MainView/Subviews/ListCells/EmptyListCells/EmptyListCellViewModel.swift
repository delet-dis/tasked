import Foundation

extension EmptyListCellView{
    class ViewModel: ObservableObject{
        @Published var enteredText: String = ""
        
        func addItem(){
            DatabaseRepository.shared.createToDoListItem(enteredText)
        }
        
        func clearEnteredValue(){
            enteredText = ""
        }
    }
}
