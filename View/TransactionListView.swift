import SwiftUI

struct TransactionListView: View {
    @State private var showingAddTransaction = false
    @State private var transactions: [Transaction] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(transactions) { transaction in
                    TransactionRow(transaction: transaction)
                }
                .onDelete(perform: deleteTransaction)
            }
            .navigationTitle("账单记录")
            .toolbar {
                Button(action: {
                    showingAddTransaction = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddTransaction) {
                AddTransactionView()
            }
        }
    }
    
    private func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }
}

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.title)
                    .font(.headline)
                Text(transaction.category.name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(String(format: "%.2f", transaction.amount))
                .foregroundColor(transaction.type == .expense ? .red : .green)
        }
        .padding(.vertical, 8)
    }
}
