import SwiftUI

struct CircleCheckboxView: View {
    @Binding var isActive: Bool


    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(isActive ? ColorPalette.activeCheckboxBackground : ColorPalette.inactiveCheckboxBackground, lineWidth: isActive ? 0 : 3)
                .frame(width: 30, height: 30, alignment: .center)

            Image(systemName: "checkmark")
                .renderingMode(.template)
                .foregroundColor(ColorPalette.activeCheckboxBackground)
                .opacity(isActive ? 1 : 0)
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                isActive.toggle()
            }
        }
    }
}

struct CircleCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) { CircleCheckboxView(isActive: $0) }
    }
}
