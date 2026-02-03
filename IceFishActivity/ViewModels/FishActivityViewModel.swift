import Foundation
import SwiftUI

class FishActivityViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var selectedFishIds: Set<String> = []
    @Published var currentSeason: Season
    @Published var isManualSeason: Bool = false
    @Published var presets: [FishPreset] = []
    
    // MARK: - Storage Keys
    private let selectedFishKey = "selectedFishIds"
    private let presetsKey = "fishPresets"
    
    // MARK: - Computed Properties
    var allFish: [Fish] {
        FishDatabase.sortedByName
    }
    
    var selectedFish: [Fish] {
        FishDatabase.allFish.filter { selectedFishIds.contains($0.id) }
    }
    
    var currentDate: Date {
        Date()
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: currentDate)
    }
    
    // MARK: - Initialization
    init() {
        self.currentSeason = Season.current()
        loadSelectedFish()
        loadPresets()
    }
    
    // MARK: - Fish Selection
    func toggleFish(_ fish: Fish) {
        if selectedFishIds.contains(fish.id) {
            selectedFishIds.remove(fish.id)
        } else {
            selectedFishIds.insert(fish.id)
        }
        saveSelectedFish()
    }
    
    func isSelected(_ fish: Fish) -> Bool {
        selectedFishIds.contains(fish.id)
    }
    
    func selectFish(_ fish: Fish) {
        selectedFishIds.insert(fish.id)
        saveSelectedFish()
    }
    
    func deselectFish(_ fish: Fish) {
        selectedFishIds.remove(fish.id)
        saveSelectedFish()
    }
    
    // MARK: - Season Management
    func setSeason(_ season: Season) {
        currentSeason = season
        isManualSeason = true
    }
    
    func resetToCurrentSeason() {
        currentSeason = Season.current()
        isManualSeason = false
    }
    
    // MARK: - Activity Calculation
    func getCombinedActivity(for hour: Int) -> ActivityLevel {
        guard !selectedFish.isEmpty else { return .low }
        
        var maxActivity: ActivityLevel = .low
        for fish in selectedFish {
            let activity = fish.getActivity(for: hour, in: currentSeason)
            if activity > maxActivity {
                maxActivity = activity
            }
        }
        return maxActivity
    }
    
    func getHourlyActivities() -> [ActivityLevel] {
        return (0..<24).map { getCombinedActivity(for: $0) }
    }
    
    // MARK: - Presets Management
    func saveCurrentAsPreset(name: String) {
        let preset = FishPreset(name: name, fishIds: Array(selectedFishIds))
        presets.append(preset)
        savePresets()
    }
    
    func loadPreset(_ preset: FishPreset) {
        selectedFishIds = Set(preset.fishIds)
        saveSelectedFish()
    }
    
    func deletePreset(_ preset: FishPreset) {
        presets.removeAll { $0.id == preset.id }
        savePresets()
    }
    
    func renamePreset(_ preset: FishPreset, to newName: String) {
        if let index = presets.firstIndex(where: { $0.id == preset.id }) {
            presets[index].name = newName
            savePresets()
        }
    }
    
    // MARK: - Persistence
    private func saveSelectedFish() {
        UserDefaults.standard.set(Array(selectedFishIds), forKey: selectedFishKey)
    }
    
    private func loadSelectedFish() {
        if let ids = UserDefaults.standard.array(forKey: selectedFishKey) as? [String] {
            selectedFishIds = Set(ids)
        }
    }
    
    private func savePresets() {
        if let encoded = try? JSONEncoder().encode(presets) {
            UserDefaults.standard.set(encoded, forKey: presetsKey)
        }
    }
    
    private func loadPresets() {
        if let data = UserDefaults.standard.data(forKey: presetsKey),
           let decoded = try? JSONDecoder().decode([FishPreset].self, from: data) {
            presets = decoded
        }
    }
}
