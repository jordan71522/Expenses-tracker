import SwiftUI
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@main
struct ExpenseTrackerApp: App {
    init() {
        AppCenter.start(withAppSecret: AppConfig.appCenterSecret) { services in
            services.analytics = true
            services.crashes = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
