//
//  Trie.swift
//  
//
//  Created by Vinodh Govindaswamy on 23/08/20.
//

import Foundation

public protocol HashKey {
    var key: String { get }
}

public class Trie <Element: HashKey> {
    // Root does'nt have any character, used the least used char for testing
    public var root: TrieNode <Element> = TrieNode(ch: Character("`"))

    public init() {}

    public func insert(item: Element){

        guard !item.key.isEmpty else { return }
        let chars: [Character] = Array(item.key)

        var chIndex = 0
        var parent = root
        while chIndex < chars.count {

            let ch = chars[chIndex]
            if let node = parent.children[ch] {
                node.freq += 1
                parent = node
            } else {
                let newNode = TrieNode<Element>(ch: ch)
                parent.children[ch] = newNode
                parent = newNode
            }
            chIndex += 1
        }
        parent.data = item
    }
}


public class TrieNode <Element: HashKey> {
    public var ch: Character
    public var freq: Int = 1
    public var data: Element? = nil
    public var children: [Character: TrieNode<Element>] = [:]

    public init(ch: Character) {
        self.ch = ch
    }
}
