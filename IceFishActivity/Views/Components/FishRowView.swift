import SwiftUI

struct FishRowView: View {
    let fish: Fish
    let isSelected: Bool
    var showChevron: Bool = true
    var onToggle: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: AppTheme.paddingMedium) {
            // Fish icon
            FishIcon(size: 28, color: isSelected ? AppTheme.primary : AppTheme.textMuted)
            
            // Fish info
            VStack(alignment: .leading, spacing: 2) {
                Text(fish.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(AppTheme.textPrimary)
                
                Text(fish.scientificName)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(AppTheme.textMuted)
                    .italic()
            }
            
            Spacer()
            
            // Selection indicator
            if let onToggle = onToggle {
                Button(action: onToggle) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(isSelected ? AppTheme.primary : AppTheme.textMuted, lineWidth: 2)
                            .frame(width: 24, height: 24)
                        
                        if isSelected {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(AppTheme.primary)
                                .frame(width: 18, height: 18)
                            
                            CheckIcon(size: 16, color: AppTheme.background)
                        }
                    }
                }
                .buttonStyle(ScaleButtonStyle())
            }
            
            if showChevron {
                ChevronIcon(size: 20, color: AppTheme.textMuted)
            }
        }
        .padding(AppTheme.paddingMedium)
        .background(AppTheme.cardBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
}

struct FishListHeader: View {
    let title: String
    var count: Int? = nil
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(AppTheme.textSecondary)
            
            if let count = count {
                Text("(\(count))")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(AppTheme.textMuted)
            }
            
            Spacer()
        }
        .padding(.horizontal, AppTheme.paddingMedium)
        .padding(.top, AppTheme.paddingMedium)
    }
}
