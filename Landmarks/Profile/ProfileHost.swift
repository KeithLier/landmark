//
//  ProfileHost.swift
//  Landmarks
//
//  Created by keith on 2019/7/1.
//  Copyright © 2019 keith. All rights reserved.
//

import SwiftUI

struct ProfileHost : View {
    @State var profile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: self.profile)
        }
        .padding()
    }
}

#if DEBUG
struct ProfileHost_Previews : PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
#endif
