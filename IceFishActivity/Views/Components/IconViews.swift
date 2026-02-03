import SwiftUI

// MARK: - Tab Icons

struct HomeIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.textPrimary
    
    var body: some View {
        ZStack {
            // House shape
            Path { path in
                let width = size
                let height = size
                
                // Roof
                path.move(to: CGPoint(x: width * 0.5, y: 0))
                path.addLine(to: CGPoint(x: width, y: height * 0.4))
                path.addLine(to: CGPoint(x: 0, y: height * 0.4))
                path.closeSubpath()
                
                // Body
                path.move(to: CGPoint(x: width * 0.15, y: height * 0.4))
                path.addLine(to: CGPoint(x: width * 0.15, y: height))
                path.addLine(to: CGPoint(x: width * 0.85, y: height))
                path.addLine(to: CGPoint(x: width * 0.85, y: height * 0.4))
                path.closeSubpath()
            }
            .fill(color)
        }
        .frame(width: size, height: size)
    }
}

struct FishIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.textPrimary
    
    var body: some View {
        ZStack {
            // Fish body
            Ellipse()
                .fill(color)
                .frame(width: size * 0.7, height: size * 0.45)
            
            // Tail
            Path { path in
                let tailStart = size * 0.35
                path.move(to: CGPoint(x: tailStart, y: size * 0.5))
                path.addLine(to: CGPoint(x: 0, y: size * 0.25))
                path.addLine(to: CGPoint(x: 0, y: size * 0.75))
                path.closeSubpath()
            }
            .fill(color)
            .offset(x: -size * 0.15)
            
            // Eye
            Circle()
                .fill(AppTheme.background)
                .frame(width: size * 0.12, height: size * 0.12)
                .offset(x: size * 0.15, y: -size * 0.05)
        }
        .frame(width: size, height: size)
    }
}

struct SeasonIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.textPrimary
    
    var body: some View {
        ZStack {
            // Snowflake-like pattern
            ForEach(0..<6) { i in
                Rectangle()
                    .fill(color)
                    .frame(width: size * 0.08, height: size * 0.8)
                    .rotationEffect(.degrees(Double(i) * 30))
            }
            
            Circle()
                .fill(color)
                .frame(width: size * 0.25, height: size * 0.25)
        }
        .frame(width: size, height: size)
    }
}

struct StarIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.textPrimary
    var filled: Bool = true
    
    var body: some View {
        ZStack {
            Path { path in
                let center = CGPoint(x: size / 2, y: size / 2)
                let outerRadius = size / 2
                let innerRadius = size / 4
                let points = 5
                
                for i in 0..<(points * 2) {
                    let radius = i % 2 == 0 ? outerRadius : innerRadius
                    let angle = (Double(i) * .pi / Double(points)) - .pi / 2
                    let point = CGPoint(
                        x: center.x + CGFloat(cos(angle)) * radius,
                        y: center.y + CGFloat(sin(angle)) * radius
                    )
                    if i == 0 {
                        path.move(to: point)
                    } else {
                        path.addLine(to: point)
                    }
                }
                path.closeSubpath()
            }
            .fill(filled ? color : Color.clear)
            .overlay(
                Path { path in
                    let center = CGPoint(x: size / 2, y: size / 2)
                    let outerRadius = size / 2
                    let innerRadius = size / 4
                    let points = 5
                    
                    for i in 0..<(points * 2) {
                        let radius = i % 2 == 0 ? outerRadius : innerRadius
                        let angle = (Double(i) * .pi / Double(points)) - .pi / 2
                        let point = CGPoint(
                            x: center.x + CGFloat(cos(angle)) * radius,
                            y: center.y + CGFloat(sin(angle)) * radius
                        )
                        if i == 0 {
                            path.move(to: point)
                        } else {
                            path.addLine(to: point)
                        }
                    }
                    path.closeSubpath()
                }
                .stroke(color, lineWidth: 1.5)
            )
        }
        .frame(width: size, height: size)
    }
}

struct CheckIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.primary
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: size * 0.2, y: size * 0.5))
            path.addLine(to: CGPoint(x: size * 0.4, y: size * 0.7))
            path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.3))
        }
        .stroke(color, style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
        .frame(width: size, height: size)
    }
}

struct ChevronIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.textMuted
    var direction: Direction = .right
    
    enum Direction {
        case left, right, up, down
        
        var rotation: Double {
            switch self {
            case .right: return 0
            case .down: return 90
            case .left: return 180
            case .up: return 270
            }
        }
    }
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: size * 0.35, y: size * 0.2))
            path.addLine(to: CGPoint(x: size * 0.65, y: size * 0.5))
            path.addLine(to: CGPoint(x: size * 0.35, y: size * 0.8))
        }
        .stroke(color, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        .frame(width: size, height: size)
        .rotationEffect(.degrees(direction.rotation))
    }
}

struct PlusIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.textPrimary
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: size * 0.6, height: size * 0.12)
            Rectangle()
                .fill(color)
                .frame(width: size * 0.12, height: size * 0.6)
        }
        .frame(width: size, height: size)
    }
}

struct TrashIcon: View {
    var size: CGFloat = 24
    var color: Color = AppTheme.danger
    
    var body: some View {
        ZStack {
            // Lid
            RoundedRectangle(cornerRadius: size * 0.05)
                .fill(color)
                .frame(width: size * 0.7, height: size * 0.1)
                .offset(y: -size * 0.35)
            
            // Handle
            RoundedRectangle(cornerRadius: size * 0.05)
                .fill(color)
                .frame(width: size * 0.25, height: size * 0.08)
                .offset(y: -size * 0.42)
            
            // Body
            Path { path in
                path.move(to: CGPoint(x: size * 0.2, y: size * 0.25))
                path.addLine(to: CGPoint(x: size * 0.25, y: size))
                path.addLine(to: CGPoint(x: size * 0.75, y: size))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.25))
                path.closeSubpath()
            }
            .fill(color)
            .offset(y: -size * 0.05)
        }
        .frame(width: size, height: size)
    }
}
