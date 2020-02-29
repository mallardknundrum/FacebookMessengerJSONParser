import Foundation

public class Message: Codable {
    public let sender: String
    public let timeStamp: Int
    public let content: String?
    public let photos: [Photo]?
    public let reactions: [Reaction]?
    
    enum CodingKeys: String, CodingKey {
        case sender = "sender_name"
        case timeStamp = "timestamp_ms"
        case content, photos, reactions
    }
}

public class Reaction: Codable {
    public let emoji: String
    public let actor: String
    
    enum CodingKeys: String, CodingKey {
        case emoji = "reaction"
        case actor
    }
}

public class Photo: Codable {
    public let uri: String
    public let timeStamp: Int
    
    enum CodingKeys: String, CodingKey {
        case uri
        case timeStamp = "creation_timestamp"
    }
}


public class MessageContainer: Codable {
    public let messages: [Message]
}
