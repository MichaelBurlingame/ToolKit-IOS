//
//  SAEtoMetricView.swift
//  SAE-METRIC
//
//  Created by Michael Burlingame on 1/30/23.
//

import SwiftUI

struct SAEtoMetricView: View {
    
    @State private var numerator = ""
    @State private var denominator = ""
    @State private var convertedValueMetric: String?
    
    func SAE_METRIC(First: Double, Second: Double) -> String {
        
        let decimal = First / Second
        
        let conversion = decimal * 25.4
        
        let formatted = String(format: "%.2f mm", conversion)
        return formatted
        
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
                            .frame(width: geo.size.width / 4,
                                   height: geo.size.width / 4)
                            .padding(.leading, 50)
                        
                        TextField("0", text: $numerator)
                            .multilineTextAlignment(.center)
                            .font(Font.system(size: 45, design: .default))
                            .frame(width: geo.size.width / 4,
                                   height: geo.size.width / 4)
                            .padding(.leading, 50)
                            .keyboardType(.numberPad)
                        
                    }
                    
                    Text("/")
                        .font(Font.system(size: 45, design: .default))
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.gray.opacity(0.40))
                            .frame(width: geo.size.width / 4,
                                   height: geo.size.width / 4)
                            .padding(.trailing, 50)
                        
                        TextField("0", text: $denominator)
                            .multilineTextAlignment(.center)
                            .font(Font.system(size: 45, design: .default))
                            .frame(width: geo.size.width / 4,
                                   height: geo.size.width / 4)
                            .padding(.trailing, 50)
                            .keyboardType(.numberPad)
                        
                    }
                    
                    Spacer()
                    
                }
                
                Button {
                    
                    convertedValueMetric = SAE_METRIC(First: Double(numerator) ?? 0.0, Second: Double(denominator) ?? 0.0)
                    
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
                
                Text(convertedValueMetric ?? "")
                    .padding()
                
                Spacer()
                
            }
            .onTapGesture {
                self.endTextEditing()
            }
        }
    }
}

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

struct SAEtoMetricView_Previews: PreviewProvider {
    static var previews: some View {
        SAEtoMetricView()
    }
}
