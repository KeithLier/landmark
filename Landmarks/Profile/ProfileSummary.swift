//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by keith on 2019/7/1.
//  Copyright © 2019 keith. All rights reserved.
//

import SwiftUI

struct ProfileSummary : View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
        }
    }
}

#if DEBUG
struct ProfileSummary_Previews : PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
#endif
