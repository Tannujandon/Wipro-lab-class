
import Foundation

// MARK: - R1: Functions (Mean, Maximum, Email Validation, Display Name)

print("========== R1: FUNCTIONS ==========")

// Calculate mean (average)
func calculateMean(numbers: [Double]) -> Double? {
    guard !numbers.isEmpty else {
        return nil
    }

    let total = numbers.reduce(0, +)
    return total / Double(numbers.count)
}

// Find maximum value
func findMaximum(numbers: [Int]) -> Int? {
    return numbers.max()
}

// Validate email-like input
func isValidEmail(email: String) -> Bool {
    let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

    return trimmedEmail.contains("@") &&
           trimmedEmail.contains(".") &&
           !trimmedEmail.hasPrefix("@") &&
           !trimmedEmail.hasSuffix("@")
}

// Format display name
func formatDisplayName(firstName: String, lastName: String) -> String {
    let formattedFirstName = firstName
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .capitalized

    let formattedLastName = lastName
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .capitalized

    return "\(formattedFirstName) \(formattedLastName)"
}

// Testing R1
let numbers = [10.0, 20.0, 30.0, 40.0]

print("Mean:", calculateMean(numbers: numbers) ?? 0)
print("Maximum:", findMaximum(numbers: [12, 45, 23, 67, 34]) ?? 0)
print("Email valid:", isValidEmail(email: "student@gmail.com"))
print("Display Name:", formatDisplayName(firstName: "tannu", lastName: "jadon"))


// MARK: - R2: Filter, Map and Reduce Transactions

print("\n========== R2: HIGHER ORDER FUNCTIONS ==========")

struct Transaction {
    let title: String
    let amount: Double
    let type: String
}

let transactions = [
    Transaction(title: "Salary", amount: 30000, type: "Income"),
    Transaction(title: "Food", amount: 500, type: "Expense"),
    Transaction(title: "Shopping", amount: 1500, type: "Expense"),
    Transaction(title: "Travel", amount: 800, type: "Expense"),
    Transaction(title: "Bonus", amount: 2000, type: "Income")
]

// Filter: Select only expenses
let expenses = transactions.filter {
    $0.type == "Expense"
}

// Map: Transform expenses into their amounts
let expenseAmounts = expenses.map {
    $0.amount
}

// Reduce: Calculate total expenses
let totalExpenses = expenseAmounts.reduce(0, +)

print("Expense Transactions:")

for expense in expenses {
    print("\(expense.title): ₹\(expense.amount)")
}

print("Expense Amounts:", expenseAmounts)
print("Total Expenses: ₹\(totalExpenses)")


// MARK: - R3: Sort Students by Marks and Name

print("\n========== R3: SORTING STUDENTS ==========")

struct Student {
    let name: String
    let marks: Int
}

let students = [
    Student(name: "Rahul", marks: 85),
    Student(name: "Aman", marks: 90),
    Student(name: "Priya", marks: 85),
    Student(name: "Tannu", marks: 95),
    Student(name: "Ankit", marks: 90)
]

// Sort by marks (highest first).
// If marks are equal, sort names alphabetically.
let sortedStudents = students.sorted {
    if $0.marks != $1.marks {
        return $0.marks > $1.marks
    }

    return $0.name < $1.name
}

for student in sortedStudents {
    print("\(student.name): \(student.marks)")
}


// MARK: - R4: Loop-Based vs Higher-Order Function

print("\n========== R4: LOOP VS HIGHER ORDER FUNCTIONS ==========")

let values = [10, 20, 30, 40, 50]

// Loop-based solution
var loopTotal = 0

for value in values {
    loopTotal += value
}

print("Loop-based total:", loopTotal)

// Higher-order function solution
let functionalTotal = values.reduce(0, +)

print("Higher-order function total:", functionalTotal)


// Loop-based filtering
var loopExpenses: [Int] = []

for amount in [100, 200, 300, 400, 500] {
    if amount >= 300 {
        loopExpenses.append(amount)
    }
}

print("Loop-based filtering:", loopExpenses)

// Higher-order filtering
let functionalExpenses = [100, 200, 300, 400, 500].filter {
    $0 >= 300
}

print("Higher-order filtering:", functionalExpenses)


// MARK: - R5: Clear Parameter Labels and Return Types

print("\n========== R5: FUNCTION DESIGN ==========")

// Clear external parameter labels and explicit return type
func calculateDiscount(price: Double, discountPercentage: Double) -> Double {
    let discount = price * discountPercentage / 100
    return price - discount
}

func greetStudent(name: String, course: String) -> String {
    return "Hello \(name), welcome to \(course)!"
}

let finalPrice: Double = calculateDiscount(
    price: 1000,
    discountPercentage: 20
)

let greeting: String = greetStudent(
    name: "Tannu",
    course: "Swift Programming"
)

print("Final Price: ₹\(finalPrice)")
print(greeting)

print("\n========== PROGRAM COMPLETED ==========")
