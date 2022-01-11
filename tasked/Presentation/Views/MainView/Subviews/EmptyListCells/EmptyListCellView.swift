import SwiftUI

struct EmptyListCellView: View {
    @StateObject private var viewModel = Self.ViewModel()

    @Binding var isActive: Bool

    var body: some View {
        TextField(NSLocalizedString("NewSubItemDescription", comment: ""), text: $viewModel.enteredText)
        
//        Button {
//            withAnimation(.easeInOut(duration: 0.3)) {}
//        } label: {
//            Image(systemName: "plus")
//                .renderingMode(.template)
//                .resizable()
//                .foregroundColor(ColorPalette.plusButtonBackgroundColor)
//                .frame(width: 20, height: 20, alignment: .center)
//                .rotationEffect(.degrees(0))
//        }
//        .padding(.trailing, 24)
    }
}

struct EmptyListCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
