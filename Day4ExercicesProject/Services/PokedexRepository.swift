//
//  PokedexRepository.swift
//  Day4ExercicesProject
//

import Foundation

final class PokedexRepository {

    private let loader: PokedexLoader
    private let cacheStore: PokedexCacheStore
    private let preferencesService: PreferencesService

    init(
        loader: PokedexLoader,
        cacheStore: PokedexCacheStore,
        preferencesService: PreferencesService
    ) {
        self.loader = loader
        self.cacheStore = cacheStore
        self.preferencesService = preferencesService
    }

    func loadPokedex() throws -> [Pokemon] {
        // TODO:
        // 1. Vérifier si le Pokédex a déjà été mis en cache
        // 2. Si oui, charger depuis CoreData
        // 3. Sinon :
        //    - charger depuis le JSON
        //    - sauvegarder dans le cache CoreData
        //    - mettre à jour le flag UserDefaults
        //    - retourner les pokémons chargés

        return []
    }
}
