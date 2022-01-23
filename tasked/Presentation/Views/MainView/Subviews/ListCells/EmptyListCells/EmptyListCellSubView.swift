import SwiftUI

struct EmptyListCellSubView: View {
    @ObservedObject private var viewModel: EmptyListCellSubViewModel

    init(viewModel: EmptyListCellSubViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        TextField(NSLocalizedString("NewSubItemDescription", comment: ""), text: $viewModel.enteredText, onCommit: {
            viewModel.addSubItemToItem()

            withAnimation(.easeInOut(duration: 0.3)) {
                viewModel.isActive = false
            }
        })
        .font(Font.custom("iAWriterQuattroS-Regular", size: 18))
        .opacity(viewModel.isActive ? 1 : 0)
        .onAppear(perform: { viewModel.clearEnteredValue() })
    }
}

struct EmptyListCellSubView_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()
        
        EmptyListCellSubView(viewModel: EmptyListCellSubViewModel(toDoItem: mockData[0], isActive: true))
    }
}
