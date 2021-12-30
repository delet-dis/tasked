import SwiftUI

struct ListCellView: View {
    var displayingItem: ToDoListItemUnwrapped
    
    var displayingSubItems: [ToDoListSubItemUnwrapped]
    
    var body: some View {
        VStack{
            
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()
        
        ListCellView(displayingItem: mockData.item, displayingSubItems: mockData.subItems)
            .previewLayout(.sizeThatFits)
    }
}
