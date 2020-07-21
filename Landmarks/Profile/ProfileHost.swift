//
//  ProfileHost.swift
//  Landmarks
//
//  Created by keith on 2019/7/1.
//  Copyright © 2019 keith. All rights reserved.
//

import SwiftUI

struct ProfileHost : View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var profile = Profile.default
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button(action: {
                        self.profile = self.draftProfile
                        self.mode?.animation().wrappedValue = .inactive
                    }) {
                        Text("Done")
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: self.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onDisappear {
                        self.draftProfile = self.profile
                    }
            }
        }
        .padding()
    }
}

#if DEBUG
struct ProfileHost_Previews : PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
#endif
