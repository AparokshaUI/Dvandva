//
//  main.swift
//  Dvandva
//
//  Created by david-swift on 01.11.23.
//

// swiftlint:disable no_magic_numbers missing_docs force_unwrapping

import Dvandva
import Foundation

let app = Application("Test", version: "test", id: "io.github.david_swift.Dice", developer: "david-swift")

class DiceModel {

    var entries: [Int] = [] {
        didSet {
            _ = self.averageLabel.setLabel("\(average)")
            list.select(index: 0)
        }
    }
    var average: Float {
        Float(entries.reduce(0) { $0 + $1 }) / Float(entries.count)
    }
    var index = 0
    let list: List = .init()
    let label: Label = .init().setFont(.title1)
    #if os(macOS)
    let attemptLabel: MenuButton = .init("")
        .buttonStyle(.pill)
        .editMenu { _ = $0.addButton("Delete", app: app, id: "Delete Selection") }
    #else
    let attemptLabel: Label = .init().setFont(.caption)
    #endif
    let averageLabel: Button = .init("")

    init() {
        list.observeSelection { index in
            self.index = index
            let attemptNumber = self.entries.count - index
            _ = self.label.setText("\(self.entries[attemptNumber - 1])")
            let text = "Attempt #\(attemptNumber)"
            #if os(macOS)
            _ = self.attemptLabel.setLabel(text)
            #else
            _ = self.attemptLabel.setText(text)
            #endif
        }
        rollDice()
    }

    func rollDice() {
        let random = Int.random(in: 1...6)
        _ = list.prepend(label: "\(random)", icon: .number)
        entries.append(random)
    }

    func deleteSelection() {
        if !entries.isEmpty {
            _ = list.remove(at: index)
            entries.remove(at: entries.count - index - 1)
        }
    }

}

func generateWindow() {
    let model = DiceModel()

    let newWindow = Window(id: UUID().uuidString, app: app)
    newWindow.setSidebar(model.list)
    newWindow.addChild(Box().append(model.label).append(model.attemptLabel))
    newWindow.data["model"] = model

    newWindow.setMainMenu(
      .init()
        .addButton("New Window", app: app, id: "New Window")
        .addButton("Close Window", app: app, id: "Close Window")
        .addSection(
          .init()
            .addButton("Roll the Dice", app: app, id: "Roll the Dice")
            .addButton("Delete Selection", app: app, id: "Delete Selection")
          )
    )
    newWindow.addToolbarItem(model.averageLabel, label: "Average", navigational: true)
    newWindow.addToolbarItem(Button(.reload).setAction { model.rollDice() }, label: "Roll the Dice")

    newWindow.setDefaultSize(width: 500, height: 350)
    newWindow.setMinimumSize(width: 380, height: 250)
    newWindow.show()
}

app.run {
    app.addMenu(
        "File",
        menu: .init()
            .addButton("New Window", app: app, shortcut: .init("n", shift: true)) {
                generateWindow()
            }
            .addButton("Close Window", app: app, shortcut: .init("w")) {
                app.keyWindow?.close()
            }
    )
    app.addMenu(
        "Dice",
        menu: .init()
            .addButton("Roll the Dice", app: app, shortcut: .init("n")) {
                if let model = app.keyWindow?.data["model"] as? DiceModel {
                    model.rollDice()
                }
            }
            .addButton("Delete Selection", app: app, shortcut: .deleteShortcut) {
                if let model = app.keyWindow?.data["model"] as? DiceModel {
                    model.deleteSelection()
                }
            }
    )
    app.setHelp(url: .init(string: "https://github.com/david-swift/Dvandva/")!)
    app.setIssue(url: .init(string: "https://github.com/david-swift/Dvandva/issues/")!)
    generateWindow()
}

// swiftlint:enable no_magic_numbers missing_docs force_unwrapping
