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

        NSLayoutConstraint.activate([
            typeColorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            typeColorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            typeColorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            typeColorView.widthAnchor.constraint(equalToConstant: 8),

            labelsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            labelsStackView.leadingAnchor.constraint(equalTo: typeColorView.trailingAnchor, constant: 12),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    // TODO: Utiliser un vrai Pokemon pour configurer le modèle
    func configure(
        name: String,
        typeText: String,
        attacksText: String,
        legendaryText: String,
        hexColor: String,
        iconName: String
    ) {
        nameLabel.text = name
        typeLabel.text = typeText
        attacksLabel.text = attacksText
        legendaryLabel.text = legendaryText
        typeIconImageView.image = UIImage(systemName: iconName)
        
        if let color = UIColor(hex: hexColor) {
            typeColorView.backgroundColor = color
        } else {
            typeColorView.backgroundColor = .clear
        }
    }
}
