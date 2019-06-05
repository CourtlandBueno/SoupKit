

public extension KnownAttribute {
    enum Cache {
        public static let abbr = KnownAttribute(
            name: "abbr",
            relatedElements: [
                .td,
                .th
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "abbreviation for header cell"
        )
        public static let acceptCharset = KnownAttribute(
            name: "accept-charset",
            relatedElements: [
                .form
            ],
            valueType: "%Charsets;",
            isDepreciated: false,
            description: "list of supported charsets"
        )
        public static let accept = KnownAttribute(
            name: "accept",
            relatedElements: [
                .form,
                .input
            ],
            valueType: "%ContentTypes;",
            isDepreciated: false,
            description: "list of MIME types for file upload"
        )
        public static let accesskey = KnownAttribute(
            name: "accesskey",
            relatedElements: [
                .label,
                .button,
                .a,
                .area,
                .textarea,
                .input,
                .legend
            ],
            valueType: "%Character;",
            isDepreciated: false,
            description: "accessibility key character"
        )
        public static let action = KnownAttribute(
            name: "action",
            relatedElements: [
                .form
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "server-side form handler"
        )
        public static let align = KnownAttribute(
            name: "align",
            relatedElements: [
                .caption
            ],
            valueType: "%CAlign;",
            isDepreciated: true,
            description: "relative to table"
        )
        public static let align2 = KnownAttribute(
            name: "align",
            relatedElements: [
                .object,
                .applet,
                .img,
                .input,
                .iframe
            ],
            valueType: "%IAlign;",
            isDepreciated: true,
            description: "vertical or horizontal alignment"
        )
        public static let align3 = KnownAttribute(
            name: "align",
            relatedElements: [
                .legend
            ],
            valueType: "%LAlign;",
            isDepreciated: true,
            description: "relative to fieldset"
        )
        public static let align4 = KnownAttribute(
            name: "align",
            relatedElements: [
                .table
            ],
            valueType: "%TAlign;",
            isDepreciated: true,
            description: "table position relative to window"
        )
        public static let align5 = KnownAttribute(
            name: "align",
            relatedElements: [
                .hr
            ],
            valueType: "(left | center | right)",
            isDepreciated: true,
            description: ""
        )
        public static let align6 = KnownAttribute(
            name: "align",
            relatedElements: [
                .p,
                .div,
                .h6,
                .h3,
                .h2,
                .h5,
                .h4,
                .h1
            ],
            valueType: "(left | center | right | justify)",
            isDepreciated: true,
            description: "align, text alignment"
        )
        public static let align7 = KnownAttribute(
            name: "align",
            relatedElements: [
                .tbody,
                .td,
                .tr,
                .thead,
                .th,
                .tfoot,
                .col,
                .colgroup
            ],
            valueType: "(left | center | right | justify | char)",
            isDepreciated: false,
            description: ""
        )
        public static let alink = KnownAttribute(
            name: "alink",
            relatedElements: [
                .body
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "color of selected links"
        )
        public static let alt = KnownAttribute(
            name: "alt",
            relatedElements: [
                .applet
            ],
            valueType: "%Text;",
            isDepreciated: true,
            description: "short description"
        )
        public static let alt2 = KnownAttribute(
            name: "alt",
            relatedElements: [
                .area,
                .img
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "short description"
        )
        public static let alt3 = KnownAttribute(
            name: "alt",
            relatedElements: [
                .input
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "short description"
        )
        public static let archive = KnownAttribute(
            name: "archive",
            relatedElements: [
                .applet
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "comma-separated archive list"
        )
        public static let archive2 = KnownAttribute(
            name: "archive",
            relatedElements: [
                .object
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "space-separated list of URIs"
        )
        public static let axis = KnownAttribute(
            name: "axis",
            relatedElements: [
                .th,
                .td
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "comma-separated list of related headers"
        )
        public static let background = KnownAttribute(
            name: "background",
            relatedElements: [
                .body
            ],
            valueType: "%URI;",
            isDepreciated: true,
            description: "texture tile for document background"
        )
        public static let bgcolor = KnownAttribute(
            name: "bgcolor",
            relatedElements: [
                .table
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "background color for cells"
        )
        public static let bgcolor2 = KnownAttribute(
            name: "bgcolor",
            relatedElements: [
                .tr
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "background color for row"
        )
        public static let bgcolor3 = KnownAttribute(
            name: "bgcolor",
            relatedElements: [
                .td,
                .th
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "cell background color"
        )
        public static let bgcolor4 = KnownAttribute(
            name: "bgcolor",
            relatedElements: [
                .body
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "document background color"
        )
        public static let border = KnownAttribute(
            name: "border",
            relatedElements: [
                .table
            ],
            valueType: "%Pixels;",
            isDepreciated: false,
            description: "controls frame width around table"
        )
        public static let border2 = KnownAttribute(
            name: "border",
            relatedElements: [
                .img,
                .object
            ],
            valueType: "%Pixels;",
            isDepreciated: true,
            description: "link border width"
        )
        public static let cellpadding = KnownAttribute(
            name: "cellpadding",
            relatedElements: [
                .table
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "spacing within cells"
        )
        public static let cellspacing = KnownAttribute(
            name: "cellspacing",
            relatedElements: [
                .table
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "spacing between cells"
        )
        public static let char = KnownAttribute(
            name: "char",
            relatedElements: [
                .td,
                .tfoot,
                .colgroup,
                .thead,
                .tr,
                .th,
                .col,
                .tbody
            ],
            valueType: "%Character;",
            isDepreciated: false,
            description: "alignment char, e.g. char=':'"
        )
        public static let charoff = KnownAttribute(
            name: "charoff",
            relatedElements: [
                .tfoot,
                .tr,
                .colgroup,
                .thead,
                .col,
                .tbody,
                .td,
                .th
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "offset for alignment char"
        )
        public static let charset = KnownAttribute(
            name: "charset",
            relatedElements: [
                .a,
                .script,
                .link
            ],
            valueType: "%Charset;",
            isDepreciated: false,
            description: "char encoding of linked resource"
        )
        public static let checked = KnownAttribute(
            name: "checked",
            relatedElements: [
                .input
            ],
            valueType: "(checked)",
            isDepreciated: false,
            description: "for radio buttons and check boxes"
        )
        public static let cite = KnownAttribute(
            name: "cite",
            relatedElements: [
                .q,
                .blockquote
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "URI for source document or msg"
        )
        public static let cite2 = KnownAttribute(
            name: "cite",
            relatedElements: [
                .ins,
                .del
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "info on reason for change"
        )
        public static let `class` = KnownAttribute(
            name: "class",
            relatedElements: [
                .table,
                .del,
                .sup,
                .h2,
                .dfn,
                .col,
                .object,
                .optgroup,
                .ins,
                .dir,
                .legend,
                .abbr,
                .map,
                .em,
                .noframes,
                .strike,
                .p,
                .applet,
                .thead,
                .sub,
                .big,
                .h5,
                .q,
                .font,
                .center,
                .code,
                .td,
                .cite,
                .frame,
                .dd,
                .noscript,
                .menu,
                .body,
                .ol,
                .div,
                .h4,
                .b,
                .th,
                .tbody,
                .caption,
                .label,
                .isindex,
                .tfoot,
                .img,
                .bdo,
                .ul,
                .colgroup,
                .link,
                .kbd,
                .form,
                .h6,
                .tt,
                .iframe,
                .dl,
                .acronym,
                .address,
                .tr,
                .s,
                .samp,
                .var,
                .li,
                .area,
                .a,
                .input,
                .option,
                .dt,
                .strong,
                .u,
                .select,
                .h3,
                .hr,
                .fieldset,
                .blockquote,
                .br,
                .frameset,
                .textarea,
                .h1,
                .i,
                .button,
                .span,
                .pre,
                .small
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "space-separated list of classes"
        )
        public static let classid = KnownAttribute(
            name: "classid",
            relatedElements: [
                .object
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "identifies an implementation"
        )
        public static let clear = KnownAttribute(
            name: "clear",
            relatedElements: [
                .br
            ],
            valueType: "(left | all | right | none)",
            isDepreciated: true,
            description: "control of text flow"
        )
        public static let code = KnownAttribute(
            name: "code",
            relatedElements: [
                .applet
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "applet class file"
        )
        public static let codebase = KnownAttribute(
            name: "codebase",
            relatedElements: [
                .object
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "base URI for classid, data, archive"
        )
        public static let codebase2 = KnownAttribute(
            name: "codebase",
            relatedElements: [
                .applet
            ],
            valueType: "%URI;",
            isDepreciated: true,
            description: "optional base URI for applet"
        )
        public static let codetype = KnownAttribute(
            name: "codetype",
            relatedElements: [
                .object
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: "content type for code"
        )
        public static let color = KnownAttribute(
            name: "color",
            relatedElements: [
                .font,
                .basefont
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "text color"
        )
        public static let cols = KnownAttribute(
            name: "cols",
            relatedElements: [
                .frameset
            ],
            valueType: "%MultiLengths;",
            isDepreciated: false,
            description: "list of lengths, default: 100% (1 col)"
        )
        public static let cols2 = KnownAttribute(
            name: "cols",
            relatedElements: [
                .textarea
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: ""
        )
        public static let colspan = KnownAttribute(
            name: "colspan",
            relatedElements: [
                .td,
                .th
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "number of cols spanned by cell"
        )
        public static let compact = KnownAttribute(
            name: "compact",
            relatedElements: [
                .dir,
                .menu,
                .ol,
                .ul,
                .dl
            ],
            valueType: "(compact)",
            isDepreciated: true,
            description: "reduced interitem spacing"
        )
        public static let content = KnownAttribute(
            name: "content",
            relatedElements: [
                .meta
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "associated information"
        )
        public static let coords = KnownAttribute(
            name: "coords",
            relatedElements: [
                .area
            ],
            valueType: "%Coords;",
            isDepreciated: false,
            description: "comma-separated list of lengths"
        )
        public static let coords2 = KnownAttribute(
            name: "coords",
            relatedElements: [
                .a
            ],
            valueType: "%Coords;",
            isDepreciated: false,
            description: "for use with client-side image maps"
        )
        public static let data = KnownAttribute(
            name: "data",
            relatedElements: [
                .object
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "reference to object's data"
        )
        public static let datetime = KnownAttribute(
            name: "datetime",
            relatedElements: [
                .ins,
                .del
            ],
            valueType: "%Datetime;",
            isDepreciated: false,
            description: "date and time of change"
        )
        public static let declare = KnownAttribute(
            name: "declare",
            relatedElements: [
                .object
            ],
            valueType: "(declare)",
            isDepreciated: false,
            description: "declare but don't instantiate flag"
        )
        public static let `defer` = KnownAttribute(
            name: "defer",
            relatedElements: [
                .script
            ],
            valueType: "(defer)",
            isDepreciated: false,
            description: "UA may defer execution of script"
        )
        public static let dir = KnownAttribute(
            name: "dir",
            relatedElements: [
                .object,
                .fieldset,
                .table,
                .area,
                .col,
                .dd,
                .body,
                .select,
                .center,
                .samp,
                .html,
                .button,
                .var,
                .form,
                .span,
                .p,
                .strike,
                .acronym,
                .h6,
                .h1,
                .h5,
                .title,
                .noframes,
                .hr,
                .u,
                .legend,
                .textarea,
                .kbd,
                .strong,
                .dt,
                .font,
                .head,
                .blockquote,
                .noscript,
                .s,
                .b,
                .tt,
                .meta,
                .optgroup,
                .ul,
                .isindex,
                .input,
                .h2,
                .tfoot,
                .small,
                .del,
                .pre,
                .map,
                .sub,
                .caption,
                .tr,
                .em,
                .th,
                .h4,
                .q,
                .li,
                .big,
                .ol,
                .div,
                .thead,
                .img,
                .cite,
                .label,
                .menu,
                .link,
                .i,
                .option,
                .style,
                .tbody,
                .h3,
                .td,
                .ins,
                .sup,
                .code,
                .a,
                .dir,
                .dl,
                .abbr,
                .colgroup,
                .address,
                .dfn
            ],
            valueType: "(ltr | rtl)",
            isDepreciated: false,
            description: "direction for weak/neutral text"
        )
        public static let dir2 = KnownAttribute(
            name: "dir",
            relatedElements: [
                .bdo
            ],
            valueType: "(ltr | rtl)",
            isDepreciated: false,
            description: "directionality"
        )
        public static let disabled = KnownAttribute(
            name: "disabled",
            relatedElements: [
                .textarea,
                .button,
                .optgroup,
                .option,
                .select,
                .input
            ],
            valueType: "(disabled)",
            isDepreciated: false,
            description: "unavailable in this context"
        )
        public static let enctype = KnownAttribute(
            name: "enctype",
            relatedElements: [
                .form
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: ""
        )
        public static let face = KnownAttribute(
            name: "face",
            relatedElements: [
                .basefont,
                .font
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "comma-separated list of font names"
        )
        public static let `for` = KnownAttribute(
            name: "for",
            relatedElements: [
                .label
            ],
            valueType: "IDREF",
            isDepreciated: false,
            description: "matches field ID value"
        )
        public static let frame = KnownAttribute(
            name: "frame",
            relatedElements: [
                .table
            ],
            valueType: "%TFrame;",
            isDepreciated: false,
            description: "which parts of frame to render"
        )
        public static let frameborder = KnownAttribute(
            name: "frameborder",
            relatedElements: [
                .frame,
                .iframe
            ],
            valueType: "(1 | 0)",
            isDepreciated: false,
            description: "request frame borders?"
        )
        public static let headers = KnownAttribute(
            name: "headers",
            relatedElements: [
                .th,
                .td
            ],
            valueType: "IDREFS",
            isDepreciated: false,
            description: "list of id's for header cells"
        )
        public static let height = KnownAttribute(
            name: "height",
            relatedElements: [
                .iframe
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "frame height"
        )
        public static let height2 = KnownAttribute(
            name: "height",
            relatedElements: [
                .td,
                .th
            ],
            valueType: "%Length;",
            isDepreciated: true,
            description: "height for cell"
        )
        public static let height3 = KnownAttribute(
            name: "height",
            relatedElements: [
                .object,
                .img
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "override height"
        )
        public static let height4 = KnownAttribute(
            name: "height",
            relatedElements: [
                .applet
            ],
            valueType: "%Length;",
            isDepreciated: true,
            description: "initial height"
        )
        public static let href = KnownAttribute(
            name: "href",
            relatedElements: [
                .area,
                .link,
                .a
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "URI for linked resource"
        )
        public static let href2 = KnownAttribute(
            name: "href",
            relatedElements: [
                .base
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "URI that acts as base URI"
        )
        public static let hreflang = KnownAttribute(
            name: "hreflang",
            relatedElements: [
                .a,
                .link
            ],
            valueType: "%LanguageCode;",
            isDepreciated: false,
            description: "language code"
        )
        public static let hspace = KnownAttribute(
            name: "hspace",
            relatedElements: [
                .object,
                .img,
                .applet
            ],
            valueType: "%Pixels;",
            isDepreciated: true,
            description: "horizontal gutter"
        )
        public static let httpEquiv = KnownAttribute(
        name: "http-equiv",
        relatedElements: [
        .meta
        ],
        valueType: "NAME",
        isDepreciated: false,
        description: "HTTP response header name"
        )
        public static let id = KnownAttribute(
            name: "id",
            relatedElements: [
                .samp,
                .font,
                .input,
                .strong,
                .caption,
                .b,
                .dt,
                .body,
                .area,
                .button,
                .ins,
                .blockquote,
                .sub,
                .dfn,
                .cite,
                .label,
                .textarea,
                .h6,
                .em,
                .h1,
                .acronym,
                .s,
                .bdo,
                .th,
                .h4,
                .small,
                .iframe,
                .form,
                .param,
                .a,
                .img,
                .div,
                .sup,
                .option,
                .tbody,
                .optgroup,
                .thead,
                .address,
                .td,
                .frame,
                .h2,
                .fieldset,
                .tr,
                .kbd,
                .h5,
                .var,
                .map,
                .h3,
                .link,
                .strike,
                .hr,
                .abbr,
                .legend,
                .big,
                .applet,
                .colgroup,
                .ul,
                .object,
                .del,
                .code,
                .noframes,
                .menu,
                .basefont,
                .u,
                .tt,
                .table,
                .span,
                .frameset,
                .pre,
                .dd,
                .center,
                .noscript,
                .li,
                .p,
                .dl,
                .isindex,
                .select,
                .ol,
                .col,
                .tfoot,
                .q,
                .dir,
                .br,
                .i
            ],
            valueType: "ID",
            isDepreciated: false,
            description: "document-wide unique id"
        )
        public static let ismap = KnownAttribute(
            name: "ismap",
            relatedElements: [
                .img,
                .input
            ],
            valueType: "(ismap)",
            isDepreciated: false,
            description: "use server-side image map"
        )
        public static let label = KnownAttribute(
            name: "label",
            relatedElements: [
                .option
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "for use in hierarchical menus"
        )
        public static let label2 = KnownAttribute(
            name: "label",
            relatedElements: [
                .optgroup
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "for use in hierarchical menus"
        )
        public static let lang = KnownAttribute(
            name: "lang",
            relatedElements: [
                .dd,
                .noscript,
                .link,
                .strike,
                .html,
                .fieldset,
                .kbd,
                .code,
                .strong,
                .td,
                .cite,
                .area,
                .dir,
                .isindex,
                .tr,
                .address,
                .table,
                .label,
                .optgroup,
                .p,
                .img,
                .h6,
                .h1,
                .input,
                .big,
                .body,
                .style,
                .a,
                .thead,
                .samp,
                .ul,
                .q,
                .select,
                .h5,
                .bdo,
                .h3,
                .title,
                .b,
                .tfoot,
                .head,
                .col,
                .caption,
                .acronym,
                .menu,
                .var,
                .option,
                .span,
                .blockquote,
                .tt,
                .del,
                .legend,
                .h4,
                .li,
                .noframes,
                .tbody,
                .button,
                .textarea,
                .font,
                .dfn,
                .small,
                .dl,
                .dt,
                .abbr,
                .object,
                .map,
                .meta,
                .ins,
                .sub,
                .i,
                .form,
                .em,
                .ol,
                .pre,
                .hr,
                .th,
                .sup,
                .colgroup,
                .s,
                .u,
                .center,
                .div,
                .h2
            ],
            valueType: "%LanguageCode;",
            isDepreciated: false,
            description: "language code"
        )
        public static let language = KnownAttribute(
            name: "language",
            relatedElements: [
                .script
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "predefined script language name"
        )
        public static let link = KnownAttribute(
            name: "link",
            relatedElements: [
                .body
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "color of links"
        )
        public static let longdesc = KnownAttribute(
            name: "longdesc",
            relatedElements: [
                .img
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "link to long description (complements alt)"
        )
        public static let longdesc2 = KnownAttribute(
            name: "longdesc",
            relatedElements: [
                .frame,
                .iframe
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "link to long description (complements title)"
        )
        public static let marginheight = KnownAttribute(
            name: "marginheight",
            relatedElements: [
                .iframe,
                .frame
            ],
            valueType: "%Pixels;",
            isDepreciated: false,
            description: "margin height in pixels"
        )
        public static let marginwidth = KnownAttribute(
            name: "marginwidth",
            relatedElements: [
                .iframe,
                .frame
            ],
            valueType: "%Pixels;",
            isDepreciated: false,
            description: "margin widths in pixels"
        )
        public static let maxlength = KnownAttribute(
            name: "maxlength",
            relatedElements: [
                .input
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "max chars for text fields"
        )
        public static let media = KnownAttribute(
            name: "media",
            relatedElements: [
                .style
            ],
            valueType: "%MediaDesc;",
            isDepreciated: false,
            description: "designed for use with these media"
        )
        public static let media2 = KnownAttribute(
            name: "media",
            relatedElements: [
                .link
            ],
            valueType: "%MediaDesc;",
            isDepreciated: false,
            description: "for rendering on these media"
        )
        public static let method = KnownAttribute(
            name: "method",
            relatedElements: [
                .form
            ],
            valueType: "(GET | POST)",
            isDepreciated: false,
            description: "HTTP method used to submit the form"
        )
        public static let multiple = KnownAttribute(
            name: "multiple",
            relatedElements: [
                .select
            ],
            valueType: "(multiple)",
            isDepreciated: false,
            description: "default is single selection"
        )
        public static let name = KnownAttribute(
            name: "name",
            relatedElements: [
                .button,
                .textarea
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: ""
        )
        public static let name2 = KnownAttribute(
            name: "name",
            relatedElements: [
                .applet
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "allows applets to find each other"
        )
        public static let name3 = KnownAttribute(
            name: "name",
            relatedElements: [
                .select
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "field name"
        )
        public static let name4 = KnownAttribute(
            name: "name",
            relatedElements: [
                .form
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "name of form for scripting"
        )
        public static let name5 = KnownAttribute(
            name: "name",
            relatedElements: [
                .frame,
                .iframe
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "name of frame for targetting"
        )
        public static let name6 = KnownAttribute(
            name: "name",
            relatedElements: [
                .img
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "name of image for scripting"
        )
        public static let name7 = KnownAttribute(
            name: "name",
            relatedElements: [
                .a
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "named link end"
        )
        public static let name8 = KnownAttribute(
            name: "name",
            relatedElements: [
                .object,
                .input
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "submit as part of form"
        )
        public static let name9 = KnownAttribute(
            name: "name",
            relatedElements: [
                .map
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "for reference by usemap"
        )
        public static let name10 = KnownAttribute(
            name: "name",
            relatedElements: [
                .param
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "property name"
        )
        public static let name11 = KnownAttribute(
            name: "name",
            relatedElements: [
                .meta
            ],
            valueType: "NAME",
            isDepreciated: false,
            description: "metainformation name"
        )
        public static let nohref = KnownAttribute(
            name: "nohref",
            relatedElements: [
                .area
            ],
            valueType: "(nohref)",
            isDepreciated: false,
            description: "this region has no action"
        )
        public static let noresize = KnownAttribute(
            name: "noresize",
            relatedElements: [
                .frame
            ],
            valueType: "(noresize)",
            isDepreciated: false,
            description: "allow users to resize frames?"
        )
        public static let noshade = KnownAttribute(
            name: "noshade",
            relatedElements: [
                .hr
            ],
            valueType: "(noshade)",
            isDepreciated: true,
            description: ""
        )
        public static let nowrap = KnownAttribute(
            name: "nowrap",
            relatedElements: [
                .th,
                .td
            ],
            valueType: "(nowrap)",
            isDepreciated: true,
            description: "suppress word wrap"
        )
        public static let object = KnownAttribute(
            name: "object",
            relatedElements: [
                .applet
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "serialized applet file"
        )
        public static let onblur = KnownAttribute(
            name: "onblur",
            relatedElements: [
                .label,
                .input,
                .select,
                .button,
                .a,
                .textarea,
                .area
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the element lost the focus"
        )
        public static let onchange = KnownAttribute(
            name: "onchange",
            relatedElements: [
                .select,
                .input,
                .textarea
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the element value was changed"
        )
        public static let onclick = KnownAttribute(
            name: "onclick",
            relatedElements: [
                .center,
                .h2,
                .blockquote,
                .samp,
                .h4,
                .s,
                .tr,
                .address,
                .p,
                .link,
                .big,
                .div,
                .em,
                .select,
                .textarea,
                .optgroup,
                .noscript,
                .q,
                .cite,
                .button,
                .del,
                .kbd,
                .strong,
                .map,
                .dl,
                .acronym,
                .ul,
                .area,
                .col,
                .b,
                .dt,
                .sup,
                .label,
                .h1,
                .body,
                .dfn,
                .strike,
                .object,
                .input,
                .caption,
                .span,
                .legend,
                .fieldset,
                .ins,
                .h3,
                .u,
                .form,
                .var,
                .i,
                .dd,
                .img,
                .dir,
                .code,
                .option,
                .a,
                .thead,
                .tfoot,
                .small,
                .tt,
                .hr,
                .colgroup,
                .table,
                .pre,
                .h5,
                .td,
                .sub,
                .abbr,
                .h6,
                .menu,
                .tbody,
                .li,
                .noframes,
                .ol,
                .th
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer button was clicked"
        )
        public static let ondblclick = KnownAttribute(
            name: "ondblclick",
            relatedElements: [
                .select,
                .strike,
                .strong,
                .col,
                .tr,
                .dir,
                .samp,
                .body,
                .sub,
                .small,
                .address,
                .option,
                .label,
                .fieldset,
                .dd,
                .textarea,
                .h1,
                .tfoot,
                .div,
                .caption,
                .sup,
                .tt,
                .button,
                .abbr,
                .noscript,
                .cite,
                .img,
                .del,
                .kbd,
                .em,
                .menu,
                .dt,
                .big,
                .code,
                .hr,
                .h4,
                .map,
                .table,
                .q,
                .ins,
                .var,
                .center,
                .u,
                .s,
                .input,
                .td,
                .dl,
                .thead,
                .li,
                .link,
                .noframes,
                .colgroup,
                .i,
                .form,
                .legend,
                .dfn,
                .h5,
                .ol,
                .span,
                .a,
                .pre,
                .optgroup,
                .ul,
                .h6,
                .object,
                .area,
                .h2,
                .blockquote,
                .h3,
                .b,
                .th,
                .p,
                .acronym,
                .tbody
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer button was double clicked"
        )
        public static let onfocus = KnownAttribute(
            name: "onfocus",
            relatedElements: [
                .label,
                .select,
                .textarea,
                .area,
                .input,
                .button,
                .a
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the element got the focus"
        )
        public static let onkeydown = KnownAttribute(
            name: "onkeydown",
            relatedElements: [
                .address,
                .strike,
                .select,
                .var,
                .noscript,
                .abbr,
                .del,
                .p,
                .big,
                .label,
                .sub,
                .menu,
                .div,
                .tt,
                .option,
                .table,
                .ol,
                .tfoot,
                .h5,
                .button,
                .span,
                .optgroup,
                .textarea,
                .th,
                .input,
                .object,
                .h1,
                .thead,
                .strong,
                .blockquote,
                .legend,
                .s,
                .area,
                .hr,
                .h3,
                .li,
                .h2,
                .form,
                .td,
                .link,
                .map,
                .u,
                .body,
                .a,
                .cite,
                .dfn,
                .ins,
                .q,
                .ul,
                .code,
                .acronym,
                .b,
                .img,
                .kbd,
                .samp,
                .h6,
                .dl,
                .tbody,
                .fieldset,
                .sup,
                .dt,
                .tr,
                .small,
                .em,
                .dd,
                .center,
                .dir,
                .caption,
                .noframes,
                .col,
                .i,
                .colgroup,
                .pre,
                .h4
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a key was pressed down"
        )
        public static let onkeypress = KnownAttribute(
            name: "onkeypress",
            relatedElements: [
                .form,
                .tbody,
                .samp,
                .span,
                .big,
                .q,
                .strike,
                .map,
                .select,
                .img,
                .p,
                .object,
                .tr,
                .legend,
                .address,
                .option,
                .label,
                .pre,
                .u,
                .noframes,
                .li,
                .del,
                .col,
                .sub,
                .menu,
                .h1,
                .tt,
                .b,
                .h4,
                .div,
                .acronym,
                .noscript,
                .dd,
                .abbr,
                .em,
                .fieldset,
                .code,
                .h3,
                .colgroup,
                .h6,
                .tfoot,
                .ol,
                .caption,
                .ul,
                .cite,
                .dir,
                .h2,
                .kbd,
                .td,
                .thead,
                .blockquote,
                .small,
                .sup,
                .area,
                .strong,
                .optgroup,
                .body,
                .i,
                .dt,
                .hr,
                .th,
                .input,
                .a,
                .center,
                .dfn,
                .dl,
                .table,
                .link,
                .ins,
                .s,
                .h5,
                .textarea,
                .var,
                .button
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a key was pressed and released"
        )
        public static let onkeyup = KnownAttribute(
            name: "onkeyup",
            relatedElements: [
                .textarea,
                .strike,
                .code,
                .p,
                .acronym,
                .fieldset,
                .label,
                .a,
                .dt,
                .option,
                .link,
                .form,
                .li,
                .ol,
                .dl,
                .del,
                .h5,
                .col,
                .abbr,
                .optgroup,
                .h6,
                .img,
                .big,
                .u,
                .h2,
                .em,
                .caption,
                .sub,
                .h1,
                .map,
                .strong,
                .cite,
                .menu,
                .dd,
                .h3,
                .ul,
                .select,
                .colgroup,
                .s,
                .button,
                .small,
                .i,
                .thead,
                .tt,
                .kbd,
                .tbody,
                .noscript,
                .center,
                .td,
                .tfoot,
                .input,
                .var,
                .sup,
                .tr,
                .q,
                .h4,
                .dir,
                .object,
                .div,
                .b,
                .span,
                .ins,
                .hr,
                .blockquote,
                .pre,
                .noframes,
                .address,
                .legend,
                .dfn,
                .samp,
                .th,
                .table,
                .area,
                .body
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a key was released"
        )
        public static let onload = KnownAttribute(
            name: "onload",
            relatedElements: [
                .frameset
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "all the frames have been loaded"
        )
        public static let onload2 = KnownAttribute(
            name: "onload",
            relatedElements: [
                .body
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the document has been loaded"
        )
        public static let onmousedown = KnownAttribute(
            name: "onmousedown",
            relatedElements: [
                .th,
                .col,
                .noframes,
                .abbr,
                .a,
                .body,
                .link,
                .dl,
                .noscript,
                .area,
                .strike,
                .div,
                .strong,
                .h5,
                .optgroup,
                .colgroup,
                .q,
                .tfoot,
                .h1,
                .dfn,
                .input,
                .address,
                .span,
                .del,
                .code,
                .img,
                .cite,
                .td,
                .legend,
                .big,
                .label,
                .menu,
                .hr,
                .object,
                .li,
                .p,
                .u,
                .h2,
                .select,
                .acronym,
                .dt,
                .dir,
                .dd,
                .fieldset,
                .s,
                .tt,
                .textarea,
                .sup,
                .tr,
                .map,
                .tbody,
                .ul,
                .i,
                .sub,
                .h4,
                .form,
                .em,
                .ins,
                .thead,
                .b,
                .kbd,
                .blockquote,
                .button,
                .var,
                .samp,
                .small,
                .center,
                .caption,
                .h6,
                .h3,
                .option,
                .ol,
                .table,
                .pre
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer button was pressed down"
        )
        public static let onmousemove = KnownAttribute(
            name: "onmousemove",
            relatedElements: [
                .menu,
                .ins,
                .tbody,
                .code,
                .dir,
                .small,
                .cite,
                .h1,
                .tr,
                .h2,
                .tfoot,
                .h6,
                .tt,
                .abbr,
                .b,
                .del,
                .dfn,
                .dl,
                .label,
                .dd,
                .div,
                .noscript,
                .h5,
                .a,
                .hr,
                .em,
                .ul,
                .q,
                .link,
                .p,
                .sub,
                .optgroup,
                .noframes,
                .kbd,
                .strike,
                .i,
                .pre,
                .img,
                .h4,
                .u,
                .th,
                .legend,
                .samp,
                .object,
                .colgroup,
                .address,
                .li,
                .table,
                .select,
                .h3,
                .form,
                .caption,
                .thead,
                .textarea,
                .strong,
                .option,
                .input,
                .map,
                .acronym,
                .dt,
                .fieldset,
                .td,
                .center,
                .span,
                .s,
                .area,
                .var,
                .sup,
                .button,
                .body,
                .col,
                .big,
                .ol,
                .blockquote
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer was moved within"
        )
        public static let onmouseout = KnownAttribute(
            name: "onmouseout",
            relatedElements: [
                .label,
                .form,
                .h5,
                .acronym,
                .button,
                .noscript,
                .body,
                .sub,
                .p,
                .span,
                .strong,
                .caption,
                .dir,
                .tr,
                .em,
                .var,
                .link,
                .del,
                .ul,
                .ins,
                .b,
                .i,
                .address,
                .option,
                .optgroup,
                .tt,
                .h4,
                .noframes,
                .col,
                .center,
                .div,
                .legend,
                .sup,
                .code,
                .ol,
                .dl,
                .q,
                .s,
                .area,
                .small,
                .pre,
                .td,
                .menu,
                .input,
                .img,
                .h6,
                .h2,
                .h3,
                .thead,
                .colgroup,
                .abbr,
                .kbd,
                .fieldset,
                .strike,
                .blockquote,
                .tbody,
                .big,
                .object,
                .samp,
                .tfoot,
                .dfn,
                .th,
                .li,
                .h1,
                .u,
                .textarea,
                .select,
                .table,
                .map,
                .cite,
                .a,
                .dd,
                .hr,
                .dt
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer was moved away"
        )
        public static let onmouseover = KnownAttribute(
            name: "onmouseover",
            relatedElements: [
                .select,
                .s,
                .kbd,
                .sup,
                .tt,
                .img,
                .blockquote,
                .thead,
                .col,
                .area,
                .code,
                .h5,
                .caption,
                .small,
                .b,
                .del,
                .option,
                .address,
                .samp,
                .dir,
                .td,
                .h2,
                .hr,
                .ins,
                .menu,
                .sub,
                .u,
                .fieldset,
                .strike,
                .dl,
                .link,
                .li,
                .big,
                .h4,
                .th,
                .table,
                .acronym,
                .body,
                .colgroup,
                .button,
                .optgroup,
                .map,
                .dfn,
                .span,
                .ol,
                .q,
                .h6,
                .div,
                .center,
                .pre,
                .tr,
                .dt,
                .legend,
                .noscript,
                .var,
                .textarea,
                .input,
                .abbr,
                .em,
                .ul,
                .cite,
                .p,
                .object,
                .noframes,
                .tbody,
                .label,
                .tfoot,
                .h3,
                .dd,
                .i,
                .a,
                .strong,
                .h1,
                .form
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer was moved onto"
        )
        public static let onmouseup = KnownAttribute(
            name: "onmouseup",
            relatedElements: [
                .dd,
                .select,
                .object,
                .h5,
                .var,
                .small,
                .option,
                .menu,
                .th,
                .strong,
                .tt,
                .body,
                .h4,
                .a,
                .h6,
                .s,
                .map,
                .kbd,
                .center,
                .form,
                .cite,
                .noscript,
                .tbody,
                .p,
                .img,
                .caption,
                .i,
                .col,
                .dl,
                .thead,
                .fieldset,
                .dir,
                .table,
                .li,
                .area,
                .sup,
                .b,
                .strike,
                .dt,
                .colgroup,
                .ins,
                .q,
                .tr,
                .hr,
                .optgroup,
                .textarea,
                .h3,
                .link,
                .dfn,
                .sub,
                .h2,
                .del,
                .blockquote,
                .big,
                .td,
                .ul,
                .address,
                .em,
                .acronym,
                .span,
                .ol,
                .u,
                .label,
                .div,
                .input,
                .code,
                .tfoot,
                .samp,
                .abbr,
                .legend,
                .noframes,
                .button,
                .h1,
                .pre
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "a pointer button was released"
        )
        public static let onreset = KnownAttribute(
            name: "onreset",
            relatedElements: [
                .form
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the form was reset"
        )
        public static let onselect = KnownAttribute(
            name: "onselect",
            relatedElements: [
                .textarea,
                .input
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "some text was selected"
        )
        public static let onsubmit = KnownAttribute(
            name: "onsubmit",
            relatedElements: [
                .form
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the form was submitted"
        )
        public static let onunload = KnownAttribute(
            name: "onunload",
            relatedElements: [
                .frameset
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "all the frames have been removed"
        )
        public static let onunload2 = KnownAttribute(
            name: "onunload",
            relatedElements: [
                .body
            ],
            valueType: "%Script;",
            isDepreciated: false,
            description: "the document has been removed"
        )
        public static let profile = KnownAttribute(
            name: "profile",
            relatedElements: [
                .head
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "named dictionary of meta info"
        )
        public static let prompt = KnownAttribute(
            name: "prompt",
            relatedElements: [
                .isindex
            ],
            valueType: "%Text;",
            isDepreciated: true,
            description: "prompt message"
        )
        public static let readonly = KnownAttribute(
            name: "readonly",
            relatedElements: [
                .textarea
            ],
            valueType: "(readonly)",
            isDepreciated: false,
            description: ""
        )
        public static let readonly2 = KnownAttribute(
            name: "readonly",
            relatedElements: [
                .input
            ],
            valueType: "(readonly)",
            isDepreciated: false,
            description: "for text and passwd"
        )
        public static let rel = KnownAttribute(
            name: "rel",
            relatedElements: [
                .a,
                .link
            ],
            valueType: "%LinkTypes;",
            isDepreciated: false,
            description: "forward link types"
        )
        public static let rev = KnownAttribute(
            name: "rev",
            relatedElements: [
                .link,
                .a
            ],
            valueType: "%LinkTypes;",
            isDepreciated: false,
            description: "reverse link types"
        )
        public static let rows = KnownAttribute(
            name: "rows",
            relatedElements: [
                .frameset
            ],
            valueType: "%MultiLengths;",
            isDepreciated: false,
            description: "list of lengths, default: 100% (1 row)"
        )
        public static let rows2 = KnownAttribute(
            name: "rows",
            relatedElements: [
                .textarea
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: ""
        )
        public static let rowspan = KnownAttribute(
            name: "rowspan",
            relatedElements: [
                .th,
                .td
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "number of rows spanned by cell"
        )
        public static let rules = KnownAttribute(
            name: "rules",
            relatedElements: [
                .table
            ],
            valueType: "%TRules;",
            isDepreciated: false,
            description: "rulings between rows and cols"
        )
        public static let scheme = KnownAttribute(
            name: "scheme",
            relatedElements: [
                .meta
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "select form of content"
        )
        public static let scope = KnownAttribute(
            name: "scope",
            relatedElements: [
                .th,
                .td
            ],
            valueType: "%Scope;",
            isDepreciated: false,
            description: "scope covered by header cells"
        )
        public static let scrolling = KnownAttribute(
            name: "scrolling",
            relatedElements: [
                .frame,
                .iframe
            ],
            valueType: "(yes | no | auto)",
            isDepreciated: false,
            description: "scrollbar or none"
        )
        public static let selected = KnownAttribute(
            name: "selected",
            relatedElements: [
                .option
            ],
            valueType: "(selected)",
            isDepreciated: false,
            description: ""
        )
        public static let shape = KnownAttribute(
            name: "shape",
            relatedElements: [
                .area
            ],
            valueType: "%Shape;",
            isDepreciated: false,
            description: "controls interpretation of coords"
        )
        public static let shape2 = KnownAttribute(
            name: "shape",
            relatedElements: [
                .a
            ],
            valueType: "%Shape;",
            isDepreciated: false,
            description: "for use with client-side image maps"
        )
        public static let size = KnownAttribute(
            name: "size",
            relatedElements: [
                .hr
            ],
            valueType: "%Pixels;",
            isDepreciated: true,
            description: ""
        )
        public static let size2 = KnownAttribute(
            name: "size",
            relatedElements: [
                .font
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: #"[+|-]nn e.g. size="+1", size="4""#
        )
        public static let size3 = KnownAttribute(
            name: "size",
            relatedElements: [
                .input
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "specific to each type of field"
        )
        public static let size4 = KnownAttribute(
            name: "size",
            relatedElements: [
                .basefont
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "base font size for FONT elements"
        )
        public static let size5 = KnownAttribute(
            name: "size",
            relatedElements: [
                .select
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "rows visible"
        )
        public static let span = KnownAttribute(
            name: "span",
            relatedElements: [
                .col
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "COL attributes affect N columns"
        )
        public static let span2 = KnownAttribute(
            name: "span",
            relatedElements: [
                .colgroup
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "default number of columns in group"
        )
        public static let src = KnownAttribute(
            name: "src",
            relatedElements: [
                .script
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "URI for an external script"
        )
        public static let src2 = KnownAttribute(
            name: "src",
            relatedElements: [
                .input
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "for fields with images"
        )
        public static let src3 = KnownAttribute(
            name: "src",
            relatedElements: [
                .frame,
                .iframe
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "source of frame content"
        )
        public static let src4 = KnownAttribute(
            name: "src",
            relatedElements: [
                .img
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "URI of image to embed"
        )
        public static let standby = KnownAttribute(
            name: "standby",
            relatedElements: [
                .object
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "message to show while loading"
        )
        public static let start = KnownAttribute(
            name: "start",
            relatedElements: [
                .ol
            ],
            valueType: "NUMBER",
            isDepreciated: true,
            description: "starting sequence number"
        )
        public static let style = KnownAttribute(
            name: "style",
            relatedElements: [
                .object,
                .option,
                .frame,
                .area,
                .th,
                .body,
                .ol,
                .s,
                .tbody,
                .b,
                .em,
                .ul,
                .q,
                .select,
                .strike,
                .i,
                .big,
                .h1,
                .td,
                .h4,
                .applet,
                .div,
                .br,
                .tt,
                .table,
                .tr,
                .isindex,
                .thead,
                .p,
                .sup,
                .address,
                .del,
                .code,
                .link,
                .small,
                .h2,
                .fieldset,
                .u,
                .abbr,
                .menu,
                .dir,
                .kbd,
                .ins,
                .label,
                .font,
                .hr,
                .h3,
                .pre,
                .cite,
                .textarea,
                .map,
                .li,
                .caption,
                .colgroup,
                .var,
                .legend,
                .iframe,
                .sub,
                .strong,
                .dl,
                .dfn,
                .frameset,
                .noscript,
                .blockquote,
                .dd,
                .samp,
                .a,
                .h6,
                .noframes,
                .img,
                .span,
                .bdo,
                .tfoot,
                .button,
                .col,
                .center,
                .optgroup,
                .h5,
                .input,
                .acronym,
                .dt,
                .form
            ],
            valueType: "%StyleSheet;",
            isDepreciated: false,
            description: "associated style info"
        )
        public static let summary = KnownAttribute(
            name: "summary",
            relatedElements: [
                .table
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "purpose/structure for speech output"
        )
        public static let tabindex = KnownAttribute(
            name: "tabindex",
            relatedElements: [
                .a,
                .input,
                .textarea,
                .object,
                .area,
                .button,
                .select
            ],
            valueType: "NUMBER",
            isDepreciated: false,
            description: "position in tabbing order"
        )
        public static let target = KnownAttribute(
            name: "target",
            relatedElements: [
                .link,
                .a,
                .form,
                .base,
                .area
            ],
            valueType: "%FrameTarget;",
            isDepreciated: false,
            description: "render in this frame"
        )
        public static let text = KnownAttribute(
            name: "text",
            relatedElements: [
                .body
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "document text color"
        )
        public static let title = KnownAttribute(
            name: "title",
            relatedElements: [
                .ins,
                .a,
                .tfoot,
                .body,
                .dl,
                .style,
                .font,
                .s,
                .table,
                .pre,
                .caption,
                .isindex,
                .h1,
                .area,
                .h2,
                .col,
                .th,
                .legend,
                .tr,
                .dd,
                .td,
                .option,
                .fieldset,
                .acronym,
                .b,
                .optgroup,
                .strong,
                .bdo,
                .select,
                .cite,
                .small,
                .map,
                .input,
                .object,
                .menu,
                .span,
                .dir,
                .textarea,
                .li,
                .noframes,
                .h3,
                .sub,
                .applet,
                .big,
                .label,
                .frame,
                .q,
                .div,
                .sup,
                .del,
                .em,
                .h5,
                .center,
                .thead,
                .address,
                .kbd,
                .link,
                .colgroup,
                .u,
                .button,
                .abbr,
                .img,
                .hr,
                .h4,
                .br,
                .ol,
                .iframe,
                .tt,
                .dfn,
                .code,
                .var,
                .h6,
                .ul,
                .dt,
                .frameset,
                .p,
                .i,
                .blockquote,
                .form,
                .tbody,
                .noscript,
                .strike,
                .samp
            ],
            valueType: "%Text;",
            isDepreciated: false,
            description: "advisory title"
        )
        public static let type = KnownAttribute(
            name: "type",
            relatedElements: [
                .a,
                .link
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: "advisory content type"
        )
        public static let type2 = KnownAttribute(
            name: "type",
            relatedElements: [
                .object
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: "content type for data"
        )
        public static let type3 = KnownAttribute(
            name: "type",
            relatedElements: [
                .param
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: "content type for value when valuetype=ref"
        )
        public static let type4 = KnownAttribute(
            name: "type",
            relatedElements: [
                .script
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: "content type of script language"
        )
        public static let type5 = KnownAttribute(
            name: "type",
            relatedElements: [
                .style
            ],
            valueType: "%ContentType;",
            isDepreciated: false,
            description: "content type of style language"
        )
        public static let type6 = KnownAttribute(
            name: "type",
            relatedElements: [
                .input
            ],
            valueType: "%InputType;",
            isDepreciated: false,
            description: "what kind of widget is needed"
        )
        public static let type7 = KnownAttribute(
            name: "type",
            relatedElements: [
                .li
            ],
            valueType: "%LIStyle;",
            isDepreciated: true,
            description: "list item style"
        )
        public static let type8 = KnownAttribute(
            name: "type",
            relatedElements: [
                .ol
            ],
            valueType: "%OLStyle;",
            isDepreciated: true,
            description: "numbering style"
        )
        public static let type9 = KnownAttribute(
            name: "type",
            relatedElements: [
                .ul
            ],
            valueType: "%ULStyle;",
            isDepreciated: true,
            description: "bullet style"
        )
        public static let type10 = KnownAttribute(
            name: "type",
            relatedElements: [
                .button
            ],
            valueType: "(button | submit | reset)",
            isDepreciated: false,
            description: "for use as form button"
        )
        public static let usemap = KnownAttribute(
            name: "usemap",
            relatedElements: [
                .object,
                .input,
                .img
            ],
            valueType: "%URI;",
            isDepreciated: false,
            description: "use client-side image map"
        )
        public static let valign = KnownAttribute(
            name: "valign",
            relatedElements: [
                .tfoot,
                .colgroup,
                .tr,
                .th,
                .thead,
                .td,
                .tbody,
                .col
            ],
            valueType: "(top | middle | bottom | baseline)",
            isDepreciated: false,
            description: "vertical alignment in cells"
        )
        public static let value = KnownAttribute(
            name: "value",
            relatedElements: [
                .input
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "Specify for radio buttons and checkboxes"
        )
        public static let value2 = KnownAttribute(
            name: "value",
            relatedElements: [
                .option
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "defaults to element content"
        )
        public static let value3 = KnownAttribute(
            name: "value",
            relatedElements: [
                .param
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "property value"
        )
        public static let value4 = KnownAttribute(
            name: "value",
            relatedElements: [
                .button
            ],
            valueType: "CDATA",
            isDepreciated: false,
            description: "sent to server when submitted"
        )
        public static let value5 = KnownAttribute(
            name: "value",
            relatedElements: [
                .li
            ],
            valueType: "NUMBER",
            isDepreciated: true,
            description: "reset sequence number"
        )
        public static let valuetype = KnownAttribute(
            name: "valuetype",
            relatedElements: [
                .param
            ],
            valueType: "(DATA | REF | OBJECT)",
            isDepreciated: false,
            description: "How to interpret value"
        )
        public static let version = KnownAttribute(
            name: "version",
            relatedElements: [
                .html
            ],
            valueType: "CDATA",
            isDepreciated: true,
            description: "Constant"
        )
        public static let vlink = KnownAttribute(
            name: "vlink",
            relatedElements: [
                .body
            ],
            valueType: "%Color;",
            isDepreciated: true,
            description: "color of visited links"
        )
        public static let vspace = KnownAttribute(
            name: "vspace",
            relatedElements: [
                .applet,
                .object,
                .img
            ],
            valueType: "%Pixels;",
            isDepreciated: true,
            description: "vertical gutter"
        )
        public static let width = KnownAttribute(
            name: "width",
            relatedElements: [
                .hr
            ],
            valueType: "%Length;",
            isDepreciated: true,
            description: ""
        )
        public static let width2 = KnownAttribute(
            name: "width",
            relatedElements: [
                .iframe
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "frame width"
        )
        public static let width3 = KnownAttribute(
            name: "width",
            relatedElements: [
                .img,
                .object
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "override width"
        )
        public static let width4 = KnownAttribute(
            name: "width",
            relatedElements: [
                .table
            ],
            valueType: "%Length;",
            isDepreciated: false,
            description: "table width"
        )
        public static let width5 = KnownAttribute(
            name: "width",
            relatedElements: [
                .th,
                .td
            ],
            valueType: "%Length;",
            isDepreciated: true,
            description: "width for cell"
        )
        public static let width6 = KnownAttribute(
            name: "width",
            relatedElements: [
                .applet
            ],
            valueType: "%Length;",
            isDepreciated: true,
            description: "initial width"
        )
        public static let width7 = KnownAttribute(
            name: "width",
            relatedElements: [
                .col
            ],
            valueType: "%MultiLength;",
            isDepreciated: false,
            description: "column width specification"
        )
        public static let width8 = KnownAttribute(
            name: "width",
            relatedElements: [
                .colgroup
            ],
            valueType: "%MultiLength;",
            isDepreciated: false,
            description: "default width for enclosed COLs"
        )
        public static let width9 = KnownAttribute(
            name: "width",
            relatedElements: [
                .pre
            ],
            valueType: "NUMBER",
            isDepreciated: true,
            description: ""
        )
        
        public static let all: [KnownAttribute] = [abbr,acceptCharset,accept,accesskey,action,align,align2,align3,align4,align5,align6,align7,alink,alt,alt2,alt3,archive,archive2,axis,background,bgcolor,bgcolor2,bgcolor3,bgcolor4,border,border2,cellpadding,cellspacing,char,charoff,charset,checked,cite,cite2,`class`,classid,clear,code,codebase,codebase2,codetype,color,cols,cols2,colspan,compact,content,coords,coords2,data,datetime,declare,`defer`,dir,dir2,disabled,enctype,face,`for`,frame,frameborder,headers,height,height2,height3,height4,href,href2,hreflang,hspace,httpEquiv,id,ismap,label,label2,lang,language,link,longdesc,longdesc2,marginheight,marginwidth,maxlength,media,media2,method,multiple,name,name2,name3,name4,name5,name6,name7,name8,name9,name10,name11,nohref,noresize,noshade,nowrap,object,onblur,onchange,onclick,ondblclick,onfocus,onkeydown,onkeypress,onkeyup,onload,onload2,onmousedown,onmousemove,onmouseout,onmouseover,onmouseup,onreset,onselect,onsubmit,onunload,onunload2,profile,prompt,readonly,readonly2,rel,rev,rows,rows2,rowspan,rules,scheme,scope,scrolling,selected,shape,shape2,size,size2,size3,size4,size5,span,span2,src,src2,src3,src4,standby,start,style,summary,tabindex,target,text,title,type,type2,type3,type4,type5,type6,type7,type8,type9,type10,usemap,valign,value,value2,value3,value4,value5,valuetype,version,vlink,vspace,width,width2,width3,width4,width5,width6,width7,width8,width9]
        
        
        static let allAttributeNames = all.map({$0.name}).reduce(Set<String>(), {$0.union([$1])}).sorted()
    }
}
