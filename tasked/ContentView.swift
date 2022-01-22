import SwiftUI

struct ContentView: View {
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        MainView()
            .environmentObject(mainViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
