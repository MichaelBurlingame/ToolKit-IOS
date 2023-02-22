//
//  E85Calculator.swift
//  SAE-METRIC
//
//  Created by Michael Burlingame on 1/31/23.
//

import SwiftUI

struct E85Calculator: View {
    
    @State private var gallons = 12.5
    @State private var desiredMix = 40.0
    @State private var E85Content = 85
    @State private var gasContent = 10
    @State private var gasAdd = 0.0
    @State private var E85Add = 0.0
    
    func convertGalLiters(gallons: Double) -> Double {
        let liters = gallons * 3.785412
        
        return liters
    }
    
    func findE85Amounts(liters: Double) -> Double {
        let answer = (desiredMix / 85) * liters
        let gallons = answer * 0.264172
        
        return gallons
    }
    
    func findGasAmount(gallons: Double, tankSize: Double) -> Double {
        let answer = tankSize - gallons
        
        return answer
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollView {
                VStack {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray.opacity(0.20))
                            .frame(height: geo.size.height / 5)
                        
                        VStack {
                            
                            HStack {
                                
                                Text("Desired Mix:")
                                    .font(.title2).fontWeight(.bold)
                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            
                            Picker("Select an appearence", selection: $desiredMix) {
                                
                                Text("E20").tag(20.0)
                                Text("E30").tag(30.0)
                                Text("E40").tag(40.0)
                                Text("E50").tag(50.0)
                                Text("E60").tag(60.0)

                            }
                            .background(.gray.opacity(0.20))
                            .cornerRadius(10)
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                        }
            
                    }
                    .padding(.vertical, 5)

                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray.opacity(0.20))
                            .frame(height: geo.size.height / 4)
                        
                        VStack {
                            
                            HStack {
                                
                                Text("Gallons To Fill:").font(.title2).fontWeight(.bold)
                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            
                            Slider(value: $gallons, in: 0...25, step: 0.25) {
                                Text("Slider")
                            } minimumValueLabel: {
                                Text("0").font(.title2).fontWeight(.thin)
                            } maximumValueLabel: {
                                Text("25").font(.title2).fontWeight(.thin)
                            }
                            .tint(.orange)
                            .padding()
                            
                            Text("\(gallons, specifier: "%.2f") Gallons")
                            
                        }
                    }
                    
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray.opacity(0.20))
                            .frame(height: geo.size.height / 3.5)
                        
                        VStack {
                            
                            HStack {
                                
                                Text("Ethanol Content:").font(.title2).fontWeight(.bold)
                                    .padding(.horizontal)
                                
                                Spacer()
                                
                            }
                            
                            Stepper(value: $E85Content,
                                    in: 1...100,
                                    step: 1) { Text("E85 Content: \(E85Content)%")
                            }
                            .padding()
                            
                            Stepper(value: $gasContent,
                                    in: 1...20,
                                    step: 1) {
                                Text("Gas Content: \(gasContent)%")
                            }
                            .padding()
                        }
                    }
                    .padding(.vertical, 5)
                    
                    
                    VStack {
                        
                        if gasAdd == 0.0 {
                            
                            Button {
                                
                                let litersToFill = convertGalLiters(gallons: gallons)
                                let E85 = findE85Amounts(liters: litersToFill)
                                let Gas = findGasAmount(gallons: E85, tankSize: gallons)
                                
                                gasAdd = Gas
                                E85Add = E85
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: geo.size.width / 2, height: 50)
                                    
                                    Text("Calcuate")
                                        .foregroundColor(.white)
                                        .font(.title).fontWeight(.medium)
                                    
                                }
                            }
                            .padding(.top, 30)
                            
                        } else {
                            
                            HStack {
                                
                                
                                VStack {
                                    Text("Add \(gasAdd, specifier: "%.2f")")
                                    Text("Gallons")
                                    Text("Of Gas")
                                }
                                .padding(.leading, 40)
                                
                                Spacer()
                                
                                VStack {
                                    Text("Add \(E85Add, specifier: "%.2f")")
                                    Text("Gallons")
                                    Text("Of E85")
                                }
                                .padding(.trailing, 40)
                                
                                
                                
                            }
                            .font(.title2).fontWeight(.medium)
                            
                            Button {
                                
                                let litersToFill = convertGalLiters(gallons: gallons)
                                let E85 = findE85Amounts(liters: litersToFill)
                                let Gas = findGasAmount(gallons: E85, tankSize: gallons)
                                
                                gasAdd = Gas
                                E85Add = E85
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: geo.size.width / 2, height: 50)
                                    
                                    Text("Calcuate")
                                        .foregroundColor(.white)
                                        .font(.title).fontWeight(.medium)
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .preferredColorScheme(.light)
    }
}

struct E85Calculator_Previews: PreviewProvider {
    static var previews: some View {
        E85Calculator()
    }
}
