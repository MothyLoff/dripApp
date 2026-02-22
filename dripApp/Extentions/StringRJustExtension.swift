//
//  StringRJustExtension.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

extension String {
    func rjust(char: String = " ", minWidth: Int) -> String {
        guard minWidth > 0 else { return self }

        let len = self.count
        guard len < minWidth else { return self }

        let need = minWidth - len

        let repeated = String(repeating: char, count: need)
        let pad = String(repeated.prefix(need))

        return pad + self
    }
}
