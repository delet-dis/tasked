import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "TTFirsNeue-Bold", size: 32)!]
    }

    var body: some View {
        NavigationView {
            VStack {
                ListCellViewCombined(item: getMockListCellViewData())
                    .navigationTitle(NSLocalizedString("ApplicationName", comment: ""))
                
                Spacer()
            }.padding(.top, 20)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
