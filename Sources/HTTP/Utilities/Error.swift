import Debugging
import Foundation
import libc

/// Errors that can be thrown while working with HTTP.
public struct HTTPError: Traceable, Debuggable, Swift.Error, Encodable {
    public static let readableName = "HTTP Error"
    public let identifier: String
    public var reason: String
    public var file: String
    public var function: String
    public var line: UInt
    public var column: UInt
    public var stackTrace: [String]

    public init(
        identifier: String,
        reason: String,
        file: String = #file,
        function: String = #function,
        line: UInt = #line,
        column: UInt = #column
    ) {
        self.identifier = identifier
        self.reason = reason
        self.file = file
        self.function = function
        self.line = line
        self.column = column
        self.stackTrace = HTTPError.makeStackTrace()
    }

    public static func invalidMessage(
        file: String = #file,
        function: String = #function,
        line: UInt = #line,
        column: UInt = #column
    ) -> HTTPError {
        return HTTPError(
            identifier: "invalidMessage",
            reason: "Unable to parse invalid HTTP message.",
            file: file,
            function: function,
            line: line,
            column: column
        )
    }

    public static func contentRequired(
        _ type: Any.Type,
        file: String = #file,
        function: String = #function,
        line: UInt = #line,
        column: UInt = #column
    ) -> HTTPError {
        return HTTPError(
            identifier: "contentRequired",
            reason: "\(type) content required.",
            file: file,
            function: function,
            line: line,
            column: column
        )
    }
}



