//
//  PokedexLoader.swift
//  Day4ExercicesProject
//

import Foundation

enum PokedexLoadingError: Error {
    case fileNotFound(String)
    case unreadableData(String)
    case decodingFailed(String)
    case missingType(id: Int, pokemonName: String)
}

final class PokedexLoader {

    func loadPokedex() throws -> [Pokemon] {
        let pokemonDTOs: [PokemonDTO] = try loadJSON(named: "pokemons")
        let typeDTOs: [PokemonTypeDTO] = try loadJSON(named: "types")

        let types = typeDTOs.map {
            PokemonType(
                id: $0.id,
                name: $0.name,
                colorHex: $0.colorHex,
                icon: $0.icon
            )
        }

        let typesByID = Dictionary(uniqueKeysWithValues: types.map { ($0.id, $0) })

        return try pokemonDTOs.map { dto in
            let resolvedTypes = try dto.typeIDs.map { typeID in
                guard let type = typesByID[typeID] else {
                    throw PokedexLoadingError.missingType(id: typeID, pokemonName: dto.name)
                }
                return type
            }

            return Pokemon(
                id: dto.id,
                name: dto.name,
                types: resolvedTypes,
                attacks: dto.attacks,
                isLegendary: dto.isLegendary
            )
        }
    }

    private func loadJSON<T: Decodable>(named filename: String) throws -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw PokedexLoadingError.fileNotFound(filename)
        }

        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            throw PokedexLoadingError.unreadableData(filename)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw PokedexLoadingError.decodingFailed(filename)
        }
    }
}
