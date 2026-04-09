//
//  PokemonCacheStore.swift
//  Day4ExercicesProject
//

import CoreData
import Foundation

final class PokedexCacheStore {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func save(pokemons: [Pokemon]) throws {
        // TODO:
        // 1. Vider le cache existant
        // 2. Pour chaque Pokémon :
        //    - créer une PokemonEntity
        //    - copier les propriétés simples
        //    - stocker les attaques sous forme de String
        //    - stocker le type principal
        // 3. Sauvegarder le contexte
    }

    func fetchPokemons() throws -> [Pokemon] {
        // TODO: 
        // 1. Faire une requête CoreData sur PokemonEntity
        // 2. Trier par id
        // 3. Transformer les entités en modèles Pokemon
        // 4. Recréer le tableau de types à partir des champs stockés
        return []
    }

    func clearCache() throws {
        let request: NSFetchRequest<NSFetchRequestResult> = PokemonEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        try context.execute(deleteRequest)
    }
}
