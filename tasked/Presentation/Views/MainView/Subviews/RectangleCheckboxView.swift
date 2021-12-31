import SwiftUI

struct RectangleCheckboxView: View {
    @State var isActive: Bool = false
    
    @State private var backgroundColor = ColorPalette.background
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(backgroundColor)
                .frame(width: 30, height: 30, alignment: .center)
            
            Image(systemName: "checkmark")
                .renderingMode(.template)
                .foregroundColor(.white)
                .opacity(isActive ? 1 : 0)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                isActive.toggle()
                
                backgroundColor = (isActive ? ColorPalette.activeCheckboxBackground : ColorPalette.inactiveCheckboxBackground)
            }
        }
    }
}

struct RectangleCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCheckboxView()
            .previewLayout(.sizeThatFits)
    }
}