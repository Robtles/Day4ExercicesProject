//
//  PokedexLoader.swift
//  Day4ExercicesProject
//

import Foundation

enum PokedexLoadingError: Error {
    case unknown
}

final class PokedexLoader {

    func loadPokedex() throws -> [Pokemon] {
        let pokemonDTOs: [PokemonDTO] = try loadJSON(named: "pokemons")
        let typeDTOs: [PokemonTypeDTO] = try loadJSON(named: "types")

        // TODO:
        // 1. Transformer les DTO de types en vrais PokemonType
        // 2. Associer les types aux pokémons
        // 3. Retourner un tableau de Pokemon

        return []
    }

    private func loadJSON<T: Decodable>(named filename: String) throws -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw PokedexLoadingError.unknown
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
