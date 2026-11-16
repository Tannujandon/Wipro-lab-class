# Swift Collections Management System

## 1. Project Overview

The **Swift Collections Management System** is a command-line application developed using Swift. It demonstrates the practical use of Swift's fundamental collection types: Array, Set, and Dictionary, along with Enumerations and Switch statements.

The project manages course information, maintains unique student IDs, stores student marks, identifies the highest-scoring student, and displays task priorities through an enum.

This project demonstrates how different Swift collections can be used to organize, manipulate, search, and process data efficiently.

## 2. Objectives

The main objectives of this project are:

- To understand and implement Swift Arrays.
- To perform adding, removing, sorting, filtering, and searching operations on courses.
- To use Sets to remove duplicate student IDs.
- To use Dictionaries to store student IDs and their corresponding marks.
- To identify the student with the highest marks.
- To find students scoring below a specified threshold.
- To implement Enumerations and Switch statements for task priority management.
- To understand when to use Array, Set, and Dictionary in real-world applications.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Swift | Programming language |
| Xcode | Development environment |
| Foundation | Standard library support |
| Command Line Tool | Application execution environment |

## 4. Project Features

### R1 – Course Management Using Array

The application maintains an array of course names.

The following operations are implemented:

1. **Add:** Adds a new course using `append()`.
2. **Remove:** Removes an existing course using `remove(at:)`.
3. **Sort:** Arranges courses alphabetically using `sorted()`.
4. **Filter:** Displays courses matching a particular keyword using `filter()`.
5. **Search:** Searches for a specific course using `first(where:)`.

Example:

```swift
var courses: [String] = [
    "Java Programming",
    "Python Programming",
    "Data Structures",
    "Web Development"
]

courses.append("Artificial Intelligence")

if let index = courses.firstIndex(of: "Web Development") {
    courses.remove(at: index)
}

let sortedCourses = courses.sorted()

let programmingCourses = courses.filter {
    $0.localizedCaseInsensitiveContains("Programming")
}
```

### R2 – Unique Student IDs Using Set

The application stores student IDs in an array containing duplicate values.

It converts the array into a Set to automatically eliminate duplicates.

Example:

```swift
let studentIDs = [
    101, 102, 103, 101, 104, 102, 105, 103, 106
]

let uniqueStudentIDs = Set(studentIDs)

print("Unique IDs:", uniqueStudentIDs.sorted())
print("Unique Student Count:", uniqueStudentIDs.count)
```

**Expected result:**

- Total ID entries: 9
- Unique student IDs: 6
- Duplicate entries: 3

### R3 – Student Marks Using Dictionary

The application uses a Dictionary to associate student IDs with their marks.

The student ID acts as the key, while the marks act as the value.

Example:

```swift
let studentMarks: [Int: Int] = [
    101: 85,
    102: 92,
    103: 76,
    104: 95,
    105: 68,
    106: 88
]
```

The application performs the following operations:

- Displays student IDs and marks.
- Identifies the topper using `max(by:)`.
- Finds students scoring below 75 using `filter()`.
- Retrieves an individual student's marks using their ID.

**Expected result:**

| Student ID | Marks |
|---|---:|
| 101 | 85 |
| 102 | 92 |
| 103 | 76 |
| 104 | 95 |
| 105 | 68 |
| 106 | 88 |

- Topper: Student ID 104
- Highest marks: 95
- Students scoring below 75: Student ID 105 (68 marks)

### R4 – Task Priority Using Enum and Switch

The application defines an enumeration named `TaskPriority`.

It contains four predefined priority levels:

```swift
enum TaskPriority {
    case low
    case medium
    case high
    case urgent
}
```

A switch statement displays a user-friendly description for each priority.

| Priority | Description |
|---|---|
| Low | Can be completed later |
| Medium | Complete within a few days |
| High | Complete soon |
| Urgent | Requires immediate attention |

This approach ensures that only predefined priority values are used.

### R5 – Understanding Swift Collections

The project demonstrates three important Swift collection types.

