import SwiftUI

struct RectangleCheckboxView: View {
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(isActive ? ColorPalette.activeCheckboxBackground : ColorPalette.inactiveCheckboxBackground)
                .frame(width: 30, height: 30, alignment: .center)

            Image(systemName: "checkmark")
                .renderingMode(.template)
                .foregroundColor(.white)
                .opacity(isActive ? 1 : 0)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                isActive.toggle()
            }
        }
    }
}

struct RectangleCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) { RectangleCheckboxView(isActive: $0) }
    }
}
