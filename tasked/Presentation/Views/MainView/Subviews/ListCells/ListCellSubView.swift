import SwiftUI

struct ListCellSubView: View {
    var displayingSubItem:ToDoListSubItemUnwrapped
    
    @State var isActive = false
    
    var body: some View {
        HStack{
            CircleCheckboxView(isActive: $isActive)
            
            TaskTextView(taskText: displayingSubItem.task!, isActive: $isActive)
                .padding(.leading, 16)
            
            Spacer()
        }.onTapGesture {
            isActive.toggle()
        }
        .padding(.top, 9)
        .padding(.bottom, 9)
    }
}

struct ListCellSubView_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()
        
        HStack(alignment: .center){
            ListCellSubView(displayingSubItem: mockData.associatedSubItems![0])
                .previewLayout(.sizeThatFits)
        }
    }
}