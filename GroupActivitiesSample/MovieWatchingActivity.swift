// Copyright © 2021 USAMI Kosuke

import GroupActivities
import UIKit

struct MovieWatchingActivity: GroupActivity {
    static let activityIdentifier = "com.example.GroupActivitiesSample.MovieWatchingActivity"
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.type = .watchTogether
        metadata.title = MovieSample.title
        metadata.fallbackURL = MovieSample.fallbackURL
        return metadata
    }
}
