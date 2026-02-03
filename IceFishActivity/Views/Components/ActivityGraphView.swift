import SwiftUI

struct ActivityGraphView: View {
    let activities: [ActivityLevel]
    var showLabels: Bool = true
    var compact: Bool = false
    
    private let hourLabels = ["00", "03", "06", "09", "12", "15", "18", "21"]
    
    var body: some View {
        VStack(spacing: compact ? 4 : 8) {
            // Graph bars
            HStack(spacing: compact ? 1 : 2) {
                ForEach(0..<24, id: \.self) { hour in
                    VStack(spacing: 2) {
                        Rectangle()
                            .fill(colorForActivity(activities[hour]))
                            .frame(height: heightForActivity(activities[hour]))
                            .cornerRadius(compact ? 2 : 3)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(height: compact ? 60 : 100)
            .padding(.horizontal, 4)
            
            // Hour labels
            if showLabels {
                HStack {
                    ForEach(hourLabels, id: \.self) { label in
                        Text(label)
                            .font(.system(size: compact ? 9 : 11, weight: .medium))
                            .foregroundColor(AppTheme.textMuted)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
    }
    
    private func colorForActivity(_ activity: ActivityLevel) -> Color {
        switch activity {
        case .high: return AppTheme.activityHigh
        case .medium: return AppTheme.activityMedium
        case .low: return AppTheme.activityLow
        }
    }
    
    private func heightForActivity(_ activity: ActivityLevel) -> CGFloat {
        let maxHeight: CGFloat = compact ? 60 : 100
        switch activity {
        case .high: return maxHeight
        case .medium: return maxHeight * 0.6
        case .low: return maxHeight * 0.25
        }
    }
}

struct ActivityLegend: View {
    var body: some View {
        HStack(spacing: AppTheme.paddingLarge) {
            legendItem(color: AppTheme.activityHigh, text: "High")
            legendItem(color: AppTheme.activityMedium, text: "Medium")
            legendItem(color: AppTheme.activityLow, text: "Low")
        }
    }
    
    private func legendItem(color: Color, text: String) -> some View {
        HStack(spacing: 6) {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text(text)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(AppTheme.textSecondary)
        }
    }
}

struct CurrentTimeIndicator: View {
    var body: some View {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        let minute = calendar.component(.minute, from: Date())
        let progress = (Double(hour) + Double(minute) / 60.0) / 24.0
        
        GeometryReader { geometry in
            Rectangle()
                .fill(AppTheme.danger)
                .frame(width: 2)
                .offset(x: geometry.size.width * CGFloat(progress))
        }
    }
}
