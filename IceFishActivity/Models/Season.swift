import Foundation

enum Season: String, CaseIterable, Identifiable {
    case earlyWinter = "Early Winter"
    case deepWinter = "Deep Winter"
    case lateWinter = "Late Winter"
    case preSpring = "Pre-Spring"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .earlyWinter:
            return "November - December. Fish are still active after autumn feeding."
        case .deepWinter:
            return "January - February. Coldest period, fish activity decreases."
        case .lateWinter:
            return "February - March. Fish start becoming more active."
        case .preSpring:
            return "March - April. High activity before ice melts."
        }
    }
    
    var monthRange: String {
        switch self {
        case .earlyWinter: return "Nov - Dec"
        case .deepWinter: return "Jan - Feb"
        case .lateWinter: return "Feb - Mar"
        case .preSpring: return "Mar - Apr"
        }
    }
    
    static func current(from date: Date = Date()) -> Season {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        switch month {
        case 11:
            return .earlyWinter
        case 12:
            return day < 20 ? .earlyWinter : .deepWinter
        case 1:
            return .deepWinter
        case 2:
            // February: first half is Deep Winter, second half is Late Winter
            return day < 20 ? .deepWinter : .lateWinter
        case 3:
            return day < 15 ? .lateWinter : .preSpring
        case 4:
            return .preSpring
        default:
            // For months outside winter season (May-October), 
            // return the closest relevant season
            if month >= 5 && month <= 10 {
                return .preSpring // Not ice fishing season, but closest
            }
            return .earlyWinter
        }
    }
}

enum ActivityLevel: Int, Comparable {
    case low = 0
    case medium = 1
    case high = 2
    
    static func < (lhs: ActivityLevel, rhs: ActivityLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var displayName: String {
        switch self {
        case .low: return "Low"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
}
