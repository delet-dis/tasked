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
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded {
                                viewModel.toggleItem()
                            }
                    )

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
                if let viewModels = viewModel.listCellSubviewsViewModels {
                    ForEach(0 ..< viewModels.count, id: \.self) { viewModelIndex in
                        VStack {
                            if let processingViewModel = viewModel.listCellSubviewsViewModels[viewModelIndex] {
                                ListCellSubView(viewModel: processingViewModel)
                            }
                        }
                    }
                } else {
                    EmptyView()
                }

                if viewModel.isNewItemCellDisplaying {
                    EmptyListCellSubView(viewModel: viewModel.emptyListCellSubViewModel, isActive: $viewModel.isNewItemCellDisplaying)
                        .padding(.bottom, 12)
                }
            }
            .padding(.leading, 64)
            .padding(.top, -5)
        }
        .background((viewModel.toDoItem.associatedSubItems ?? []).capacity > 0 ? ColorPalette.activeListCellBackground : ColorPalette.inactiveListCellBackground)
        .onDelete {
            viewModel.deleteItem()
        }
    }

    struct ListCellViewCombined_Previews: PreviewProvider {
        static var previews: some View {
            let mockData = getMockListCellViewData()

            ListWrappedCellView(viewModel: ListWrappedCellViewModel(toDoItem: mockData[0]))
        }
    }
}
