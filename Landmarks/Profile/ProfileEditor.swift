//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by keith on 2019/7/8.
//  Copyright © 2019 keith. All rights reserved.
//

import SwiftUI

struct ProfileEditor : View {
    @Binding var profile: Profile

    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField($profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enabled Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo")
                    .bold()
                
                SegmentedControl(selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases.identified(by:\.self)) { season in
                        Text(season.rawValue).tag(season)
                        
                    }
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date")
                    .bold()
                
                DatePicker(
                    $profile.goalDate,
                    minimumDate: Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate),
                    maximumDate: Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate),
                    displayedComponents: .date                )
            }
            .padding(.top)
        }
    }
}

#if DEBUG
struct ProfileEditor_Previews : PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
#endif
