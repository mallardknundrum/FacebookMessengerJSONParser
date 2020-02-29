import Foundation

public let playgroundDirectoryURL = URLComponents(string: "/Users/jeremiahhawks/Documents/DevProjects/FacebookMessengerJSON")!
public let playgroundOutputURL = URLComponents(string: "/Users/jeremiahhawks/Documents/DevProjects/FacebookMessengerJSON/output.txt")!
public let jsonURL = Bundle.main.url(forResource: "message_1", withExtension: "json")!
public let messageContainerData = try! Data(contentsOf: jsonURL)
