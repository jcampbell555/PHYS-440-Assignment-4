//
//  1D_Schrodinger.swift
//  PHYS 440 Assignment 4
//
//  Created by Joshua Campbell  on 2/25/22.
//

import Foundation
import SwiftUI


/// Time Independent Schrodinger Equation
//          2  2
//      hbar  d  psi
//   - ----- ------ + V psi = E psi
//      2 m      2
//            d x

//func solveTISE (xMin: Double, xMax: Double, potential: Double, xStep: Double, Energy: Double, mass: Double){
func squareWell(){
    //User input variable
    let xMin = 0.0
    let xMax = 10.0
    let xStep = 0.001
    let EnergyStep = 0.005
    let EnergyMax = 10.0
    
    
    // Initial Values
    var xValue = xMin
    var Energy = 0.37
    var Psi_ip = 5.0 //just a guess
    var Psi_i = 0.0
    var Psi_idp = 0.0
    
    // constants
    let hbar = 6.582119569*pow(10.0, -16.0)
    let mass = 510998.946/pow((2.99792458*pow(10.0, 18.0)), 2.0)
    let potential = 0.0
    let schroconstant = (hbar*hbar)/(2.0*mass)
  
    
    var previousEnergy = 0.0
    var previousEndingPsi_i = 100000.0
    
    var Energies : [Double] = []

    while( Double(Energy) < Double(EnergyMax)){
        
//        reset xValue
        xValue = xMin
        Psi_idp = 0.0
        Psi_ip = 5.0
        Psi_i = 0.0
        
        while (Double(xValue) < Double(xMax)){
            

            
            //changing the value of Psi_ip
            Psi_ip = Psi_ip + (xStep * Psi_idp)
            
            //changing the value of Psi_i
            Psi_i = Psi_i + (xStep * Psi_ip)
            
            //changing the value of Psi_idp
            Psi_idp = ((potential - Energy) * Psi_i) / schroconstant
            
            //changing the Psi value (psi0, psi1, psi2...)
            xValue = xValue + xStep
            
          //  print("new x is", xValue)
           // print("new values are", Energy, xValue, Psi_i)
        

            
}
        if ((Psi_i * previousEndingPsi_i) < 0.0 ){
        //  print("new x is", xValue)
          print("new values are",previousEnergy, Energy, Psi_i)
        }
            previousEnergy = Energy
        
            previousEndingPsi_i = Psi_i
        //changing the energy value
        Energy = Energy + EnergyStep
    }
}

func linearWell(){
    //User input variable
    let xMin = 0.0
    let xMax = 10.0
    let xStep = 0.001
    let EnergyStep = 0.05
    let EnergyMax = 35.0
    
    
    // Initial Values
    var xValue = xMin
    var Energy = 0.37
    var Psi_ip = 5.0 //just a guess
    var Psi_i = 0.0
    var Psi_idp = 0.0
    
    // constants
    let hbar = 6.582119569*pow(10.0, -16.0)
    let mass = 510998.946/pow((2.99792458*pow(10.0, 18.0)), 2.0)
    let schroconstant = (hbar*hbar)/(2.0*mass)
    
    var potential : [Double] = []
    
    for i in stride(from: xMin, through: xMax, by: xStep){
        
        potential.append((i-xMin)*4.0*1.3)
    }
  
    var previousEnergy = 0.0
    var previousEndingPsi_i = 100000.0
    
    while( Double(Energy) < Double(EnergyMax)){
        
//        reset xValue
        xValue = xMin
        Psi_idp = 0.0
        Psi_ip = 5.0
        Psi_i = 0.0
        
        var counter = 0
        
        while (Double(xValue) < Double(xMax)){
            

            
            //changing the value of Psi_ip
            Psi_ip = Psi_ip + (xStep * Psi_idp)
            
            //changing the value of Psi_i
            Psi_i = Psi_i + (xStep * Psi_ip)
            
            //changing the value of Psi_idp
            Psi_idp = ((potential[counter] - Energy) * Psi_i) / schroconstant
            
            //changing the Psi value (psi0, psi1, psi2...)
            xValue = xValue + xStep
            counter = counter + 1
          
            
            
          
            
            
            
}
        
        if ((Psi_i * previousEndingPsi_i) < 0.0 ){
        //  print("new x is", xValue)
          print("new values are",Energy, Psi_i)
        }
            previousEnergy = Energy
        
            previousEndingPsi_i = Psi_i
        
        
        //changing the energy value
        Energy = Energy + EnergyStep
    }
}
    
