import SwiftUI

struct CircleCheckboxView: View {
    @State var isActive: Bool = false
    
    @State private var backgroundColor = ColorPalette.background
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(backgroundColor, lineWidth: isActive ? 0 : 3)
                .frame(width: 30, height: 30, alignment: .center)
                
            Image(systemName: "checkmark")
                .renderingMode(.template)
                .foregroundColor(ColorPalette.activeCheckboxBackground)
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

struct CircleCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CircleCheckboxView()
            .previewLayout(.sizeThatFits)
    }
}
