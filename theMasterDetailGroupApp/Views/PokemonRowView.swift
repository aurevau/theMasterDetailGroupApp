//
//  PokemonRowView.swift
//  theMasterDetailGroupApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-25.
//

import SwiftUI

struct PokemonRowView: View {
    let pokemon: Pokemon
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.headline)
                Text(pokemon.type)
                    .font(.subheadline.italic())
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    PokemonRowView(pokemon: Pokemon(name: "Bublasaur", type: "Grass", hp: 45, attack: 49, defence: 49))
}
