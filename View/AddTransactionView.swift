import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var amount = ""
    @State private var type: Transaction.TransactionType = .expense
    @State private var category: Category?
    @State private var date = Date()
    @State private var note = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("基本信息")) {
                    TextField("标题", text: $title)
                    TextField("金额", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker("类型", selection: $type) {
                        Text("支出").tag(Transaction.TransactionType.expense)
                        Text("收入").tag(Transaction.TransactionType.income)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("详细信息")) {
                    DatePicker("日期", selection: $date, displayedComponents: .date)
                    TextField("备注", text: $note)
                }
            }
            .navigationTitle("新增记录")
            .navigationBarItems(
                leading: Button("取消") {
                    dismiss()
                },
                trailing: Button("保存") {
                    saveTransaction()
                }
            )
        }
    }
    
    private func saveTransaction() {
        // TODO: Implement save logic
        dismiss()
    }
}
