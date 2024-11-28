import SwiftUI

struct BudgetView: View {
    @State private var monthlyBudget: Double = 5000
    @State private var currentSpent: Double = 3250
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Budget Progress Card
                    VStack {
                        Text("本月预算")
                            .font(.headline)
                        
                        Text("¥\(String(format: "%.2f", monthlyBudget))")
                            .font(.title)
                            .bold()
                        
                        ProgressView(value: currentSpent, total: monthlyBudget)
                            .progressViewStyle(LinearProgressViewStyle(tint: progressColor))
                            .padding(.vertical)
                        
                        HStack {
                            Text("已支出: ¥\(String(format: "%.2f", currentSpent))")
                            Spacer()
                            Text("剩余: ¥\(String(format: "%.2f", monthlyBudget - currentSpent))")
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    
                    // Category Budgets
                    VStack(alignment: .leading) {
                        Text("分类预算")
                            .font(.headline)
                            .padding(.bottom)
                        
                        ForEach(["餐饮", "交通", "购物", "娱乐"], id: \.self) { category in
                            CategoryBudgetRow(category: category)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
                .padding()
            }
            .navigationTitle("预算")
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private var progressColor: Color {
        let percentage = currentSpent / monthlyBudget
        if percentage < 0.7 {
            return .green
        } else if percentage < 0.9 {
            return .yellow
        } else {
            return .red
        }
    }
}

struct CategoryBudgetRow: View {
    let category: String
    
    var body: some View {
        VStack {
            HStack {
                Text(category)
                Spacer()
                Text("¥1,000")
            }
            ProgressView(value: 0.6)
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
        }
        .padding(.vertical, 4)
    }
}
