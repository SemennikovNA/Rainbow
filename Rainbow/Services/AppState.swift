//
//  AppState.swift
//  Rainbow
//
//  Created by Kirill Taraturin on 16.11.2023.
//

import Foundation

final class AppState {
    let defaults = UserDefaultsManager()
    let defaultSettings = Settings(gameTime: 2,gameTimeValueSlider: 2, speedTimeValueSlider: 5, speed: 5, isSubstrate: true, isBackgroundNeed: true)
    var games = [ResultsCardModel]()
    
    init() {}
}
