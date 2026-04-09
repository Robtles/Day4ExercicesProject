//
//  PokemonCell.swift
//  Day4ExercicesProject
//

import UIKit

final class PokemonCell: UITableViewCell {

    static let reuseIdentifier = "PokemonCell"

    private let typeColorView = UIView()

    private let nameLabel = UILabel()

    private let typeIconImageView = UIImageView()
    private let typeLabel = UILabel()

    private let attacksLabel = UILabel()
    private let legendaryLabel = UILabel()

    private let favoriteImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        typeColorView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.font = .preferredFont(forTextStyle: .headline)

        typeLabel.font = .preferredFont(forTextStyle: .subheadline)
        typeLabel.textColor = .secondaryLabel

        attacksLabel.font = .preferredFont(forTextStyle: .footnote)
        attacksLabel.textColor = .secondaryLabel
        attacksLabel.numberOfLines = 0

        legendaryLabel.font = .preferredFont(forTextStyle: .caption1)
        legendaryLabel.textColor = .systemOrange

        typeIconImageView.contentMode = .scaleAspectFit
        typeIconImageView.tintColor = .secondaryLabel
        typeIconImageView.translatesAutoresizingMaskIntoConstraints = false
        typeIconImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        typeIconImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true

        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        favoriteImageView.tintColor = .systemYellow
        favoriteImageView.contentMode = .scaleAspectFit
        
        let typeStackView = UIStackView(arrangedSubviews: [
            typeIconImageView,
            typeLabel
        ])
        typeStackView.axis = .horizontal
        typeStackView.spacing = 6
        typeStackView.alignment = .center

        let labelsStackView = UIStackView(arrangedSubviews: [
            nameLabel,
            typeStackView,
            attacksLabel,
            legendaryLabel
        ])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(typeColorView)
        contentView.addSubview(labelsStackView)
        contentView.addSubview(favoriteImageView)

        NSLayoutConstraint.activate([
            typeColorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            typeColorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            typeColorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            typeColorView.widthAnchor.constraint(equalToConstant: 8),

            labelsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            labelsStackView.leadingAnchor.constraint(equalTo: typeColorView.trailingAnchor, constant: 12),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            favoriteImageView.widthAnchor.constraint(equalToConstant: 20),
            favoriteImageView.heightAnchor.constraint(equalToConstant: 20),
            favoriteImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentView.trailingAnchor.constraint(equalTo: favoriteImageView.trailingAnchor, constant: 24.0)
        ])
    }

    func configure(with pokemon: Pokemon, isFavorite: Bool) {
        nameLabel.text = "#\(pokemon.id) \(pokemon.name)"
        typeLabel.text = pokemon.types.map(\.name).joined(separator: ", ")
        attacksLabel.text = "Attacks: " + pokemon.attacks.joined(separator: ", ")
        legendaryLabel.text = pokemon.isLegendary ? "Legendary" : "Standard"

        favoriteImageView.image = isFavorite
            ? UIImage(systemName: "star.fill")
            : UIImage(systemName: "star")
        
        if let primaryType = pokemon.types.first {
            typeColorView.backgroundColor = UIColor(hex: primaryType.colorHex) ?? .systemGray5
            typeIconImageView.image = UIImage(systemName: primaryType.icon) ?? UIImage(systemName: "questionmark.circle")
            typeIconImageView.tintColor = UIColor(hex: primaryType.colorHex) ?? .secondaryLabel
        } else {
            typeColorView.backgroundColor = .clear
            typeIconImageView.image = nil
            typeIconImageView.tintColor = .secondaryLabel
        }
    }
}
