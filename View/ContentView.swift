import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TransactionListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("记录")
                }
                .tag(0)
            
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("统计")
                }
                .tag(1)
            
            BudgetView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("预算")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("设置")
                }
                .tag(3)
        }
    }
}
