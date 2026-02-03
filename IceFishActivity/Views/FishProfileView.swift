import SwiftUI

struct FishProfileView: View {
    let fish: Fish
    @ObservedObject var viewModel: FishActivityViewModel
    @Environment(\.presentationMode) var presentationMode
    
    private var isSelected: Bool {
        viewModel.isSelected(fish)
    }
    
    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                headerView
                
                ScrollView {
                    VStack(spacing: AppTheme.paddingLarge) {
                        // Fish info card
                        infoCard
                        
                        // Activity graph
                        activityCard
                        
                        // Activity notes
                        notesCard
                        
                        // All seasons preview
                        seasonsPreviewCard
                        
                        // Toggle button
                        toggleButton
                    }
                    .padding(AppTheme.paddingMedium)
                    .padding(.bottom, 80)
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private var headerView: some View {
        HStack {
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                ChevronIcon(size: 24, color: AppTheme.textPrimary, direction: .left)
            }
            
            Spacer()
            
            VStack(spacing: 2) {
                Text(fish.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(AppTheme.textPrimary)
                
                Text(fish.scientificName)
                    .font(.system(size: 12))
                    .foregroundColor(AppTheme.textMuted)
                    .italic()
            }
            
            Spacer()
            
            FishIcon(size: 24, color: isSelected ? AppTheme.primary : AppTheme.textMuted)
        }
        .padding(AppTheme.paddingMedium)
    }
    
    private var infoCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingSmall) {
            Text("About")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
            
            Text(fish.description)
                .font(.system(size: 14))
                .foregroundColor(AppTheme.textSecondary)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
    
    private var activityCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingMedium) {
            HStack {
                Text("Activity - \(viewModel.currentSeason.rawValue)")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppTheme.textPrimary)
                
                Spacer()
                
                ActivityLegend()
            }
            
            if let activities = fish.hourlyActivity[viewModel.currentSeason] {
                ActivityGraphView(activities: activities)
            }
        }
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusLarge)
    }
    
    private var notesCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingSmall) {
            Text("Why This Pattern?")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
            
            Text(fish.getActivityNote(for: viewModel.currentSeason))
                .font(.system(size: 14))
                .foregroundColor(AppTheme.textSecondary)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
    
    private var seasonsPreviewCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingMedium) {
            Text("All Seasons")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
            
            ForEach(Season.allCases) { season in
                VStack(alignment: .leading, spacing: 4) {
                    Text(season.rawValue)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(season == viewModel.currentSeason ? AppTheme.primary : AppTheme.textMuted)
                    
                    if let activities = fish.hourlyActivity[season] {
                        ActivityGraphView(activities: activities, showLabels: false, compact: true)
                    }
                }
            }
        }
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusLarge)
    }
    
    private var toggleButton: some View {
        PrimaryButton(
            title: isSelected ? "Remove from Selection" : "Add to Selection",
            style: isSelected ? .outlined : .filled,
            action: { viewModel.toggleFish(fish) }
        )
    }
}
