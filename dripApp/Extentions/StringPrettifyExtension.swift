//
//  StringPrettifyExtension.swift
//  dripApp
//
//  Created by Тимофей Фролов on 22.02.2026.
//

import Foundation

extension String {
    func prettifyClassTitle(enabled: Bool = true) -> String {
        guard enabled else { return self }
        guard
            let openBracket = self.lastIndex(of: "("),
            let closeBracket = self.lastIndex(of: ")")
        else { return self }
        return String(self[..<openBracket] + self[self.index(after: closeBracket)...]).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
