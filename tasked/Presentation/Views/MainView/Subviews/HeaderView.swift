import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text(NSLocalizedString("ApplicationName", comment: ""))
            .font(Font.custom("TTFirsNeue-Bold", size: 32))
            .padding(.top, 40)
            .padding(.leading, 27)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
    }
}
