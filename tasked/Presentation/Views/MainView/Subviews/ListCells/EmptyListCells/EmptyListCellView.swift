import SwiftUI

struct EmptyListCellView: View {
    @StateObject private var viewModel: Self.ViewModel
    
    @Binding var isActive: Bool
    
    init(isActive: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: Self.ViewModel())

        _isActive = isActive
    }
    
    var body: some View {
        TextField(NSLocalizedString("NewItemDescription", comment: ""), text: $viewModel.enteredText, onCommit: {
            viewModel.addItem()

            withAnimation(.easeInOut(duration: 0.3)) {
                isActive = false
            }
        })
        .font(Font.custom("iAWriterQuattroS-Regular", size: 18))
        .opacity(isActive ? 1 : 0)
        .onAppear(perform: { viewModel.clearEnteredValue() })
    }
}

struct EmptyListCellView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(true) { EmptyListCellView(isActive: $0) }
    }
}
