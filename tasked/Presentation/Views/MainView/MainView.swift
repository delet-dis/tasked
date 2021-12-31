import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "TTFirsNeue-Bold", size: 32)!]
    }

    var body: some View {
        NavigationView {
            VStack{
                ListCellView(displayingItem: getMockListCellViewData().item)
                
                Spacer()
            }
            .padding()
            .padding(.leading, 27)
                .navigationTitle(NSLocalizedString("ApplicationName", comment: ""))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
