//
//  PokemonRowView.swift
//  theMasterDetailGroupApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-25.
//

import SwiftUI

struct PokemonRowView: View {
    let pokemon: Pokemon
    
    func typeColor (_ type: String) -> Color {
        switch type {
        case "Fire": return .red
        case "Grass": return .green
        case "Water": return .blue
        default: return .gray
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(pokemon.type)
                    .font(.subheadline.italic())
                    .foregroundColor(.white.opacity(0.8))
            }
            Spacer()
            Text("\(pokemon.hp) HP")
                .foregroundColor(.white)
        }
        .padding()
        .background(typeColor(pokemon.type))
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.vertical, 4)
    }
}

#Preview {
    PokemonRowView(pokemon: Pokemon(name: "Bublasaur", type: "Grass", hp: 45, attack: 49, defence: 49))
}
