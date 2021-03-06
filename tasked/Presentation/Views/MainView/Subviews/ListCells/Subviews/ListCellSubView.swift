import SwiftUI

struct ListCellSubView: View {
    @ObservedObject private var viewModel: ListCellSubViewModel
    
    init(viewModel: ListCellSubViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            CircleCheckboxView(isActive: $viewModel.isActive)
            
            TaskTextView(taskText: viewModel.displayingItem.task, isActive: $viewModel.isActive)
                .padding(.leading, 16)
                
            Spacer()
        }
        .padding(.bottom, 12)
        .padding(.top, 12)
        .onDelete {
            viewModel.deleteItem()
        }
        .onTapGesture {
            viewModel.toggleItem()
        }
        .animation(.default)
    }
}

struct ListCellSubView_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()
        
        ListCellSubView(viewModel: ListCellSubViewModel(displayingItem: mockData[0].associatedSubItems![0]))
            .previewLayout(.sizeThatFits)
    }
}
