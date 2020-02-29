import Cocoa

let fileManager = FileManager.default

func encode(_ s: String) -> String {
    let data = s.data(using: .nonLossyASCII, allowLossyConversion: true)!
    return String(data: data, encoding: .utf8)!
}

func decode(_ s: String) -> String? {
    let data = s.data(using: .utf8)!
    return String(data: data, encoding: .nonLossyASCII)
}
let messageContainer = try! JSONDecoder().decode(MessageContainer.self, from: messageContainerData)

let sortedMessages = messageContainer.messages.sorted( by: { $0.timeStamp < $1.timeStamp} )

var outputString = ""

for message in sortedMessages {
    outputString.append(message.sender)
    outputString.append(":\n")
    if let content = message.content {
        outputString.append(content)
        outputString.append("\n")
    }
    if let photos = message.photos {
        for photo in photos {
            outputString.append("PHOTO")
            outputString.append("\n")
            outputString.append(photo.uri)
            outputString.append("\n")
        }
    }
    if let reactions = message.reactions {
        for reaction in reactions {
            outputString.append("\(reaction.actor) reacted with \(encode(reaction.emoji))")
            outputString.append("\n")
            print(reaction.emoji)
//            print(encode(reaction.emoji))
//            print(decode(reaction.emoji))
        }
    }
    outputString.append("\n")
}

fileManager.createFile(atPath: playgroundOutputURL.url!.absoluteString, contents: outputString.data(using: .utf8)!, attributes: nil)

//let string = String(data: messageContainerData, encoding: .utf8)
//print(string)
//
//let string2 = "\\u00f0\\u009f\\u0098\\u0086\""
//print(decode(string2))
//print(encode(string2))
