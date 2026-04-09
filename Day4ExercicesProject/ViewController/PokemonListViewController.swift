//
//  PokemonListViewController.swift
//  Day4ExercicesProject
//

import UIKit

final class PokemonListViewController: UITableViewController {

    private let preferencesService = PreferencesServiceImpl()
    private let pokedexRepository: PokedexRepository

    private var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"

        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100

        loadData()
    }

    private func loadData() {
        do {
            pokemons = try pokedexRepository.loadPokedex()
            tableView.reloadData()
        } catch {
            print("Erreur lors du chargement :", error)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PokemonCell.reuseIdentifier,
            for: indexPath
        ) as? PokemonCell else {
            return .init()
        }

        let pokemon = pokemons[indexPath.row]
        let isFavorite = preferencesService.isFavorite(pokemonID: pokemon.id)
        cell.configure(with: pokemon, isFavorite: isFavorite)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        preferencesService.toggleFavorite(pokemonID: pokemon.id)
        tableView.reloadData()
    }
    
    init(repository: PokedexRepository) {
        self.pokedexRepository = repository
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
