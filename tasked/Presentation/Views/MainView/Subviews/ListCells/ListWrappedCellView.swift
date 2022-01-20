import SwiftUI

struct ListWrappedCellView: View {
    var item: ToDoListItemUnwrapped

    @StateObject private var viewModel: Self.ViewModel

    init(item: ToDoListItemUnwrapped) {
        self.item = item

        _viewModel = StateObject(wrappedValue: Self.ViewModel(toDoItem: item))
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
                        .foregroundColor(ColorPalette.plusButtonBackgroundColor)
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
                    EmptyListCellSubView(item: item, isActive: $viewModel.isNewItemCellDisplaying)
                        .padding(.bottom, 12)
                        .onDisappear(perform: {
                            viewModel.updateItem(item)
                        })
                }
            }
            .padding(.leading, 64)
            .padding(.top, -5)
        }
        .animation(.default)
        .background((viewModel.toDoItem.associatedSubItems ?? []).capacity > 0 ? ColorPalette.activeListCellBackground : ColorPalette.inactiveListCellBackground)
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    viewModel.toggleItem()
                }
        )
    }

    struct ListCellViewCombined_Previews: PreviewProvider {
        static var previews: some View {
            let mockData = getMockListCellViewData()

            ListWrappedCellView(item: mockData[0])
        }
    }
}
