//
//  PreferencesService.swift
//  Day4ExercicesProject
//

import Foundation

protocol PreferencesService {
    var favorites: [Int] { get }
    var hasCachedPokedex: Bool { get set }
    
    func isFavorite(pokemonID: Int) -> Bool
    func toggleFavorite(pokemonID: Int)
}

final class PreferencesServiceImpl: PreferencesService {

    private let favoritesKey = "favoritePokemonIDs"
    private let hasCachedPokedexKey = "hasCachedPokedex"

    var hasCachedPokedex: Bool {
        // TODO: ajouter get {} et set {} pour stocker la donnée dans UserDefaults
    }
    
    var favorites: [Int] {
        UserDefaults.standard.array(forKey: favoritesKey) as? [Int] ?? []
    }

    func isFavorite(pokemonID: Int) -> Bool {
        favorites.contains(pokemonID)
    }

    func toggleFavorite(pokemonID: Int) {
        var favorites = favorites

        if let index = favorites.firstIndex(of: pokemonID) {
            favorites.remove(at: index)
        } else {
            favorites.append(pokemonID)
        }

        UserDefaults.standard.set(favorites, forKey: favoritesKey)
    }
}
