import SwiftUI

struct RectangleCheckboxView: View {
    @State var isActive: Bool = false
    
    @State private var backgroundColor = ColorPalette.background
    @State private var isCheckboxImageDisplaying = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(backgroundColor)
                .frame(width: 30, height: 30, alignment: .center)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isActive.toggle()
                        
                        backgroundColor = (isActive ? ColorPalette.activeCheckboxBackground : ColorPalette.inactiveCheckboxBackground)
                        isCheckboxImageDisplaying.toggle()
                    }
                }
            
            Image(systemName: "checkmark")
                .renderingMode(.template)
                .foregroundColor(.white)
                .opacity(isCheckboxImageDisplaying ? 1 : 0)
        }
    }
}

struct RectangleCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCheckboxView()
            .previewLayout(.sizeThatFits)
    }
}
