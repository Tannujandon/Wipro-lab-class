
import Foundation

// MARK: - R1: Store student information

let studentName: String = "Rahul Sharma"
let rollNumber: Int = 101

let subject1: Double = 78
let subject2: Double = 85
let subject3: Double = 69
let subject4: Double = 92
let subject5: Double = 74

let attendancePercentage: Double = 88.5

// Store marks in an array for easy calculation
let marks: [Double] = [
    subject1, subject2, subject3, subject4, subject5
]

// MARK: - R2: Calculate total, average and percentage

let totalMarks: Double = marks.reduce(0, +)
let maximumMarks: Double = Double(marks.count * 100)

let averageMarks: Double = totalMarks / Double(marks.count)
let percentage: Double = (totalMarks / maximumMarks) * 100

// Pass if the student scores at least 40 in every subject
let hasPassed: Bool = marks.allSatisfy { $0 >= 40 }

// Attendance eligibility: minimum 75%
let attendanceEligible: Bool = attendancePercentage >= 75

let result: String = (hasPassed && attendanceEligible)
    ? "PASS"
    : "FAIL"

// MARK: - R3: Demonstrate operators

print("\n========== OPERATOR DEMONSTRATION ==========")

// 1. Arithmetic operators
let addition = 10 + 5
let subtraction = 10 - 5
let multiplication = 10 * 5
let division = 10.0 / 5.0
let remainder = 10 % 3

print("\nArithmetic Operators:")
print("Addition: 10 + 5 = \(addition)")
print("Subtraction: 10 - 5 = \(subtraction)")
print("Multiplication: 10 * 5 = \(multiplication)")
print("Division: 10 / 5 = \(division)")
print("Remainder: 10 % 3 = \(remainder)")

// 2. Comparison operators
print("\nComparison Operators:")
print("10 == 5: \(10 == 5)")
print("10 != 5: \(10 != 5)")
print("10 > 5: \(10 > 5)")
print("10 < 5: \(10 < 5)")
print("10 >= 5: \(10 >= 5)")
print("10 <= 5: \(10 <= 5)")

// 3. Logical operators
let isPresent = true
let hasSubmittedAssignment = true

print("\nLogical Operators:")
print("AND: \(isPresent && hasSubmittedAssignment)")
print("OR: \(isPresent || false)")
print("NOT: \(!isPresent)")

// 4. Compound assignment operators
var score = 50

print("\nCompound Assignment Operators:")
score += 10
print("After += 10: \(score)")

score -= 5
print("After -= 5: \(score)")

score *= 2
print("After *= 2: \(score)")

score /= 2
print("After /= 2: \(score)")

// 5. Nil-coalescing operator
let optionalNickname: String? = nil
let nickname = optionalNickname ?? "Not Provided"

print("\nNil-Coalescing Operator:")
print("Nickname: \(nickname)")

// MARK: - R4: Assign grade using if/else and switch

var grade: String

if percentage >= 90 {
    grade = "A"
} else if percentage >= 80 {
    grade = "B"
} else if percentage >= 70 {
    grade = "C"
} else if percentage >= 60 {
    grade = "D"
} else {
    grade = "F"
}

// Switch statement to assign a performance remark
let remark: String

switch grade {
case "A":
    remark = "Excellent Performance"
case "B":
    remark = "Very Good Performance"
case "C":
    remark = "Good Performance"
case "D":
    remark = "Needs Improvement"
default:
    remark = "Failed - More Practice Required"
}

// MARK: - Formatted Student Result

print("\n============================================")
print("             STUDENT REPORT")
print("============================================")

print("Student Name       : \(studentName)")
print("Roll Number        : \(rollNumber)")

print("--------------------------------------------")
print("Subject 1 Marks    : \(subject1)")
print("Subject 2 Marks    : \(subject2)")
print("Subject 3 Marks    : \(subject3)")
print("Subject 4 Marks    : \(subject4)")
print("Subject 5 Marks    : \(subject5)")

print("--------------------------------------------")
print("Total Marks        : \(totalMarks) / \(maximumMarks)")
print("Average Marks      : \(String(format: "%.2f", averageMarks))")
print("Percentage         : \(String(format: "%.2f", percentage))%")
print("Attendance         : \(attendancePercentage)%")
print("Grade              : \(grade)")
print("Performance        : \(remark)")
print("Attendance Eligible: \(attendanceEligible)")
print("Final Result       : \(result)")

print("============================================")

