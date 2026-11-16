
import Foundation

// =====================================================
// R1: ARRAY - COURSE MANAGEMENT
// =====================================================

print("========== COURSE MANAGEMENT ==========")

// Maintain an array of course names
var courses: [String] = [
    "Java Programming",
    "Python Programming",
    "Data Structures",
    "Web Development",
    "Database Management"
]

// Display original courses
print("\nOriginal Courses:")
print(courses)

// ADD a course
courses.append("Artificial Intelligence")
print("\nAfter Adding a Course:")
print(courses)

// REMOVE a course
if let index = courses.firstIndex(of: "Web Development") {
    courses.remove(at: index)
}
print("\nAfter Removing Web Development:")
print(courses)

// SORT courses alphabetically
let sortedCourses = courses.sorted()
print("\nSorted Courses:")
print(sortedCourses)

// FILTER courses containing the word Programming
let filteredCourses = courses.filter {
    $0.localizedCaseInsensitiveContains("Programming")
}
print("\nFiltered Programming Courses:")
print(filteredCourses)

// SEARCH for a particular course
let searchCourse = "Python Programming"

if let foundCourse = courses.first(where: {
    $0.localizedCaseInsensitiveCompare(searchCourse) == .orderedSame
}) {
    print("\nSearch Result: \(foundCourse) found.")
} else {
    print("\nSearch Result: Course not found.")
}

// =====================================================
// R2: SET - REMOVE DUPLICATE STUDENT IDs
// =====================================================

print("\n========== STUDENT ID MANAGEMENT ==========")

// Array containing duplicate student IDs
let studentIDs: [Int] = [
    101, 102, 103, 101, 104, 102, 105, 103, 106
]

// Convert Array into Set to remove duplicates
let uniqueStudentIDs: Set<Int> = Set(studentIDs)

print("\nOriginal Student IDs:")
print(studentIDs)

print("\nUnique Student IDs:")
print(uniqueStudentIDs.sorted())

print("\nTotal ID Entries: \(studentIDs.count)")
print("Unique Student Count: \(uniqueStudentIDs.count)")
print("Duplicate Entries: \(studentIDs.count - uniqueStudentIDs.count)")

// =====================================================
// R3: DICTIONARY - STUDENT MARKS MANAGEMENT
// =====================================================

print("\n========== STUDENT MARKS MANAGEMENT ==========")

// Dictionary mapping student ID to marks
let studentMarks: [Int: Int] = [
    101: 85,
    102: 92,
    103: 76,
    104: 95,
    105: 68,
    106: 88
]

// Display all student marks
print("\nStudent Marks:")

for (studentID, marks) in studentMarks.sorted(by: { $0.key < $1.key }) {
    print("Student ID: \(studentID), Marks: \(marks)")
}

// Find the topper
if let topper = studentMarks.max(by: { $0.value < $1.value }) {
    print("\nTopper:")
    print("Student ID: \(topper.key)")
    print("Marks: \(topper.value)")
}

// Find students scoring below a threshold
let threshold = 75

let belowThreshold = studentMarks.filter {
    $0.value < threshold
}

print("\nStudents Scoring Below \(threshold):")

if belowThreshold.isEmpty {
    print("No students found.")
} else {
    for (studentID, marks) in belowThreshold.sorted(by: { $0.key < $1.key }) {
        print("Student ID: \(studentID), Marks: \(marks)")
    }
}

// Access marks using a student ID
let searchedID = 102

if let marks = studentMarks[searchedID] {
    print("\nMarks of Student \(searchedID): \(marks)")
} else {
    print("\nStudent ID not found.")
}

// =====================================================
// R4: ENUM - TASK PRIORITY
// =====================================================

print("\n========== TASK PRIORITY MANAGEMENT ==========")

// Define an enum for task priority
enum TaskPriority {
    case low
    case medium
    case high
    case urgent
}

// Function to display user-friendly priority labels
func displayPriority(_ priority: TaskPriority) {

    switch priority {

    case .low:
        print("Priority: Low - Can be completed later.")

    case .medium:
        print("Priority: Medium - Complete within a few days.")

    case .high:
        print("Priority: High - Complete soon.")

    case .urgent:
        print("Priority: Urgent - Requires immediate attention.")
    }
}

// Create different tasks
let task1 = TaskPriority.low
let task2 = TaskPriority.medium
let task3 = TaskPriority.high
let task4 = TaskPriority.urgent

// Display priorities
displayPriority(task1)
displayPriority(task2)
displayPriority(task3)
displayPriority(task4)

// =====================================================
// R5: EXPLANATION OF COLLECTIONS
// =====================================================

print("\n========== COLLECTIONS SUMMARY ==========")

print("""
1. ARRAY:
   - Stores multiple values in an ordered collection.
   - Allows duplicate values.
   - Best for course lists where order matters.

2. SET:
   - Stores unique values only.
   - Does not guarantee insertion order.
   - Best for removing duplicate student IDs.

3. DICTIONARY:
   - Stores data as key-value pairs.
   - Keys must be unique.
   - Best for mapping student IDs to marks.

4. ENUM:
   - Defines a fixed group of related values.
   - Best for task priorities and order statuses.
   - Switch makes it easy to handle each case.
""")

print("========== PROGRAM COMPLETED ==========")

