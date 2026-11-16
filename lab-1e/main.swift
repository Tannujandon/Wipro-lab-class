
import Foundation

// MARK: - R1: Course Struct and CourseManager Class

struct Course {
    var courseName: String
    var duration: Int
    var fee: Double
}

class CourseManager {
    var course: Course

    init(course: Course) {
        self.course = course
    }

    func displayCourse() {
        print("Course: \(course.courseName)")
        print("Duration: \(course.duration) months")
        print("Fee: ₹\(course.fee)")
    }
}

print("========== R1 ==========")

let course1 = Course(
    courseName: "Swift Programming",
    duration: 3,
    fee: 5000
)

let manager = CourseManager(course: course1)
manager.displayCourse()


// MARK: - R2: Value Type vs Reference Type

print("\n========== R2 ==========")

// Struct example (Value Type)

var originalCourse = Course(
    courseName: "Java",
    duration: 4,
    fee: 6000
)

var copiedCourse = originalCourse

copiedCourse.courseName = "Python"
copiedCourse.fee = 7000

print("Original Struct: \(originalCourse.courseName)")
print("Copied Struct: \(copiedCourse.courseName)")

// Class example (Reference Type)

class Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let student1 = Student(name: "Rahul")
let student2 = student1

student2.name = "Aman"

print("Original Class Object: \(student1.name)")
print("Copied Class Reference: \(student2.name)")


// MARK: - R3: Teacher and Classroom Relationships

print("\n========== R3 ==========")

class Teacher {
    let name: String
    weak var classroom: Classroom?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Teacher \(name) is deallocated")
    }
}

class Classroom {
    let roomNumber: Int
    var teacher: Teacher?

    init(roomNumber: Int) {
        self.roomNumber = roomNumber
    }

    deinit {
        print("Classroom \(roomNumber) is deallocated")
    }
}

var teacher: Teacher? = Teacher(name: "Mr. Sharma")
var classroom: Classroom? = Classroom(roomNumber: 101)

// Classroom strongly owns Teacher
classroom?.teacher = teacher

// Teacher weakly references Classroom
teacher?.classroom = classroom

print("Teacher: \(classroom?.teacher?.name ?? "No teacher")")
print("Classroom: \(teacher?.classroom?.roomNumber ?? 0)")

// Release references
teacher = nil
classroom = nil


// MARK: - R4: Strong Reference Cycle and Memory Management

print("\n========== R4 ==========")

class CourseDetails {
    let name: String
    var onCompletion: (() -> Void)?

    init(name: String) {
        self.name = name
        print("\(name) initialized")
    }

    func setupStrongClosure() {
        // Strong reference cycle:
        // Object owns closure, closure strongly captures object.
        onCompletion = {
            print("Completed course: \(self.name)")
        }
    }

    func setupWeakClosure() {
        // Weak capture prevents strong reference cycle.
        onCompletion = { [weak self] in
            guard let self = self else {
                print("Course object no longer exists")
                return
            }

            print("Completed course: \(self.name)")
        }
    }

    deinit {
        print("\(name) deallocated")
    }
}

// Demonstrate strong reference cycle
do {
    var course: CourseDetails? = CourseDetails(name: "iOS Development")
    course?.setupStrongClosure()

    course = nil

    print("Strong cycle: object cannot be deallocated")
}

// Demonstrate weak capture
do {
    var course: CourseDetails? = CourseDetails(name: "Swift Basics")
    course?.setupWeakClosure()

    course?.onCompletion?()

    course = nil

    print("Weak capture: object can be deallocated")
}


// MARK: - R5: Value Semantics, Reference Semantics and ARC

print("\n========== R5 ==========")

// Value Semantics:
// Each struct variable maintains its own independent value.

struct Book {
    var title: String
}

var book1 = Book(title: "Swift Basics")
var book2 = book1

book2.title = "Advanced Swift"

print("Book 1: \(book1.title)")
print("Book 2: \(book2.title)")

// Reference Semantics:
// Multiple variables can refer to the same class instance.

class Library {
    var name: String

    init(name: String) {
        self.name = name
        print("Library initialized")
    }

    deinit {
        print("Library deallocated")
    }
}

var library1: Library? = Library(name: "Central Library")
var library2 = library1

library2?.name = "University Library"

print("Library 1: \(library1?.name ?? "None")")
print("Library 2: \(library2?.name ?? "None")")

// ARC: Automatic Reference Counting
// Object is deallocated when its last strong reference is released.

library1 = nil
print("First reference released")

library2 = nil
print("Last reference released")

print("\n========== PROGRAM COMPLETED ==========")
