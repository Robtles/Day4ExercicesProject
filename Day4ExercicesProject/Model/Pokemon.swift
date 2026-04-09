//
//  Pokemon.swift
//  Day4ExercicesProject
//

import Foundation

struct PokemonDTO: Decodable {
    let id: Int
    let name: String
    let typeIDs: [Int]
    let attacks: [String]
    let isLegendary: Bool
}

struct Pokemon {
    let id: Int
    let name: String
    let types: [PokemonType]
    let attacks: [String]
    let isLegendary: Bool
}
