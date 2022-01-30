import SwiftUI

struct EmptyListCellSubView: View {
    @ObservedObject private var viewModel: EmptyListCellSubViewModel

    @Binding var isActive: Bool

    init(viewModel: EmptyListCellSubViewModel, isActive: Binding<Bool>) {
        self.viewModel = viewModel
        self._isActive = isActive
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
        StatefulPreviewWrapper(true) {
            EmptyListCellSubView(viewModel: EmptyListCellSubViewModel(toDoItem: mockData[0]), isActive: $0)
        }
    }
}
