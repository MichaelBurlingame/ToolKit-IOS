
import SwiftUI

struct Chart: Identifiable {
    let id = UUID()
    let sae: String
    let metric: String
    let inch: String
}


struct ConversionTableView: View {
    
    @State private var chart = [
        Chart(sae: "5/32'", metric: "", inch: "0.156 in"),
        Chart(sae: "", metric: "4mm", inch: "0.157 in"),
        Chart(sae: "", metric: "4.5mm", inch: "0.177 in"),
        Chart(sae: "3/16'", metric: "", inch: "0.188 in"),
        Chart(sae: "", metric: "5mm", inch: "0.197 in"),
        Chart(sae: "", metric: "5.5mm", inch: "0.216 in"),
        Chart(sae: "7/32'", metric: "", inch: "0.219 in"),
        Chart(sae: "", metric: "6mm", inch: "0.236 in"),
        Chart(sae: "1/4'", metric: "", inch: "0.25 in"),
        Chart(sae: "", metric: "6.5mm", inch: "0.256 in"),
        Chart(sae: "", metric: "7mm", inch: "0.276 in"),
        Chart(sae: "9/32'", metric: "", inch: "0.281 in"),
        Chart(sae: "5/16'", metric: "", inch: "0.313 in"),
        Chart(sae: "", metric: "8mm", inch: "0.315 in"),
        Chart(sae: "11/32'", metric: "", inch: "0.344 in"),
        Chart(sae: "", metric: "9mm", inch: "0.354 in"),
        Chart(sae: "3/8'", metric: "", inch: "0.375 in"),
        Chart(sae: "", metric: "10mm", inch: "0.394 in"),
        Chart(sae: "13/32'", metric: "", inch: "0.406 in"),
        Chart(sae: "", metric: "11mm", inch: "0.433 in"),
        Chart(sae: "7/16'", metric: "", inch: "0.438 in"),
        Chart(sae: "15/32'", metric: "", inch: "0.469 in"),
        Chart(sae: "", metric: "12mm", inch: "0.472 in"),
        Chart(sae: "1/2'", metric: "", inch: "0.5 in"),
        Chart(sae: "", metric: "13mm", inch: "0.512 in"),
        Chart(sae: "17/32'", metric: "", inch: "0.531 in"),
        Chart(sae: "", metric: "14mm", inch: "0.551 in"),
        Chart(sae: "9/16'", metric: "", inch: "0.563 in"),
        Chart(sae: "", metric: "15mm", inch: "0.591 in"),
        Chart(sae: "19/32'", metric: "", inch: "0.594 in"),
        Chart(sae: "5/8'", metric: "", inch: "0.625 in"),
        Chart(sae: "", metric: "16mm", inch: "0.63 in"),
        Chart(sae: "21/32'", metric: "", inch: "0.656 in"),
        Chart(sae: "", metric: "17mm", inch: "0.669 in"),
        Chart(sae: "11/16'", metric: "", inch: "0.688 in"),
        Chart(sae: "", metric: "18mm", inch: "0.709 in"),
        Chart(sae: "23/32'", metric: "", inch: "0.719 in"),
        Chart(sae: "", metric: "19mm", inch: "0.748 in"),
        Chart(sae: "3/4'", metric: "", inch: "0.75 in"),
        Chart(sae: "25/32'", metric: "", inch: "0.781 in"),
        Chart(sae: "", metric: "20mm", inch: "0.787 in"),
        Chart(sae: "13/16'", metric: "", inch: "0.813 in"),
        Chart(sae: "", metric: "21mm", inch: "0.827 in"),
        Chart(sae: "27/32'", metric: "", inch: "0.844 in"),
        Chart(sae: "", metric: "22mm", inch: "0.866 in"),
        Chart(sae: "7/8'", metric: "", inch: "0.875 in"),
        Chart(sae: "", metric: "23mm", inch: "0.906 in"),
        Chart(sae: "29/32'", metric: "", inch: "0.906 in"),
        Chart(sae: "15/16'", metric: "", inch: "0.938 in"),
        Chart(sae: "", metric: "24mm", inch: "0.945 in"),
        Chart(sae: "1'", metric: "", inch: "1.0 in"),
        
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Text("SAE")
                    .padding(.trailing, 25)
                    .padding(.vertical)
                    .font(.system(size: 25, weight: .heavy, design: .monospaced))
                
                Spacer()
                
                Text("METRIC")
                    .padding(.trailing, 25)
                    .padding(.vertical)
                    .font(.system(size: 25, weight: .heavy, design: .monospaced))
                
                
                Spacer()
                
                Text("INCH")
                    .font(.system(size: 25, weight: .heavy, design: .monospaced))
                
                Spacer()
                
            }
            .background(Color.gray.opacity(0.40))
            
            List {
                
                ForEach(chart) { chart in
                    
                    HStack {
                        
                        Text(chart.sae)
                            .bold()
                            .padding(.leading, 25)
                        
                        
                        Spacer()
                        
                        Text(chart.metric)
                            .bold()
                            .padding(.leading, 50)
                        
                        Spacer()
                        
                        Text(chart.inch)
                            .bold()
                            .padding(.trailing, 25)
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

struct ConversionTableView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionTableView()
    }
}
