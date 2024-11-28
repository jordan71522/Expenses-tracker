import Foundation

struct Transaction: Identifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var title: String
    var date: Date
    var category: Category
    var type: TransactionType
    var note: String?
    
    enum TransactionType: String, Codable {
        case income = "收入"
        case expense = "支出"
    }
}

struct Category: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var icon: String
    var color: String
}
