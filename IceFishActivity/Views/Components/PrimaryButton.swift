import SwiftUI

struct PrimaryButton: View {
    let title: String
    var icon: AnyView? = nil
    var style: ButtonStyle = .filled
    var action: () -> Void
    
    enum ButtonStyle {
        case filled
        case outlined
        case text
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppTheme.paddingSmall) {
                if let icon = icon {
                    icon
                }
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, AppTheme.paddingMedium)
            .padding(.horizontal, AppTheme.paddingLarge)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(AppTheme.cornerRadiusMedium)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium)
                    .stroke(borderColor, lineWidth: style == .outlined ? 2 : 0)
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private var backgroundColor: Color {
        switch style {
        case .filled: return AppTheme.primary
        case .outlined: return Color.clear
        case .text: return Color.clear
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .filled: return AppTheme.background
        case .outlined: return AppTheme.primary
        case .text: return AppTheme.primary
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .outlined: return AppTheme.primary
        default: return Color.clear
        }
    }
}

struct ScaleButtonStyle: SwiftUI.ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct SecondaryButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .padding(.vertical, AppTheme.paddingSmall)
                .padding(.horizontal, AppTheme.paddingMedium)
                .background(AppTheme.cardBackground)
                .foregroundColor(AppTheme.textSecondary)
                .cornerRadius(AppTheme.cornerRadiusSmall)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct IconButton: View {
    let icon: AnyView
    var size: CGFloat = 44
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            icon
                .frame(width: size, height: size)
                .background(AppTheme.cardBackground)
                .cornerRadius(AppTheme.cornerRadiusSmall)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}
