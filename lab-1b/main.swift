
import Foundation

public enum BankAccountError: Error, CustomStringConvertible {
    case invalidAccountHolder
    case negativeOpeningBalance
    case invalidDeposit
    case invalidWithdrawal
    case insufficientBalance

    public var description: String {
        switch self {
        case .invalidAccountHolder:
            return "Account holder name cannot be empty."
        case .negativeOpeningBalance:
            return "Opening balance cannot be negative."
        case .invalidDeposit:
            return "Deposit amount must be greater than zero."
        case .invalidWithdrawal:
            return "Withdrawal amount must be greater than zero."
        case .insufficientBalance:
            return "Insufficient account balance."
        }
    }
}

public final class BankAccount {

    // PRIVATE: Cannot be directly accessed outside this type.
    private var balance: Double

    public let accountHolder: String

    // PUBLIC: Controlled account creation.
    public init(accountHolder: String, openingBalance: Double = 0) throws {

        let cleanedName = accountHolder.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !cleanedName.isEmpty else {
            throw BankAccountError.invalidAccountHolder
        }

        guard openingBalance >= 0 else {
            throw BankAccountError.negativeOpeningBalance
        }

        self.accountHolder = cleanedName
        self.balance = openingBalance
    }

    // PUBLIC: Read-only access to the balance.
    public var currentBalance: Double {
        return balance
    }

    // PUBLIC: Deposit money through validation.
    public func deposit(_ amount: Double) throws {

        guard amount > 0 else {
            throw BankAccountError.invalidDeposit
        }

        balance += amount
        print("Successfully deposited: ₹\(amount)")
    }

    // PUBLIC: Withdraw money through validation.
    public func withdraw(_ amount: Double) throws {

        guard amount > 0 else {
            throw BankAccountError.invalidWithdrawal
        }

        guard amount <= balance else {
            throw BankAccountError.insufficientBalance
        }

        balance -= amount
        print("Successfully withdrawn: ₹\(amount)")
    }

    // PRIVATE: Only this type can use this helper.
    private func balanceDescription() -> String {
        return "₹\(balance)"
    }

    // FILEPRIVATE: Available to code in this same file.
    fileprivate func auditDetails() -> String {
        return """
        Account Holder: \(accountHolder)
        Balance: \(balanceDescription())
        """
    }
}

