import SwiftUI

struct MainView: View {
    @State private var todo: String = ""
    
    @EnvironmentObject var viewModel: MainViewModel
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "TTFirsNeue-Bold", size: 32)!]
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    TasksListView(viewModel: viewModel.tasksListViewModel)
                        .navigationTitle(NSLocalizedString("ApplicationName", comment: ""))
                        .padding(.bottom, viewModel.isNewItemCellDisplaying ? 0 : 90)
                    
                    if viewModel.isNewItemCellDisplaying {
                        EmptyListCellView(viewModel: viewModel.emptyListCellViewModel, isActive: $viewModel.isNewItemCellDisplaying)
                            .padding(.top, 10)
                            .padding(.bottom, 90)
                            .padding(.leading, 25)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                viewModel.isNewItemCellDisplaying.toggle()
                            }
                        } label: {
                            Image(systemName: "plus")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .foregroundColor(ColorPalette.plusFabButtonColor)
                                .rotationEffect(.degrees(viewModel.isNewItemCellDisplaying ? -45 : 0))
                        }
                        .background(ColorPalette.plusFabButtonBackgroundColor)
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
