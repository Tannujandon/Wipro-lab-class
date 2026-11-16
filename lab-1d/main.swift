
import Foundation

// MARK: - Student and Address Models

struct Address {
    var city: String
}

struct Student {
    var id: Int
    var name: String
    var marks: Int
    var address: Address?
}

// MARK: - Student Records

let students: [Int: Student] = [
    101: Student(
        id: 101,
        name: "Tannu",
        marks: 85,
        address: Address(city: "Mathura")
    ),
    102: Student(
        id: 102,
        name: "Rahul",
        marks: 90,
        address: Address(city: "Delhi")
    ),
    103: Student(
        id: 103,
        name: "Priya",
        marks: 78,
        address: nil
    )
]

// MARK: - R1: Lookup Student Marks by ID (Optional Result)

func getMarks(studentID: Int) -> Int? {
    return students[studentID]?.marks
}

print("========== R1 ==========")

if let marks = getMarks(studentID: 101) {
    print("Student marks: \(marks)")
} else {
    print("Student not found")
}

// Testing missing student ID
if let marks = getMarks(studentID: 999) {
    print("Student marks: \(marks)")
} else {
    print("Student not found")
}

// MARK: - R2: Optional Handling

print("\n========== R2 ==========")

// 1. if let
if let student = students[101] {
    print("Student name: \(student.name)")
} else {
    print("Student not found")
}

// 2. guard let
func displayStudentName(studentID: Int) {
    guard let student = students[studentID] else {
        print("Student not found")
        return
    }

    print("Student name: \(student.name)")
}

displayStudentName(studentID: 102)

// 3. Optional chaining
let city = students[101]?.address?.city
print("Student city: \(city ?? "City not available")")

// 4. Nil-coalescing operator
let studentName = students[999]?.name ?? "Unknown Student"
print("Student name: \(studentName)")

// MARK: - R3: Handle Missing Dictionary Key and Empty Text

print("\n========== R3 ==========")

// Handle missing dictionary key
let marks = students[999]?.marks ?? 0
print("Marks: \(marks)")

// Handle empty or whitespace-only text field
func validateStudentName(_ name: String) {
    let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)

    if trimmedName.isEmpty {
        print("Please enter a valid student name")
    } else {
        print("Student name: \(trimmedName)")
    }
}

validateStudentName("   ")
validateStudentName("Tannu")

// MARK: - R4: Avoid Force Unwrapping

print("\n========== R4 ==========")

// Unsafe force unwrapping is avoided.
// Instead, use optional binding.

let optionalName: String? = "Tannu"

if let validName = optionalName {
    print("Valid name: \(validName)")
} else {
    print("Name is not available")
}

// Safe default value using nil-coalescing
let anotherName: String? = nil
print("Name: \(anotherName ?? "Unknown")")

// Safe optional chaining
let studentCity = students[103]?.address?.city
print("City: \(studentCity ?? "Address not available")")

print("\n========== PROGRAM COMPLETED ==========")
