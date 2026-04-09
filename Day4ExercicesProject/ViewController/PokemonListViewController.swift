//
//  PokemonListViewController.swift
//  Day4ExercicesProject
//

import UIKit

final class PokemonListViewController: UITableViewController {

    private let loader = PokedexLoader()
    private var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"

        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.reuseIdentifier)

        loadData()
    }

    private func loadData() {
        do {
            pokemons = try loader.loadPokedex()
            tableView.reloadData()
        } catch {
            print("Erreur lors du chargement :", error)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        pokemons.count
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.reuseIdentifier, for: indexPath) as? PokemonCell else {
            return .init()
        }

        // TODO: injecter le pokémon dans la cellule
        // let pokemon = pokemons[indexPath.row]
        // cell.configure(with: pokemon)

        cell.configure(
            name: "Pikachu",
            typeText: "Électrique",
            attacksText: "Éclair, Tonnerre",
            legendaryText: "Non",
            hexColor: "#F7D02C",
            iconName: "bolt.fill"
        )
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
