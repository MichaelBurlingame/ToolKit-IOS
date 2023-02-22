
import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView {
            
            E85Calculator()
                .tabItem {
                    Label("E85 CALCULATOR", systemImage: "fuelpump.fill")
                }
            
            ConversionTableView()
                .tabItem {
                    Label("CHART", systemImage: "tablecells")
                }
            
            SocketConversionView()
                .tabItem {
                    Label("SOCKET CONVERSION", systemImage: "wrench.and.screwdriver.fill")
                }
          
        }
        .preferredColorScheme(.light)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
