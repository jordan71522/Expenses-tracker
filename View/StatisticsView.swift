import SwiftUI

struct StatisticsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Monthly Overview Card
                    VStack {
                        Text("本月概览")
                            .font(.headline)
                        
                        HStack {
                            StatCard(title: "支出", amount: "¥3,250", color: .red)
                            StatCard(title: "收入", amount: "¥5,800", color: .green)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    
                    // Category Distribution
                    VStack {
                        Text("支出分类")
                            .font(.headline)
                        
                        // Placeholder for pie chart
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(height: 200)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
                .padding()
            }
            .navigationTitle("统计")
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct StatCard: View {
    let title: String
    let amount: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(amount)
                .font(.title2)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(8)
    }
}
