import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FishActivityViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Tab content
            Group {
                switch selectedTab {
                case 0:
                    MainView(viewModel: viewModel)
                case 1:
                    NavigationView {
                        ZStack {
                            AppTheme.background
                                .ignoresSafeArea()
                            
                            VStack(spacing: 0) {
                                Text("All Fish")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(AppTheme.textPrimary)
                                    .padding(.top, AppTheme.paddingLarge)
                                    .padding(.bottom, AppTheme.paddingMedium)
                                
                                ScrollView {
                                    LazyVStack(spacing: AppTheme.paddingSmall) {
                                        ForEach(viewModel.allFish) { fish in
                                            NavigationLink(
                                                destination: FishProfileView(fish: fish, viewModel: viewModel)
                                            ) {
                                                FishRowView(
                                                    fish: fish,
                                                    isSelected: viewModel.isSelected(fish),
                                                    showChevron: true,
                                                    onToggle: { viewModel.toggleFish(fish) }
                                                )
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                    .padding(.horizontal, AppTheme.paddingMedium)
                                    .padding(.bottom, 100)
                                }
                            }
                        }
                        .navigationBarHidden(true)
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                case 2:
                    SeasonsView(viewModel: viewModel)
                case 3:
                    FavoritesView(viewModel: viewModel)
                default:
                    MainView(viewModel: viewModel)
                }
            }
            
            // Custom tab bar
            customTabBar
        }
    }
    
    private var customTabBar: some View {
        HStack(spacing: 0) {
            tabButton(index: 0, icon: AnyView(HomeIcon(size: 24, color: selectedTab == 0 ? AppTheme.primary : AppTheme.textMuted)), title: "Home")
            tabButton(index: 1, icon: AnyView(FishIcon(size: 24, color: selectedTab == 1 ? AppTheme.primary : AppTheme.textMuted)), title: "Fish")
            tabButton(index: 2, icon: AnyView(SeasonIcon(size: 24, color: selectedTab == 2 ? AppTheme.primary : AppTheme.textMuted)), title: "Seasons")
            tabButton(index: 3, icon: AnyView(StarIcon(size: 24, color: selectedTab == 3 ? AppTheme.primary : AppTheme.textMuted, filled: selectedTab == 3)), title: "Favorites")
        }
        .padding(.top, AppTheme.paddingMedium)
        .padding(.bottom, AppTheme.paddingLarge)
        .background(
            AppTheme.cardBackground
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: -5)
        )
    }
    
    private func tabButton(index: Int, icon: AnyView, title: String) -> some View {
        Button(action: { selectedTab = index }) {
            VStack(spacing: 4) {
                icon
                Text(title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(selectedTab == index ? AppTheme.primary : AppTheme.textMuted)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
