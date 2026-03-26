//
//  ContentView.swift
//  theMasterDetailGroupApp
//
//  Created by Aurelie Vaudan APP25 on 2026-03-25.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var hp: String = ""
    @State private var attack: String = ""
    @State private var defence: String = ""
    @State private var showMessage = false
    @State private var alertMessage = ""
    
    @State private var pokemons: [Pokemon] = [
        Pokemon(name: "Charmander", type: "Fire", hp: 39, attack: 52, defence: 43),
        Pokemon(name: "Bulbasaur", type: "Grass", hp: 45, attack: 49, defence: 49),
        Pokemon(name: "Squirtle", type: "Water", hp: 44, attack: 48, defence: 65)
    ]
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    ForEach(pokemons) {pokemon in
                        NavigationLink {
                            PokemonDetailView(pokemon: pokemon)
                        } label: {
                            PokemonRowView(pokemon: pokemon)
                            
                        }
                        
                    }
                    .onDelete {indexSet in
                        pokemons.remove(atOffsets: indexSet)
                    }
                }
                
                Form {
                    Section(header: Text("Add a new Pokémon").font(.headline)) {
                        
                        TextField("Enter Pokemon name", text: $name)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        TextField("Enter Pokemon type", text: $type)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        TextField("Enter Pokemon HP", text: $hp)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        TextField("Enter Pokemon Attack", text: $attack)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        TextField("Enter Pokemon Defence", text: $defence)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        Button("Save") {
                            
                            guard !name.isEmpty,
                                  !type.isEmpty,
                                  let hpValue = Int(hp),
                                  let attackValue = Int(attack),
                                  let defenceValue = Int(defence)
                            else {
                                alertMessage = "Fyll i alla fält"
                                showMessage = true
                                return
                            }
                            pokemons.append(Pokemon(name: name, type: type, hp: hpValue, attack: attackValue, defence: defenceValue))
                            
                            name = ""
                            type = ""
                            attack = ""
                            defence = ""
                        }
                    }
                }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        Spacer()
                        
                    }
                    .navigationTitle("Pokémons")
                    .alert(alertMessage, isPresented: $showMessage) {
                        Button("OK", role: .cancel) {}
                    }
                }
    }
}

#Preview {
    ContentView()
}
