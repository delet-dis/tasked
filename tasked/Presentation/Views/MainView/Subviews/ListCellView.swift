import SwiftUI

struct ListCellView: View {
    var displayingItem: ToDoListItemUnwrapped
    
    @State var isActive = false

    var body: some View {
        HStack{
            RectangleCheckboxView(isActive: $isActive)
            
            TaskTextView(taskText: displayingItem.task!, isActive: $isActive)
                .padding(.leading, 16)
            
            Spacer()
        }.onTapGesture {
            isActive.toggle()
        }
        .padding(.top, 17)
        .padding(.bottom, 17)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()

        ListCellView(displayingItem: mockData.item)
                .previewLayout(.sizeThatFits)
    }
}
