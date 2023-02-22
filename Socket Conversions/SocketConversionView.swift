//
//  SocketConversion.swift
//  SAE-METRIC
//
//  Created by Michael Burlingame on 1/31/23.
//

import SwiftUI

struct SocketConversionView: View {
    
    @State private var convertFromMM = true
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Picker("Select an appearence", selection: $convertFromMM) {
                    
                    Text("Metric -> SAE").tag(true)
                    Text("SAE -> Metric").tag(false)
                    

                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            
            if convertFromMM == true {
                MetricToSAEView()
            } else {
                SAEtoMetricView()
            }
        }
    }
}

struct SocketConversion_Previews: PreviewProvider {
    static var previews: some View {
        SocketConversionView()
    }
}
