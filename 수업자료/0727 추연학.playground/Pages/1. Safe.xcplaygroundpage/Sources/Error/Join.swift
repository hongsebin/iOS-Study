import Foundation

public class Platform {
    public static func join(id: String, pw: String) {
        do {
            let result = try createAccount(id: id, pw: pw)
            print(result)
        } catch AccountError.invalidUsername {
            print("Username is too short.")
        } catch AccountError.invalidPassword {
            print("Password is too short.")
        } catch AccountError.usernameAlreadyInUse {
            print("Username is already in use.")
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    public static func fastJoin(id: String, pw: String) {
        guard let result = try? createAccount(id: id, pw: pw) else { return }
        print(result)
    }
    
    private static func createAccount(id: String, pw: String) throws -> String {
        if id.count < 6 {
            throw AccountError.invalidUsername
        } else if pw.count < 8 {
            throw AccountError.invalidPassword
        } else if id.lowercased() == "admin" {
            throw AccountError.usernameAlreadyInUse
        }
        
        return "Account created successfully."
    }
}
