import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: FishActivityViewModel
    @State private var showFishSelection = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    headerSection
                    
                    ScrollView {
                        VStack(spacing: AppTheme.paddingLarge) {
                            // Season info
                            seasonCard
                            
                            // Activity graph
                            graphSection
                            
                            // Selected fish list
                            if !viewModel.selectedFish.isEmpty {
                                selectedFishSection
                            }
                            
                            // Empty state
                            if viewModel.selectedFish.isEmpty {
                                emptyStateView
                            }
                            
                            // Select fish button
                            selectFishButton
                        }
                        .padding(AppTheme.paddingMedium)
                        .padding(.bottom, 80)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showFishSelection) {
                FishSelectionView(viewModel: viewModel)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 4) {
            Text(viewModel.formattedDate)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(AppTheme.textPrimary)
            
            HStack(spacing: 6) {
                SeasonIcon(size: 16, color: AppTheme.primary)
                Text(viewModel.currentSeason.rawValue)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(AppTheme.primary)
                
                if viewModel.isManualSeason {
                    Text("(manual)")
                        .font(.system(size: 12))
                        .foregroundColor(AppTheme.textMuted)
                }
            }
        }
        .padding(.top, AppTheme.paddingLarge)
        .padding(.bottom, AppTheme.paddingMedium)
    }
    
    // MARK: - Season Card
    private var seasonCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.currentSeason.description)
                .font(.system(size: 13))
                .foregroundColor(AppTheme.textSecondary)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
    
    // MARK: - Graph Section
    private var graphSection: some View {
        VStack(spacing: AppTheme.paddingMedium) {
            HStack {
                Text("Activity Today")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(AppTheme.textPrimary)
                Spacer()
                ActivityLegend()
            }
            
            ZStack {
                ActivityGraphView(activities: viewModel.getHourlyActivities())
                CurrentTimeIndicator()
                    .frame(height: 100)
                    .padding(.horizontal, 4)
                    .offset(y: -14)
            }
        }
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusLarge)
    }
    
    // MARK: - Selected Fish Section
    private var selectedFishSection: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingSmall) {
            Text("Selected Fish (\(viewModel.selectedFish.count))")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
                .padding(.horizontal, 4)
            
            ForEach(viewModel.selectedFish) { fish in
                NavigationLink(destination: FishProfileView(fish: fish, viewModel: viewModel)) {
                    FishRowView(fish: fish, isSelected: true, showChevron: true)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    // MARK: - Empty State
    private var emptyStateView: some View {
        VStack(spacing: AppTheme.paddingMedium) {
            FishIcon(size: 48, color: AppTheme.textMuted)
            
            Text("No Fish Selected")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
            
            Text("Select fish species to see their activity patterns throughout the day")
                .font(.system(size: 14))
                .foregroundColor(AppTheme.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(AppTheme.paddingXLarge)
        .frame(maxWidth: .infinity)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusLarge)
    }
    
    // MARK: - Select Fish Button
    private var selectFishButton: some View {
        PrimaryButton(
            title: "Select Fish",
            icon: AnyView(FishIcon(size: 20, color: AppTheme.background)),
            action: { showFishSelection = true }
        )
    }
}
