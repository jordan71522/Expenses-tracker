import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var currency = "CNY"
    @State private var darkModeEnabled = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("通用设置")) {
                    Toggle("开启通知", isOn: $notificationsEnabled)
                    
                    Picker("货币", selection: $currency) {
                        Text("人民币 (CNY)").tag("CNY")
                        Text("美元 (USD)").tag("USD")
                        Text("欧元 (EUR)").tag("EUR")
                    }
                    
                    Toggle("深色模式", isOn: $darkModeEnabled)
                }
                
                Section(header: Text("数据管理")) {
                    Button("导出数据") {
                        exportData()
                    }
                    
                    Button("备份到iCloud") {
                        backupToCloud()
                    }
                }
                
                Section(header: Text("关于")) {
                    HStack {
                        Text("版本")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                    
                    Button("隐私政策") {
                        // TODO: Show privacy policy
                    }
                    
                    Button("用户协议") {
                        // TODO: Show terms of service
                    }
                }
            }
            .navigationTitle("设置")
        }
    }
    
    private func exportData() {
        // TODO: Implement data export
    }
    
    private func backupToCloud() {
        // TODO: Implement iCloud backup
    }
}
