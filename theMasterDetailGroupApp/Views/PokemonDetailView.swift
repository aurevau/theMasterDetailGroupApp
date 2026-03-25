//
//  PokemonDetailView.swift
//  theMasterDetailGroupApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-25.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading){
                
                HStack{
                    Image(systemName: "figure")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    Text("Type: ")
                        .fontWeight(.bold)
                    Text(pokemon.type)
                }
                
                
                    HStack{
                        Image(systemName: "heart.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.pink)
                        Text("HP: ")
                            .fontWeight(.bold)
                        Text("\(pokemon.hp)")
                    }
                
                
                    
                    HStack{
                        Image(systemName: "bolt")
                            .font(.system(size: 20))
                            .foregroundStyle(.yellow)
                        Text("Attack: ")
                            .fontWeight(.bold)
                        Text("\(pokemon.attack)")
                    }
                    
                    HStack{
                        Image(systemName: "shield.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.gray)
                        Text("Attack: ")
                            .fontWeight(.bold)
                        Text("\(pokemon.attack)")
                    }
                   
                    
                    Text("\(pokemon.name) is a \(pokemon.type) pokemon with an HP of \(pokemon.hp), Attack of \(pokemon.attack) and Defence of \(pokemon.defence).")
                        .padding()
                    
                Spacer()
                }
                .padding()
           
                
            }
            .navigationTitle(pokemon.name)
            
        }
        
    
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(name: "Bulbasaur", type: "Grass", hp: 45, attack: 49, defence: 49))
}
