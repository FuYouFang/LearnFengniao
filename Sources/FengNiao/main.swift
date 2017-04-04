import Foundation
import CommandLineKit
import Rainbow
import FengNiaoKit

//print("Hello, world!")

// 打印 arguments
//print(CommandLine.arguments)


let cli = CommandLineKit.CommandLine()

let projectOption = StringOption(shortFlag: "p", longFlag: "project", required: true,
                                 helpMessage: "Path to the project.")
let excludePathsOption = MultiStringOption(shortFlag: "e", longFlag: "exclude", helpMessage: "Excluded paths which should not search in.")
let resourceExtensionsOption = MultiStringOption(shortFlag: "r", longFlag: "resourrce-extension",
                          helpMessage: "Extension To search.")
let fileExtensionsOption = MultiStringOption(shortFlag: "f", longFlag: "file-extensions",
                      helpMessage: "File extensions to search with.")
let help = BoolOption(shortFlag: "h", longFlag: "help",
                              helpMessage: "Print a help message.")

cli.addOptions(projectOption, excludePathsOption, resourceExtensionsOption, fileExtensionsOption, help)


cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.lightBlue
    default:
        str = s
    }
    
    return cli.defaultFormat(s: str, type: type)
}


do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if (help.value) {
    cli.printUsage();
}

//print(projectOption.value);


let project = projectOption.value ?? "."
let excludePaths = excludePathsOption.value ?? []
let resourceExtensions = resourceExtensionsOption.value ?? ["png", "jpg", "imageset"]
let fileExtensions = fileExtensionsOption.value ?? ["swift", "m", "mm", "xib", "storyboard"]







