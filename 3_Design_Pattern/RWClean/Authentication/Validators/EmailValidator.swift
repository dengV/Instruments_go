 

// Based on https://github.com/vapor/vapor/blob/master/Sources/Vapor/Validation/Convenience/Email.swift

public class EmailValidator {
  public static func validate(input value: String) -> Bool {
    guard let localName = value.components(separatedBy: "@").first, isValidLocalName(localName) else {
      return false
    }
    return value.range(of: ".@.+\\..", options: .regularExpression) != nil
  }
    // 来一个 正则
    //  The only sort of validation the app is currently doing ,
    //  is making sure that email is in the expected format.
    
    
    
  
  private static func isValidLocalName(_ string: String) -> Bool {
    let valid = string.filter(isValid)
    return valid.count == string.count
  }
  
  private static func isValid(_ character: Character) -> Bool {
    switch character {
    case "a"..."z", "A"..."Z", "0"..."9":
      return true
    case "!", "#", "$", "%", "&", "'", "*", "+", "-", "/", "=", "?", "^", "_", "`", "{", "|", "}", "~", ".":
      return true
    default:
      return false
    }
  }
}
