import SwiftUI

struct SeasonsView: View {
    @ObservedObject var viewModel: FishActivityViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    Text("Seasons")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(AppTheme.textPrimary)
                        .padding(.top, AppTheme.paddingLarge)
                        .padding(.bottom, AppTheme.paddingMedium)
                    
                    ScrollView {
                        VStack(spacing: AppTheme.paddingLarge) {
                            // Season selector
                            seasonSelector
                            
                            // Current season info
                            seasonInfoCard
                            
                            // Activity preview
                            activityPreviewCard
                            
                            // Reset button
                            if viewModel.isManualSeason {
                                resetButton
                            }
                        }
                        .padding(AppTheme.paddingMedium)
                        .padding(.bottom, 100) // Extra padding for tab bar
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var seasonSelector: some View {
        VStack(spacing: AppTheme.paddingSmall) {
            ForEach(Season.allCases) { season in
                seasonButton(season)
            }
        }
    }
    
    private func seasonButton(_ season: Season) -> some View {
        Button(action: { viewModel.setSeason(season) }) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(season.rawValue)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(viewModel.currentSeason == season ? AppTheme.primary : AppTheme.textPrimary)
                    
                    Text(season.monthRange)
                        .font(.system(size: 12))
                        .foregroundColor(AppTheme.textMuted)
                }
                
                Spacer()
                
                if viewModel.currentSeason == season {
                    Circle()
                        .fill(AppTheme.primary)
                        .frame(width: 12, height: 12)
                }
                
                if !viewModel.isManualSeason && Season.current() == season {
                    Text("Current")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(AppTheme.success)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(AppTheme.success.opacity(0.2))
                        .cornerRadius(4)
                }
            }
            .padding(AppTheme.paddingMedium)
            .background(viewModel.currentSeason == season ? AppTheme.cardBackgroundLight : AppTheme.cardBackground)
            .cornerRadius(AppTheme.cornerRadiusMedium)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium)
                    .stroke(viewModel.currentSeason == season ? AppTheme.primary : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private var seasonInfoCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingSmall) {
            HStack {
                SeasonIcon(size: 20, color: AppTheme.primary)
                Text(viewModel.currentSeason.rawValue)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(AppTheme.textPrimary)
            }
            
            Text(viewModel.currentSeason.description)
                .font(.system(size: 14))
                .foregroundColor(AppTheme.textSecondary)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
    
    private var activityPreviewCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingMedium) {
            HStack {
                Text("Combined Activity")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppTheme.textPrimary)
                
                Spacer()
                
                if viewModel.selectedFish.isEmpty {
                    Text("No fish selected")
                        .font(.system(size: 12))
                        .foregroundColor(AppTheme.textMuted)
                } else {
                    Text("\(viewModel.selectedFish.count) fish")
                        .font(.system(size: 12))
                        .foregroundColor(AppTheme.primary)
                }
            }
            
            ActivityGraphView(activities: viewModel.getHourlyActivities())
            
            ActivityLegend()
                .frame(maxWidth: .infinity)
        }
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusLarge)
    }
    
    private var resetButton: some View {
        SecondaryButton(title: "Reset to Current Season") {
            viewModel.resetToCurrentSeason()
        }
    }
}
