//
//  KnownElements.swift
//  FisherKitExample-MacOS
//
//  Created by Courtland Bueno on 3/13/19.
//
// https://www.w3.org/TR/REC-html40/index/elements.html

import Foundation

public enum KnownElements: String, CaseIterable, RawRepresentable, Codable {
    case a
    case abbr
    case acronym
    case address
    case applet
    case area
    case b
    case base
    case basefont
    case bdo
    case big
    case blockquote
    case body
    case br
    case button
    case caption
    case center
    case cite
    case code
    case col
    case colgroup
    case dd
    case del
    case dfn
    case dir
    case div
    case dl
    case dt
    case em
    case fieldset
    case font
    case form
    case frame
    case frameset
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case head
    case hr
    case html
    case i
    case iframe
    case img
    case input
    case ins
    case isindex
    case kbd
    case label
    case legend
    case li
    case link
    case map
    case menu
    case meta
    case noframes
    case noscript
    case object
    case ol
    case optgroup
    case option
    case p
    case param
    case pre
    case q
    case s
    case samp
    case script
    case select
    case small
    case span
    case strike
    case strong
    case style
    case sub
    case sup
    case table
    case tbody
    case td
    case textarea
    case tfoot
    case th
    case thead
    case title
    case tr
    case tt
    case u
    case ul
    case `var`
    
}

extension KnownElements: CustomStringConvertible {
    public var description: String {
        switch self {
        case .a:
            return "anchor"
        case .abbr:
            return "abbreviated form (e.g., WWW, HTTP, etc.)"
        case .acronym:
            return ""
        case .address:
            return "information on author"
        case .applet:
            return "Java applet"
        case .area:
            return "client-side image map area"
        case .b:
            return "bold text style"
        case .base:
            return "document base URI"
        case .basefont:
            return "base font size"
        case .bdo:
            return "I18N BiDi over-ride"
        case .big:
            return "large text style"
        case .blockquote:
            return "long quotation"
        case .body:
            return "document body"
        case .br:
            return "forced line break"
        case .button:
            return "push button"
        case .caption:
            return "table caption"
        case .center:
            return "shorthand for DIV align=center"
        case .cite:
            return "citation"
        case .code:
            return "computer code fragment"
        case .col:
            return "table column"
        case .colgroup:
            return "table column group"
        case .dd:
            return "definition description"
        case .del:
            return "deleted text"
        case .dfn:
            return "instance definition"
        case .dir:
            return "directory list"
        case .div:
            return "generic language/style container"
        case .dl:
            return "definition list"
        case .dt:
            return "definition term"
        case .em:
            return "emphasis"
        case .fieldset:
            return "form control group"
        case .font:
            return "local change to font"
        case .form:
            return "interactive form"
        case .frame:
            return "subwindow"
        case .frameset:
            return "window subdivision"
        case .h1:
            return "heading"
        case .h2:
            return "heading"
        case .h3:
            return "heading"
        case .h4:
            return "heading"
        case .h5:
            return "heading"
        case .h6:
            return "heading"
        case .head:
            return "document head"
        case .hr:
            return "horizontal rule"
        case .html:
            return "document root element"
        case .i:
            return "italic text style"
        case .iframe:
            return "inline subwindow"
        case .img:
            return "Embedded image"
        case .input:
            return "form control"
        case .ins:
            return "inserted text"
        case .isindex:
            return "single line prompt"
        case .kbd:
            return "text to be entered by the user"
        case .label:
            return "form field label text"
        case .legend:
            return "fieldset legend"
        case .li:
            return "list item"
        case .link:
            return "a media-independent link"
        case .map:
            return "client-side image map"
        case .menu:
            return "menu list"
        case .meta:
            return "generic metainformation"
        case .noframes:
            return "alternate content container for non frame-based rendering"
        case .noscript:
            return "alternate content container for non script-based rendering"
        case .object:
            return "generic embedded object"
        case .ol:
            return "ordered list"
        case .optgroup:
            return "option group"
        case .option:
            return "selectable choice"
        case .p:
            return "paragraph"
        case .param:
            return "named property value"
        case .pre:
            return "preformatted text"
        case .q:
            return "short inline quotation"
        case .s:
            return "strike-through text style"
        case .samp:
            return "sample program output, scripts, etc."
        case .script:
            return "script statements"
        case .select:
            return "option selector"
        case .small:
            return "small text style"
        case .span:
            return "generic language/style container"
        case .strike:
            return "strike-through text"
        case .strong:
            return "strong emphasis"
        case .style:
            return "style info"
        case .sub:
            return "subscript"
        case .sup:
            return "superscript"
        case .table:
            return ""
        case .tbody:
            return "table body"
        case .td:
            return "table data cell"
        case .textarea:
            return "multi-line text field"
        case .tfoot:
            return "table footer"
        case .th:
            return "table header cell"
        case .thead:
            return "table header"
        case .title:
            return "document title"
        case .tr:
            return "table row"
        case .tt:
            return "teletype or monospaced text style"
        case .u:
            return "underlined text style"
        case .ul:
            return "unordered list"
        case .var:
            return "instance of a variable or program argument"
        }
    }
    
}
