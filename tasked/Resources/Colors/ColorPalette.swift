import SwiftUI

final class ColorPalette {
    static var background: Color {
        Color(.sRGB, red: 12/255, green: 12/255, blue: 12/255, opacity: 1)
    }

    static var activeCheckboxBackground: Color {
        Color(.sRGB, red: 255/255, green: 90/255, blue: 96/255, opacity: 1)
    }

    static var inactiveCheckboxBackground: Color {
        background
    }
}
