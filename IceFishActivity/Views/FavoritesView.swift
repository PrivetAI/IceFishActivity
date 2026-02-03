import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FishActivityViewModel
    @State private var showNewPresetSheet = false
    @State private var newPresetName = ""
    @State private var presetToDelete: FishPreset? = nil
    @State private var showDeleteConfirm = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    headerView
                    
                    ScrollView {
                        VStack(spacing: AppTheme.paddingMedium) {
                            // Current selection info
                            currentSelectionCard
                            
                            // Presets list
                            if viewModel.presets.isEmpty {
                                emptyStateView
                            } else {
                                presetsSection
                            }
                        }
                        .padding(AppTheme.paddingMedium)
                        .padding(.bottom, 100)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showNewPresetSheet) {
                newPresetSheet
            }
            .alert(isPresented: $showDeleteConfirm) {
                Alert(
                    title: Text("Delete Preset"),
                    message: Text("Are you sure you want to delete this preset?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let preset = presetToDelete {
                            viewModel.deletePreset(preset)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var headerView: some View {
        VStack(spacing: 4) {
            Text("Favorites")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(AppTheme.textPrimary)
            
            Text("Save and load fish presets")
                .font(.system(size: 14))
                .foregroundColor(AppTheme.textSecondary)
        }
        .padding(.top, AppTheme.paddingLarge)
        .padding(.bottom, AppTheme.paddingMedium)
    }
    
    private var currentSelectionCard: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingSmall) {
            Text("Current Selection")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
            
            if viewModel.selectedFish.isEmpty {
                Text("No fish selected")
                    .font(.system(size: 14))
                    .foregroundColor(AppTheme.textMuted)
            } else {
                Text(viewModel.selectedFish.map { $0.name }.joined(separator: ", "))
                    .font(.system(size: 14))
                    .foregroundColor(AppTheme.textSecondary)
                    .lineLimit(3)
            }
            
            if !viewModel.selectedFishIds.isEmpty {
                PrimaryButton(
                    title: "Save as Preset",
                    icon: AnyView(StarIcon(size: 18, color: AppTheme.background)),
                    action: { showNewPresetSheet = true }
                )
                .padding(.top, AppTheme.paddingSmall)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
    
    private var emptyStateView: some View {
        VStack(spacing: AppTheme.paddingMedium) {
            StarIcon(size: 48, color: AppTheme.textMuted, filled: false)
            
            Text("No Presets Yet")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
            
            Text("Save your frequently used fish combinations for quick access")
                .font(.system(size: 14))
                .foregroundColor(AppTheme.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(AppTheme.paddingXLarge)
        .frame(maxWidth: .infinity)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusLarge)
    }
    
    private var presetsSection: some View {
        VStack(alignment: .leading, spacing: AppTheme.paddingSmall) {
            Text("Saved Presets")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(AppTheme.textPrimary)
                .padding(.horizontal, 4)
            
            ForEach(viewModel.presets) { preset in
                presetRow(preset)
            }
        }
    }
    
    private func presetRow(_ preset: FishPreset) -> some View {
        HStack(spacing: AppTheme.paddingMedium) {
            StarIcon(size: 24, color: AppTheme.warning)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(preset.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(AppTheme.textPrimary)
                
                Text("\(preset.fishIds.count) fish")
                    .font(.system(size: 12))
                    .foregroundColor(AppTheme.textMuted)
            }
            
            Spacer()
            
            Button(action: { viewModel.loadPreset(preset) }) {
                Text("Load")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppTheme.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(AppTheme.primary.opacity(0.2))
                    .cornerRadius(6)
            }
            
            Button(action: {
                presetToDelete = preset
                showDeleteConfirm = true
            }) {
                TrashIcon(size: 20, color: AppTheme.danger)
            }
        }
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
    
    private var newPresetSheet: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: AppTheme.paddingLarge) {
                Text("Save Preset")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(AppTheme.textPrimary)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Preset Name")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(AppTheme.textSecondary)
                    
                    TextField("", text: $newPresetName)
                        .padding()
                        .background(AppTheme.cardBackground)
                        .foregroundColor(AppTheme.textPrimary)
                        .cornerRadius(AppTheme.cornerRadiusSmall)
                        .placeholder(when: newPresetName.isEmpty) {
                            Text("Enter name...")
                                .foregroundColor(AppTheme.textMuted)
                                .padding(.leading, 16)
                        }
                }
                
                Text("\(viewModel.selectedFish.count) fish will be saved")
                    .font(.system(size: 14))
                    .foregroundColor(AppTheme.textMuted)
                
                HStack(spacing: AppTheme.paddingMedium) {
                    PrimaryButton(
                        title: "Cancel",
                        style: .outlined,
                        action: { showNewPresetSheet = false }
                    )
                    
                    PrimaryButton(
                        title: "Save",
                        action: {
                            if !newPresetName.isEmpty {
                                viewModel.saveCurrentAsPreset(name: newPresetName)
                                newPresetName = ""
                                showNewPresetSheet = false
                            }
                        }
                    )
                }
            }
            .padding(AppTheme.paddingLarge)
        }
    }
}

// MARK: - Placeholder Extension
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
