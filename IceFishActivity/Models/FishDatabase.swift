import Foundation

struct FishDatabase {
    static let allFish: [Fish] = [
        // North American Species
        Fish(
            id: "walleye",
            name: "Walleye",
            scientificName: "Sander vitreus",
            description: "Popular game fish known for excellent taste. Most active during low light conditions.",
            activityNotes: [
                .earlyWinter: "Feeds aggressively before deep winter. Best at dawn and dusk near drop-offs.",
                .deepWinter: "Slower metabolism but still feeds. Focus on early morning and late afternoon.",
                .lateWinter: "Activity increases as days get longer. Prime time before sunset.",
                .preSpring: "Very active preparing for spawn. Feeds throughout the day near shallows."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,2,1,0,0,0,0,0,0,1,2,2,2,1,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,2,1,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,1,2,2,1,0,0,0,0,0,1,2,2,2,1,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,1,1,1,1,1,1,2,2,2,2,1,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "perch",
            name: "Yellow Perch",
            scientificName: "Perca flavescens",
            description: "Schooling fish that provides steady action. Excellent table fare.",
            activityNotes: [
                .earlyWinter: "Very active in schools. Best mid-morning to afternoon.",
                .deepWinter: "Still feeds but slower. Focus on late morning when water warms slightly.",
                .lateWinter: "Becomes more aggressive. Good action throughout daylight hours.",
                .preSpring: "Peak activity before spawn. Feeds heavily all day."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,1,1,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,1,2,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "northern_pike",
            name: "Northern Pike",
            scientificName: "Esox lucius",
            description: "Aggressive predator that can be caught year-round. Ambush hunter.",
            activityNotes: [
                .earlyWinter: "Very aggressive. Hunts actively near weed edges all day.",
                .deepWinter: "Slows down but still feeds. Focus on mid-day when activity peaks.",
                .lateWinter: "Increasing activity. Best at first and last light.",
                .preSpring: "Extremely active pre-spawn. Can be caught all day."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,2,2,2,1,1,1,2,2,2,2,1,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,1,1,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,1,2,2,1,1,1,1,1,1,1,2,2,1,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "crappie",
            name: "Crappie",
            scientificName: "Pomoxis spp.",
            description: "Paper-mouth panfish. Excellent eating. Found in schools near structure.",
            activityNotes: [
                .earlyWinter: "Schools near deep structure. Best at dawn and dusk.",
                .deepWinter: "Suspends in deep water. Focus on early morning.",
                .lateWinter: "Starts moving shallower. Good low-light bites.",
                .preSpring: "Moves to shallows. Active throughout the day."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,2,2,1,0,0,0,0,0,0,0,0,1,2,2,1,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,2,2,1,1,0,0,0,0,0,0,1,1,2,2,1,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,1,1,1,1,1,1,1,2,2,2,1,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "bluegill",
            name: "Bluegill",
            scientificName: "Lepomis macrochirus",
            description: "Common panfish. Easy to catch, great for beginners.",
            activityNotes: [
                .earlyWinter: "Active near vegetation. Best mid-morning to early afternoon.",
                .deepWinter: "Moves to deeper water. Short feeding windows at noon.",
                .lateWinter: "Increasing activity. Responds to warming trends.",
                .preSpring: "Very active. Feeds throughout daylight hours."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,1,2,2,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,1,1,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "largemouth_bass",
            name: "Largemouth Bass",
            scientificName: "Micropterus salmoides",
            description: "Popular game fish. Less active in winter but still catchable.",
            activityNotes: [
                .earlyWinter: "Feeds near structure. Best during warmest part of day.",
                .deepWinter: "Very sluggish. Short windows mid-day only.",
                .lateWinter: "Starts feeding more. Responds to sunny days.",
                .preSpring: "Much more active. Good fishing all day."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,1,2,2,2,2,1,1,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,1,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "lake_trout",
            name: "Lake Trout",
            scientificName: "Salvelinus namaycush",
            description: "Deep water predator. Thrives in cold water.",
            activityNotes: [
                .earlyWinter: "Very active in cold water. Feeds throughout the day.",
                .deepWinter: "Peak season. Excellent all-day fishing.",
                .lateWinter: "Still very active. Best in morning hours.",
                .preSpring: "Good fishing continues. Acts before ice-out."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,2,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,1,2,2,2,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,2,2,2,2,2,1,1,1,1,2,2,1,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,1,2,2,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "rainbow_trout",
            name: "Rainbow Trout",
            scientificName: "Oncorhynchus mykiss",
            description: "Active cold water fish. Popular sport fish.",
            activityNotes: [
                .earlyWinter: "Active in cold water. Best early morning.",
                .deepWinter: "Continues feeding. Focus on morning hours.",
                .lateWinter: "Very active. Feeds throughout daylight.",
                .preSpring: "Peak activity. Excellent all-day fishing."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,2,2,2,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,1,2,2,2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,2,2,2,2,2,2,2,1,1,1,1,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "burbot",
            name: "Burbot",
            scientificName: "Lota lota",
            description: "Nocturnal fish. Most active during night. Called freshwater cod.",
            activityNotes: [
                .earlyWinter: "Night feeder. Best after sunset.",
                .deepWinter: "Spawning season. Extremely active at night.",
                .lateWinter: "Still very active. Peak hours after dark.",
                .preSpring: "Slows down but night fishing still productive."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,2,2]),
                .deepWinter: makeActivity([2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,2,2,2]),
                .lateWinter: makeActivity([2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,2,2]),
                .preSpring: makeActivity([1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,1,1])
            ]
        ),
        Fish(
            id: "whitefish",
            name: "Whitefish",
            scientificName: "Coregonus clupeaformis",
            description: "Bottom feeder. Excellent winter target in deep water.",
            activityNotes: [
                .earlyWinter: "Moves to mid-depths. Best mid-day.",
                .deepWinter: "Found in deep water. Good afternoon bite.",
                .lateWinter: "More active. Responds to light jigs.",
                .preSpring: "Moves shallower. Good all-day action."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,1,2,2,2,2,2,1,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,1,1,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "cisco",
            name: "Cisco (Tullibee)",
            scientificName: "Coregonus artedi",
            description: "Schooling fish in cold lakes. Feed on plankton and insects.",
            activityNotes: [
                .earlyWinter: "Suspends in deep water. Best early and late.",
                .deepWinter: "Active in cold water. Good mid-day bite.",
                .lateWinter: "Feeds more actively. Morning and afternoon.",
                .preSpring: "Very active. Feeds heavily before spawn."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,1,1,1,2,2,2,2,1,1,1,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,1,2,2,1,1,1,1,1,1,2,2,1,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,2,1,1,1,1,2,2,2,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "sauger",
            name: "Sauger",
            scientificName: "Sander canadensis",
            description: "Smaller cousin of walleye. Similar habits but more river-oriented.",
            activityNotes: [
                .earlyWinter: "Active near current. Best at dawn and dusk.",
                .deepWinter: "Schools in deep pools. Short feeding windows.",
                .lateWinter: "Increasing activity. Feeds more frequently.",
                .preSpring: "Very active. Moves toward spawning areas."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,2,1,0,0,0,0,0,0,1,2,2,1,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,1,2,2,1,0,0,0,0,0,1,1,2,2,1,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,1,1,1,1,1,1,2,2,2,1,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "smallmouth_bass",
            name: "Smallmouth Bass",
            scientificName: "Micropterus dolomieu",
            description: "Fighting fish. Less active in cold but catchable.",
            activityNotes: [
                .earlyWinter: "Near rocky structure. Mid-day best.",
                .deepWinter: "Very slow. Only warmest hours productive.",
                .lateWinter: "Starts picking up. Afternoon feeding.",
                .preSpring: "Much more aggressive. All-day potential."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,2,2,2,1,1,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,1,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,1,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "brook_trout",
            name: "Brook Trout",
            scientificName: "Salvelinus fontinalis",
            description: "Native char. Thrives in cold streams and lakes.",
            activityNotes: [
                .earlyWinter: "Active in cold water. Early morning best.",
                .deepWinter: "Continues feeding. Midday when warmer.",
                .lateWinter: "Excellent fishing. All daylight hours.",
                .preSpring: "Very active. Feeds aggressively."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,2,2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,1,1,1,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,1,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "muskellunge",
            name: "Muskellunge",
            scientificName: "Esox masquinongy",
            description: "Trophy fish. Rare catches but worth the effort.",
            activityNotes: [
                .earlyWinter: "Feeds before deep cold. Mid-day patterns.",
                .deepWinter: "Very slow. Best on warm sunny days.",
                .lateWinter: "Increasing activity. Focus on afternoons.",
                .preSpring: "Active pre-spawn. Good all-day fishing."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,1,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "pumpkinseed",
            name: "Pumpkinseed",
            scientificName: "Lepomis gibbosus",
            description: "Colorful sunfish. Common in ponds and lakes.",
            activityNotes: [
                .earlyWinter: "Near vegetation. Best late morning.",
                .deepWinter: "Deep in vegetation. Short noon window.",
                .lateWinter: "More active. Mid-day feeding.",
                .preSpring: "Very active. All-day fishing."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        // European Species
        Fish(
            id: "european_perch",
            name: "European Perch",
            scientificName: "Perca fluviatilis",
            description: "Common European predator. Active throughout winter.",
            activityNotes: [
                .earlyWinter: "Very active. Best late morning to afternoon.",
                .deepWinter: "Still feeds. Focus on warmest hours.",
                .lateWinter: "Increasing activity. Good all-day fishing.",
                .preSpring: "Excellent fishing. Feeds heavily."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "roach",
            name: "Roach",
            scientificName: "Rutilus rutilus",
            description: "European schooling fish. Good beginner target.",
            activityNotes: [
                .earlyWinter: "Active in schools. Best mid-day.",
                .deepWinter: "Slower but catchable. Focus on noon.",
                .lateWinter: "Increasing activity. Afternoon feeding.",
                .preSpring: "Very active. All-day fishing possible."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,1,2,2,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "bream",
            name: "Bream",
            scientificName: "Abramis brama",
            description: "Bottom feeding fish. Often found in large schools.",
            activityNotes: [
                .earlyWinter: "Deep water schools. Mid-morning best.",
                .deepWinter: "Very slow. Only brief feeding windows.",
                .lateWinter: "Activity increases. Afternoon bite.",
                .preSpring: "Feeds heavily. Good all-day action."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,0,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "zander",
            name: "Zander",
            scientificName: "Sander lucioperca",
            description: "European pikeperch. Similar to walleye behavior.",
            activityNotes: [
                .earlyWinter: "Dawn and dusk predator. Very active.",
                .deepWinter: "Slower but feeds. Low light hours best.",
                .lateWinter: "Increasing activity. Sunset prime time.",
                .preSpring: "Very aggressive. Feeds heavily pre-spawn."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,1,2,2,1,0,0,0,0,0,0,1,2,2,2,1,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,1,2,2,1,0,0,0,0,0,1,2,2,2,1,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,1,2,2,2,1,1,1,1,1,1,2,2,2,2,1,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "ide",
            name: "Ide",
            scientificName: "Leuciscus idus",
            description: "European cyprinid. Found in rivers and lakes.",
            activityNotes: [
                .earlyWinter: "Active near current. Mid-day feeding.",
                .deepWinter: "Slow period. Brief afternoon windows.",
                .lateWinter: "Picks up activity. Focus on sunny days.",
                .preSpring: "Very active. Moves to spawning areas."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,2,1,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,1,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "rudd",
            name: "Rudd",
            scientificName: "Scardinius erythrophthalmus",
            description: "Surface-oriented fish. Colors become vivid in winter.",
            activityNotes: [
                .earlyWinter: "Near vegetation. Late morning best.",
                .deepWinter: "Deep and sluggish. Noon feeding only.",
                .lateWinter: "More active. Sunny day fishing.",
                .preSpring: "Active near surface. All-day action."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,1,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "tench",
            name: "Tench",
            scientificName: "Tinca tinca",
            description: "Warm water fish. Very slow in winter.",
            activityNotes: [
                .earlyWinter: "Rarely active. Only warmest days.",
                .deepWinter: "Almost dormant. Not recommended.",
                .lateWinter: "Slight activity. Warm spell dependent.",
                .preSpring: "Starts feeding. Focus on afternoons."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "chub",
            name: "Chub",
            scientificName: "Squalius cephalus",
            description: "Opportunistic feeder. Found in rivers.",
            activityNotes: [
                .earlyWinter: "Active in current. Mid-day feeding.",
                .deepWinter: "Slows but feeds. Warmest hours only.",
                .lateWinter: "Increasing activity. All-day possible.",
                .preSpring: "Very active. Excellent fishing."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,1,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,1,1,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0])
            ]
        ),
        Fish(
            id: "crucian_carp",
            name: "Crucian Carp",
            scientificName: "Carassius carassius",
            description: "Hardy fish. Can survive low oxygen.",
            activityNotes: [
                .earlyWinter: "Slow but catchable. Rare mid-day bites.",
                .deepWinter: "Nearly dormant. Avoid targeting.",
                .lateWinter: "Slight activity on warm days.",
                .preSpring: "Waking up. Afternoon feeding begins."
            ],
            hourlyActivity: [
                .earlyWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0]),
                .deepWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]),
                .lateWinter: makeActivity([0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0]),
                .preSpring: makeActivity([0,0,0,0,0,0,0,0,0,0,1,2,2,2,1,0,0,0,0,0,0,0,0,0])
            ]
        )
    ]
    
    private static func makeActivity(_ values: [Int]) -> [ActivityLevel] {
        return values.map { value in
            switch value {
            case 2: return .high
            case 1: return .medium
            default: return .low
            }
        }
    }
    
    static func fish(byId id: String) -> Fish? {
        return allFish.first { $0.id == id }
    }
    
    static var sortedByName: [Fish] {
        return allFish.sorted { $0.name < $1.name }
    }
}
