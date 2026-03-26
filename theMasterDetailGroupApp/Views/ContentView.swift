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
        Pokemon(name: "Bulbasaur", type: "Grass", hp: 45, attack: 49, defence: 49)
    ]
    var body: some View {
        NavigationStack{
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
                .navigationTitle(Text("Pokemons"))
                
            }
            
            TextField("Enter Pokemon name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            TextField("Enter Pokemon type", text: $type)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            TextField("Enter Pokemon HP", text: $hp)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            TextField("Enter Pokemon Attack", text: $attack)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            TextField("Enter Pokemon Defence", text: $defence)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
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
            Spacer()
            .alert(alertMessage, isPresented: $showMessage) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

#Preview {
    ContentView()
}
