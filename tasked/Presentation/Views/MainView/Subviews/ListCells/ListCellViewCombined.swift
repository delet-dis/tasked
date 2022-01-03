import SwiftUI

struct ListCellViewCombined: View {
    var item: ToDoListItemUnwrapped

    var body: some View {
        VStack {
            VStack {
                ListCellView(displayingItem: item, isActive: item.isDone)
                    .padding(.leading, 24)
                    .padding(.bottom, 12)
                    .padding(.top, 12)

                VStack {
                    if let associatedItems = item.associatedSubItems {
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
            
            .background((item.associatedSubItems ?? []).capacity > 0 ? ColorPalette.activeListCellBackground : ColorPalette.inactiveListCellBackground)
        }
    }
}

struct ListCellViewCombined_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = getMockListCellViewData()

        ListCellViewCombined(item: mockData[0])
            .previewLayout(.sizeThatFits)
    }
}
