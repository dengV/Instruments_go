 

import Foundation

public struct Compressor {
  public static func loadCompressedFile(_ path: String) -> Data? {
    return Data(contentsOfArchive: path, usedCompression: .lzma)
  }
  
  public static func decompressData(_ data: Data) -> Data? {
    return data.uncompressed(using: .lzma)
    //return data.uncompressedDataUsingCompression(.lzma)
  }
  
  public static func saveDataAsCompressedFile(_ data: Data, path: String) -> Bool {
    guard let compressedData = data.compressed(using: .lzma) else { return false
    }
    print("compressed!")
    return ((try? compressedData.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil)
  }
  
}
