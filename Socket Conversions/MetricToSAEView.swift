//
//  MetricToSAEView.swift
//  SAE-METRIC
//
//  Created by Michael Burlingame on 1/30/23.
//

import SwiftUI

struct MetricToSAEView: View {
    
    @State private var a = ""
    @State private var convertedValueSAE: String?
    
    func METRIC_SAE(First: Int) -> String {
        
        let solution = Double(First) / 25.4
        let formated = String(format: "%.3f in", solution)
        
        return formated
        
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.gray.opacity(0.40))
                            .frame(width: geo.size.width / 3,
                                   height: geo.size.width / 4)
                        
                        TextField("0mm", text: $a)
                            .multilineTextAlignment(.center)
                            .font(Font.system(size: 45, design: .default))
                            .frame(width: geo.size.width / 3,
                                   height: geo.size.width / 4)
                            .keyboardType(.numberPad)
                        
                    }
                    Spacer()
                }
                
                Button {
                    
                    convertedValueSAE = METRIC_SAE(First: Int(a) ?? 0)
                    
                } label: {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color.gray.opacity(0.40))
                            .frame(width: geo.size.width / 2,
                                   height: geo.size.width / 4)
                        
                        Text("Convert")
                            .foregroundColor(.black)
                            .font(Font.system(size: 45, design: .rounded))
                        
                    }
                    
                }
                
                Text(convertedValueSAE ?? "")
                    .padding()
                
                Spacer()
                
            }
            .onTapGesture {
                self.endTextEditing()
            }
        }
    }
}

struct MetricToSAEView_Previews: PreviewProvider {
    static var previews: some View {
        MetricToSAEView()
    }
}
