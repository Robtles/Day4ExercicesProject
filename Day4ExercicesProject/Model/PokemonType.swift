//
//  PokemonType.swift
//  Day4ExercicesProject
//

import Foundation

struct PokemonTypeDTO: Decodable {
    let id: Int
    let name: String
    let colorHex: String
    let icon: String
}

struct PokemonType {
    let id: Int
    let name: String
    let colorHex: String
    let icon: String
}
