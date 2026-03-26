//
//  Pokemon.swift
//  theMasterDetailGroupApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-25.
//

import Foundation

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let hp: Int
    let attack: Int
    let defence: Int
}
