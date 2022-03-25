//
//  ContentView.swift
//  Shared
//
//  Created by Joshua Campbell  on 2/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var guess = ""
    
    private var intFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()
    

    var body: some View {
        
        VStack {
             HStack {
                 
                 TextEditor(text: $guess)

                 
                 Button("Calculate Square Well", action: squareWell)
                     }
             .frame(minHeight: 300, maxHeight: 800)
             .frame(minWidth: 480, maxWidth: 800)
             .padding()
            
            HStack {
                
                TextEditor(text: $guess)

                
                Button("Calculate Linear Well", action: linearWell)
                    }
            .frame(minHeight: 300, maxHeight: 800)
            .frame(minWidth: 480, maxWidth: 800)
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
