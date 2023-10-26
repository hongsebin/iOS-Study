import Foundation

public enum AccountError: Error {
    case invalidUsername
    case invalidPassword
    case usernameAlreadyInUse
}
