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
            }
            .padding(.bottom, 12)
            .padding(.top, 12)

            VStack {
                if let associatedItems = viewModel.toDoItem.associatedSubItems {
                    ForEach(associatedItems, id: \.self) { subItem in
                        ListCellSubView(displayingSubItem: subItem, isActive: subItem.isDone)
                            .padding(.bottom, 12)
                            .padding(.top, 12)
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(.leading, 64)
            .padding(.top, -5)
        }
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
