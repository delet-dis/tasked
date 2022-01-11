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
    
    static var activeListCellBackground: Color{
        Color(.sRGB, red: 238/255, green: 238/255, blue: 238/255)
    }
    
    static var inactiveListCellBackground: Color{
        Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255)
    }
    
    static var plusButtonBackgroundColor: Color{
        background
    }
}
