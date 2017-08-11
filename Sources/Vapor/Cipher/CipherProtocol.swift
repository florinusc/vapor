import Foundation
import Bits

/// Objects conforming to this protocol can be
/// used as ciphers for encrypting and decrypting information.
public protocol CipherProtocol: class {
    /// Encrypts bytes with a required key and
    /// optional initialization vector.
    func encrypt(_ bytes: Bytes) throws -> Bytes

    /// Decrypts bytes with a required key and
    /// optional initialization vector.
    func decrypt(_ bytes: Bytes) throws -> Bytes
}

// MARK: Convenience

extension CipherProtocol {
    public func encrypt(_ bytes: BytesConvertible) throws -> Bytes {
        return try encrypt(bytes.makeBytes())
    }

    public func decrypt(_ bytes: BytesConvertible) throws -> Bytes {
        return try decrypt(bytes.makeBytes())
    }
}
