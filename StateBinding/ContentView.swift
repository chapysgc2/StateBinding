//
//  ContentView.swift
//  StateBinding
//
//  Created by Hazel Alain on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    
    //Binding: es la conexion entre una propiedad que almacena datos(variable) y una vista que cambia el valor (Textfield)
    
    
    @State var x = "Titulo"
    @State private var show = true
    @State private var numero = 0
    @State private var numeroMoneda = 123
    @State private var numeroMoneda2 = "0"
        
    //El state nos sirve para cambiar la variable en cualquier sitio del codigo @State var x = ""
    
    //si le agregamos private esta solo se podra cambiar dentro de la clase donde se declaro @State private var x = ""
    //ademas hace que el codigo sea mas optimizado
    
    func suma() -> Int {
        x = "cambiando su valor"
        
        var x2 = 2
        x2 = 4
        return x2
    }
    
    var body: some View {
        VStack {
            Text("Puntos")
                .font(.title)
            Text(x).font(.largeTitle)
            HStack {
                Button(action: {
                    show.toggle()
                    if show {
                        numero -= 1
                        
                    }
                    else {
                        numero += 1
                    }
                }){
                    if show {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    }
                    else {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    }
                    Text(String(numero)).bold()
                }
                
                Button(action: {
                    numeroMoneda = numeroMoneda + Int(numeroMoneda2)!
                }){
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                }
                Text(String(numeroMoneda))
                    .bold()
                
            }
            
            TextField("Donacion", text: $numeroMoneda2)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Titulo", text : $x)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            vista2(x : $x) //aqui ya podemos asignar el binding a x y mandarlo a la siguiente vista
            vista3(x: $x)
        }
    }
}



struct vista2: View {
    @Binding var x : String //No le damos un valor si no el tipo de dato es como si fuera un parametro a recibir
    var body: some View {
        Text(x) //y le damos el valor a nuestro text
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct vista3: View {
    @Binding var x : String //No le damos un valor si no el tipo de dato es como si fuera un parametro a recibir
    var body: some View {
        
        Button(action: {
            x = "Nuevo titulo desde vista 3"
            
        }, label: {
            Text("Cambiar titulo")
        })
    }
}
struct vista: View {
    var body: some View {
        Text("Nueva vista")
        Button(action:{
            //
        }){
            Text("Boton")
        }
        Button(action:{
            
        }){
            Text("Boton")
        }
    }
    
}



#Preview {
    ContentView()
}
