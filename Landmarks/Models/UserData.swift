//
//  UserData.swift
//  Landmarks
//
//  Created by keith on 2019/6/28.
//  Copyright © 2019 keith. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject  {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var landmarks = landmarkData {
        didSet {
            didChange.send(self)
        }
    }
}
