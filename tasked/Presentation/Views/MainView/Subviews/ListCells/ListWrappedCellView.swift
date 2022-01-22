import SwiftUI

struct ListWrappedCellView: View {
    @ObservedObject private var viewModel: ListWrappedCellViewModel

    init(viewModel: ListWrappedCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack {
                ListCellView(displayingItem: viewModel.toDoItem, isActive: viewModel.toDoItem.isDone)
                    .padding(.leading, 24)

                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        viewModel.isNewItemCellDisplaying.toggle()
                    }
                } label: {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(ColorPalette.plusButtonColor)
                        .rotationEffect(.degrees(viewModel.isNewItemCellDisplaying ? -45 : 0))
                        .padding(.trailing, 24)
                }
            }
            .padding(.bottom, 12)
            .padding(.top, 12)

            VStack {
                if let associatedItems = viewModel.toDoSubItems {
                    ForEach(associatedItems, id: \.self) { subItem in
                        ListCellSubView(displayingSubItem: subItem, isActive: subItem.isDone)
                            .padding(.bottom, 12)
                            .padding(.top, 12)
                    }
                } else {
                    EmptyView()
                }

                if viewModel.isNewItemCellDisplaying {
                    EmptyListCellSubView(item: viewModel.toDoItem, isActive: $viewModel.isNewItemCellDisplaying)
                        .padding(.bottom, 12)
                }
            }
            .padding(.leading, 64)
            .padding(.top, -5)
        }
        .animation(.default)
        .background((viewModel.toDoItem.associatedSubItems ?? []).capacity > 0 ? ColorPalette.activeListCellBackground : ColorPalette.inactiveListCellBackground)
        .simultaneousGesture(
            TapGesture()
        )
    }

    struct ListCellViewCombined_Previews: PreviewProvider {
        static var previews: some View {
            let mockData = getMockListCellViewData()

            ListWrappedCellView(viewModel: ListWrappedCellViewModel(toDoItem: mockData[0]))
        }
    }
}