| Collection | Characteristics | Best Use |
|---|---|---|
| Array | Ordered collection; duplicates allowed | Maintaining course names |
| Set | Stores unique elements; order not guaranteed | Removing duplicate student IDs |
| Dictionary | Stores key-value pairs; keys are unique | Mapping student IDs to marks |

**Why use Array?**

An Array is useful when the order of elements matters and duplicate values may be allowed. It is suitable for maintaining lists of courses.

**Why use Set?**

A Set is useful when only unique values are required. It automatically removes duplicates and supports efficient membership checking.

**Why use Dictionary?**

A Dictionary is useful when information needs to be retrieved using a unique key. In this project, student IDs are used to retrieve marks.

## 5. Project Structure

```text
SwiftCollectionsManagement/
│
├── main.swift
└── README.md
```

- `main.swift`: Contains the complete Swift program and all collection operations.
- `README.md`: Contains project documentation, implementation details, and execution instructions.

## 6. Sample Output

The program produces output similar to the following:

```text
========== COURSE MANAGEMENT ==========

Original Courses:
["Java Programming", "Python Programming",
 "Data Structures", "Web Development",
 "Database Management"]

After Adding a Course:
Artificial Intelligence added successfully.

After Removing Web Development:
Web Development removed successfully.

Sorted Courses:
Courses arranged alphabetically.

Filtered Programming Courses:
Java Programming
Python Programming

Search Result:
Python Programming found.

========== STUDENT ID MANAGEMENT ==========

Total ID Entries: 9
Unique Student Count: 6
Duplicate Entries: 3

========== STUDENT MARKS MANAGEMENT ==========

Topper:
Student ID: 104
Marks: 95

Students Scoring Below 75:
Student ID: 105
Marks: 68

========== TASK PRIORITY MANAGEMENT ==========

Priority: Low - Can be completed later.
Priority: Medium - Complete within a few days.
Priority: High - Complete soon.
Priority: Urgent - Requires immediate attention.

========== PROGRAM COMPLETED ==========
```

*Note: The actual console output also includes the complete course lists, student marks, and collection summary.*

## 7. How to Run the Project

Follow these steps to execute the application:

1. Open Xcode on your Mac.
2. Select **File → New → Project**.
3. Choose **macOS → Command Line Tool**.
4. Enter the project name `SwiftCollectionsManagement`.
5. Select Swift as the programming language.
6. Open the generated `main.swift` file.
7. Replace the existing code with the project implementation.
8. Save the file.
9. Click the Run button or press `Command + R`.
10. View the program output in the Xcode console.

## 8. Requirement Mapping

| Requirement | Implementation | Status |
|---|---|---|
| R1 | Array operations: add, remove, sort, filter, search | Implemented |
| R2 | Set conversion and unique student count | Implemented |
| R3 | Dictionary, topper identification, threshold filtering | Implemented |
| R4 | TaskPriority enum and switch statement | Implemented |
| R5 | Explanation and comparison of Array, Set, and Dictionary | Implemented |

## 9. Key Swift Concepts Learned

Through this project, the following Swift concepts were practiced:

- Variables and constants (`var`, `let`).
- Arrays and collection manipulation.
- Sets and duplicate removal.
- Dictionaries and key-value storage.
- Enumerations (`enum`).
- Switch statements.
- Loops and conditional statements.
- Closures and higher-order functions.
- Optional binding using `if let`.
- Collection methods such as `append()`, `remove(at:)`, `sorted()`, `filter()`, and `max(by:)`.

## 10. Conclusion

The Swift Collections Management System successfully demonstrates the practical implementation of Array, Set, Dictionary, and Enum in Swift.

It provides a simple example of how different data structures solve different programming problems:

- Arrays organize and manipulate ordered data.
- Sets maintain unique values.
- Dictionaries establish relationships between keys and values.
- Enums represent a fixed group of related options.

This project helped strengthen the understanding of Swift collection types and their applications in real-world software development.

---

**Project Name:** Swift Collections Management System  
**Language:** Swift  
**Platform:** macOS Command Line / Swift Playground  
**IDE:** Xcode  
**Project Type:** Academic Programming Assignment
