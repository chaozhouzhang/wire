// Code generated by Wire protocol buffer compiler, do not edit.
// Source: squareup.protos.custom_options.FooBar in custom_options.proto
import Foundation
import Wire

public struct FooBar {

    public var foo: Int32?
    public var bar: String?
    public var baz: Nested?
    public var qux: UInt64?
    public var fred: [Float]
    public var daisy: Double?
    public var nested: [FooBar]
    public var ext: FooBarBazEnum?
    public var rep: [FooBarBazEnum]
    public var unknownFields: Data = .init()

    public init(
        foo: Int32? = nil,
        bar: String? = nil,
        baz: Nested? = nil,
        qux: UInt64? = nil,
        fred: [Float] = [],
        daisy: Double? = nil,
        nested: [FooBar] = [],
        ext: FooBarBazEnum? = nil,
        rep: [FooBarBazEnum] = []
    ) {
        self.foo = foo
        self.bar = bar
        self.baz = baz
        self.qux = qux
        self.fred = fred
        self.daisy = daisy
        self.nested = nested
        self.ext = ext
        self.rep = rep
    }

    public struct Nested {

        public var value: FooBarBazEnum?
        public var unknownFields: Data = .init()

        public init(value: FooBarBazEnum? = nil) {
            self.value = value
        }

    }

    public struct More {

        public var serial: [Int32]
        public var unknownFields: Data = .init()

        public init(serial: [Int32] = []) {
            self.serial = serial
        }

    }

    public enum FooBarBazEnum : UInt32, CaseIterable, Codable {

        case FOO = 1
        case BAR = 2
        case BAZ = 3

    }

}

extension FooBar.Nested : Equatable {
}

extension FooBar.Nested : Hashable {
}

extension FooBar.Nested : Proto2Codable {
    public init(from reader: ProtoReader) throws {
        var value: FooBar.FooBarBazEnum? = nil

        let token = try reader.beginMessage()
        while let tag = try reader.nextTag(token: token) {
            switch tag {
            case 1: value = try reader.decode(FooBar.FooBarBazEnum.self)
            default: try reader.readUnknownField(tag: tag)
            }
        }
        self.unknownFields = try reader.endMessage(token: token)

        self.value = value
    }

    public func encode(to writer: ProtoWriter) throws {
        try writer.encode(tag: 1, value: self.value)
        try writer.writeUnknownFields(unknownFields)
    }
}

extension FooBar.Nested : Codable {
    public enum CodingKeys : String, CodingKey {

        case value

    }
}

extension FooBar.More : Equatable {
}

extension FooBar.More : Hashable {
}

extension FooBar.More : Proto2Codable {
    public init(from reader: ProtoReader) throws {
        var serial: [Int32] = []

        let token = try reader.beginMessage()
        while let tag = try reader.nextTag(token: token) {
            switch tag {
            case 1: try reader.decode(into: &serial)
            default: try reader.readUnknownField(tag: tag)
            }
        }
        self.unknownFields = try reader.endMessage(token: token)

        self.serial = try FooBar.More.checkIfMissing(serial, "serial")
    }

    public func encode(to writer: ProtoWriter) throws {
        try writer.encode(tag: 1, value: self.serial)
        try writer.writeUnknownFields(unknownFields)
    }
}

extension FooBar.More : Codable {
    public enum CodingKeys : String, CodingKey {

        case serial

    }
}

extension FooBar : Equatable {
}

extension FooBar : Hashable {
}

extension FooBar : Proto2Codable {
    public init(from reader: ProtoReader) throws {
        var foo: Int32? = nil
        var bar: String? = nil
        var baz: FooBar.Nested? = nil
        var qux: UInt64? = nil
        var fred: [Float] = []
        var daisy: Double? = nil
        var nested: [FooBar] = []
        var ext: FooBar.FooBarBazEnum? = nil
        var rep: [FooBar.FooBarBazEnum] = []

        let token = try reader.beginMessage()
        while let tag = try reader.nextTag(token: token) {
            switch tag {
            case 1: foo = try reader.decode(Int32.self)
            case 2: bar = try reader.decode(String.self)
            case 3: baz = try reader.decode(FooBar.Nested.self)
            case 4: qux = try reader.decode(UInt64.self)
            case 5: try reader.decode(into: &fred)
            case 6: daisy = try reader.decode(Double.self)
            case 7: try reader.decode(into: &nested)
            case 101: ext = try reader.decode(FooBar.FooBarBazEnum.self)
            case 102: try reader.decode(into: &rep)
            default: try reader.readUnknownField(tag: tag)
            }
        }
        self.unknownFields = try reader.endMessage(token: token)

        self.foo = foo
        self.bar = bar
        self.baz = baz
        self.qux = qux
        self.fred = try FooBar.checkIfMissing(fred, "fred")
        self.daisy = daisy
        self.nested = try FooBar.checkIfMissing(nested, "nested")
        self.ext = ext
        self.rep = try FooBar.checkIfMissing(rep, "rep")
    }

    public func encode(to writer: ProtoWriter) throws {
        try writer.encode(tag: 1, value: self.foo)
        try writer.encode(tag: 2, value: self.bar)
        try writer.encode(tag: 3, value: self.baz)
        try writer.encode(tag: 4, value: self.qux)
        try writer.encode(tag: 5, value: self.fred)
        try writer.encode(tag: 6, value: self.daisy)
        try writer.encode(tag: 7, value: self.nested)
        try writer.encode(tag: 101, value: self.ext)
        try writer.encode(tag: 102, value: self.rep)
        try writer.writeUnknownFields(unknownFields)
    }
}

extension FooBar : Redactable {
    public enum RedactedKeys : String, RedactedKey {

        case nested

    }
}

extension FooBar : Codable {
    public enum CodingKeys : String, CodingKey {

        case foo
        case bar
        case baz
        case qux
        case fred
        case daisy
        case nested
        case ext
        case rep

    }
}
