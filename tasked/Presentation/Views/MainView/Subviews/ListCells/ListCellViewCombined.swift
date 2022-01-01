import SwiftUI

struct ListCellViewCombined: View {
    var item: ToDoListItemUnwrapped

    var body: some View {
        VStack {
            ListCellView(displayingItem: item, isActive: item.isDone)
                .padding(.leading, 24)

            VStack {
                if let associatedItems = item.associatedSubItems {
                    ForEach(associatedItems, id: \.self){ subItem in
                        ListCellSubView(displayingSubItem: subItem, isActive: subItem.isDone)
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(.leading, 64)
            .padding(.top, -5)
        }
    }
}

struct ListCellViewCombined_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()

        ListCellViewCombined(item: mockData)
            .previewLayout(.sizeThatFits)
    }
}
