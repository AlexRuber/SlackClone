//
//  SocketService.swift
//  SlackClone
//
//  Created by Mihai Ruber on 1/2/18.
//  Copyright © 2018 Mihai Ruber. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    
    func establishConnection() {
        manager.defaultSocket.connect()
    }
    
    func closeConnection() {
        manager.defaultSocket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        manager.defaultSocket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        manager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        manager.defaultSocket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getChatMessage(completion: @escaping CompletionHandler) {
        manager.defaultSocket.on("messageCreated") { (dataArray, ack) in
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }

            if channelId == MessageService.instance.selectedChannel?.id && AuthService.instance.isLoggedIn {
                let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                MessageService.instance.messages.append(newMessage)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
