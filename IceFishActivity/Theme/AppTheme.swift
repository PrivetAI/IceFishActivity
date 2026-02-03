import SwiftUI

struct AppTheme {
    // MARK: - Background Colors
    static let background = Color(hex: "0D1B2A")
    static let cardBackground = Color(hex: "1B2838")
    static let cardBackgroundLight = Color(hex: "243447")
    static let surface = Color(hex: "2C3E50")
    
    // MARK: - Activity Colors
    static let activityHigh = Color(hex: "4CAF50")      // Green - high activity
    static let activityMedium = Color(hex: "FFC107")    // Yellow - medium activity
    static let activityLow = Color(hex: "6B7280")       // Gray - low activity
    
    // MARK: - Primary Colors
    static let primary = Color(hex: "5DADE2")
    static let accent = Color(hex: "85C1E9")
    static let accentLight = Color(hex: "AED6F1")
    
    // MARK: - Status Colors
    static let success = Color(hex: "4CAF50")
    static let warning = Color(hex: "FF9800")
    static let danger = Color(hex: "F44336")
    
    // MARK: - Text Colors
    static let textPrimary = Color.white
    static let textSecondary = Color(hex: "B0BEC5")
    static let textMuted = Color(hex: "78909C")
    
    // MARK: - Gradients
    static let backgroundGradient = LinearGradient(
        colors: [Color(hex: "0D1B2A"), Color(hex: "1B2838")],
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let cardGradient = LinearGradient(
        colors: [Color(hex: "1B2838"), Color(hex: "243447")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // MARK: - Spacing
    static let paddingSmall: CGFloat = 8
    static let paddingMedium: CGFloat = 16
    static let paddingLarge: CGFloat = 24
    static let paddingXLarge: CGFloat = 32
    
    // MARK: - Corner Radius
    static let cornerRadiusSmall: CGFloat = 8
    static let cornerRadiusMedium: CGFloat = 12
    static let cornerRadiusLarge: CGFloat = 20
    static let cornerRadiusXLarge: CGFloat = 28
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 255, 255, 255)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
