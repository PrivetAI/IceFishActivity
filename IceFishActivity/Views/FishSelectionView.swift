import SwiftUI

struct FishSelectionView: View {
    @ObservedObject var viewModel: FishActivityViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    
    private var filteredFish: [Fish] {
        if searchText.isEmpty {
            return viewModel.allFish
        }
        return viewModel.allFish.filter { 
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.scientificName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    headerView
                    
                    // Search bar
                    searchBar
                    
                    // Fish list
                    ScrollView {
                        LazyVStack(spacing: AppTheme.paddingSmall) {
                            ForEach(filteredFish) { fish in
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
                        .padding(.bottom, AppTheme.paddingLarge)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var headerView: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                ChevronIcon(size: 24, color: AppTheme.textPrimary, direction: .left)
            }
            
            Spacer()
            
            Text("Select Fish")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(AppTheme.textPrimary)
            
            Spacer()
            
            Text("\(viewModel.selectedFishIds.count)")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.primary)
                .frame(width: 30)
        }
        .padding(AppTheme.paddingMedium)
    }
    
    private var searchBar: some View {
        HStack(spacing: AppTheme.paddingSmall) {
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    Text("Search fish...")
                        .foregroundColor(AppTheme.textMuted)
                        .padding(.leading, 8)
                }
                TextField("", text: $searchText)
                    .foregroundColor(AppTheme.textPrimary)
                    .padding(.horizontal, 8)
            }
            .padding(.vertical, 10)
            .background(AppTheme.cardBackground)
            .cornerRadius(AppTheme.cornerRadiusSmall)
        }
        .padding(.horizontal, AppTheme.paddingMedium)
        .padding(.bottom, AppTheme.paddingSmall)
    }
}
