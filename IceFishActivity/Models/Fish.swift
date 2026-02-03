import Foundation

struct Fish: Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    let scientificName: String
    let description: String
    let activityNotes: [Season: String]
    let hourlyActivity: [Season: [ActivityLevel]]
    
    static func == (lhs: Fish, rhs: Fish) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func getActivity(for hour: Int, in season: Season) -> ActivityLevel {
        guard hour >= 0 && hour < 24,
              let activities = hourlyActivity[season] else {
            return .low
        }
        return activities[hour]
    }
    
    func getActivityNote(for season: Season) -> String {
        return activityNotes[season] ?? "Activity varies by conditions."
    }
}

struct FishPreset: Identifiable, Codable {
    let id: UUID
    var name: String
    var fishIds: [String]
    
    init(id: UUID = UUID(), name: String, fishIds: [String]) {
        self.id = id
        self.name = name
        self.fishIds = fishIds
    }
}
