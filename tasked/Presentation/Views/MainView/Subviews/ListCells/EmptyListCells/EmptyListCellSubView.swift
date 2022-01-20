import SwiftUI

struct EmptyListCellSubView: View {
    var item: ToDoListItemUnwrapped

    @StateObject private var viewModel: Self.ViewModel

    @Binding var isActive: Bool

    @State private var todo: String = ""

    init(item: ToDoListItemUnwrapped, isActive: Binding<Bool>) {
        self.item = item

        _viewModel = StateObject(wrappedValue: Self.ViewModel(toDoItem: item))

        _isActive = isActive
    }

    var body: some View {
        TextField(NSLocalizedString("NewSubItemDescription", comment: ""), text: $viewModel.enteredText, onCommit: {
            viewModel.addSubItemToItem()

            withAnimation(.easeInOut(duration: 0.3)) {
                isActive = false
            }
        })
        .font(Font.custom("iAWriterQuattroS-Regular", size: 18))
        .opacity(isActive ? 1 : 0)
        .onAppear(perform: { viewModel.clearEnteredValue() })
    }
}

struct EmptyListCellSubView_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()

        StatefulPreviewWrapper(true) { EmptyListCellSubView(item: mockData[0], isActive: $0) }
    }
}
