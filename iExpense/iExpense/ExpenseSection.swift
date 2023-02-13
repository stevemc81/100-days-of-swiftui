//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Steven McWee on 13/02/2023.
//

import SwiftUI

// Separate the Section into its own view so it can be called to display each of the expense types
struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    var localCurrency: FloatingPointFormatStyle<Double>.Currency {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: localCurrency)
                        .foregroundColor(item.amount < 10 ? .green : item.amount < 100 ? .blue : .red)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: [], deleteItems: { _ in })
    }
}
