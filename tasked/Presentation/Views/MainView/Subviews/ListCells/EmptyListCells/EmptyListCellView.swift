import SwiftUI

struct EmptyListCellView: View {
    @ObservedObject private var viewModel: EmptyListCellViewModel
    
    init(viewModel: EmptyListCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        TextField(NSLocalizedString("NewItemDescription", comment: ""), text: $viewModel.enteredText, onCommit: {
            viewModel.addItem()

            withAnimation(.easeInOut(duration: 0.3)) {
                viewModel.isActive = false
            }
        })
        .font(Font.custom("iAWriterQuattroS-Regular", size: 18))
        .opacity(viewModel.isActive ? 1 : 0)
        .onAppear(perform: { viewModel.clearEnteredValue() })
    }
}

struct EmptyListCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListCellView(viewModel: EmptyListCellViewModel())
    }
}
