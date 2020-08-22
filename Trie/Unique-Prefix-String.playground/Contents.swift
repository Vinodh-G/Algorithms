import UIKit

var str = "Hello, playground"

func uniquePrefix(for words: [String]) -> [String: String] {
    guard !words.isEmpty else { return [:] }

    var trie: Trie<String> = trieDS(for: words)
    var prefixes: [String: String] = [:]
    for word in words {
        if let prefix = uniquePrefix(for: word, trie: &trie) {
            prefixes[prefix] = word
        }
    }
    return prefixes
}

private func uniquePrefix(for word: String, trie: inout Trie<String>) -> String? {
    guard !word.isEmpty else { return nil }
    let chars: [Character] = Array(word)
    var str = ""
    var parent = trie.root
    for ch in chars {
        if let node = parent.children[ch] {
            str += "\(ch)"
            if node.freq == 1 { return str }
            parent = node
        }
    }
    return nil
}

private func trieDS(for words: [String]) -> Trie<String> {
    let trie: Trie<String> = Trie()
    for word in words {
        trie.insert(item: word)
    }
    return trie
}

extension String: HashKey {
    public var key: String {
        return self
    }
}


print(uniquePrefix(for: ["alphabet", "carpet", "cartoon", "carrot", "alpine"]))
print(uniquePrefix(for: ["create", "big", "zebra"]))
