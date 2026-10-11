[![W3C](https://www.w3.org/StyleSheets/TR/2021/logos/W3C)](https://www.w3.org/)

# EPUB Reading Systems 3.3

[W3C Recommendation](https://www.w3.org/standards/types#REC) 17 October 2024

More details about this document

This version:  
[https://www.w3.org/TR/2024/REC-epub-rs-33-20241017/](https://www.w3.org/TR/2024/REC-epub-rs-33-20241017/)

Latest published version:  
<https://www.w3.org/TR/epub-rs-33/>

Latest editor's draft:  
<https://w3c.github.io/epub-specs/epub33/rs/>

History:  
<https://www.w3.org/standards/history/epub-rs-33/>

[Commit history](https://github.com/w3c/epub-specs/commits/main)

Test suite:  
<https://w3c.github.io/epub-tests/index.html>

Implementation report:  
<https://w3c.github.io/epub-specs/epub33/reports/>

Editors:  
Matt Garrish ([DAISY Consortium](https://daisy.org))

[Ivan Herman](https://www.w3.org/People/Ivan/)[![](data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld2JveD0iMCAwIDI1NiAyNTYiPgogICAgPHN0eWxlPgoKICAgICAgLnN0MSB7CiAgICAgICAgZmlsbDogI2ZmZjsKICAgICAgfQogICAgCjwvc3R5bGU+CiAgICA8cGF0aCBkPSJNMjU2IDEyOGMwIDcwLjctNTcuMyAxMjgtMTI4IDEyOFMwIDE5OC43IDAgMTI4IDU3LjMgMCAxMjggMHMxMjggNTcuMyAxMjggMTI4eiIgZmlsbD0iI2E2Y2UzOSIgLz4KICAgIDxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik04Ni4zIDE4Ni4ySDcwLjlWNzkuMWgxNS40djEwNy4xek0xMDguOSA3OS4xaDQxLjZjMzkuNiAwIDU3IDI4LjMgNTcgNTMuNiAwIDI3LjUtMjEuNSA1My42LTU2LjggNTMuNmgtNDEuOFY3OS4xem0xNS40IDkzLjNoMjQuNWMzNC45IDAgNDIuOS0yNi41IDQyLjktMzkuN0MxOTEuNyAxMTEuMiAxNzggOTMgMTQ4IDkzaC0yMy43djc5LjR6TTg4LjcgNTYuOGMwIDUuNS00LjUgMTAuMS0xMC4xIDEwLjFzLTEwLjEtNC42LTEwLjEtMTAuMWMwLTUuNiA0LjUtMTAuMSAxMC4xLTEwLjFzMTAuMSA0LjYgMTAuMSAxMC4xeiIgLz4KICA8L3N2Zz4=)](https://orcid.org/0000-0003-0782-2704) ([W3C](https://www.w3.org))

Dave Cramer (Invited Expert)

Feedback:  
[GitHub w3c/epub-specs](https://github.com/w3c/epub-specs/) ([pull requests](https://github.com/w3c/epub-specs/pulls/), [new issue](https://github.com/w3c/epub-specs/issues/new/choose), [open issues](https://github.com/w3c/epub-specs/issues/))

[public-pm-wg@w3.org](mailto:public-pm-wg@w3.org?subject=%5Bepub-rs-33%5D%20YOUR%20TOPIC%20HERE) with subject line \[epub-rs-33\] *… message topic …* ([archives](https://lists.w3.org/Archives/Public/public-pm-wg))

Errata:  
<https://w3c.github.io/epub-specs/epub33/errata.html>

This document is also available in this non-normative format:  
[EPUB 3](./epub-rs-33.epub)

See also [**translations**](https://www.w3.org/Translations/?technology=epub-rs-33).

[Copyright](https://www.w3.org/policies/#copyright) © 1999-2024 [International Digital Publishing Forum](https://www.idpf.org) and [World Wide Web Consortium](https://www.w3.org/). W3C^(®) [liability](https://www.w3.org/policies/#Legal_Disclaimer), [trademark](https://www.w3.org/policies/#W3C_Trademarks) and [permissive document license](https://www.w3.org/copyright/software-license-2023/ "W3C Software and Document Notice and License") rules apply.

------------------------------------------------------------------------

## Abstract

EPUB® 3 defines a distribution and interchange format for digital publications and documents. The EPUB format provides a means of representing, packaging, and encoding structured and semantically enhanced web content — including HTML, CSS, SVG and other resources — for distribution in a single-file container.

This specification defines the conformance requirements for EPUB 3 reading systems — the user agents that render EPUB publications.

## Status of This Document

*This section describes the status of this document at the time of its publication. A list of current W3C publications and the latest revision of this technical report can be found in the [W3C technical reports index](https://www.w3.org/TR/) at https://www.w3.org/TR/.*

This document was published by the [Publishing Maintenance Working Group](https://www.w3.org/groups/wg/pm) as a Recommendation using the [Recommendation track](https://www.w3.org/policies/process/20231103/#recs-and-notes).

W3C recommends the wide deployment of this specification as a standard for the Web.

A W3C Recommendation is a specification that, after extensive consensus-building, is endorsed by W3C and its Members, and has commitments from Working Group members to [royalty-free licensing](https://www.w3.org/policies/patent-policy/#sec-Requirements) for implementations. Future updates to this Recommendation may incorporate [new features](https://www.w3.org/policies/process/20231103/#allow-new-features).

This document was produced by a group operating under the [W3C Patent Policy](https://www.w3.org/policies/patent-policy/). W3C maintains a [public list of any patent disclosures](https://www.w3.org/groups/wg/pm/ipr) made in connection with the deliverables of the group; that page also includes instructions for disclosing a patent. An individual who has actual knowledge of a patent which the individual believes contains [Essential Claim(s)](https://www.w3.org/policies/patent-policy/#def-essential) must disclose the information in accordance with [section 6 of the W3C Patent Policy](https://www.w3.org/policies/patent-policy/#sec-Disclosure).

This document is governed by the [03 November 2023 W3C Process Document](https://www.w3.org/policies/process/20231103/).

## Table of Contents

1.  [Abstract](#abstract)
2.  [Status of This Document](#sotd)
3.  [1. Introduction](#sec-introduction)
    1.  [1.1 Overview](#sec-intro-overview)
    2.  [1.2 Terminology](#sec-terminology)
    3.  [1.3 Conformance](#conformance)
    4.  [1.4 Relationship to other specifications](#sec-intro-relations)
        1.  [1.4.1 Relationship to HTML](#rel)
        2.  [1.4.2 Relationship to SVG](#sec-overview-relations-svg)
4.  [2. Reading system conformance](#sec-rs-conformance)
    1.  [2.1 Requirements](#rs-conf-req)
    2.  [2.2 Error handling](#rs-conf-error-handling)
    3.  [2.3 Error reporting](#rs-conf-error-reporting)
5.  [3. Publication resource processing](#sec-pub-resources)
    1.  [3.1 Core Media types](#sec-epub-rs-conf-cmt)
    2.  [3.2 Foreign resources](#sec-epub-rs-conf-foreign-res)
    3.  [3.3 Resource locations](#sec-epub-rs-conf-remote-res)
    4.  [3.4 Data URLs](#sec-epub-rs-conf-data-urls)
    5.  [3.5 File URLs](#sec-epub-rs-conf-file-urls)
    6.  [3.6 XML processing](#sec-epub-rs-conf-xml)
    7.  [3.7 Internationalization](#sec-epub-rs-i18n)
    8.  [3.8 Network access](#sec-epub-rs-network-access)
    9.  [3.9 External links](#sec-epub-rs-external-links)
6.  [4. Open Container Format (OCF) processing](#sec-ocf)
    1.  [4.1 OCF abstract container](#sec-container-abstract)
        1.  [4.1.1 URL of the root directory](#sec-container-iri)
        2.  [4.1.2 File names](#sec-container-filenames)
        3.  [4.1.3 `META-INF` directory](#sec-container-metainf)
    2.  [4.2 OCF ZIP container](#sec-container-zip)
    3.  [4.3 Font obfuscation](#sec-container-fobfus)
7.  [5. Package document processing](#sec-package-doc)
    1.  [5.1 Base direction](#sec-pkg-doc-base-dir)
    2.  [5.2 Unique identifier](#sec-pkg-doc-pub-identifiers)
    3.  [5.3 Metadata](#sec-pkg-doc-metadata)
    4.  [5.4 Manifest](#sec-pkg-doc-manifest)
    5.  [5.5 Spine](#sec-pkg-doc-spine)
        1.  [5.5.1 Spine overrides](#spine-overrides)
    6.  [5.6 Collections](#sec-pkg-doc-collections)
    7.  [5.7 Legacy features](#sec-pkg-doc-legacy)
8.  [6. EPUB content document processing](#sec-contentdocs)
    1.  [6.1 XHTML content documents](#sec-xhtml)
        1.  [6.1.1 HTML extensions](#sec-xhtml-extensions)
            1.  [6.1.1.1 RDFa](#sec-xhtml-rdfa)
            2.  [6.1.1.2 Content switching (deprecated)](#sec-xhtml-content-switch)
            3.  [6.1.1.3 The `epub:trigger` element (deprecated)](#sec-xhtml-epub-trigger)
            4.  [6.1.1.4 Custom attributes](#sec-xhtml-custom-attributes)
        2.  [6.1.2 HTML deviations and constraints](#sec-xhtml-deviations)
            1.  [6.1.2.1 Microdata](#sec-xhtml-microdata)
            2.  [6.1.2.2 MathML](#sec-xhtml-mathml)
            3.  [6.1.2.3 Embedded SVG](#sec-xhtml-svg)
                1.  [6.1.2.3.1 Embedded SVG and CSS](#sec-xhtml-svg-css)
            4.  [6.1.2.4 Form submission](#sec-xhtml-forms)
    2.  [6.2 SVG content documents](#sec-svg)
    3.  [6.3 Cascading Style Sheets (CSS)](#sec-css)
    4.  [6.4 Scripting](#sec-scripted-content)
        1.  [6.4.1 Local storage](#sec-local-storage)
        2.  [6.4.2 Event model](#sec-scripted-content-events)
        3.  [6.4.3 Security considerations](#sec-scripted-content-security)
9.  [7. Navigation document processing](#sec-nav)
10. [8. Layout rendering control processing](#sec-rendering-control)
    1.  [8.1 Fixed-layout documents](#sec-fixed-layouts)
        1.  [8.1.1 Fixed-layout properties](#sec-fxl-props)
            1.  [8.1.1.1 The `rendition:layout` property](#layout)
            2.  [8.1.1.2 The `rendition:orientation` property](#orientation)
            3.  [8.1.1.3 The `rendition:spread` property](#spread)
            4.  [8.1.1.4 The `rendition:page-spread-*` properties](#page-spread)
        2.  [8.1.2 Initial containing block dimensions](#sec-fxl-dimensions)
        3.  [8.1.3 Viewport rendering](#sec-fxl-viewport)
    2.  [8.2 Reflowable layouts](#sec-reflowable-layouts)
        1.  [8.2.1 The `rendition:flow` property](#flow)
        2.  [8.2.2 The `rendition:align-x-center` property](#align-x-center)
    3.  [8.3 The `viewport meta` tag](#sec-viewport-meta)
    4.  [8.4 Custom properties](#sec-custom-properties)
11. [9. Media overlays processing](#sec-media-overlays)
    1.  [9.1 Loading the media overlay](#sec-behaviors-loading)
    2.  [9.2 Basic playback](#sec-behaviors-playback)
        1.  [9.2.1 Timing and synchronization](#sec-rsconf-timing-synch)
        2.  [9.2.2 Rendering audio](#sec-rsconf-rendering-audio)
        3.  [9.2.3 Rendering EPUB content document elements](#sec-rsconf-rendering-text)
    3.  [9.3 Interacting with the EPUB content document](#sec-behaviors-interaction)
        1.  [9.3.1 Navigation](#sec-rsconf-navigation)
        2.  [9.3.2 Embedded audio and video (deprecated)](#sec-embedded-media)
        3.  [9.3.3 Text-to-speech](#sec-text-to-speech)
    4.  [9.4 Skippability and escapability](#sec-behaviors-skip-escape)
        1.  [9.4.1 Skippability](#sec-skippability)
        2.  [9.4.2 Escapability](#sec-escapability)
12. [10. Processing structural semantics](#sec-structural-semantics)
13. [11. Processing `property` values](#sec-property-values)
14. [12. Backward compatibility](#sec-epub-rs-conf-backward)
15. [13. Forward compatibility](#sec-epub-rs-conf-forward)
16. [14. Accessibility](#sec-accessibility)
17. [15. Security and privacy](#sec-security-privacy)
    1.  [15.1 Overview](#security-privacy-overview)
    2.  [15.2 Threat model](#epub-threat-model)
    3.  [15.3 Recommendations](#security-privacy-recommendations)
18. [A. Unsupported features](#app-unsupported)
19. [B. epubReadingSystem object](#app-epubReadingSystem)
    1.  [B.1 Interface definition](#app-ers-idl)
    2.  [B.2 Description](#app-ers-desc)
    3.  [B.3 Properties](#app-ers-properties)
    4.  [B.4 Methods](#app-ers-methods)
        1.  [B.4.1 hasFeature](#app-ers-hasFeature)
            1.  [B.4.1.1 Description](#app-ers-hasFeature-desc)
            2.  [B.4.1.2 Features](#app-ers-hasFeature-features)
20. [C. Index](#index)
    1.  [C.1 Terms defined by this specification](#index-defined-here)
    2.  [C.2 Terms defined by reference](#index-defined-elsewhere)
21. [D. Change log](#change-log)
22. [E. Acknowledgements](#ack)
23. [F. References](#references)
    1.  [F.1 Normative references](#normative-references)
    2.  [F.2 Informative references](#informative-references)

## 1. Introduction

[](#sec-introduction)

### 1.1 Overview

[](#sec-intro-overview)

*This section is non-normative.*

The EPUB 3 standard is separated into two distinct concerns: the authoring of [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication) is defined in the [core specification](https://www.w3.org/TR/epub-33/#) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], while this specification details the rendering requirements for them in [EPUB reading system](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system).

An EPUB reading system can take many forms. It might have a visual display area for rendering the content to users, for example, or it might only provide audio playback of the content. Therefore, there is no single set of rules that applies to all reading systems. Rather, this specification breaks down the rendering requirements based on a reading system's capabilities and the features it supports.

Moreover, this specification allows for a great deal of flexibility for developers to create unique user interfaces, and requirements for things like metadata processing are intentionally minimal to allow for such flexibility.

So, although this specification identifies the formal requirements for reading systems, it is not possible to understand this document in isolation. Developers should also familiarize themselves with the full content structure of an EPUB publication in order to understand the complete range of information that is available.

Note

A conforming reading system is not necessarily a single dedicated program or device but might exist as a distributed system.

### 1.2 Terminology

[](#sec-terminology)

This specification uses [terminology defined in EPUB 3.3](https://www.w3.org/TR/epub-33/#sec-terminology) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

It also defines the following term:

content display area  
The area within the [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport) dedicated to the display of [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document). The content display area excludes any borders, margins, headers, footers, or other decoration a [EPUB reading system](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) might inject into the viewport.

In the case of [synthetic spreads](https://www.w3.org/TR/epub-33/#dfn-synthetic-spread), the viewport contains two content display areas.

Note

Only the first instance of a term in a section links to its definition.

### 1.3 Conformance

[](#conformance)

As well as sections marked as non-normative, all authoring guidelines, diagrams, examples, and notes in this specification are non-normative. Everything else in this specification is normative.

The key words *MAY*, *MUST*, *MUST NOT*, *OPTIONAL*, *RECOMMENDED*, *SHOULD*, and *SHOULD NOT* in this document are to be interpreted as described in [BCP 14](https://datatracker.ietf.org/doc/html/bcp14) \[[RFC2119](#bib-rfc2119 "Key words for use in RFCs to Indicate Requirement Levels")\] \[[RFC8174](#bib-rfc8174 "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words")\] when, and only when, they appear in all capitals, as shown here.

All algorithm explanations are *non-normative*.

### 1.4 Relationship to other specifications

[](#sec-intro-relations)

*This section is non-normative.*

#### 1.4.1 Relationship to HTML

[](#rel)

The \[[html](#bib-html "HTML Standard")\] standard is continuously evolving — there are no longer versioned releases of it. That standard, in turn, references various technologies that continue to evolve, such as MathML, SVG, CSS, and JavaScript.

[Reading system](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) developers must keep track of the changes to HTML, and the technologies it references, to ensure they keep their systems up to date.

This specification does not require EPUB reading systems to support [scripting](#sec-scripted-content), [form submission](#sec-xhtml-forms), or the HTML DOM \[[dom](#bib-dom "DOM Standard")\]. Reading systems conformant with this specification are only expected to be able to process a conforming [EPUB content document](https://www.w3.org/TR/epub-33/#dfn-epub-content-document). As support for scripting and form submission is not compulsory, a conformant reading system might not be a fully conformant HTML user agent.

#### 1.4.2 Relationship to SVG

[](#sec-overview-relations-svg)

This specification does not reference a specific version of \[[svg](#bib-svg "SVG")\], but instead uses an undated reference. Whenever there is any ambiguity in this reference, the latest recommended specification is the authoritative reference.

This approach ensures that EPUB will always keep pace with changes to the SVG standard. [Reading system](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) developers must keep track of changes to the SVG standard to ensure that they keep their systems up to date.

## 2. Reading system conformance

[](#sec-rs-conformance)

### 2.1 Requirements

[](#rs-conf-req)

Whether a [reading system](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) has to support a feature is mentioned at the beginning of its section. To be conformant with this specification, reading systems *MUST* support all required features as well as all applicable conditionally-required features (e.g., to support image rendering if the reading system has a [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport)) as defined in their respective sections.

Note

As a reading system is not necessarily a single application, but may exist as a distributed system, it is not always the case that reading system requirements will be met in the application that renders EPUB publications to users. An example is a reading system that solely interacts with a controlled content repository (e.g., a bookstore or library system). In this case, if a reading system developer can demonstrate that requirements are not applicable to the application (e.g., EPUB publications with duplicate [`itemref`](https://www.w3.org/TR/epub-33/#dfn-itemref) entries \[[epub-33](#bib-epub-33 "EPUB 3.3")\] cannot enter the system), the reading system as a whole is still considered conforming.

When supporting recommended and optional features, reading systems *MUST* meet all normative requirements as defined in their respective sections.

When reading system developers opt not to support a recommended or optional feature, it does not always mean none of the normative requirements of the section apply. In some cases, there may be alternative requirements when not implementing a feature (e.g., to [process fallbacks](#confreq-rs-scripted-flbk) when scripting is not supported). Reading systems *MUST* meet these alternative requirements when not supporting a feature.

Note

EPUB publications frequently contain information not required by this specification (e.g., [package document](https://www.w3.org/TR/epub-33/#dfn-package-document) metadata). Reading systems may use this additional information for any purposes (e.g., to improve the user interface).

### 2.2 Error handling

[](#rs-conf-error-handling)

Reading systems are not required to load [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication), or resources within them, when they violate content authoring or processing requirements.

### 2.3 Error reporting

[](#rs-conf-error-reporting)

*This section is non-normative.*

Although reading systems are not required to report errors encountered while processing and rendering [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication) (e.g., if the dimensions of a [fixed-layout document](https://www.w3.org/TR/epub-33/#dfn-fixed-layout-document) have been inferred), they are strongly encouraged to provide a means of accessing this information. A comparable example are the developer tools that web browsers provide for debugging HTML pages and applications.

[EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator), for example, can greatly benefit from having access to such processing information (e.g., to efficiently debug their EPUB publications). For maximum use in debugging, it is recommended that reading systems not only report issues they directly encounter but also issues reported by any applications they use (e.g., HTML, CSS, and JavaScript errors reported from a browser core used to render the content, or validation issues reported by [EPUBCheck](https://www.w3.org/publishing/epubcheck/)).

It is not expected that error reporting will be an intrusive experience that affects the general reading experience for users. Rather, reporting information could, for example, be selectively activated from a settings menu so that it does not bother users unnecessarily.

## 3. Publication resource processing

[](#sec-pub-resources)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* process [publication resources](https://www.w3.org/TR/epub-33/#sec-publication-resources) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

### 3.1 Core Media types

[](#sec-epub-rs-conf-cmt)

If a reading system has a [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport), it *MUST* support the [image core media type resources](https://www.w3.org/TR/epub-33/#cmt-grp-image) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

If it has the capability to render prerecorded audio, it *MUST* support the [audio core media type resources](https://www.w3.org/TR/epub-33/#cmt-grp-audio) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

Note

It is recommended that reading systems support at least one of the H.264 \[[h264](#bib-h264 "H.264 : Advanced video coding for generic audiovisual services")\] and VP8 \[[rfc6386](#bib-rfc6386 "VP8 Data Format and Decoding Guide")\] video codecs, but this is not a conformance requirement — a reading system may support any video codec, or none at all. Reading system developers should take into consideration factors such as breadth of adoption, playback quality, and technology royalties when deciding which video formats to support.

### 3.2 Foreign resources

[](#sec-epub-rs-conf-foreign-res)

Reading systems *MAY* support an arbitrary set of [foreign resource](https://www.w3.org/TR/epub-33/#dfn-foreign-resource) types, and if a foreign resource is not supported, *MUST* process fallbacks as defined in [foreign resources](https://www.w3.org/TR/epub-33/#sec-foreign-resources) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

### 3.3 Resource locations

[](#sec-epub-rs-conf-remote-res)

Reading systems *SHOULD* support [remote resources](https://www.w3.org/TR/epub-33/#dfn-remote-resource), as defined in [Resource locations](https://www.w3.org/TR/epub-33/#sec-resource-locations) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

To limit the risk of network attacks, reading systems *SHOULD* only load remote resources referenced via the `https` URI scheme \[[rfc9110](#bib-rfc9110 "HTTP Semantics")\].

### 3.4 Data URLs

[](#sec-epub-rs-conf-data-urls)

Reading systems *MUST* prevent data URLs \[[rfc2397](#bib-rfc2397 "The "data" URL scheme")\] from opening in [top-level browsing contexts](https://html.spec.whatwg.org/multipage/document-sequences.html#top-level-browsing-context) \[[html](#bib-html "HTML Standard")\], except when initiated through a reading system affordance such as a context menu. If a reading system does not use a top-level browsing context for [top-level content documents](https://www.w3.org/TR/epub-33/#dfn-top-level-content-document), for example if the top-level content document is an SVG, it *MUST* also prevent data URLs from opening as though they are top-level content documents.

### 3.5 File URLs

[](#sec-epub-rs-conf-file-urls)

Reading Systems *MUST* prevent access to resources referenced via file URLs \[[rfc8089](#bib-rfc8089 "The "file" URI Scheme")\].

### 3.6 XML processing

[](#sec-epub-rs-conf-xml)

A [reading system](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* use a non-validating XML processor \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] that:

- does not read external DTD subsets \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\];
- conforms to \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\].

### 3.7 Internationalization

[](#sec-epub-rs-i18n)

As part of processing [publication resources](https://www.w3.org/TR/epub-33/#dfn-publication-resource), a reading system is required to process the attributes to set the language and the base directions in [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document) or [SVG content documents](https://www.w3.org/TR/epub-33/#dfn-svg-content-document), as well as the [`xml:lang` attribute](https://www.w3.org/TR/xml/#sec-lang-tag) for all XML documents (e.g., the [package document](https://www.w3.org/TR/epub-33/#dfn-package-document) and [media overlay documents](https://www.w3.org/TR/epub-33/#dfn-media-overlay-document)).

Furthermore, a reading system *MUST* also process the [`dir`](https://www.w3.org/TR/epub-33/#attrdef-dir) attribute \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for the [package document](https://www.w3.org/TR/epub-33/#dfn-package-document), where the base direction specified by `dir` applies to the element where it is specified, and to all elements in its content unless overridden with another instance of `dir`. (See also [5.1 Base direction](#sec-pkg-doc-base-dir) for further details.)

In the absence of this information in a [publication resource](https://www.w3.org/TR/epub-33/#dfn-publication-resource), reading systems *MUST NOT* assume either the language or the base direction of that resource from information expressed in the package document (i.e., in [`xml:lang`](https://www.w3.org/TR/epub-33/#attrdef-xml-lang) and [`dir`](https://www.w3.org/TR/epub-33/#attrdef-dir) attributes, in [`hreflang` attributes](https://www.w3.org/TR/epub-33/#attrdef-hreflang) on [`link`](https://www.w3.org/TR/epub-33/#dfn-link) elements, or from [`dc:language`](https://www.w3.org/TR/epub-33/#dfn-dc-language) elements \[[epub-33](#bib-epub-33 "EPUB 3.3")\]). Refer to a resource's formal specification for more information about to handle the absence of explicit language or direction information.

### 3.8 Network access

[](#sec-epub-rs-network-access)

Reading systems *MAY* support network access to [retrieve remote resources](#sec-epub-rs-conf-remote-res) and to allow [scripted content documents](https://www.w3.org/TR/epub-33/#dfn-scripted-content-document) to [communicate with web-hosted APIs and retrieve resources](#confreq-rs-scripted-limit).

Providing network access, however, increases both the security risks to the reading systems and the security and privacy risks to users. These risks are often unique to reading systems and the platforms they run on — the browser cores that most reading systems are built on do not offer the same security and privacy controls as web browsers themselves. Consequently, developers need to use extra caution when allowing network access, and more thoroughly test that their reading systems are not vulnerable to attacks. More information about these risks is provided in [15. Security and privacy](#sec-security-privacy).

If reading system developers allow network access, it is *RECOMMENDED* both that they:

- notify users when network activity occurs; and
- let users block access to the network (e.g., disable network access for the reading system globally or for a particular EPUB publication).

### 3.9 External links

[](#sec-epub-rs-external-links)

When a link has an `http` or `https` [scheme](https://url.spec.whatwg.org/#concept-url-scheme) \[[url](#bib-url "URL Standard")\], reading systems:

- *SHOULD* obtain the user's consent before opening the link.
- *SHOULD* open the link in a new browser instance to ensure that the browser's security and privacy controls are available to users.

For links that have schemes that require a helper application to load, reading systems *SHOULD* obtain the user's consent and follow platform guidance for opening the helper application.

Note

External links are not only found in [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document). A reading system might provide access to external [linked records](https://www.w3.org/TR/epub-33/#sec-link-elem) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in the [package document](https://www.w3.org/TR/epub-33/#dfn-package-document) metadata, for example.

Note

For more information about security and privacy issues with external links, see [15.2 Threat model](#epub-threat-model).

## 4. Open Container Format (OCF) processing

[](#sec-ocf)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* process the [EPUB container](https://www.w3.org/TR/epub-33/#sec-ocf) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

Note

An application that processes EPUB containers does not have to be a full-fledged reading system (e.g., an application might only extract the content of a container or check the validity of the packaged content). In these cases, developers of such applications can ignore the rendering requirements for reading systems defined in this section.

### 4.1 OCF abstract container

[](#sec-container-abstract)

#### 4.1.1 URL of the root directory

[](#sec-container-iri)

Reading systems *MUST* assign a URL \[[url](#bib-url "URL Standard")\] to the [root directory](https://www.w3.org/TR/epub-33/#dfn-root-directory) of the [OCF abstract container](https://www.w3.org/TR/epub-33/#dfn-ocf-abstract-container). This URL is called the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url). It is implementation specific, but the implementation *MUST* have the following properties:

- The result of [parsing](https://url.spec.whatwg.org/#concept-url-parser) \[[url](#bib-url "URL Standard")\] "`/`" with the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url) as [`base`](https://url.spec.whatwg.org/#concept-base-url) is the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url).
- The result of [parsing](https://url.spec.whatwg.org/#concept-url-parser) \[[url](#bib-url "URL Standard")\] "`..`" with the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url) as [`base`](https://url.spec.whatwg.org/#concept-base-url) is the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url).
- The [origin](https://url.spec.whatwg.org/#origin) \[[url](#bib-url "URL Standard")\] of the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url) is unique for each user-specific instance of an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) in a reading system.

Note

The unicity of the [origin](https://html.spec.whatwg.org/multipage/#origin) \[[html](#bib-html "HTML Standard")\] per each user-specific instance of an EPUB publication in a reading system means that if two different users acquire a copy of the same EPUB publication, the origins will be different for the two users on those copies even if the same reading system is used.

Note

The properties of the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url) are such that a conforming reading system will parse any relative URL string to a [content URL](https://www.w3.org/TR/epub-33/#dfn-content-url). In other words, relative links do not "leak" outside the container content, which is an important feature for security.

In practice, the container root URL behaves similarly to a URL defined as follows:

| URL component | Values                                                |
|---------------|-------------------------------------------------------|
| scheme        | `http` or `https`                                     |
| host          | `localhost`                                           |
| port          | a dynamic port uniquely assigned to the EPUB instance |

for example:

| Container File | File Path | URL |
|----|----|----|
| Root directory | `empty string` | `http://localhost:49152/` |
| Package document | `EPUB/package.opf` | `http://localhost:49152/EPUB/package.opf` |
| EPUB content document | `HTML/file name.xhtml` | `http://localhost:49152/HTML/file%20name.xhtml` |

[TABLE]

Note that the last two links are [disallowed](https://www.w3.org/TR/epub-33/#urls-in-ocf-constraints) in an EPUB publications to ensure better interoperability with non-conforming or legacy reading systems and toolchains.

Note

Some language specifications reference [Requests For Comments](https://www.ietf.org/standards/rfcs/) that preceded \[[url](#bib-url "URL Standard")\], in which case the earlier RFC applies for content in that particular language.

Note

Unlike most language specifications, reading systems must use the [container root URL](https://www.w3.org/TR/epub-33/#dfn-container-root-url) as the [base URL](https://url.spec.whatwg.org/#concept-base-url) \[[url](#bib-url "URL Standard")\] for all files within the `META-INF` directory. See also the section on [Parsing URLs in the `META-INF` directory](https://www.w3.org/TR/epub-33/#sec-parsing-urls-metainf) in \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

#### 4.1.2 File names

[](#sec-container-filenames)

Although [EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator) are required to follow various [file name and file path restrictions](https://www.w3.org/TR/epub-33/#sec-container-filenames) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for maximum interoperability, reading systems *SHOULD* attempt to process file names and paths that do not adhere to these requirements. Invalid file names and paths may only be problematic on some operating systems.

This specification does not specify how a reading system that is unable to represent OCF file names and paths would handle this incompatibility.

#### 4.1.3 `META-INF` directory

[](#sec-container-metainf)

Container file (`container.xml`)  
A reading system *MUST*, by default, use the [package document](https://www.w3.org/TR/epub-33/#dfn-package-document) referenced the from first [`rootfile`](https://www.w3.org/TR/epub-33/#dfn-rootfile) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\] to render the [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication). If the reading system recognizes a means of selecting from the other available options, it *MAY* choose a more appropriate package document.

Metadata file (`metadata.xml`)  
Reading systems *SHOULD* ignore [`metadata.xml` files](https://www.w3.org/TR/epub-33/#sec-container-metainf-metadata.xml) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] with unrecognized root elements.

Manifest file (`manifest.xml`)  
Reading systems *MUST NOT* use ancillary manifest information contained in the ZIP archive or in the [`manifest.xml` file](https://www.w3.org/TR/epub-33/#sec-container-metainf-manifest.xml) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for processing an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication).

Signature file (`signatures.xml`)  
Before computing the digest used to validate the signature in the [`signatures.xml` file](https://www.w3.org/TR/epub-33/#sec-container-metainf-signatures.xml) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], reading systems *MUST* decrypt any data encrypted after signing — data encrypted before signing *MUST NOT* be decrypted.

Refer to Decryption Transform for XML Signature \[[xmlenc-decrypt](#bib-xmlenc-decrypt "Decryption Transform for XML Signature")\] for more information about identifying data encrypted after signing.

Other files  
Reading systems *MUST NOT* fail when encountering configuration files in the `META-INF` directory not listed in [Reserved files](https://www.w3.org/TR/epub-33/#sec-container-metainf-files) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

### 4.2 OCF ZIP container

[](#sec-container-zip)

A reading system:

- *MUST* treat any [OCF ZIP container](https://www.w3.org/TR/epub-33/#dfn-ocf-zip-container) that splits the content into segments \[[zip](#bib-zip ".ZIP File Format Specification")\] as in error.

- *MUST* treat any OCF ZIP container that uses compression techniques other than Deflate \[[rfc1951](#bib-rfc1951 "DEFLATE Compressed Data Format Specification version 1.3")\] as in error.

- *MUST* support the ZIP64 extensions defined as "Version 1" \[[zip](#bib-zip ".ZIP File Format Specification")\].

- *MUST* treat an OCF ZIP container that uses \[[zip](#bib-zip ".ZIP File Format Specification")\] encryption features as in error.

- *MAY* generate a physical directory for the [root directory](https://www.w3.org/TR/epub-33/#dfn-root-directory) of the [OCF abstract container](https://www.w3.org/TR/epub-33/#dfn-ocf-abstract-container) if it unzips the contents.

- does not have to preserve information from an OCF ZIP container through load and save operations outside the context of the OCF abstract container. In particular, a reading system does not have to preserve CRC values, comment fields or fields that hold file system information corresponding to a particular operating system (e.g., *External file attributes* and *Extra field*).

With respect to specific fields in the OCF ZIP container archive, the reading system:

- *MUST* treat `version needed to extract` field values other than `10`, `20` or `45` in the local file header table \[[zip](#bib-zip ".ZIP File Format Specification")\] as being in error.

- *MUST* treat `compression` method field values other than `0` or `8` in the local file header table \[[zip](#bib-zip ".ZIP File Format Specification")\] as being in error.

- *MUST* treat OCF ZIP containers with an `Archive decryption header` or an `Archive extra data record` \[[zip](#bib-zip ".ZIP File Format Specification")\] as being in error.

### 4.3 Font obfuscation

[](#sec-container-fobfus)

Reading systems *SHOULD* support deobfuscation of fonts as defined in [Font obfuscation](https://www.w3.org/TR/epub-33/#sec-font-obfuscation) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

To restore the original data, reading systems should simply reverse the process: the source file becomes the obfuscated data, and the destination file contains the raw data.

Note

EPUB 3 allowed font obfuscation prior to EPUB 3.0.1, but did not specify the order of obfuscation and compression. As a result, reading systems might encounter invalid fonts after decompression and deobfuscation. In such instances, deobfuscating the data before inflating it may return a valid font. Reading systems do not have to support this method of retrieval, but developers should consider it when supporting EPUB 3 content generally.

## 5. Package document processing

[](#sec-package-doc)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* process the [package document](https://www.w3.org/TR/epub-33/#sec-package-doc) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

### 5.1 Base direction

[](#sec-pkg-doc-base-dir)

If the [`dir` attribute](https://www.w3.org/TR/epub-33/#attrdef-dir) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is set and indicates a base direction of `ltr` or `rtl`, reading systems *MUST* override the bidi algorithm per [the higher-level protocols](https://www.unicode.org/reports/tr9/tr9-50.html#Higher-Level_Protocols) defined in \[[bidi](#bib-bidi "Unicode Bidirectional Algorithm")\], setting the paragraph embedding level to 0 if the base direction is `ltr`, or 1 if the base direction is `rtl`.

Otherwise the base direction is `auto`, in which case reading systems *MUST* determine the text's direction by applying the Unicode Bidi Algorithm, beginning with [Rule P2](https://www.unicode.org/reports/tr9/tr9-50.html#P2) of \[[bidi](#bib-bidi "Unicode Bidirectional Algorithm")\].

Note

Although [setting the directionality of package document metadata](https://www.w3.org/TR/epub-33/#attrdef-dir) is marked as [under-implemented](https://www.w3.org/TR/epub-33/#under-implemented) in \[[epub-33](#bib-epub-33 "EPUB 3.3")\], reading system with an international audience, or that claim support for international content, are strongly advised to implement this feature when exposing that metadata to users. Ignoring the directionality of text can cause readability issues.

The under-implemented label will be removed from \[[epub-33](#bib-epub-33 "EPUB 3.3")\] when the necessary baseline of support in reading systems has been achieved.

### 5.2 Unique identifier

[](#sec-pkg-doc-pub-identifiers)

Reading systems *SHOULD NOT* depend on the [unique identifier](https://www.w3.org/TR/epub-33/#dfn-unique-identifier) being unique to one and only one [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication). Determining whether two EPUB publications with the same unique identifier represent different versions of the same publication, or different publications, may require inspecting other metadata, such as their last modification dates, titles, and authors.

### 5.3 Metadata

[](#sec-pkg-doc-metadata)

Whitespace  
Reading systems *MUST* [strip and collapse ASCII whitespace](https://infra.spec.whatwg.org/#strip-and-collapse-ascii-whitespace) \[[infra](#bib-infra "Infra Standard")\] from Dublin Core \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] and [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) element [values](https://www.w3.org/TR/epub-33/#dfn-value) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] before processing.

The `dc:identifier` element  
To determine whether the value of a [`dc:identifier`](https://www.w3.org/TR/epub-33/#dfn-dc-identifier) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\] conforms to an established system or has been granted by an issuing authority, reading systems *SHOULD* check for an [`identifier-type` property](https://www.w3.org/TR/epub-33/#identifier-type) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

The `dc:title` element  
Reading systems *MUST* recognize the first [`dc:title`](https://www.w3.org/TR/epub-33/#dfn-dc-title) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in document order as the main title of the [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) and present it to users before other title elements.

This specification does not define how to process additional `dc:title` elements.

The `dc:language` element  
The language(s) of the EPUB publication specified in [`dc:language`](https://www.w3.org/TR/epub-33/#dfn-dc-language) elements are informational. Some uses of this information include:

- exposing it to the user through the reading system user interface
- using it to enhance functionality in a bookshelf (e.g., sorting by language)
- using it to optimize the reading interface (e.g., to preload text-to-speech languages)

See [3.7 Internationalization](#sec-epub-rs-i18n) for more details on how to determine the language of a [publication resource](https://www.w3.org/TR/epub-33/#dfn-publication-resource).

The `dc:creator` element  
When determining display priority, reading systems *MUST* use the document order of [`dc:creator`](https://www.w3.org/TR/epub-33/#dfn-dc-creator) elements \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in the `metadata` section, where the first `creator` element encountered is the primary creator. If a reading system exposes creator metadata to the user, it *SHOULD* include all the creators listed in the `metadata` section whenever possible (e.g., when not constrained by display considerations).

The `meta` element  
Reading systems *SHOULD* ignore all [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) elements whose [`property` attributes](https://www.w3.org/TR/epub-33/#attrdef-meta-property) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] define expressions they do not recognize. A reading system *MUST NOT* fail when encountering unknown expressions.

If a reading system does not recognize the [`scheme` attribute](https://www.w3.org/TR/epub-33/#attrdef-scheme) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] value, it *SHOULD* treat the value of the element as a string.

The `link` element  
Retrieval and support of [linked resources](https://www.w3.org/TR/epub-33/#dfn-linked-resource) is *OPTIONAL*.

The language identified in an [`hreflang`](https://www.w3.org/TR/epub-33/#attrdef-hreflang) \[[EPUB-33](#bib-epub-33 "EPUB 3.3")\] attribute is purely advisory. The language information expressed in the resource determines its language for processing and rendering purposes, as defined in the [internationalization requirements](#confreq-rs-pkg-lang-no-content).

### 5.4 Manifest

[](#sec-pkg-doc-manifest)

Reading systems *MUST* ignore values of the [`properties` attribute](https://www.w3.org/TR/epub-33/#sec-item-resource-properties) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] they do not recognize.

Reading systems *SHOULD NOT* use [linked resources](https://www.w3.org/TR/epub-33/#dfn-linked-resource) in the rendering of an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) due to the inherent limitations and risks involved (e.g., lack of information about the resource and how to process it, security risks from remotely-hosted sources, lack of fallbacks, etc.).

A reading system that does not support the MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] of a given [publication resource](https://www.w3.org/TR/epub-33/#dfn-publication-resource) *MUST* traverse the [manifest fallback chain](https://www.w3.org/TR/epub-33/#sec-manifest-fallbacks) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] until it identifies a supported publication resource to use in place of the unsupported resource. If the reading system supports multiple publication resources in the fallback chain, it *MAY* select the resource to use based on the resource's [`properties` attribute](https://www.w3.org/TR/epub-33/#attrdef-item-properties) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] values, otherwise it *SHOULD* honor the [EPUB creator's](https://www.w3.org/TR/epub-33/#dfn-epub-creator) preferred fallback order. If a reading system does not support any resource in the fallback chain, it *MUST* alert the user that it could not display the content.

When [manifest fallbacks](https://www.w3.org/TR/epub-33/#sec-manifest-fallbacks) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] are provided for [top-level content documents](https://www.w3.org/TR/epub-33/#dfn-top-level-content-document), reading systems *MAY* choose from the available options to find the optimal version to render in a given context (e.g., by inspecting the properties attribute for each).

A reading system *MUST* terminate the fallback chain at the first reference to a manifest item it has already encountered.

### 5.5 Spine

[](#sec-pkg-doc-spine)

Reading systems *MUST* provide a means of rendering an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) in the order defined in the [`spine`](https://www.w3.org/TR/epub-33/#dfn-spine) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\], which includes:

- recognizing the first [primary (linear) `itemref`](https://www.w3.org/TR/epub-33/#attrdef-itemref-linear) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] as the beginning of the default reading order; and,
- rendering successive primary items in the order given in the `spine`.

When a user traverses the default reading order defined in the `spine` element, a reading system *MAY* automatically skip [non-linear `itemref` elements](https://www.w3.org/TR/epub-33/#attrdef-itemref-linear) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. When a user activates a hyperlink to a non-linear resource, however, reading systems *MUST* render the referenced resource or a designated fallback. Reading systems *MAY* also provide the option for users to skip non-linear content by default or not.

If the [EPUB creator](https://www.w3.org/TR/epub-33/#dfn-epub-creator) has not specified the [`page-progression-direction` attribute](https://www.w3.org/TR/epub-33/#attrdef-spine-page-progression-direction) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], the reading system *MUST* assume the value of `default`. When `page-progression-direction` value is `default`, the reading system can choose the rendering direction.

If the `page-progression-direction` attribute has a value other than `default`, the reading system *MUST* ignore any directionality computed from [`pre-paginated`](#layout) [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document).

Reading systems *MUST* ignore all values expressed in spine `itemref` [`properties` attributes](https://www.w3.org/TR/epub-33/#attrdef-properties) \[[EPUB-33](#bib-epub-33 "EPUB 3.3")\] that they do not recognize.

Reading systems *MUST NOT* skip spine references to duplicate [manifest items](https://www.w3.org/TR/epub-33/#sec-item-elem) \[[EPUB-33](#bib-epub-33 "EPUB 3.3")\] when rendering the linear reading order. The reading system *MUST* treat these as distinct items for user interface (UI) purposes (for example, each occurrence could be independently bookmarked or annotated). When a reading system follows a hyperlink to a resource referenced multiple times in the spine, the reading system *MUST* navigate to the first occurrence of the document in the linear reading order.

#### 5.5.1 Spine overrides

[](#spine-overrides)

When a [spine](https://www.w3.org/TR/epub-33/#dfn-spine) [`itemref`](https://www.w3.org/TR/epub-33/#dfn-itemref) element's [`properties` attribute](https://www.w3.org/TR/epub-33/#attrdef-properties) overrides a [global rendering property](https://www.w3.org/TR/epub-33/#app-rendering-vocab) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], reading systems *MUST* follow the requirements for the override's global value to display that spine item.

For example, a spine item that contains the [`layout-pre-paginated` override](https://www.w3.org/TR/epub-33/#layout-overrides) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is rendered following the requirements of the global [`pre-paginated` value](#def-layout-pre-paginated).

If more than one override for the same property is specified in a `properties` attribute, reading systems *MUST* use only the first value.

### 5.6 Collections

[](#sec-pkg-doc-collections)

In the context of this specification, support for [collections](https://www.w3.org/TR/epub-33/#sec-collection-elem) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in reading systems is *OPTIONAL*. Reading systems *MUST* ignore `collection` elements that define unrecognized roles.

### 5.7 Legacy features

[](#sec-pkg-doc-legacy)

Reading systems *MUST NOT* support [legacy features](https://www.w3.org/TR/epub-33/#sec-pkg-legacy) in content that conforms to [this version of EPUB](https://www.w3.org/TR/epub-33/#attrdef-package-version) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

## 6. EPUB content document processing

[](#sec-contentdocs)

The definition of [EPUB content documents](https://www.w3.org/TR/epub-33/#sec-contentdocs) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] includes various authoring restrictions to optimize the cross-compatibility of content (e.g., [prohibiting CSS for setting language and direction](https://www.w3.org/TR/epub-33/#sec-css-req) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]). Unless stated otherwise in this specification, reading systems *MAY* support these restricted features.

### 6.1 XHTML content documents

[](#sec-xhtml)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* process [XHTML content documents](https://www.w3.org/TR/epub-33/#sec-xhtml) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

Unless explicitly defined in this section as overridden, reading systems *MUST* process XHTML content documents using semantics defined by the \[[html](#bib-html "HTML Standard")\] specification and honor any applicable user agent conformance constraints expressed therein.

#### 6.1.1 HTML extensions

[](#sec-xhtml-extensions)

##### 6.1.1.1 RDFa

[](#sec-xhtml-rdfa)

Reading system support for the [attribute processing model](https://www.w3.org/TR/rdfa-core/#s_model) \[[rdfa-core](#bib-rdfa-core "RDFa Core 1.1 - Third Edition")\] is *OPTIONAL*.

##### 6.1.1.2 Content switching (deprecated)

[](#sec-xhtml-content-switch)

Use of the `switch` element is [deprecated](https://www.w3.org/TR/epub-33/#deprecated) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. Refer to its definition in \[[epubcontentdocs-301](#bib-epubcontentdocs-301 "EPUB Content Documents 3.0.1")\] for implementation information.

##### 6.1.1.3 The `epub:trigger` element (deprecated)

[](#sec-xhtml-epub-trigger)

Use of the `trigger` element is [deprecated](https://www.w3.org/TR/epub-33/#deprecated) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. Refer to its definition in \[[epubcontentdocs-301](#bib-epubcontentdocs-301 "EPUB Content Documents 3.0.1")\] for implementation information.

##### 6.1.1.4 Custom attributes

[](#sec-xhtml-custom-attributes)

Reading systems *MAY* support custom attributes provided the attributes do not modify the requirements of this specification.

#### 6.1.2 HTML deviations and constraints

[](#sec-xhtml-deviations)

##### 6.1.2.1 Microdata

[](#sec-xhtml-microdata)

Reading system support for the [attribute processing model](https://html.spec.whatwg.org/multipage/#encoding-microdata) is *OPTIONAL*, as is the [conversion to JSON](https://html.spec.whatwg.org/multipage/#json) \[[html](#bib-html "HTML Standard")\].

##### 6.1.2.2 MathML

[](#sec-xhtml-mathml)

To support MathML \[[mathml3](#bib-mathml3 "Mathematical Markup Language (MathML) Version 3.0 2nd Edition")\] embedded in [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document), a reading system:

- *MUST* be an [input-compliant processor](https://www.w3.org/TR/MathML3/chapter2.html#fund.mathmlconf) for [Presentation MathML](https://www.w3.org/TR/MathML3/chapter3.html#), as defined in the \[[mathml3](#bib-mathml3 "Mathematical Markup Language (MathML) Version 3.0 2nd Edition")\] specification.

- *MUST*, if it has a [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport), support visual rendering of Presentation MathML.

- *MAY* support rendering of [Content MathML](https://www.w3.org/TR/MathML3/chapter4.html#) found in [`annotation-xml` elements](https://www.w3.org/TR/MathML3/chapter5.html#mixing.elements.annotation.xml) \[[mathml3](#bib-mathml3 "Mathematical Markup Language (MathML) Version 3.0 2nd Edition")\].

Note

Reading systems may choose to use third-party libraries such as [MathJax](https://www.mathjax.org/) to provide MathML rendering.

##### 6.1.2.3 Embedded SVG

[](#sec-xhtml-svg)

Reading systems *MUST* process SVG embedded in [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document) as defined in [6.2 SVG content documents](#sec-svg).

###### 6.1.2.3.1 Embedded SVG and CSS

[](#sec-xhtml-svg-css)

For the purposes of styling SVG embedded in [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document) *by reference*, reading systems *MUST NOT* apply CSS style rules of the containing document to the referenced SVG document.

For the purposes of styling SVG embedded in XHTML content documents *by inclusion*, reading systems *MUST* apply applicable CSS rules of the containing document to the included SVG elements.

Note

SVG included *by reference* is processed as a separate document, and can include its own CSS style rules just like an [SVG content document](https://www.w3.org/TR/epub-33/#dfn-svg-content-document) would. Note that this is consistent with situations where an \[[html](#bib-html "HTML Standard")\] [`object` element](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element) references an external \[[html](#bib-html "HTML Standard")\] element.

##### 6.1.2.4 Form submission

[](#sec-xhtml-forms)

Reading system support for the submission of \[[html](#bib-html "HTML Standard")\] [`form`](https://html.spec.whatwg.org/multipage/forms.html#the-form-element) elements is *OPTIONAL*. A reading system might, for example, prevent form submissions by limiting access to networking.

### 6.2 SVG content documents

[](#sec-svg)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* process [SVG content documents](https://www.w3.org/TR/epub-33/#sec-svg) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

To process SVG content documents and [SVG embedded in XHTML content documents](#sec-xhtml-svg), a reading system:

- *MUST* process SVG content documents using semantics defined by the \[[svg](#bib-svg "SVG")\] specification, and honor any applicable user agent conformance constraints expressed therein, unless explicitly defined by this specification as overridden.

- *MUST* meet the conformance criteria defined in [6.4 Scripting](#sec-scripted-content).

- *MUST*, if it has a [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport), support the visual rendering of SVG using CSS as defined in [Styling](https://www.w3.org/TR/SVG/styling.html#) \[[svg](#bib-svg "SVG")\] and it *SHOULD* support all properties defined in the [Property Index](https://www.w3.org/TR/SVG/propidx.html#) \[[svg](#bib-svg "SVG")\]. In the case of embedded SVG, a reading system *MUST* also conform to the constraints defined in [6.1.2.3.1 Embedded SVG and CSS](#sec-xhtml-svg-css).

### 6.3 Cascading Style Sheets (CSS)

[](#sec-css)

If a reading system has a [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport), it *MUST* support the [visual rendering of XHTML content documents via CSS](https://www.w3.org/TR/epub-33/#sec-css) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

To support CSS, a reading system:

- *MUST* support the official definition of CSS as described in the \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\].

- *SHOULD* support all applicable modules in \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\] that have reached at least [Candidate Recommendation](https://www.w3.org/policies/process/#RecsCR) status \[[w3cprocess](#bib-w3cprocess "W3C Process Document")\] (and are widely implemented).

- *MUST* support \[[truetype](#bib-truetype "TrueType™ Reference Manual")\], \[[opentype](#bib-opentype "OpenType specification")\], \[[woff](#bib-woff "WOFF File Format 1.0")\], and \[[woff2](#bib-woff2 "WOFF File Format 2.0")\] font resources referenced from [`@font-face` rules](https://www.w3.org/TR/css-fonts-4/#font-face-rule) \[[css-fonts-4](#bib-css-fonts-4 "CSS Fonts Module Level 4")\].

- *SHOULD* support all prefixed properties defined in [CSS Style Sheets — Prefixed properties](https://www.w3.org/TR/epub-33/#sec-css-prefixed) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

- *SHOULD* apply [EPUB creator](https://www.w3.org/TR/epub-33/#dfn-epub-creator) style sheets as written to [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document).

- *SHOULD NOT* override the EPUB creator's style sheets, but *SHOULD* do so in a way that preserves the Cascade when necessary: through a user agent style sheet, or \[[html](#bib-html "HTML Standard")\] [`style`](https://html.spec.whatwg.org/multipage/dom.html#attr-style) attributes.

- It *MAY* override parts of the EPUB creator's style sheet because of user interaction.

In addition to supporting CSS properties as defined above, a reading system's user agent style sheet *SHOULD* support the \[[html](#bib-html "HTML Standard")\] [suggested default rendering](https://html.spec.whatwg.org/multipage/#rendering).

Reading system developers should implement CSS support at the level of major browsers and publicly document their user agent style sheets and how they interact with EPUB creator's style sheets.

### 6.4 Scripting

[](#sec-scripted-content)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *SHOULD* support [scripting](https://www.w3.org/TR/epub-33/#sec-scripted-content) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

Reading system support for scripting depends on its usage context:

- Reading systems *SHOULD* support [container-constrained scripting](https://www.w3.org/TR/epub-33/#sec-scripted-container-constrained) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in reflowable [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document).

- Reading systems *SHOULD* support [spine-level scripting](https://www.w3.org/TR/epub-33/#sec-scripted-spine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in [fixed-layout documents](https://www.w3.org/TR/epub-33/#sec-fixed-layouts) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

- Reading systems *SHOULD* support spine-level scripting in reflowable EPUB content documents that use the ["`scrolled-doc`"](https://www.w3.org/TR/epub-33/#flow-scrolled-doc) or ["`scrolled-continuous`"](https://www.w3.org/TR/epub-33/#flow-scrolled-continuous) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] presentation modes defined by [the `rendition:flow` property](#flow). Similarly, if it supports spine-level scripting in reflowable EPUB content documents, it *MUST* implement the "`scrolled-doc`" presentation mode and *SHOULD* implement the "`scrolled-continuous`" presentation mode.

- Reading systems *MAY* support scripting in other contexts, but this specification does not address such scripting. As a result, the use of scripting in these contexts may not be consistent across reading systems.

If a reading system supports scripting:

- It *MAY* render [scripted content documents](https://www.w3.org/TR/epub-33/#dfn-scripted-content-document) as an interactive, scripted user agent according to \[[html](#bib-html "HTML Standard")\].

- It *MUST* assign a unique [origin](https://html.spec.whatwg.org/multipage/#origin) \[[html](#bib-html "HTML Standard")\], shared by all [spine-level scripts](https://www.w3.org/TR/epub-33/#sec-scripted-spine) of the [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication). That [origin](https://html.spec.whatwg.org/multipage/#origin) \[[html](#bib-html "HTML Standard")\] *MUST* be *unique* for each user-specific instance of an EPUB publication in a reading system.

-  It *MUST NOT* allow a container-constrained script to modify the \[[dom](#bib-dom "DOM Standard")\] of the host EPUB content document or other contents in the EPUB publication and *MUST NOT* allow it to manipulate the size of its containing rectangle . (Note: Even if a script is not container-constrained, a reading system might impose restrictions on modifications. See the [dom-manipulation feature](#feature-dom-manipulation).)

- It *MAY* place additional limitations on the capabilities provided to scripts during execution (e.g., limiting networking).

- It *MUST* extend the [navigator object](https://html.spec.whatwg.org/multipage/#the-navigator-object) \[[html](#bib-html "HTML Standard")\] with the `epubReadingSystem` interface defined in [B. epubReadingSystem object](#app-epubReadingSystem). It also *MUST* support the `dom-manipulation` and `layout-change` features defined in [B.4.1.2 Features](#app-ers-hasFeature-features) in container-constrained scripting contexts.

If a reading system does not support scripting, it *MUST* process fallbacks for scripted content as defined in [Fallbacks for scripted content documents](https://www.w3.org/TR/epub-33/#confreq-cd-scripted-flbk) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

#### 6.4.1 Local storage

[](#sec-local-storage)

Reading systems *MAY* block scripts from saving persistent data through [cookies](https://html.spec.whatwg.org/multipage/#dom-document-cookie) and [web storage](https://html.spec.whatwg.org/multipage/#webstorage) \[[html](#bib-html "HTML Standard")\].

Reading systems that allow [local storage](https://html.spec.whatwg.org/multipage/#dom-localstorage) \[[html](#bib-html "HTML Standard")\] *SHOULD* provide methods for users to inspect or delete that data.

#### 6.4.2 Event model

[](#sec-scripted-content-events)

Reading systems *SHOULD* follow the DOM Event model as per \[[html](#bib-html "HTML Standard")\] and pass UI events to the scripting environment before performing any default action associated with these events.

Reading system developers must ensure that scripts cannot disable critical functionality (such as navigation) to constrain the extent to which a [potentially malicious](#sec-scripted-content-security) script could impact their reading systems. As a result, although the scripting environment should be able to cancel the default action of any event, some events either might not be passed through or might not be cancelable.

#### 6.4.3 Security considerations

[](#sec-scripted-content-security)

*This section is non-normative.*

Reading system developers who also support scripting must be aware of the security issues that arise when reading systems execute scripted content. As the underlying scripting model employed by reading systems and browsers is the same, developers must take into consideration the same kinds of issues encountered in web contexts.

Each reading system must establish if it can trust the scripts in a particular document. Reading systems should treat all scripts as untrusted (and potentially malicious), and developers should examine all vectors of attack and protect against them. In particular, developers should consider the following:

- an attack against the runtime environment (e.g., stealing files from a user's hard drive);

- an attack against the reading system itself (e.g., stealing a list of a user's books or causing unexpected behavior);

- an attack of one [EPUB content document](https://www.w3.org/TR/epub-33/#dfn-epub-content-document) against another (e.g., stealing data that originated in a different document);

- an attack of an unencrypted script against an encrypted portion of a document (e.g., an injected malicious script extracting protected content);

- an attack against the local network (e.g., stealing data from a server behind a firewall).

To limit the possible damage of untrusted scripts, this specification recommends that reading systems establish a unique [origin](https://html.spec.whatwg.org/multipage/#origin) \[[html](#bib-html "HTML Standard")\] allocated to each [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) (see [4.1.1 URL of the root directory](#sec-container-iri)). Assigning a unique origin ensures that [spine-level scripts](https://www.w3.org/TR/epub-33/#sec-scripted-spine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] are isolated from other EPUB publications, and limits access to [cookies](https://html.spec.whatwg.org/multipage/#dom-document-cookie) \[[html](#bib-html "HTML Standard")\], [web storage](https://html.spec.whatwg.org/multipage/#webstorage) \[[html](#bib-html "HTML Standard")\], etc.

Examples of web APIs that are tied to the concept of "origin" include web storage \[[html](#bib-html "HTML Standard")\] and IndexedDB \[[indexeddb](#bib-indexeddb "Indexed Database API")\], which EPUB content documents can interact with via scripting. Reading systems that allow users to add/remove publications from a managed library (their "bookshelf") may maintain the publication's unique origin when the publication is removed and subsequently re-imported into the content library. Conversely, reading systems may create a new unique origin for every newly added publication.

This specification also recommends that [container-constrained scripts](https://www.w3.org/TR/epub-33/#sec-scripted-container-constrained) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] not be allowed to modify the DOM of the host EPUB content document and/or manipulate the containing rectangle (see [6.4 Scripting](#sec-scripted-content)).

Note that compliance with these recommendations does not guarantee protection from the possible attacks listed above; developers must examine each potential vulnerability within the context of their reading system.

## 7. Navigation document processing

[](#sec-nav)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* process [EPUB navigation documents](https://www.w3.org/TR/epub-33/#sec-nav) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

To process the EPUB navigation document, a reading system:

- *MUST* provide users access to the [links and headings](https://www.w3.org/TR/epub-33/#confreq-nav-a) in the [`toc nav` element](https://www.w3.org/TR/epub-33/#sec-nav-toc) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

- *SHOULD*, when generating non-HTML based navigation widgets, replace unsupported non-text elements in headings and labels with their [alternative text](https://www.w3.org/TR/epub-33/#confreq-nav-a-cnt) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. If both `alt` and `title` attributes are present on an element, preference *SHOULD* be given to the `alt` attribute. If neither attribute is present, reading systems *MAY* provide their own text or ignore the element.

- *SHOULD* provide a method to navigate to the listed page breaks when a [`page-list nav` element](https://www.w3.org/TR/epub-33/#sec-nav-pagelist) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is present.

- *MAY* provide users access to the links in the [`landmarks nav` element](https://www.w3.org/TR/epub-33/#sec-nav-landmarks) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] and *MAY* use the links to enable functionality in the application.

- *MAY* provide access to `nav` elements that do not specify an [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) attribute or that [declare an unknown value](https://www.w3.org/TR/epub-33/#sec-nav-def-types-other) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

- *MUST* relocate the current reading position to the destination identified by an activated link when the link is to a [publication resource](https://www.w3.org/TR/epub-33/#dfn-publication-resource).

- *MUST NOT* show list item numbering on `nav` elements when presenting them outside of the spine, regardless of support for CSS, as the default display style of list items is equivalent to the [`list-style: none` property](https://www.w3.org/TR/CSS2/generate.html#propdef-list-style) \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\].).

Reading systems *MUST* honor the above requirements irrespective of whether the EPUB navigation document is part of the [spine](https://www.w3.org/TR/epub-33/#dfn-epub-spine).

## 8. Layout rendering control processing

[](#sec-rendering-control)

### 8.1 Fixed-layout documents

[](#sec-fixed-layouts)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* support the rendering of [fixed-layout documents](https://www.w3.org/TR/epub-33/#sec-fixed-layouts) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

#### 8.1.1 Fixed-layout properties

[](#sec-fxl-props)

##### 8.1.1.1 The `rendition:layout` property

[](#layout)

The default value `reflowable` *MUST* be assumed by EPUB reading systems as the global value if no [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) element carrying the [`rendition:layout` property](https://www.w3.org/TR/epub-33/#layout) occurs in the [package document metadata](https://www.w3.org/TR/epub-33/#elemdef-opf-metadata) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

When the `rendition:layout` property is set to `pre-paginated`, reading systems *MUST NOT* include space between the adjacent content slots when rendering [synthetic spreads](https://www.w3.org/TR/epub-33/#dfn-synthetic-spread).

The `rendition:layout` property values have the following processing requirements:

reflowable  
Reading systems *MAY* apply dynamic pagination when rendering.

pre-paginated  
Reading systems *MUST* produce exactly one page per spine [`itemref`](https://www.w3.org/TR/epub-33/#dfn-itemref) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] when rendering.

##### 8.1.1.2 The `rendition:orientation` property

[](#orientation)

The default value `auto` *MUST* be assumed by EPUB reading systems as the global value if no [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) element carrying the [`rendition:orientation` property](https://www.w3.org/TR/epub-33/#orientation) occurs in the [package document metadata](https://www.w3.org/TR/epub-33/#elemdef-opf-metadata) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

The `rendition:orientation` property values have the following processing requirements:

auto  
The reading system determines the orientation in which to render [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document).

landscape  
Reading systems that support multiple orientations *SHOULD* render EPUB content documents in landscape orientation.

portrait  
Reading systems that support multiple orientations *SHOULD* render EPUB content documents in portrait orientation.

The means by which they convey the intent is implementation specific.

##### 8.1.1.3 The `rendition:spread` property

[](#spread)

Reading Systems MUSt assume the default value `auto` as the global value if no [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) element carrying the [`rendition:spread`](https://www.w3.org/TR/epub-33/#spread) property occurs in the [package document metadata](https://www.w3.org/TR/epub-33/#elemdef-opf-metadata) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

The `rendition:spread` property values have the following processing requirements:

none  
Reading systems *MUST NOT* incorporate spine items in a [synthetic spread](https://www.w3.org/TR/epub-33/#dfn-synthetic-spread). Reading systems *SHOULD* create a single [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport) positioned at the center of the screen.

landscape  
Reading systems *SHOULD* render a synthetic spread for spine items only when the device is in landscape orientation.

portrait (deprecated)  
Reading systems *SHOULD* treat the value "`portrait`" as a synonym of "`both`" and create spreads regardless of orientation.

both  
Reading systems *SHOULD* render a synthetic spread regardless of device orientation.

auto  
Reading systems *MAY* use synthetic spreads in specific or all device orientations as part of a [content display area](#dfn-content-display-area) utilization optimization process.

##### 8.1.1.4 The `rendition:page-spread-*` properties

[](#page-spread)

The [`rendition:page-spread-left` property](https://www.w3.org/TR/epub-33/#fxl-page-spread-left) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] indicates that the given spine item *SHOULD* be rendered in the left-hand slot of a spread. The [`rendition:page-spread-right` property](https://www.w3.org/TR/epub-33/#fxl-page-spread-right) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] indicates that the given spine item *SHOULD* be rendered in the right-hand slot of a spread.

The `rendition:page-spread-left` and `rendition:page-spread-right` properties apply to both pre-paginated and reflowable content, and they only apply when the reading system is creating [synthetic spreads](https://www.w3.org/TR/epub-33/#dfn-synthetic-spread).

The `rendition:page-spread-*` properties *MUST* take precedence over whatever value of the [`page-break-before` property](https://www.w3.org/TR/CSS2/page.html#propdef-page-break-before) \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\] has been set for an [XHTML content document](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document).

When a [reflowable](#def-layout-reflowable) spine item follows a [pre-paginated](#def-layout-pre-paginated) one, the reflowable one *SHOULD* start on the next page — as defined by the [`page-progression-direction` attribute](https://www.w3.org/TR/epub-33/#attrdef-spine-page-progression-direction) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] — when it lacks a `rendition:page-spread-*` property value.

Reading systems *MUST* honor `rendition:page-spread-*` properties on both reflowable and pre-paginated spine items (e.g., by inserting a blank page).

When a pre-paginated spine item follows a reflowable one, the pre-paginated one *SHOULD* start on the next page (as defined by the `page-progression-direction` attribute) when it lacks a `rendition:page-spread-*` property value.

When a reading system encounters two spine items that represent a true spread (i.e., two adjacent spine items with the `rendition:page-spread-left` and `rendition:page-spread-right` properties), it *SHOULD* create the spread with no space between the adjacent pages.

#### 8.1.2 Initial containing block dimensions

[](#sec-fxl-dimensions)

XHTML  
Reading systems *MUST* create the initial containing block (ICB) using the width and height expressions declared in the `viewport meta` tag for [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document), as defined in [Expressing in HTML](https://www.w3.org/TR/epub-33/#sec-fxl-icb-html) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. They *MUST* clip content positioned outside of the ICB.

If the width or height values in the `viewport meta` tag contain a non-numeric character but start with a number (e.g., the value includes a unit of length declaration such as "500px"), the number prefix *SHOULD* be used as the pixel value, otherwise the value *MUST* be treated as invalid.

Reading systems *SHOULD* attempt to extract `width` and `height` values from a `viewport meta` tag even if its syntax is invalid.

Reading systems *MUST* use the first declaration of a `width` and `height` property in a `viewport meta` tag (i.e., ignore repeated declarations).

If the `viewport meta` does not contain a width or a height value, or if these values are invalid, reading systems *MAY* supply the values. For example, a reading system may:

- consider these as having the values `device-width` and `device-height`, respectively; or
- look for the previous content document in the [spine](https://www.w3.org/TR/epub-33/#dfn-spine), if applicable, and use the ICB value defined there; or
- consider the content document as erroneous XHTML content altogether.

If an XHTML content document contains more than one `viewport meta` tags, reading systems *MUST* use the first in document order to obtain the height and width dimensions. Subsequent declarations *MUST* be ignored.

When the ICB aspect ratio does not match the aspect ratio of the reading system [content display area](#dfn-content-display-area), reading systems *MAY* position the ICB inside the area to accommodate the user interface; in other words, added letter-boxing space *MAY* appear on either side (or both) of the content.

SVG  
Reading systems *MUST* create the initial containing block (ICB) using the dimensions as defined in [Expressing the ICB in SVG](https://www.w3.org/TR/epub-33/#sec-fxl-icb-svg) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] to render [SVG content documents](https://www.w3.org/TR/epub-33/#dfn-svg-content-document).

Note

When the ICB aspect ratio does not match the aspect ratio of the reading system [content display area](#dfn-content-display-area), reading systems should follow the rules for the [`viewBox`](https://www.w3.org/TR/SVG/coords.html#ViewBoxAttribute) and the [`preserveAspectRatio`](https://www.w3.org/TR/SVG/coords.html#PreserveAspectRatioAttribute) attributes, as defined in \[[SVG](#bib-svg "SVG")\].

#### 8.1.3 Viewport rendering

[](#sec-fxl-viewport)

When rendering [fixed-layout documents](https://www.w3.org/TR/epub-33/#dfn-fixed-layout-document), the default intent is that the [content display area](#dfn-content-display-area) *SHOULD* occupy as much of the available [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport) area as possible. Reading systems *SHOULD NOT* inject additional content such as border, margins, headers, or footers into the viewport.

Note

This specification does not define how the [initial containing block](https://www.w3.org/TR/CSS2/visudet.html#containing-block-details) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] is placed within the reading system [content display area](#dfn-content-display-area).

Note

The exposure of reading system control widgets to the user is implementation-specific and not included in the above behavioral expectations.

### 8.2 Reflowable layouts

[](#sec-reflowable-layouts)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *SHOULD* process the [reflowable layout properties](https://www.w3.org/TR/epub-33/#sec-reflowable-layouts) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

#### 8.2.1 The `rendition:flow` property

[](#flow)

If a reading system supports the specified rendering, it *SHOULD* use that method to handle overflow content, but *MAY* provide the option for users to override the requested rendering.

The default global value is `auto` if no `meta` element carrying this property occurs in the [`metadata` section](https://www.w3.org/TR/epub-33/#elemdef-opf-metadata) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. Reading systems *MAY* support only this default value.

The `rendition:flow` property values have the following processing requirements:

paginated  
The reading system *SHOULD* dynamically paginate all overflow content.

scrolled-continuous  
The reading system *SHOULD* render all [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document) such that overflow content is scrollable, and *SHOULD* present the [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) as one continuous scroll from spine item to spine item (except where [locally overridden](https://www.w3.org/TR/epub-33/#flow-overrides) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]).

scrolled-doc  
The reading system *SHOULD* render all EPUB content documents such that users can scroll overflow content, and *SHOULD* present each spine item as a separate scrollable document.

auto  
The reading system *MAY* render overflow content using its default method or a user preference, whichever is applicable.

For the `rendition:flow-scrolled-continuous` property, the scroll direction *MUST* be defined relative to the block flow direction of the root element of the [XHTML content document](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document) referenced by the [`itemref`](https://www.w3.org/TR/epub-33/#dfn-itemref) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. The scroll direction *MUST* be vertical if the block flow direction is downward (top-to-bottom). It *MUST* be horizontal if the block flow direction of the root element is rightward (left-to-right) or leftward (right-to-left).

Reading systems *MUST* ignore the `rendition:flow` property and its overrides when processing [pre-paginated spine items](https://www.w3.org/TR/epub-33/#def-layout-pre-paginated) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

Note

Reading system developers may decide to disregard this restriction, and accept the `scrolled-continuous` value of `rendition:flow` as a switch to display each pre-paginated spine item on a long, vertical strip (making it is easier to read on a smartphone or computer). This type of presentation is often referred to as ["webtoons"](https://medium.com/mrcomics/what-is-webtoon-4926929b20d8). Some publishers already use this possibility. After some further experimentation and incubation, a future version of this specification may introduce this approach as a standard feature for fixed-layout documents. See also the (deferred) github [issue 2412](https://github.com/w3c/epub-specs/issues/2412).

#### 8.2.2 The `rendition:align-x-center` property

[](#align-x-center)

When the [`rendition:align-x-center` property](#align-x-center) is set on a spine item, reading systems *SHOULD* render the content centered horizontally within the [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport) or spread, as applicable. This property does not affect the rendering of the spine item, only the placement of the resulting content box.

For reflowable content, reading systems that support this property *MUST* center each virtual page.

This specification does not define a default rendering behavior when reading systems do not support this property or [EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator) do not specify it. Reading systems *MAY* render spine items by their own design.

### 8.3 The `viewport meta` tag

[](#sec-viewport-meta)

Except when obtaining the initial containing block dimensions for [fixed-layout documents](https://www.w3.org/TR/epub-33/#dfn-fixed-layout-document), reading systems *MUST* ignore rendering instructions in [`viewport meta` declarations](https://www.w3.org/TR/epub-33/#app-viewport-meta).

This restriction applies to both fixed-layout and reflowable documents.

### 8.4 Custom properties

[](#sec-custom-properties)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MAY* support custom properties provided they do not introduce expressions that conflict behaviorally with the properties defined in the [Package rendering vocabulary](https://www.w3.org/TR/epub-33/#app-rendering-vocab) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

## 9. Media overlays processing

[](#sec-media-overlays)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) with the capability to render prerecorded audio *SHOULD* support [media overlays](https://www.w3.org/TR/epub-33/#sec-media-overlays) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

If a reading system does not support media overlays, it *MUST* ignore both:

- the [`media-overlay` attribute](https://www.w3.org/TR/epub-33/#attrdef-item-media-overlay) on [manifest](https://www.w3.org/TR/epub-33/#dfn-epub-manifest) [`item`](https://www.w3.org/TR/epub-33/#dfn-item) elements \[[epub-33](#bib-epub-33 "EPUB 3.3")\]; and
- `item` elements where the `media-type` attribute value equals `application/smil+xml`.

### 9.1 Loading the media overlay

[](#sec-behaviors-loading)

When a reading system loads a [package document](https://www.w3.org/TR/epub-33/#dfn-package-document), it *MUST* refer to the [manifest](https://www.w3.org/TR/epub-33/#dfn-epub-manifest) [`item`](https://www.w3.org/TR/epub-33/#dfn-item) elements' \[[epub-33](#bib-epub-33 "EPUB 3.3")\] `media-overlay` attributes to discover the corresponding media overlays for [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document).

Reading systems *MUST* support playback for [XHTML content documents](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document), and *MAY* support [SVG content documents](https://www.w3.org/TR/epub-33/#dfn-svg-content-document).

Playback *MUST* start at the media overlay element which corresponds to the desired EPUB content document starting point. Note that the start of an EPUB content document could correspond to an element at the start or in the middle of a media overlay. When the media overlay document finishes playing, the reading system *SHOULD* load the next EPUB content document (as specified in the package document [spine](https://www.w3.org/TR/epub-33/#dfn-epub-spine)) and also load its corresponding media overlay document, provided that one is given.

### 9.2 Basic playback

[](#sec-behaviors-playback)

#### 9.2.1 Timing and synchronization

[](#sec-rsconf-timing-synch)

Reading systems *MUST* render immediate children of the [`body`](https://www.w3.org/TR/epub-33/#dfn-body) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in a sequence. A [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) element's \[[epub-33](#bib-epub-33 "EPUB 3.3")\] children *MUST* be rendered in sequence, and playback completes when the last child finishes playing. Reading system *MUST* render a [`par`](https://www.w3.org/TR/epub-33/#dfn-par) element's \[[epub-33](#bib-epub-33 "EPUB 3.3")\] children in parallel (with each starting at the same time), and playback completes when all the children finish playing. Reading system playback of the media overlay document completes when the `body` element's last child finishes playing.

#### 9.2.2 Rendering audio

[](#sec-rsconf-rendering-audio)

When presented with a media overlay [`audio`](https://www.w3.org/TR/epub-33/#dfn-audio) element \[[EPUB-33](#bib-epub-33 "EPUB 3.3")\], reading systems *MUST* play the audio resource referenced by the `src` attribute, starting at the clip offset time given by the [`clipBegin`](https://www.w3.org/TR/epub-33/#attrdef-smil-clipBegin) attribute and ending at the clip offset time given by the [`clipEnd`](https://www.w3.org/TR/epub-33/#attrdef-smil-clipEnd) attribute \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

In addition:

- If the [EPUB creator](https://www.w3.org/TR/epub-33/#dfn-epub-creator) has not specified a `clipBegin` attribute, reading systems *MUST* assume the value "`0`".

- If the EPUB creator has not specified a `clipEnd` attribute, reading systems *MUST* assume the value to be the full duration of the physical media.

- If the value of `clipEnd` exceeds the full duration of the physical media, reading systems *MUST* assume its value to be the full duration of the physical media.

User-controllable audio playback options *SHOULD* include timescale modification, in which the user can alter the playback rate without distorting the pitch. The suggested range is half-speed to double-speed.

#### 9.2.3 Rendering EPUB content document elements

[](#sec-rsconf-rendering-text)

When presented with a media overlay [`text`](https://www.w3.org/TR/epub-33/#dfn-text) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\] whose `src` attribute contains a [URL-fragment string](https://url.spec.whatwg.org/#url-fragment-string) referencing a specific part of an EPUB content document, reading systems *SHOULD* ensure the referenced portion is visible in the [viewport](https://www.w3.org/TR/epub-33/#dfn-viewport). In addition to \[[html](#bib-html "HTML Standard")\] element ID references and [SVG Fragment Identifiers](https://www.w3.org/TR/SVG/linking.html#SVGFragmentIdentifiers) \[[svg](#bib-svg "SVG")\], reading systems *MAY* support other fragment identifier schemes.

During media overlays playback, reading systems with a viewport *SHOULD* add the class names given by the metadata properties [`active-class`](https://www.w3.org/TR/epub-33/#active-class) and [`playback-active-class`](https://www.w3.org/TR/epub-33/#playback-active-class) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] to the appropriate elements, when specified, in the [EPUB content document](https://www.w3.org/TR/epub-33/#dfn-epub-content-document). Conversely, the class names *SHOULD* be removed when the playback state changes, as described in [Associating style information](https://www.w3.org/TR/epub-33/#sec-docs-assoc-style) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

The `active-class` and `playback-active-class` metadata properties are *OPTIONAL*, and if omitted, reading system behavior is implementation-specific.

Reading system behavior when a [fragment identifier](https://www.w3.org/TR/epub-33/#sec-media-overlays-fragids) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] does not reference an element is also implementation-specific.

### 9.3 Interacting with the EPUB content document

[](#sec-behaviors-interaction)

Note

Earlier versions of this specification included some information about embedded audio and video \[[epubmediaoverlays-32](#bib-epubmediaoverlays-32 "EPUB Media Overlays 3.2")\]. This feature has been deprecated.

#### 9.3.1 Navigation

[](#sec-rsconf-navigation)

Because the media overlay is closely linked to the [EPUB content document](https://www.w3.org/TR/epub-33/#dfn-epub-content-document), it is very easy for reading systems to locate a position in the EPUB content document based on the current position in the media overlay playback. If the user pauses synchronized playback and navigates to a different part of the [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication), synchronized playback *MUST* resume at that point. For example, if a specific page number in the EPUB content document is the desired location, then this same point is located in the media overlay and playback started there.

This same approach allows for synchronizing the media overlay playback with user selection of a navigation point in the [EPUB navigation document](https://www.w3.org/TR/epub-33/#dfn-epub-navigation-document). The reading system loads the media overlay for that file and finds the correct point for starting playback based on the ID of the navigation point target.

Note

[EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator) may associate a [media overlay document](https://www.w3.org/TR/epub-33/#dfn-media-overlay-document) directly with an [EPUB navigation document](https://www.w3.org/TR/epub-33/#dfn-epub-navigation-document) in order to provide synchronized playback of its contents, regardless of whether the [XHTML content document](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document) in which it resides is included in the [spine](https://www.w3.org/TR/epub-33/#dfn-epub-spine). See [EPUB navigation document](https://www.w3.org/TR/epub-33/#sec-mo-nav-doc) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for more information.

Note

EPUB creators may associate media overlay document elements with EPUB content document structures such as tables. Reading systems should ensure that media overlay playback remains synchronized with user navigation of table rows and cells. The reading system might also play the corresponding table header preceding the contents of the cell.

#### 9.3.2 Embedded audio and video (deprecated)

[](#sec-embedded-media)

Guidance for automatic playback of embedded audio and video is now [deprecated](https://www.w3.org/TR/epub-33/#deprecated).

Refer to its definition in \[[epubmediaoverlays-32](#bib-epubmediaoverlays-32 "EPUB Media Overlays 3.2")\] for more information.

#### 9.3.3 Text-to-speech

[](#sec-text-to-speech)

When a media overlay [`text`](https://www.w3.org/TR/epub-33/#dfn-text) element with no [`audio`](https://www.w3.org/TR/epub-33/#dfn-audio) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] sibling element references text within the target [EPUB content document](https://www.w3.org/TR/epub-33/#dfn-epub-content-document), reading systems capable of text-to-speech (TTS) playback *SHOULD* render the referenced text using TTS.

Reading systems *SHOULD* use the speech-related information provided in the target EPUB content document to play the audio stream as part of the media overlay rendering.

Note

See [EPUB 3 Text-to-Speech Support](https://www.w3.org/TR/epub-tts-10/#) \[[epub-tts-10](#bib-epub-tts-10 "EPUB 3 Text-to-Speech Enhancements 1.0")\] for more information about supporting TTS technologies in [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication).

The media overlay `text` element's lifespan corresponds to the rendering time of the associated speech synthesis. The implicit duration of the `text` element (and by inference, of the parent `par` element) is therefore determined by the execution of the Text-to-Speech engine, and cannot be known at authoring time (factors like speech rate, pauses and other prosody parameters influence the audio output). This also means that reading systems should treat the [`duration`](https://www.w3.org/TR/epub-33/#duration) property values set in the package document as approximative when making use of them.

### 9.4 Skippability and escapability

[](#sec-behaviors-skip-escape)

#### 9.4.1 Skippability

[](#sec-skippability)

Reading systems *SHOULD* use the semantic information provided by media overlay elements' [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) attribute to offer users the option of skipping content.

When skipping of content is enabled, reading systems *MUST* suppress playback of any `par` and `seq` elements whose `epub:type` attribute contains a semantic that matches a skippable structure.

#### 9.4.2 Escapability

[](#sec-escapability)

While playing media overlays, reading systems *SHOULD* offer users the option to leave ("escape") [escapable structures](https://www.w3.org/TR/epub-33/#sec-escapability) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], which are determined by the presence of an [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) attribute \[[epub-33](#bib-epub-33 "EPUB 3.3")\] with a value from the escapable structures list. If a user opts to escape from an escapable structure, then the reading system *MUST* continue playback with the next sequential element after the structure.

## 10. Processing structural semantics

[](#sec-structural-semantics)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MAY* support [structural semantics](https://www.w3.org/TR/epub-33/#app-structural-semantics) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] in [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document).

When processing the [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) attribute, a reading system:

- *MAY* [obtain an expanded URL](#dfn-obtain-an-expanded-url) for each value.

- *MUST* ignore the terms if used on an element whose usage is not allowed in the [definition of `epub:type`](https://www.w3.org/TR/epub-33/#sec-epub-type-attribute) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

- *MAY* associate behaviors with none, some, or all of the terms defined in the [default vocabulary](https://www.w3.org/TR/epub-33/#sec-epub-type-attribute) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

- *MAY* associate behaviors with terms from other vocabularies.

## 11. Processing `property` values

[](#sec-property-values)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MAY* support the [vocabulary association mechanisms](https://www.w3.org/TR/epub-33/#sec-vocab-assoc) for processing [`property` data type values](https://www.w3.org/TR/epub-33/#sec-property-datatype) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

This section defines an algorithm for obtaining an expanded URL from a `property` data type value. It applies only to [reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) that support the \[[epub-33](#bib-epub-33 "EPUB 3.3")\] vocabulary association mechanisms.

Reading systems that do not support the \[[epub-33](#bib-epub-33 "EPUB 3.3")\] vocabulary association mechanisms *MAY* process `property` values as plain [string](https://infra.spec.whatwg.org/#string) values \[[infra](#bib-infra "Infra Standard")\]. It is not required to support the expansion of these values to URLs to add reading system behaviors based on their presence.

The algorithm describes the process using the terminology and data types defined in \[[infra](#bib-infra "Infra Standard")\], and, if successful, results in a [string](https://infra.spec.whatwg.org/#string) value with the expanded URL being returned. A [null](https://infra.spec.whatwg.org/#nulls) value is returned for invalid properties.

This algorithm takes the following arguments:

- `value`: the `property` value to process.
- `attr`: the name of the attribute that contains `value`.
- `elem`: the name of the element that `attr` is attached to.
- `doc`: the document being processed (e.g., [package document](https://www.w3.org/TR/epub-33/#dfn-package-document), [media overlay document](https://www.w3.org/TR/epub-33/#dfn-media-overlay-document), [epub content document](https://www.w3.org/TR/epub-33/#dfn-epub-content-document)).

To obtain an expanded URL, apply the following steps:

1.  Let `baseURL`, `expandedURL`, `propertyPrefix`, and `propertyReference` be empty [strings](https://infra.spec.whatwg.org/#string).

    Explanation

    In this algorithm:

    - `baseURL` will hold the base URL associated with the value, whether this URL is assigned by the EPUB creator, corresponds to a default vocabulary, or comes from a reserved prefix.
    - `expandedURL` will hold the final URL that results from the concatenation of the base URL and property reference.
    - `propertyPrefix` will hold the property's [prefix](https://www.w3.org/TR/epub-33/#property.ebnf.prefix) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] (i.e., the value before the colon). Properties from a default vocabulary will not have a prefix, but all others will.
    - `propertyReference` will hold the property's [reference](https://www.w3.org/TR/epub-33/#property.ebnf.reference) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] (i.e., the value after the prefix). All valid properties require a reference.

2.  Obtain the values of `propertyPrefix` and `propertyReference` as follows:

    1.  If `value` does not contain a colon (U+003A), set `propertyReference` to `value`.

        Explanation

        If a `property` value does not have a colon, it does not have a prefix. In this case, the value is drawn from the default vocabulary as described in the next step of the algorithm.

    2.  Otherwise, if `value` begins with a colon, the value is invalid. Return [null](https://infra.spec.whatwg.org/#nulls).

        Explanation

        A colon at the beginning of the value is invalid as it indicates the prefix is not set.

    3.  Otherwise, split `value` on the first colon and set `propertyPrefix` to the string before the colon and set `propertyReference` to the string after the colon.

    If `propertyReference` is not a valid [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string), as required by the [`property` data type definition](https://www.w3.org/TR/epub-33/#property.ebnf.reference) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], the value is invalid. Return [null](https://infra.spec.whatwg.org/#nulls).

    Explanation

    The path-relative-scheme-less-URL string definition has a number of restrictions that apply to the reference whether it has a prefix or not.

    For example, the reference must not begin with a [URL-scheme string](https://url.spec.whatwg.org/#url-scheme-string) followed by a colon. This restriction means that the following is not a valid `property` value as the second colon could represent a scheme: `foo:bar:baz/qux`.

    There are also restrictions on what characters must be percent encoded.

3.  Obtain the value of `baseURL` as follows:

    1.  If `propertyPrefix` is an empty string:

        1.  If `attr` is [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], set `baseURL` to\
            `http://idpf.org/epub/vocab/structure/#`
        2.  Otherwise, if `elem` is the package document [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\] and `attr` is `scheme`, the property value is invalid. Return [null](https://infra.spec.whatwg.org/#nulls).
        3.  Otherwise, if `elem` is the package document [`meta`](https://www.w3.org/TR/epub-33/#dfn-meta) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\], set `baseURL` to\
            `http://idpf.org/epub/vocab/package/meta/#`
        4.  Otherwise, if `elem` is the package document [`link`](https://www.w3.org/TR/epub-33/#dfn-link) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\], set `baseURL` to\
            `http://idpf.org/epub/vocab/package/link/#`
        5.  Otherwise, if `elem` is the package document [`item`](https://www.w3.org/TR/epub-33/#dfn-item) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\], set `baseURL` to\
            `http://idpf.org/epub/vocab/package/item/#`
        6.  Otherwise, if `elem` is the package document [`itemref`](https://www.w3.org/TR/epub-33/#dfn-itemref) element \[[epub-33](#bib-epub-33 "EPUB 3.3")\], set `baseURL` to\
            `http://idpf.org/epub/vocab/package/itemref/#`

        Explanation

        If the `property` value does not have a prefix, then this step assigns the default vocabulary URL to use based on the attribute or element to which it belongs. When an element in the package document has more than one attribute that takes a `property` data type, those attributes share the same default vocabulary. For this reason, it is not necessary to check both the element and attribute to determine what URL to assign.

        The one attribute in EPUB 3 that does not have a default vocabulary is the [`scheme` attribute](https://www.w3.org/TR/epub-33/#attrdef-scheme) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. A scheme value without a prefix is invalid.

    2.  Otherwise:

        1.  If a `prefix` attribute is declared on the document element of `doc`, and the attribute contains a prefix that matches `propertyPrefix`, set `baseURL` to the URL associated with the prefix declaration.

        2.  Otherwise, if `propertyPrefix` matches a [reserved prefix](https://www.w3.org/TR/epub-33/#sec-reserved-prefixes) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for `doc`, set `baseURL` to the URL associated with the reserved prefix.

        Explanation

        When a `property` value has a prefix, the first place to check for its base URL is in a `prefix` attribute declaration on the document element.

        If the author has not assigned a URL for the prefix, the next step is to check if the prefix matches one of the reserved prefixes.

        Note that author-assigned prefix URLs override the reserved prefix URLs.

    If `baseURL` is an empty string, the property value is invalid. Return [null](https://infra.spec.whatwg.org/#nulls).

    Explanation

    If the base URL is empty at the end of this processing step, then either the prefix is not mapped or reserved, or the element or attribute being processed does not accept `property` data types as defined in \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

    Without a base URL, it is impossible to generate an expanded URL, so the value is invalid.

4.  Set `expandedURL` to the concatenated values of `baseURL` and `propertyReference`. Do not add a separator when concatenating the values.

5.  If `expandedURL` is not a [valid URL string](https://url.spec.whatwg.org/#valid-url-string), the value is invalid. Return [null](https://infra.spec.whatwg.org/#nulls).

    Otherwise, return `expandedURL`.

    Explanation

    Although an expanded value may be obtained, it is not necessarily the case that it is a valid URL. This is only likely to occur when the EPUB creator assigns an invalid base URL to a prefix.

Note

Reading systems do not have to [parse the resulting URL](https://url.spec.whatwg.org/#concept-url-parser) \[[url](#bib-url "URL Standard")\] or attempt to dereference the resulting expanded URL. Expanding a `property` data type value to a full URL only ensures a reading system has encountered the value it expects (i.e., because different EPUB creators can assign the same prefix to different URLs, two values may appear the same until expanded).

## 12. Backward compatibility

[](#sec-epub-rs-conf-backward)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MUST* attempt to process an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) whose [package document](https://www.w3.org/TR/epub-33/#dfn-package-document) [`version` attribute](https://www.w3.org/TR/epub-33/#attrdef-package-version) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is less than "`3.0`".

EPUB publications with older version numbers will not always render exactly as intended unless processed according to their respective specifications. Reading systems *SHOULD* support such EPUB publications as defined by those specifications.

## 13. Forward compatibility

[](#sec-epub-rs-conf-forward)

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *SHOULD* attempt to process an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) whose [package document](https://www.w3.org/TR/epub-33/#dfn-package-document) [`version` attribute](https://www.w3.org/TR/epub-33/#attrdef-package-version) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is greater than "`3.0`".

## 14. Accessibility

[](#sec-accessibility)

*This section is non-normative.*

Although the primary focus of this specification is on how to process and render [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication), it does not mandate specific user interfaces that all [reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) must offer. This does not mean that there are not common accessibility issues that all reading systems developers should be aware of, or seek to avoid in their applications.

The W3C's User Agent Accessibility Guidelines \[[uaag20](#bib-uaag20 "User Agent Accessibility Guidelines (UAAG) 2.0")\] provides many useful practices developers should apply to improve their reading systems as many browser accessibility issues have parallels in EPUB-specific user agents.

The following list outlines some additional EPUB-specific areas where a lack of accessibility impacts the reading experience for users:

- Bookshelf — Ensure that the process for accessing and opening the user's content is accessible. For example, do not rely on a visual-only display like cover images. Exposing text representations of the title(s) and author(s), including the language they are expressed in, allows assistive technologies to properly announce the content.
- User Interface Controls — Ensure that all controls (e.g., search boxes, annotation controls, and buttons to load features such as the table of contents) are exposed to assistive technologies and that their actions do not rely on specific modalities (e.g., they only operate through touch or a mouse).
- Search — Search access to the full text content of all [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document) is necessary to ensure users can locate information easily.
- Display Control — Provide methods for users to tailor the styling of the content to their preferences (e.g., to change and increase fonts, increase line and word spacing, and apply alternate contrasts).
- Zoom — Allow users to zoom the content to better size it to their needs, especially for [fixed-layout documents](https://www.w3.org/TR/epub-33/#dfn-fixed-layout-document).
- Reading Control — Ensure that the ability to read from page-to-page and document-to-document does not depend on physical interaction (i.e., users of assistive technologies can read the content without getting trapped at the end of pages or documents).
- API Integration — Ensure that the accessibility tree, including support for roles, states and properties \[[wai-aria-11](#bib-wai-aria-11 "Accessible Rich Internet Applications (WAI-ARIA) 1.1")\], is exposed to the underlying operating system's accessibility API so that users can fully interact with the content when using assistive technologies.
- Document Object Model (DOM) — Provide access to the \[[dom](#bib-dom "DOM Standard")\] of EPUB content documents so that users can investigate the semantics and structure expressed in the source.
- Table of Contents — Ensure that users can access the link text, including [text alternatives for visual content](https://www.w3.org/TR/epub-33/#confreq-nav-a-title). Activating the table of contents links should be possible using different inputs.

The DAISY Consortium maintains an [accessibility test suite](https://epubtest.org/test-books) to aid in evaluating these issues and more.

## 15. Security and privacy

[](#sec-security-privacy)

### 15.1 Overview

[](#security-privacy-overview)

*This section is non-normative.*

The particularity of an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication) is its structure. The EPUB format provides a means of representing, packaging, and encoding structured and semantically enhanced web content — including HTML, CSS, SVG, and other resources — for distribution in a single-file container.

For [reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system), this means that the security and privacy issues are primarily based on the features of those formats, and closely mirror the threats presented by web content generally.

Reading system developers also have a dual responsibility of both ensuring the security and privacy of their applications and helping limit the threats to users from the content that renders within them. The rest of this section explores the risk model of EPUB 3 with the aim of helping developers recognize and mitigate these risks.

Note

For the risks associated with the authoring of EPUB publications, refer to the [security and privacy section](https://www.w3.org/TR/epub-33/#sec-security-privacy) of \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

### 15.2 Threat model

[](#epub-threat-model)

*This section is non-normative.*

The greatest threats to users come from the [content they read](https://www.w3.org/TR/epub-33/#epub-threat-model) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], and the first line of defense against these attacks is the reading systems they use. Users expect that reading systems act as safeguards against malicious content and are often unaware that [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication) are susceptible to the same security risks as web sites.

But although reading systems are relied on to provide security and privacy, they can also pose unintended threats to users depending on how information is handled. Tracking user information to optimize experiences is a common need, for example, but done without user permission and reading systems can run afoul of legal privacy requirements.

This section outlines some of the key threats that reading system developers must take into consideration, with further details and recommendations in the following sections.

Scripting  
Malicious scripts present several attack vectors against reading systems. If local storage is not secure, for example, they can attempt to compromise the user's data. Provided with network access, they may attempt unauthorized collection of user data.

More detailed discussion of these issues and how to mitigate them is provided in [6.4.3 Security considerations](#sec-scripted-content-security).

Malicious content  
EPUB publications may contain resources designed to exploit security flaws in reading systems or the operating systems they run on. Attackers may also try to gain access to [remote resources](https://www.w3.org/TR/epub-33/#dfn-remote-resource) using file indirection techniques, such as symbolic links or file aliases.

The lack of a standard method of signing EPUB publications means that reading systems cannot always verify whether the content has been tampered with between authoring and loading in the device.

Remote resources  
[Remote resources](https://www.w3.org/TR/epub-33/#dfn-remote-resource) present the same risks as any EPUB publication loaded from an untrusted source. Even if the publisher of the EPUB publication is trusted, remote resources may be compromised.

Calls to remote resources can also be used to track information about users (e.g., through server logs). Reading systems should limit the information they expose through HTTP requests to only what is essential to obtain the resource.

The [origin](#sec-container-iri) of an EPUB is both unknown to the [EPUB creator](https://www.w3.org/TR/epub-33/#dfn-epub-creator) and specific to each reading system implementation. Consequently, if the EPUB creator hosts remote resources on a web server they control, the server effectively cannot use security features that require specifying allowable origins, such as headers for [CORS](https://fetch.spec.whatwg.org/#cors-protocol), [`Content-Security-Policy`](https://www.w3.org/TR/CSP2/#content-security-policy-header-field), or [`X-Frame-Options`](https://www.rfc-editor.org/rfc/rfc7034).

External links  
Like remote resources, external links may be used to trick unwitting users into opening malicious resources on the web designed to exploit the reading system or operating system.

Likewise, reading systems should also avoid exposing potentially identifying information about users through the traversal of links (e.g., not using tracking identifiers or exposing unnecessary information about the user's environment).

User-generated content  
User-generated content within a reading experience, for example through text areas or other interactive components, could pose a threat to reading system security or user privacy if the content is not properly secured. More details on scripting security are provided in [6.4.3 Security considerations](#sec-scripted-content-security).

Collection of user data  
Collecting information about the user and their reading habits without obtaining their permission can violate their privacy, even if the information is only intended for internal use.

Attempting to profile users based on their reading habits or through metadata in their publication (e.g., accessibility preferences) can expose users to unintended harms.

Additionally, the security considerations that apply to \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] and \[[zip](#bib-zip ".ZIP File Format Specification")\] files also apply to the [package document](https://www.w3.org/TR/epub-33/#sec-package-doc) and the [Open Container Format](https://www.w3.org/TR/epub-33/#sec-ocf), respectively. See the "Security Consideration" sections of the Media Type registrations for the [`application/oebps-package+xml`](https://www.w3.org/TR/epub-33/#app-media-type-app-oebps-package) and the [`application/epub+zip`](https://www.w3.org/TR/epub-33/#app-media-type) formats for further details.

### 15.3 Recommendations

[](#security-privacy-recommendations)

The strongest measure that reading system developers can take for privacy is to specify the data they intend to collect and use about the user and/or their reading behavior and seek the consent of users to obtain it. They *SHOULD* also allow personalization and control over this information.

If a reading system allows users to store persistent data, especially personally identifiable information, it *SHOULD* treat that data as sensitive and not allow access to it by third parties.

It is understood that the collection of some user data may be required for the sale, delivery, and operation of an [EPUB publication](https://www.w3.org/TR/epub-33/#dfn-epub-publication), particularly on platforms where the sale of an EPUB publication and the method of reading it are connected. In these cases, the reading system *SHOULD* identify the data being collected, how it is used, and allow for user opt-outs (retailers may choose to inform users by other means, however, such as when a user creates an account on their web site). Anonymization of any collected data is *RECOMMENDED* for the privacy and the security of the user and reading system.

It is also understood that user data may be required or helpful for some reading system affordances. In these cases, anonymization is also *RECOMMENDED*. Reading systems also *SHOULD* inform users of what data is needed, what it is to be used for, and to provide methods to opt-out.

Content processors — defined as entities that handle the ingestion of EPUB content for distribution, display, or sale — also need to be aware of the potential risks in ingestion. It is advised that content processors check content for malicious content on ingestion, in addition to the validation steps that usually occur. This could include running virus scans, validating external links and remote resources, and other precautions.

Reading systems *SHOULD* treat content from any new source, including from an integrated bookstore, as insecure (e.g., prompt users to allow scripting and network access the first time the source is accessed). If a reading system allows users to load their own content (e.g., through the process of "sideloading"), each instance *SHOULD* be treated as insecure.

When processing XML documents, a reading system *SHOULD NOT* resolve [external identifiers](https://www.w3.org/TR/xml/#NT-ExternalID) in DOCTYPE, ENTITY and NOTATION declarations \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\]. Reading systems *SHOULD* also consider security risks related to [internal](https://www.w3.org/TR/xml/#sec-internal-ent) or [external](https://www.w3.org/TR/xml/#sec-external-ent) XML entities like, for example, DoS attacks also known as ["Billion laughs attacks"](https://en.wikipedia.org/wiki/Billion_laughs_attack) or ["XML external entity attacks"](https://en.wikipedia.org/wiki/XML_external_entity_attack).

Note

Additional security recommendations for external links, network access and scripting are available in [3.9 External links](#sec-epub-rs-external-links), [3.8 Network access](#sec-epub-rs-network-access), and [6.4.3 Security considerations](#sec-scripted-content-security), respectively.

## A. Unsupported features

[](#app-unsupported)

[reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) *MAY* support [deprecated features](https://www.w3.org/TR/epub-33/#deprecated) \[[epub-33](#bib-epub-33 "EPUB 3.3")\].

Note

Developers should consider the unlikelihood of encountering content with deprecated features before adding new support for them.

## B. epubReadingSystem object

[](#app-epubReadingSystem)

Note

[Reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system) act as the core rendering engines of EPUB publications and provide a scripting environment based on the \[[dom](#bib-dom "DOM Standard")\] specification. So, although this interface definition uses the \[[webidl](#bib-webidl "Web IDL Standard")\] notation for implementation by reading systems, web browsers generally do not have to implement these objects.

### B.1 Interface definition

[](#app-ers-idl)

This specification extends the [`Navigator`](https://html.spec.whatwg.org/multipage/system-state.html#navigator) object \[[html](#bib-html "HTML Standard")\] as follows.

[WebIDL](#webidl-1233247208)`[`[`Exposed`](https://webidl.spec.whatwg.org/#Exposed)`=(Window)``]`\
`interface ``EpubReadingSystem`` {`\
`    `[`boolean`](https://webidl.spec.whatwg.org/#idl-boolean)` `[`hasFeature`](#dom-epubreadingsystem-hasfeature)`(`[`DOMString`](https://webidl.spec.whatwg.org/#idl-DOMString)` ``feature``, optional`` `[`DOMString`](https://webidl.spec.whatwg.org/#idl-DOMString)` ``version``);`\
`};`\
\
`partial interface `[`Navigator`](https://html.spec.whatwg.org/multipage/system-state.html#navigator)` {`\
`    [`[`LegacyUnforgeable`](https://webidl.spec.whatwg.org/#LegacyUnforgeable)`, `[`SameObject`](https://webidl.spec.whatwg.org/#SameObject)`] readonly attribute`` `[`EpubReadingSystem`](#dom-epubreadingsystem)` `[`epubReadingSystem`](#dom-navigator-epubreadingsystem)`;`\
`};`

Note

This specification does not define an `epubReadingSystem` property extension for the [`WorkerNavigator`](https://html.spec.whatwg.org/multipage/workers.html#workernavigator) object \[[html](#bib-html "HTML Standard")\]. Reading systems therefore do not have to expose the `epubReadingSystem` object in the scripting context of Workers, and [EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator) cannot rely on its presence.

### B.2 Description

[](#app-ers-desc)

The `Navigator.epubReadingSystem` object provides an interface through which a [scripted content document](https://www.w3.org/TR/epub-33/#dfn-scripted-content-document) can query information about a user's reading system.

Reading systems *MUST* expose the `epubReadingSystem` object on the `navigator` object of all loaded scripted content documents, including any nested [container-constrained scripting contexts](https://www.w3.org/TR/epub-33/#sec-scripted-container-constrained) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. Reading systems *MUST* ensure that the `epubReadingSystem` object is available no later than when the [`DOMContentLoaded` event is triggered](https://html.spec.whatwg.org/multipage/#the-end) \[[html](#bib-html "HTML Standard")\].

Note

Reading systems implementations may create cloned instances of the `epubReadingSystem` object in scripted content documents for technical feasibility reasons. In such cases, the reading system must ensure they consistently maintain the object's state — as reflected by the values of its properties and methods — across all copied instances.

### B.3 Properties

[](#app-ers-properties)

This specification used to define the `name`, `version`, and the `layoutStyle` properties, but these are now [deprecated](https://www.w3.org/TR/epub-33/#deprecated) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]. For more information refer to their definitions in \[[epubcontentdocs-32](#bib-epubcontentdocs-32 "EPUB Content Documents 3.2")\] (for [`name` and `version`](https://www.w3.org/publishing/epub32/epub-contentdocs.html#app-ers-properties)) and in \[[epubcontentdocs-301](#bib-epubcontentdocs-301 "EPUB Content Documents 3.0.1")\] (for [`layoutStyle`](https://idpf.org/epub/301/spec/epub-contentdocs.html#app-ers-properties)).

### B.4 Methods

[](#app-ers-methods)

#### B.4.1 hasFeature

[](#app-ers-hasFeature)

##### B.4.1.1 Description

[](#app-ers-hasFeature-desc)

The `hasFeature` method returns a boolean value indicating whether the reading system supports any version of the specified feature, or `undefined` if the reading system does not recognize the specified feature.

The optional `version` parameter allows [EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator) to query custom features that could change in incompatible ways over time. The return value indicates support only for the specified version of the feature.

[Features defined in this specification](#app-ers-hasFeature-features) are versionless. If a reading system supports a feature defined in this specification, it *MUST* ignore any supplied `version` parameter and return a `true` value.

[Example 1](#example-javascript-function-to-display-support-for-scripted-manipulation-of-the-dom): JavaScript function to display support for scripted manipulation of the DOM

``` javascript
var feature = "dom-manipulation";

var conformTest = navigator.epubReadingSystem.hasFeature(feature);

alert("Feature " + feature + " supported?: " + conformTest);
```

##### B.4.1.2 Features

[](#app-ers-hasFeature-features)

The following table lists the set of features that reading systems that support the `epubReadingSystem` object *MUST* recognize. When the features are queried from the `hasFeature` method, reading systems *MUST* return a boolean value indicating their support.

| Name | Description |
|----|----|
| `dom-manipulation` | Scripts may make structural changes to the document’s DOM (applies to [spine-level scripting](https://www.w3.org/TR/epub-33/#sec-scripted-spine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] only). |
| `layout-changes` | Scripts may modify attributes and CSS styles that affect content layout (applies to [spine-level scripting](https://www.w3.org/TR/epub-33/#sec-scripted-spine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] only). |
| `touch-events` | The device supports touch events, and the reading system passes touch events to the content. |
| `mouse-events` | The device supports mouse events, and the reading system passes mouse events to the content. |
| `keyboard-events` | The device supports keyboard events, and the reading system passes keyboard events to the content. |
| `spine-scripting` | Indicates whether the reading system supports [spine-level scripting](https://www.w3.org/TR/epub-33/#sec-scripted-spine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] (e.g., so a [container-constrained script](https://www.w3.org/TR/epub-33/#sec-scripted-container-constrained) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] can determine whether any actions that depend on scripting support in a [top-level content document](https://www.w3.org/TR/epub-33/#dfn-top-level-content-document) have any chance of success before attempting them). |

Reading system developers *MAY* add additional features, but future versions of this specification could append to this list in ways that might conflict or be incompatible with any such custom additions.

## C. Index

[](#index)

### C.1 Terms defined by this specification

[](#index-defined-here)

- [content display area](#dfn-content-display-area) §1.2
- [epubReadingSystem](#dfn-epubreadingsystem) §B.
- [`EpubReadingSystem`](#dom-epubreadingsystem) interface §B.1
- [`hasFeature`](#dom-epubreadingsystem-hasfeature) method for `EpubReadingSystem` §B.4.1.1
- [`Navigator.epubReadingSystem`](#dom-navigator-epubreadingsystem) attribute for `Navigator` §B.2
- [obtain an expanded URL](#dfn-obtain-an-expanded-url) §11.

### C.2 Terms defined by reference

[](#index-defined-elsewhere)

- \[[BIDI](#bib-bidi)\] defines the following:
  - Rule P2
  - the higher-level protocols
- \[[CSS-FONTS-4](#bib-css-fonts-4)\] defines the following:
  - @font-face rules
- \[[EPUB-33](#bib-epub-33)\] defines the following:
  - "scrolled-continuous"
  - "scrolled-doc"
  - active-class
  - alternative text
  - application/epub+zip
  - application/oebps-package+xml
  - Associating style information
  - `audio` element
  - audio core media type resources
  - `body` element
  - clipBegin
  - clipEnd
  - collections
  - container root URL
  - container-constrained scripting
  - content they read
  - content URL
  - core specification
  - CSS Style Sheets — Prefixed properties
  - `dc:creator` element
  - `dc:identifier` element
  - `dc:language` element
  - `dc:title` element
  - declare an unknown value
  - definition of epub:type
  - deprecated
  - dir
  - disallowed
  - duration
  - EPUB container
  - EPUB content documents
  - EPUB content documents
  - EPUB creators
  - EPUB manifest
  - EPUB navigation document
  - EPUB navigation document
  - EPUB navigation documents
  - EPUB publications
  - EPUB reading system
  - EPUB spine
  - `epub:type` attribute
  - escapable structures
  - Expressing in HTML
  - Expressing the ICB in SVG
  - Fallbacks for scripted content documents
  - file name and file path restrictions
  - fixed-layout document
  - fixed-layout documents
  - Font obfuscation
  - foreign resource
  - foreign resources
  - fragment identifier
  - global rendering property
  - hreflang attributes
  - identifier-type property
  - image core media type resources
  - `item` element
  - `itemref` element
  - landmarks nav element
  - layout-pre-paginated override
  - legacy features
  - `link` element
  - linked records
  - linked resources
  - links and headings
  - locally overridden
  - manifest fallback chain
  - manifest items
  - manifest.xml file
  - media overlay documents
  - media overlays
  - media-overlay attribute
  - `meta` element
  - metadata.xml files
  - OCF abstract container
  - OCF ZIP container
  - package document
  - package document
  - package document metadata
  - page-list nav element
  - page-progression-direction attribute
  - `par` element
  - Parsing URLs in the META-INF directory
  - playback-active-class
  - prefix
  - primary (linear) itemref
  - prohibiting CSS for setting language and direction
  - properties attribute
  - properties attribute
  - properties attributes
  - property attributes
  - property data type values
  - publication resources
  - publication resources
  - reference
  - reflowable layout properties
  - remote resources
  - rendition:layout property
  - rendition:orientation property
  - rendition:page-spread-left property
  - rendition:page-spread-right property
  - rendition:spread
  - Reserved files
  - reserved prefix
  - Resource locations
  - root directory
  - `rootfile` element
  - scheme attribute
  - scripted content documents
  - scripting
  - security and privacy section
  - `seq` element
  - signatures.xml file
  - `spine` element
  - spine-level scripting
  - structural semantics
  - SVG content documents
  - SVG content documents
  - synthetic spreads
  - terminology defined in EPUB 3.3
  - `text` element
  - text alternatives for visual content
  - this version of EPUB
  - toc nav element
  - top-level content documents
  - under-implemented
  - unique identifier
  - values
  - viewport
  - viewport meta declarations
  - visual rendering of XHTML content documents via CSS
  - vocabulary association mechanisms
  - XHTML content documents
  - XHTML content documents
  - xml:lang
- \[[EPUB-TTS-10](#bib-epub-tts-10)\] defines the following:
  - EPUB 3 Text-to-Speech Support
- \[[HTML](#bib-html)\] defines the following:
  - attribute processing model
  - conversion to JSON
  - cookies
  - DOMContentLoaded event is triggered
  - `form` element
  - local storage
  - `Navigator` interface
  - navigator object
  - `object` type
  - origin
  - `style` attribute (for `html-global` element)
  - suggested default rendering
  - top-level browsing contexts
  - web storage
  - `WorkerNavigator` interface
- \[[INFRA](#bib-infra)\] defines the following:
  - null
  - string
  - strip and collapse ASCII whitespace
- \[[MATHML3](#bib-mathml3)\] defines the following:
  - annotation-xml elements
  - Content MathML
  - input-compliant processor
  - Presentation MathML
- \[[RDFA-CORE](#bib-rdfa-core)\] defines the following:
  - attribute processing model
- \[[URL](#bib-url)\] defines the following:
  - base
  - origin
  - path-relative-scheme-less-URL string
  - scheme
  - url parser
  - URL-fragment string
  - URL-scheme string
  - valid URL string
- \[[WEBIDL](#bib-webidl)\] defines the following:
  - `boolean` type
  - `DOMString` interface
  - `[Exposed]` extended attribute
  - `[LegacyUnforgeable]` extended attribute
  - `[SameObject]` extended attribute
- \[[XML](#bib-xml)\] defines the following:
  - external
  - external identifiers
  - internal
  - xml:lang attribute

## D. Change log

[](#change-log)

*This section is non-normative.*

Note that this change log only identifies substantive changes since [EPUB 3.2](https://www.w3.org/publishing/epub32/) — those that may affect the conformance of [EPUB reading systems](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system).

For a list of all issues addressed, refer to the [working group's issue tracker](https://github.com/w3c/epub-specs/issues?q=is%3Aissue+is%3Aclosed+sort%3Aupdated-desc+label%3ASpec-ReadingSystems).

Substantive changes since the [Recommendation](https://www.w3.org/TR/2023/REC-epub-rs-33-20230525/) of 2023-05-25

No substantive changes were made.

Substantive changes since the [Candidate Recommendation](https://www.w3.org/TR/2022/CR-epub-rs-33-20220512/) of 2022-05-12

- 01-Feb-2023: Removed reference to `getOverrideStyle` in DOM Level 2 as it was dropped from the DOM Living Standard. See [pull request 2531](https://github.com/w3c/epub-specs/pull/2531).
- 11-Jan-2023: Added note advising reading system developers to support package metadata directionality even though marked as under-implemented for authoring. See [pull request 2515](https://github.com/w3c/epub-specs/pull/2515).
- 11-Jan-2023: Removed support description for under-implemented features. See [pull request 2515](https://github.com/w3c/epub-specs/pull/2515).
- 06-Jan-2023: Reduced the requirement to support prefixed CSS properties to a recommendation. See [pull request 2514](https://github.com/w3c/epub-specs/pull/2514).
- 06-Jan-2023: Reduced the requirement to use alternative text for non-text elements in the navigation document to a recommendation due to the lack of support for both. See [pull request 2513](https://github.com/w3c/epub-specs/pull/2513).
- 05-Jan-2023: Removed the processing requirements for linked records. See [pull request 2512](https://github.com/w3c/epub-specs/pull/2512).
- 11-Nov-2022: Added requirement to replace unsupported non-text elements with their text alternatives when generating non-HTML navigation widgets. See [issue 2477](https://github.com/w3c/epub-specs/issues/2477).
- 13-Oct-2022: Added sections to explain expectations for error handling and reporting. See [issue 2454](https://github.com/w3c/epub-specs/issues/2454).
- 11-Oct-2023: Additional text sketching the RS behavior in the case of erroneous ICB setting. See [issue 2442](https://github.com/w3c/epub-specs/issues/2442).
- 06-10-2022: Moved the restriction on XML external identifiers from the XML conformance clause to the security and privacy section, adding an additional note on security risks on internal or external entities. See [issue 2433](https://github.com/w3c/epub-specs/issues/2433) and [issue 2477](https://github.com/w3c/epub-specs/issues/2447).
- 23-Sep-2023: Added a note on a possible future feature, whereby the value of `rendition:flow` would control the publication of webtoon-like publications. See [issue 2412](https://github.com/w3c/epub-specs/issues/2412).
- 19-Sept-2022: Removed ARIA extension section as the HTML specification already contains [ARIA support requirements](https://html.spec.whatwg.org/multipage/dom.html#wai-aria). See [issue 2431](https://github.com/w3c/epub-specs/issues/2431).
- 14-Sept-2022: Integrated the reading system support requirements for unsupported features that were still in the EPUB 3.3 specification. See [issue 2424](https://github.com/w3c/epub-specs/issues/2424).
- 28-Aug-2022: The guidelines for rendering embedded timed media in Media Overlays have been deprecated. See [issue 2397](https://github.com/w3c/epub-specs/issues/2397).
- 28-July-2022: Restructured the vocabulary association mechanisms section as an algorithm for obtaining an expanded URL. See [issue 2378](https://github.com/w3c/epub-specs/issues/2378).
- 22-July-2022: The `name` and `version` properties of the `epubReadingSystem` object have been deprecated. See [issue 1872](https://github.com/w3c/epub-specs/issues/1872).
- 19-July-2022: ZIP containers with content split into segments have been disallowed in general. See [issue 2360](https://github.com/w3c/epub-specs/issues/2360).
- 24-June-2022: Removed duplicate requirement not to use `hreflang` value for processing purposes. See [pull request 2343](https://github.com/w3c/epub-specs/pull/2343).
- 17-June-2022: Add recommendation to alert user before opening URLs with a scheme and clarify the external links section to account for more than just web schemes. See [issue 2320](https://github.com/w3c/epub-specs/issues/2320).
- 17-June-2022: Clarify support for the vocabulary association mechanisms is optional. See [issue 2317](https://github.com/w3c/epub-specs/issues/2317).
- 07-June-2022: The usage of File URLs has been disallowed. See [issue 2324](https://github.com/w3c/epub-specs/issues/2324).
- 07-June-2022: Noted that unsigned EPUB publications represent a security risk and added recommendation to treat sideloaded unsigned publications as untrusted. See [issue 2265](https://github.com/w3c/epub-specs/issues/2265).
- 07-June-2022: Updated privacy and security recommendations to use normative language.
- 27-May-2022: Added reading system conformance section. See [issue 2271](https://github.com/w3c/epub-specs/issues/2271).
- 27-May-2022: Added recommendation to only load remote resources referenced via https. See [issue 2263](https://github.com/w3c/epub-specs/issues/2263).
- 20-May-2022: Removed the recommendation to prevent access to persistent storage from "unrelated documents". This recommendation conflicts with, and is made redundant by, the unique origin requirement introduced in this revision. See [issue 2264](https://github.com/w3c/epub-specs/issues/2264).
- 17-May-2022: Added an index of terms. See [issue 2260](https://github.com/w3c/epub-specs/issues/2260).

Substantive changes since [EPUB 3.2](https://www.w3.org/publishing/epub32/)

- 31-Mar-2022: Moved custom attribute authoring requirements to the authoring specification. Added reading system handling of custom properties. See [issue 2134](https://github.com/w3c/epub-specs/issues/2134).
- 17-Mar-2022: Added requirement to suppress playback of skippable elements in media overlays Documents. See [issue 2066](https://github.com/w3c/epub-specs/issues/2066).
- 11-Feb-2022: Fix the contradictory support statements for media overlays. Support is recommended when rendering of prerecorded audio is supported, as in previous versions of EPUB 3. See [issue 1991](https://github.com/w3c/epub-specs/issues/1991).
- 04-Feb-2022: Changed the non-normative security considerations for controlling network access, opening external links, and managing local storage to normative recommendations. See [issue 1957](https://github.com/w3c/epub-specs/issues/1957).
- 04-Feb-2022: Expanded the section on security and privacy to include new sections on the threat model for reading systems and additional recommendations for ensuring security and privacy. See [issue 1871](https://github.com/w3c/epub-specs/issues/1871), [issue 1872](https://github.com/w3c/epub-specs/issues/1872), [issue 1875](https://github.com/w3c/epub-specs/issues/1875) and [issue 1876](https://github.com/w3c/epub-specs/issues/1876).
- 03-Feb-2022: Reduced the requirement to support deobfuscation to a recommendation. See [issue 1873](https://github.com/w3c/epub-specs/issues/1873).
- 19-Jan-2022: Elevated default statements for the `rendition:spread` and `rendition:orientation` properties to requirements, to align with `rendition:layout`. See [issue 1936](https://github.com/w3c/epub-specs/issues/1936).
- 08-Dec-2021: `page-spread-center` is now an alias for `spread-none`. See [issue 1929](https://github.com/w3c/epub-specs/issues/1929).
- 10-Nov-2021: Proper definition of the content URL and handling of relative URLs. See [issue 1374](https://github.com/w3c/epub-specs/issues/1374) and [issue 1888](https://github.com/w3c/epub-specs/issues/1888).
- 01-Nov-2021: Added a statement on the reading system behavior when item references are repeated in the spine. See [issue 1686](https://github.com/w3c/epub-specs/issues/1686).
- 25-Oct-2021: Clarify that reading systems must render non-linear resources when they are hyperlinked to by a user. See [issue 1864](https://github.com/w3c/epub-specs/issues/1864).
- 27-Aug-2021: Added accessibility bullet to cover the need for zooming, particularly for fixed-layout documents. See [issue 1776](https://github.com/w3c/epub-specs/issues/1776).
- 27-Aug-2021: Remove the recommendation to support text search and selection in SVGs. Replacing with a more general bullet on search accessibility to avoid defining requirements on reading system UI. See [issue 1774](https://github.com/w3c/epub-specs/issues/1774).
- 09-July-2021: Restored the custom attributes section due to known usage but without reference to the attribute registry. See [issue 1602](https://github.com/w3c/epub-specs/issues/1602).
- 09-July-2021: Removed recommendation to use the first language tag to determine an unspecified page progression direction. See [issue 1482](https://github.com/w3c/epub-specs/issues/1482).
- 18-June-2021: Moved requirements for supporting SSML, PLS lexicons and CSS 3 Speech to the [EPUB 3 Text-to-Speech Support](https://www.w3.org/TR/epub-tts-10/) note. See [issue 1690](https://github.com/w3c/epub-specs/issues/1690).
- 20-May-2021: Providing a shared and unique origin for scripts is a requirements for reading systems that support scripting. See [issue 1659](https://github.com/w3c/epub-specs/issues/1659).
- 20-May-2021: Removed requirement for reading systems to be conformant xml:base processors. See [pull request 1678](https://github.com/w3c/epub-specs/pull/1678).
- 12-May-2021: Added additional requirement that reading systems ignore property values that expand to invalid URL strings and property values with empty references. See [issue 1673](https://github.com/w3c/epub-specs/issues/1673).
- 12-May-2021: Changed all references to URIs/IRIs to URLs and references to RFCs 3986 and 3987 to the URL standard. See [issue 808](https://github.com/w3c/epub-specs/issues/808).
- 06-May-2021: Recommend that reading systems support references to HTML target elements and SVG fragment identifiers in `textref` attributes and the `text` element's `src` attribute. Support for other fragment identifier schemes is optional. See [issue 1586](https://github.com/w3c/epub-specs/issues/1586).
- 23-Apr-2021: Clarified that reading systems should attempt to process invalid file and path names. See [issue 1629](https://github.com/w3c/epub-specs/issues/1629)
- 16-Apr-2021: Removed the section on custom attributes. See [Working Group Resolution](https://www.w3.org/publishing/groups/epub-wg/Meetings/Minutes/2021-04-15-epub#resolution2).
- 15-Apr-2021: Remove the reference to "presentation logic". See [issue 1516](https://github.com/w3c/epub-specs/issues/1516) and [Working Group Resolution](https://www.w3.org/publishing/groups/epub-wg/Meetings/Minutes/2021-04-15-epub#resolution3).
- 12-Apr-2021: The section [B. epubReadingSystem object](#app-epubReadingSystem) has been marked as "at-risk". See [Working Group resolution](https://www.w3.org/publishing/groups/epub-wg/Meetings/Minutes/2021-04-09-epub#resolution1).
- 09-Apr-2021: Added a new section dedicated to accessibility and removed the outdated reference to the defunct appendix in the Accessibility specification. See [issue 1608](https://github.com/w3c/epub-specs/issues/1608).
- 09-Apr-2021: Added section clarifying all the conformance requirements on establishing the primary language and base direction of publication resources. See [pull request 1613](https://github.com/w3c/epub-specs/pull/1613).
- 01-Apr-2021: Added section clarifying how absolute URLs are created from relative in the package document. See [pull request 1468](https://github.com/w3c/epub-specs/pull/1468).
- 30-Mar-2021: Restructured the document to remove the rendundant conformance sections and requirements that were only used as locators when this specification was combined with the authoring requirements. See [pull request 1597](https://github.com/w3c/epub-specs/pull/1597) and [pull request 1609](https://github.com/w3c/epub-specs/pull/1609).
- 23-Mar-2021: Added requirement to prevent top-level navigation to data URLs. See [issue 1564](https://github.com/w3c/epub-specs/issues/1564).
- 23-Mar-2021: Changed "suppressing" of non-linear content to "skipping" when traversing the spine to clarify that the intention is not to remove all access to such content. See [issue 1480](https://github.com/w3c/epub-specs/issues/1480).
- 10-Mar-2021: Changed restriction against using resources not listed in the package document to a recommendation not to use. See [issue 810](https://github.com/w3c/epub-specs/issues/810).
- 09-March-2021: the statement on unique identifiers has been set to non-normative, following the discussion and [Working Group resolution](https://www.w3.org/publishing/groups/epub-wg/Meetings/Minutes/2020-12-18-epub#resolution2). See [issue 1310](https://github.com/w3c/epub-specs/issues/1310).
- 08-Mar-2021: Remove unnecessary requirement to assume default value for rendering metadata. See [issue 1313](https://github.com/w3c/epub-specs/issues/1313).
- 05-Mar-2021: Added requirement for reading systems to collapse whitespace in DCMES and meta elements per the \[[infra](#bib-infra "Infra Standard")\] specification definition. See [issue 1295](https://github.com/w3c/epub-specs/issues/1295).
- 26-Feb-2021: Clarified the trimming of leading and trailing whitespace is to be done in accordance with the \[[infra](#bib-infra "Infra Standard")\] specification definition, and removed the exception that `meta` element properties may define their own whitespace handling rules. See [issue 1295](https://github.com/w3c/epub-specs/issues/1295).
- 19-Feb-2021: Updated the [scripting security considerations](#sec-scripted-content-security) so that the text recommends assigning a unique origin to each EPUB publication for security rather than domain isolation at the EPUB content document level. See [issue 1156](https://github.com/w3c/epub-specs/issues/1156).
- 15-Feb-2021: Clarified the requirements for presenting nav elements in the navigation document. The toc nav is now the only required element, the page-list nav is recommended when present, and all others are optional. See [issue 975](https://github.com/w3c/epub-specs/issues/975).
- 10-Feb-2021: A very first draft for [15. Security and privacy](#sec-security-privacy) has been added.
- 04-Feb-2021: Added explicit requirement that reading systems not use the language in `dc:language` elements as the language of resources.
- 02-Feb-2021: Added base direction determination rules for the `dir` attribute accounting for the addition of the new `auto` value. See [issue 1491](https://github.com/w3c/epub-specs/issues/1491).
- 02-Feb-2021: Noted that language information in the new `hreflang` attribute on `link` elements is not authoritative. See [issue 1488](https://github.com/w3c/epub-specs/issues/1488).
- 24-Dec-2020: The creation of a [release identifier](https://www.w3.org/publishing/epub32/epub-packages.html#sec-metadata-elem-identifiers-pid) \[[epubpackages-32](#bib-epubpackages-32 "EPUB Packages 3.2")\] is no longer defined. See [issue 1440](https://github.com/w3c/epub-specs/issues/1440).
- 06-Nov-2020: Reading systems are now required to [not resolve external identifiers](#confreq-rs-xml-extid) in doctype declarations. See [issue 1338](https://github.com/w3c/epub-specs/issues/1338).
- 05-Nov-2020: Generalized the restriction on custom attribute namespace URIs to exclude all of idpf.org and w3.org. See [issue 1388](https://github.com/w3c/epub-specs/issues/1388).
- 30-Sept-2020: The structure of the EPUB core specifications has been simplified to ease understanding and access to information. This specification now consolidates the reading system requirements from the EPUB 3.2 specification together with the Packages, Content Documents, OCF and media overlays specifications. The EPUB 3.3 core specification now focuses only on authoring requirements.

## E. Acknowledgements

[](#ack)

*This section is non-normative.*

Specifications, like art, are human creations. No human has done more for EPUB than Garth Conboy, who has been there every step of the way, from the very first OEB 1.0 in 1999 to today's EPUB 3.3. None of this would have happened without Garth's vision, knowledge, and preternatural good nature. We dedicate EPUB 3.3 to his memory. We are forever in your debt, Garth.

The following members of the EPUB 3 Working Group contributed to the development of this specification:

- Shadi Abou-Zahra (Amazon)
- Will AWAD (Newgen Knowledgeworks)
- Noel Ray Barron (Apple Inc.)
- Sofia Bautista (Legible Media Inc.)
- Leah Brochu (National Network for Equitable Library Service)
- Matthew C. Chan (House of Anansi Press)
- Yu-Wei Chang (Taiwan Digital Publishing Forum)
- Juan Corona (Legible Media Inc.)
- Dave Cramer (W3C Invited Expert, chair)
- Romain Deltour (DAISY Consortium)
- Marisa DeMeglio (DAISY Consortium)
- Brady Duga (Google LLC)
- Reinaldo Ferraz (NIC.br - Brazilian Network Information Center)
- Symon Flaming (Rakuten Group, Inc.)
- John Foliot (W3C Invited Expert)
- Teenya Franklin (Pearson plc)
- Hadrien Gardeur (EDRLab)
- Matt Garrish (DAISY Consortium)
- Jen Goulden (Crawford Technologies)
- David Hall (Apple Inc.)
- Ivan Herman (W3C, staff contact)
- Tetsu Hoshino (Kodansha, Publishers, Ltd.)
- jasen huang (ByteDance)
- Norikazu Ishizu (Kadokawa Corporation)
- Norihito IYENAGA (Kodansha, Publishers, Ltd.)
- Rick Johnson (VitalSource Technologies)
- Ken Jones (Circular Software)
- Antonio Kamiya (Dentsu Group Inc.)
- Deborah Kaplan (W3C Invited Expert)
- Bill Kasdorf (Book Industry Study Group)
- Hiroshi Kawada (MEDIA DO Co., Ltd.)
- George Kerscher (DAISY Consortium)
- Kazuhito Kidachi (Mitsue-Links Co., Ltd.)
- Masakazu Kitahara (Voyager Japan, Inc.)
- Toshiaki Koike (Voyager Japan, Inc.)
- Ryo Kuroda (ACCESS CO., LTD.)
- Charles LaPierre (Benetech)
- Dan Lazin (Google LLC)
- Philippe Le Hegaret (W3C)
- Laurent Le Meur (EDRLab)
- YuYu Lin (Taiwan Digital Publishing Forum)
- Farrah Little (National Network for Equitable Library Service)
- Victor Lopes (Apple Inc.)
- Karan Malhotra (Newgen Knowledgeworks)
- Makoto Murata (DAISY Consortium)
- Cristina Mussinelli (Fondazione LIA)
- Yoichiro Nagao (Kodansha, Publishers, Ltd.)
- Theresa O'Connor (Apple Inc.)
- Yoshinori Ohmura (SHUEISHA Inc.)
- Rachel Osolen (National Network for Equitable Library Service)
- Gregorio Pellegrino (Fondazione LIA)
- Vijaya Gowri Perumal (Newgen Knowledgeworks)
- Wendy Reid (Rakuten Group, Inc., chair)
- John Roque (Apple Inc.)
- Leonard Rosenthol (Adobe)
- Shinobu Sato (Kadokawa Corporation)
- Ben Schroeter (Pearson plc)
- Daihei Shiohama (MEDIA DO Co., Ltd.)
- Tzviya Siegman (Wiley)
- Avneesh Singh (DAISY Consortium)
- MOTOI SUZUKI (SHUEISHA Inc.)
- Yutaka Suzuki (Kadokawa Corporation)
- Kyrce Swenson (Pearson plc)
- Shinya Takami (Kadokawa Corporation, chair)
- Mateus Teixeira (W. W. Norton & Company)
- Yukio Tomikura (Kodansha, Publishers, Ltd.)
- Aimee Ubbink (Crawford Technologies)
- xinyuan wang (ByteDance)
- Daniel Weck (DAISY Consortium)
- Fuqiao Xue (W3C)
- Evan Yamanishi (W. W. Norton & Company)
- Osamu Yoshiba (Kodansha, Publishers, Ltd.)
- Junichi Yoshii (Kodansha, Publishers, Ltd.)
- Naomi Yoshizawa (W3C)
- Laurence Zaysser (EDRLab)

## F. References

[](#references)

### F.1 Normative references

[](#normative-references)

\[bidi\]  
[Unicode Bidirectional Algorithm](https://www.unicode.org/reports/tr9/tr9-50.html). Manish Goregaokar मनीष गोरेगांवकर; Robin Leroy. Unicode Consortium. 2 September 2024. Unicode Standard Annex \#9. URL: <https://www.unicode.org/reports/tr9/tr9-50.html>

\[css-fonts-4\]  
[CSS Fonts Module Level 4](https://www.w3.org/TR/css-fonts-4/). Chris Lilley. W3C. 1 February 2024. W3C Working Draft. URL: <https://www.w3.org/TR/css-fonts-4/>

\[csssnapshot\]  
[CSS Snapshot](https://www.w3.org/TR/CSS/). URL: <https://www.w3.org/TR/CSS/>

\[dcterms\]  
[DCMI Metadata Terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/). DCMI Usage Board. DCMI. 20 January 2020. DCMI Recommendation. URL: <https://www.dublincore.org/specifications/dublin-core/dcmi-terms/>

\[dom\]  
[DOM Standard](https://dom.spec.whatwg.org/). Anne van Kesteren. WHATWG. Living Standard. URL: <https://dom.spec.whatwg.org/>

\[epub-33\]  
[EPUB 3.3](https://www.w3.org/TR/epub-33/). Ivan Herman; Matt Garrish; Dave Cramer. W3C. 25 May 2023. W3C Recommendation. URL: <https://www.w3.org/TR/epub-33/>

\[epubcontentdocs-301\]  
[EPUB Content Documents 3.0.1](https://idpf.org/epub/301/spec/epub-contentdocs-20140626.html). Markus Gylling; William McCoy; Elika J. Etimad; Matt Garrish. IDPF. 26 June 2014. URL: <https://idpf.org/epub/301/spec/epub-contentdocs-20140626.html>

\[epubcontentdocs-32\]  
[EPUB Content Documents 3.2](https://www.w3.org/publishing/epub32/epub-contentdocs.html). Dave Cramer; Matt Garrish. W3C. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-contentdocs.html>

\[epubmediaoverlays-32\]  
[EPUB Media Overlays 3.2](https://www.w3.org/publishing/epub32/epub-mediaoverlays.html). Marisa DeMeglio; Daniel Weck. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-mediaoverlays.html>

\[html\]  
[HTML Standard](https://html.spec.whatwg.org/multipage/). Anne van Kesteren; Domenic Denicola; Dominic Farolino; Ian Hickson; Philip Jägenstedt; Simon Pieters. WHATWG. Living Standard. URL: <https://html.spec.whatwg.org/multipage/>

\[infra\]  
[Infra Standard](https://infra.spec.whatwg.org/). Anne van Kesteren; Domenic Denicola. WHATWG. Living Standard. URL: <https://infra.spec.whatwg.org/>

\[mathml3\]  
[Mathematical Markup Language (MathML) Version 3.0 2nd Edition](https://www.w3.org/TR/MathML3/). David Carlisle; Patrick D F Ion; Robert R Miner. W3C. 10 April 2014. W3C Recommendation. URL: <https://www.w3.org/TR/MathML3/>

\[opentype\]  
[OpenType specification](http://www.microsoft.com/typography/otspec/default.htm). Microsoft. URL: <http://www.microsoft.com/typography/otspec/default.htm>

\[rdfa-core\]  
[RDFa Core 1.1 - Third Edition](https://www.w3.org/TR/rdfa-core/). Ben Adida; Mark Birbeck; Shane McCarron; Ivan Herman et al. W3C. 17 March 2015. W3C Recommendation. URL: <https://www.w3.org/TR/rdfa-core/>

\[rfc1951\]  
[DEFLATE Compressed Data Format Specification version 1.3](https://www.rfc-editor.org/rfc/rfc1951). P. Deutsch. IETF. May 1996. Informational. URL: <https://www.rfc-editor.org/rfc/rfc1951>

\[rfc2046\]  
[Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types](https://www.rfc-editor.org/rfc/rfc2046). N. Freed; N. Borenstein. IETF. November 1996. Draft Standard. URL: <https://www.rfc-editor.org/rfc/rfc2046>

\[RFC2119\]  
[Key words for use in RFCs to Indicate Requirement Levels](https://www.rfc-editor.org/rfc/rfc2119). S. Bradner. IETF. March 1997. Best Current Practice. URL: <https://www.rfc-editor.org/rfc/rfc2119>

\[rfc2397\]  
[The "data" URL scheme](https://www.rfc-editor.org/rfc/rfc2397). L. Masinter. IETF. August 1998. Proposed Standard. URL: <https://www.rfc-editor.org/rfc/rfc2397>

\[rfc8089\]  
[The "file" URI Scheme](https://www.rfc-editor.org/rfc/rfc8089). M. Kerwin. IETF. February 2017. Proposed Standard. URL: <https://www.rfc-editor.org/rfc/rfc8089>

\[RFC8174\]  
[Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words](https://www.rfc-editor.org/rfc/rfc8174). B. Leiba. IETF. May 2017. Best Current Practice. URL: <https://www.rfc-editor.org/rfc/rfc8174>

\[rfc9110\]  
[HTTP Semantics](https://httpwg.org/specs/rfc9110.html). R. Fielding, Ed.; M. Nottingham, Ed.; J. Reschke, Ed.. IETF. June 2022. Internet Standard. URL: <https://httpwg.org/specs/rfc9110.html>

\[svg\]  
[SVG](https://www.w3.org/TR/SVG/). W3C. URL: <https://www.w3.org/TR/SVG/>

\[truetype\]  
[TrueType™ Reference Manual](https://developer.apple.com/fonts/TrueType-Reference-Manual/). Apple, Inc. URL: <https://developer.apple.com/fonts/TrueType-Reference-Manual/>

\[url\]  
[URL Standard](https://url.spec.whatwg.org/). Anne van Kesteren. WHATWG. Living Standard. URL: <https://url.spec.whatwg.org/>

\[w3cprocess\]  
[W3C Process Document](https://www.w3.org/Consortium/Process/). URL: <https://www.w3.org/Consortium/Process/>

\[webidl\]  
[Web IDL Standard](https://webidl.spec.whatwg.org/). Edgar Chen; Timothy Gu. WHATWG. Living Standard. URL: <https://webidl.spec.whatwg.org/>

\[woff\]  
[WOFF File Format 1.0](https://www.w3.org/TR/WOFF/). Jonathan Kew; Tal Leming; Erik van Blokland. W3C. 13 December 2012. W3C Recommendation. URL: <https://www.w3.org/TR/WOFF/>

\[woff2\]  
[WOFF File Format 2.0](https://www.w3.org/TR/WOFF2/). Vladimir Levantovsky. W3C. 8 August 2024. W3C Recommendation. URL: <https://www.w3.org/TR/WOFF2/>

\[xml\]  
[Extensible Markup Language (XML) 1.0 (Fifth Edition)](https://www.w3.org/TR/xml/). Tim Bray; Jean Paoli; Michael Sperberg-McQueen; Eve Maler; François Yergeau et al. W3C. 26 November 2008. W3C Recommendation. URL: <https://www.w3.org/TR/xml/>

\[xml-names\]  
[Namespaces in XML 1.0 (Third Edition)](https://www.w3.org/TR/xml-names/). Tim Bray; Dave Hollander; Andrew Layman; Richard Tobin; Henry Thompson et al. W3C. 8 December 2009. W3C Recommendation. URL: <https://www.w3.org/TR/xml-names/>

\[xmlenc-decrypt\]  
[Decryption Transform for XML Signature](https://www.w3.org/TR/xmlenc-decrypt/). Merlin Hughes; Takeshi Imamura; Hiroshi Maruyama. W3C. 10 December 2002. W3C Recommendation. URL: <https://www.w3.org/TR/xmlenc-decrypt/>

\[zip\]  
[.ZIP File Format Specification](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT). 15 July 2020. Final. URL: <https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT>

### F.2 Informative references

[](#informative-references)

\[css2\]  
[Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification](https://www.w3.org/TR/CSS21/). Bert Bos; Tantek Çelik; Ian Hickson; Håkon Wium Lie. W3C. 7 June 2011. W3C Recommendation. URL: <https://www.w3.org/TR/CSS21/>

\[epub-tts-10\]  
[EPUB 3 Text-to-Speech Enhancements 1.0](https://www.w3.org/TR/epub-tts-10/). Matt Garrish. W3C. 21 December 2023. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-tts-10/>

\[epubpackages-32\]  
[EPUB Packages 3.2](https://www.w3.org/publishing/epub32/epub-packages.html). Matt Garrish; Dave Cramer. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-packages.html>

\[h264\]  
[H.264 : Advanced video coding for generic audiovisual services](https://www.itu.int/ITU-T/recommendations/rec.aspx?rec=13189). 2017-04-13. URL: <https://www.itu.int/ITU-T/recommendations/rec.aspx?rec=13189>

\[indexeddb\]  
[Indexed Database API](https://www.w3.org/TR/IndexedDB/). Nikunj Mehta; Jonas Sicking; Eliot Graff; Andrei Popescu; Jeremy Orlow; Joshua Bell. W3C. 8 January 2015. W3C Recommendation. URL: <https://www.w3.org/TR/IndexedDB/>

\[rfc6386\]  
[VP8 Data Format and Decoding Guide](https://www.rfc-editor.org/rfc/rfc6386). J. Bankoski; J. Koleszar; L. Quillio; J. Salonen; P. Wilkins; Y. Xu. IETF. November 2011. Informational. URL: <https://www.rfc-editor.org/rfc/rfc6386>

\[uaag20\]  
[User Agent Accessibility Guidelines (UAAG) 2.0](https://www.w3.org/TR/UAAG20/). James Allan; Greg Lowney; Kimberly Patch; Jeanne F Spellman. W3C. 15 December 2015. W3C Working Group Note. URL: <https://www.w3.org/TR/UAAG20/>

\[wai-aria-11\]  
[Accessible Rich Internet Applications (WAI-ARIA) 1.1](https://www.w3.org/TR/wai-aria-1.1/). Joanmarie Diggs; Shane McCarron; Michael Cooper; Richard Schwerdtfeger; James Craig. W3C. 14 December 2017. W3C Recommendation. URL: <https://www.w3.org/TR/wai-aria-1.1/>

[↑](#title)

[Permalink](#dfn-content-display-area) exported

**Referenced in:**

- [§ 8.1.1.3 The rendition:spread property](#ref-for-dfn-content-display-area-1 "§ 8.1.1.3 The rendition:spread property")
- [§ 8.1.2 Initial containing block dimensions](#ref-for-dfn-content-display-area-2 "§ 8.1.2 Initial containing block dimensions") [(2)](#ref-for-dfn-content-display-area-3 "Reference 2")
- [§ 8.1.3 Viewport rendering](#ref-for-dfn-content-display-area-4 "§ 8.1.3 Viewport rendering") [(2)](#ref-for-dfn-content-display-area-5 "Reference 2")

[Permalink](#dfn-obtain-an-expanded-url)

**Referenced in:**

- [§ 10. Processing structural semantics](#ref-for-dfn-obtain-an-expanded-url-1 "§ 10. Processing structural semantics")

[Permalink](#dfn-epubreadingsystem) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dom-epubreadingsystem) exported

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-dom-epubreadingsystem-1 "§ B.1 Interface definition")

[Permalink](#dom-navigator-epubreadingsystem) exported [IDL](#webidl-1233247208 "Jump to IDL declaration")

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-dom-navigator-epubreadingsystem-1 "§ B.1 Interface definition")

[Permalink](#dom-epubreadingsystem-hasfeature) exported [IDL](#webidl-1233247208 "Jump to IDL declaration")

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-dom-epubreadingsystem-hasfeature-1 "§ B.1 Interface definition")

[Permalink](https://www.unicode.org/reports/tr9/tr9-50.html#P2)

**Referenced in:**

- [§ 5.1 Base direction](#ref-for-index-term-rule-p2-1 "§ 5.1 Base direction")

[Permalink](https://www.unicode.org/reports/tr9/tr9-50.html#Higher-Level_Protocols)

**Referenced in:**

- [§ 5.1 Base direction](#ref-for-index-term-the-higher-level-protocols-1 "§ 5.1 Base direction")

[Permalink](https://www.w3.org/TR/css-fonts-4/#font-face-rule)

**Referenced in:**

- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-font-face-rules-1 "§ 6.3 Cascading Style Sheets (CSS)")

[Permalink](https://www.w3.org/TR/epub-33/#flow-scrolled-continuous)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-scrolled-continuous-1 "§ 6.4 Scripting")

[Permalink](https://www.w3.org/TR/epub-33/#flow-scrolled-doc)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-scrolled-doc-1 "§ 6.4 Scripting")

[Permalink](https://www.w3.org/TR/epub-33/#active-class)

**Referenced in:**

- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-active-class-1 "§ 9.2.3 Rendering EPUB content document elements")

[Permalink](https://www.w3.org/TR/epub-33/#confreq-nav-a-cnt)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-alternative-text-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#app-media-type)

**Referenced in:**

- [§ 15.2 Threat model](#ref-for-index-term-application-epub-zip-1 "§ 15.2 Threat model")

[Permalink](https://www.w3.org/TR/epub-33/#app-media-type-app-oebps-package)

**Referenced in:**

- [§ 15.2 Threat model](#ref-for-index-term-application-oebps-package-xml-1 "§ 15.2 Threat model")

[Permalink](https://www.w3.org/TR/epub-33/#sec-docs-assoc-style)

**Referenced in:**

- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-associating-style-information-1 "§ 9.2.3 Rendering EPUB content document elements")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-audio)

**Referenced in:**

- [§ 9.2.2 Rendering audio](#ref-for-index-term-audio-element-1 "§ 9.2.2 Rendering audio")
- [§ 9.3.3 Text-to-speech](#ref-for-index-term-audio-element-2 "§ 9.3.3 Text-to-speech")

[Permalink](https://www.w3.org/TR/epub-33/#cmt-grp-audio)

**Referenced in:**

- [§ 3.1 Core Media types](#ref-for-index-term-audio-core-media-type-resources-1 "§ 3.1 Core Media types")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-body)

**Referenced in:**

- [§ 9.2.1 Timing and synchronization](#ref-for-index-term-body-element-1 "§ 9.2.1 Timing and synchronization")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-smil-clipBegin)

**Referenced in:**

- [§ 9.2.2 Rendering audio](#ref-for-index-term-clipbegin-1 "§ 9.2.2 Rendering audio")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-smil-clipEnd)

**Referenced in:**

- [§ 9.2.2 Rendering audio](#ref-for-index-term-clipend-1 "§ 9.2.2 Rendering audio")

[Permalink](https://www.w3.org/TR/epub-33/#sec-collection-elem)

**Referenced in:**

- [§ 5.6 Collections](#ref-for-index-term-collections-1 "§ 5.6 Collections")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-container-root-url)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-container-root-url-1 "§ 4.1.1 URL of the root directory") [(2)](#ref-for-index-term-container-root-url-2 "Reference 2") [(3)](#ref-for-index-term-container-root-url-3 "Reference 3") [(4)](#ref-for-index-term-container-root-url-4 "Reference 4") [(5)](#ref-for-index-term-container-root-url-5 "Reference 5") [(6)](#ref-for-index-term-container-root-url-6 "Reference 6") [(7)](#ref-for-index-term-container-root-url-7 "Reference 7") [(8)](#ref-for-index-term-container-root-url-8 "Reference 8")

[Permalink](https://www.w3.org/TR/epub-33/#sec-scripted-container-constrained)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-container-constrained-scripting-1 "§ 6.4 Scripting")
- [§ 6.4.3 Security considerations](#ref-for-index-term-container-constrained-scripting-2 "§ 6.4.3 Security considerations")
- [§ B.2 Description](#ref-for-index-term-container-constrained-scripting-3 "§ B.2 Description")
- [§ B.4.1.2 Features](#ref-for-index-term-container-constrained-scripting-4 "§ B.4.1.2 Features")

[Permalink](https://www.w3.org/TR/epub-33/#epub-threat-model)

**Referenced in:**

- [§ 15.2 Threat model](#ref-for-index-term-content-they-read-1 "§ 15.2 Threat model")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-content-url)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-content-url-1 "§ 4.1.1 URL of the root directory")

[Permalink](https://www.w3.org/TR/epub-33/#)

**Referenced in:**

- [§ 1.1 Overview](#ref-for-index-term-core-specification-1 "§ 1.1 Overview")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed)

**Referenced in:**

- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-css-style-sheets-prefixed-properties-1 "§ 6.3 Cascading Style Sheets (CSS)")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-dc-creator)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-dc-creator-element-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-dc-identifier)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-dc-identifier-element-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-dc-language)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-dc-language-element-1 "§ 3.7 Internationalization")
- [§ 5.3 Metadata](#ref-for-index-term-dc-language-element-2 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-dc-title)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-dc-title-element-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#sec-nav-def-types-other)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-declare-an-unknown-value-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#sec-epub-type-attribute)

**Referenced in:**

- [§ 10. Processing structural semantics](#ref-for-index-term-definition-of-epub-type-1 "§ 10. Processing structural semantics") [(2)](#ref-for-index-term-definition-of-epub-type-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#deprecated)

**Referenced in:**

- [§ 6.1.1.2 Content switching (deprecated)](#ref-for-index-term-deprecated-1 "§ 6.1.1.2 Content switching (deprecated)")
- [§ 6.1.1.3 The epub:trigger element (deprecated)](#ref-for-index-term-deprecated-2 "§ 6.1.1.3 The epub:trigger element (deprecated)")
- [§ 9.3.2 Embedded audio and video (deprecated)](#ref-for-index-term-deprecated-3 "§ 9.3.2 Embedded audio and video (deprecated)")
- [§ A. Unsupported features](#ref-for-index-term-deprecated-4 "§ A. Unsupported features")
- [§ B.3 Properties](#ref-for-index-term-deprecated-5 "§ B.3 Properties")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-dir)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-dir-1 "§ 3.7 Internationalization") [(2)](#ref-for-index-term-dir-2 "Reference 2")
- [§ 5.1 Base direction](#ref-for-index-term-dir-3 "§ 5.1 Base direction") [(2)](#ref-for-index-term-dir-4 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#urls-in-ocf-constraints)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-disallowed-1 "§ 4.1.1 URL of the root directory")

[Permalink](https://www.w3.org/TR/epub-33/#duration)

**Referenced in:**

- [§ 9.3.3 Text-to-speech](#ref-for-index-term-duration-1 "§ 9.3.3 Text-to-speech")

[Permalink](https://www.w3.org/TR/epub-33/#sec-ocf)

**Referenced in:**

- [§ 4. Open Container Format (OCF) processing](#ref-for-index-term-epub-container-1 "§ 4. Open Container Format (OCF) processing")
- [§ 15.2 Threat model](#ref-for-index-term-epub-container-2 "§ 15.2 Threat model")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-content-document)

**Referenced in:**

- [§ 1.2 Terminology](#ref-for-index-term-epub-content-documents-1 "§ 1.2 Terminology")
- [§ 1.4.1 Relationship to HTML](#ref-for-index-term-epub-content-documents-2 "§ 1.4.1 Relationship to HTML")
- [§ 3.9 External links](#ref-for-index-term-epub-content-documents-3 "§ 3.9 External links")
- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-epub-content-documents-4 "§ 6.3 Cascading Style Sheets (CSS)")
- [§ 6.4 Scripting](#ref-for-index-term-epub-content-documents-5 "§ 6.4 Scripting")
- [§ 6.4.3 Security considerations](#ref-for-index-term-epub-content-documents-6 "§ 6.4.3 Security considerations")
- [§ 8.1.1.2 The rendition:orientation property](#ref-for-index-term-epub-content-documents-7 "§ 8.1.1.2 The rendition:orientation property")
- [§ 8.2.1 The rendition:flow property](#ref-for-index-term-epub-content-documents-8 "§ 8.2.1 The rendition:flow property")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-epub-content-documents-9 "§ 9.1 Loading the media overlay")
- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-epub-content-documents-10 "§ 9.2.3 Rendering EPUB content document elements")
- [§ 9.3.1 Navigation](#ref-for-index-term-epub-content-documents-11 "§ 9.3.1 Navigation")
- [§ 9.3.3 Text-to-speech](#ref-for-index-term-epub-content-documents-12 "§ 9.3.3 Text-to-speech")
- [§ 10. Processing structural semantics](#ref-for-index-term-epub-content-documents-13 "§ 10. Processing structural semantics")
- [§ 11. Processing property values](#ref-for-index-term-epub-content-documents-14 "§ 11. Processing property values")
- [§ 14. Accessibility](#ref-for-index-term-epub-content-documents-15 "§ 14. Accessibility")

[Permalink](https://www.w3.org/TR/epub-33/#sec-contentdocs)

**Referenced in:**

- [§ 6. EPUB content document processing](#ref-for-index-term-epub-content-documents-0-1 "§ 6. EPUB content document processing")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-creator)

**Referenced in:**

- [§ 2.3 Error reporting](#ref-for-index-term-epub-creators-1 "§ 2.3 Error reporting")
- [§ 4.1.2 File names](#ref-for-index-term-epub-creators-2 "§ 4.1.2 File names")
- [§ 5.4 Manifest](#ref-for-index-term-epub-creators-3 "§ 5.4 Manifest")
- [§ 5.5 Spine](#ref-for-index-term-epub-creators-4 "§ 5.5 Spine")
- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-epub-creators-5 "§ 6.3 Cascading Style Sheets (CSS)")
- [§ 8.2.2 The rendition:align-x-center property](#ref-for-index-term-epub-creators-6 "§ 8.2.2 The rendition:align-x-center property")
- [§ 9.2.2 Rendering audio](#ref-for-index-term-epub-creators-7 "§ 9.2.2 Rendering audio")
- [§ 9.3.1 Navigation](#ref-for-index-term-epub-creators-8 "§ 9.3.1 Navigation")
- [§ 15.2 Threat model](#ref-for-index-term-epub-creators-9 "§ 15.2 Threat model")
- [§ B.1 Interface definition](#ref-for-index-term-epub-creators-10 "§ B.1 Interface definition")
- [§ B.4.1.1 Description](#ref-for-index-term-epub-creators-11 "§ B.4.1.1 Description")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-manifest)

**Referenced in:**

- [§ 9. Media overlays processing](#ref-for-index-term-epub-manifest-1 "§ 9. Media overlays processing")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-epub-manifest-2 "§ 9.1 Loading the media overlay")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-navigation-document)

**Referenced in:**

- [§ 9.3.1 Navigation](#ref-for-index-term-epub-navigation-document-1 "§ 9.3.1 Navigation") [(2)](#ref-for-index-term-epub-navigation-document-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#sec-mo-nav-doc)

**Referenced in:**

- [§ 9.3.1 Navigation](#ref-for-index-term-epub-navigation-document-0-1 "§ 9.3.1 Navigation")

[Permalink](https://www.w3.org/TR/epub-33/#sec-nav)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-epub-navigation-documents-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-publication)

**Referenced in:**

- [§ 1.1 Overview](#ref-for-index-term-epub-publications-1 "§ 1.1 Overview")
- [§ 2.2 Error handling](#ref-for-index-term-epub-publications-2 "§ 2.2 Error handling")
- [§ 2.3 Error reporting](#ref-for-index-term-epub-publications-3 "§ 2.3 Error reporting")
- [§ 4.1.1 URL of the root directory](#ref-for-index-term-epub-publications-4 "§ 4.1.1 URL of the root directory")
- [§ 4.1.3 META-INF directory](#ref-for-index-term-epub-publications-5 "§ 4.1.3 META-INF directory") [(2)](#ref-for-index-term-epub-publications-6 "Reference 2")
- [§ 5.2 Unique identifier](#ref-for-index-term-epub-publications-7 "§ 5.2 Unique identifier")
- [§ 5.3 Metadata](#ref-for-index-term-epub-publications-8 "§ 5.3 Metadata")
- [§ 5.4 Manifest](#ref-for-index-term-epub-publications-9 "§ 5.4 Manifest")
- [§ 5.5 Spine](#ref-for-index-term-epub-publications-10 "§ 5.5 Spine")
- [§ 6.4 Scripting](#ref-for-index-term-epub-publications-11 "§ 6.4 Scripting")
- [§ 6.4.3 Security considerations](#ref-for-index-term-epub-publications-12 "§ 6.4.3 Security considerations")
- [§ 8.2.1 The rendition:flow property](#ref-for-index-term-epub-publications-13 "§ 8.2.1 The rendition:flow property")
- [§ 9.3.1 Navigation](#ref-for-index-term-epub-publications-14 "§ 9.3.1 Navigation")
- [§ 9.3.3 Text-to-speech](#ref-for-index-term-epub-publications-15 "§ 9.3.3 Text-to-speech")
- [§ 12. Backward compatibility](#ref-for-index-term-epub-publications-16 "§ 12. Backward compatibility")
- [§ 13. Forward compatibility](#ref-for-index-term-epub-publications-17 "§ 13. Forward compatibility")
- [§ 14. Accessibility](#ref-for-index-term-epub-publications-18 "§ 14. Accessibility")
- [§ 15.1 Overview](#ref-for-index-term-epub-publications-19 "§ 15.1 Overview")
- [§ 15.2 Threat model](#ref-for-index-term-epub-publications-20 "§ 15.2 Threat model")
- [§ 15.3 Recommendations](#ref-for-index-term-epub-publications-21 "§ 15.3 Recommendations")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-reading-system)

**Referenced in:**

- [§ 1.1 Overview](#ref-for-index-term-epub-reading-system-1 "§ 1.1 Overview")
- [§ 1.2 Terminology](#ref-for-index-term-epub-reading-system-2 "§ 1.2 Terminology")
- [§ 1.4.1 Relationship to HTML](#ref-for-index-term-epub-reading-system-3 "§ 1.4.1 Relationship to HTML")
- [§ 1.4.2 Relationship to SVG](#ref-for-index-term-epub-reading-system-4 "§ 1.4.2 Relationship to SVG")
- [§ 2.1 Requirements](#ref-for-index-term-epub-reading-system-5 "§ 2.1 Requirements")
- [§ 3. Publication resource processing](#ref-for-index-term-epub-reading-system-6 "§ 3. Publication resource processing")
- [§ 3.6 XML processing](#ref-for-index-term-epub-reading-system-7 "§ 3.6 XML processing")
- [§ 4. Open Container Format (OCF) processing](#ref-for-index-term-epub-reading-system-8 "§ 4. Open Container Format (OCF) processing")
- [§ 5. Package document processing](#ref-for-index-term-epub-reading-system-9 "§ 5. Package document processing")
- [§ 6.1 XHTML content documents](#ref-for-index-term-epub-reading-system-10 "§ 6.1 XHTML content documents")
- [§ 6.2 SVG content documents](#ref-for-index-term-epub-reading-system-11 "§ 6.2 SVG content documents")
- [§ 6.4 Scripting](#ref-for-index-term-epub-reading-system-12 "§ 6.4 Scripting")
- [§ 7. Navigation document processing](#ref-for-index-term-epub-reading-system-13 "§ 7. Navigation document processing")
- [§ 8.1 Fixed-layout documents](#ref-for-index-term-epub-reading-system-14 "§ 8.1 Fixed-layout documents")
- [§ 8.2 Reflowable layouts](#ref-for-index-term-epub-reading-system-15 "§ 8.2 Reflowable layouts")
- [§ 8.4 Custom properties](#ref-for-index-term-epub-reading-system-16 "§ 8.4 Custom properties")
- [§ 9. Media overlays processing](#ref-for-index-term-epub-reading-system-17 "§ 9. Media overlays processing")
- [§ 10. Processing structural semantics](#ref-for-index-term-epub-reading-system-18 "§ 10. Processing structural semantics")
- [§ 11. Processing property values](#ref-for-index-term-epub-reading-system-19 "§ 11. Processing property values") [(2)](#ref-for-index-term-epub-reading-system-20 "Reference 2")
- [§ 12. Backward compatibility](#ref-for-index-term-epub-reading-system-21 "§ 12. Backward compatibility")
- [§ 13. Forward compatibility](#ref-for-index-term-epub-reading-system-22 "§ 13. Forward compatibility")
- [§ 14. Accessibility](#ref-for-index-term-epub-reading-system-23 "§ 14. Accessibility")
- [§ 15.1 Overview](#ref-for-index-term-epub-reading-system-24 "§ 15.1 Overview")
- [§ A. Unsupported features](#ref-for-index-term-epub-reading-system-25 "§ A. Unsupported features")
- [§ B. epubReadingSystem object](#ref-for-index-term-epub-reading-system-26 "§ B. epubReadingSystem object")
- [§ D. Change log](#ref-for-index-term-epub-reading-system-27 "§ D. Change log")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-spine)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-epub-spine-1 "§ 7. Navigation document processing")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-epub-spine-2 "§ 9.1 Loading the media overlay")
- [§ 9.3.1 Navigation](#ref-for-index-term-epub-spine-3 "§ 9.3.1 Navigation")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-epub-type)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-epub-type-attribute-1 "§ 7. Navigation document processing")
- [§ 9.4.1 Skippability](#ref-for-index-term-epub-type-attribute-2 "§ 9.4.1 Skippability")
- [§ 9.4.2 Escapability](#ref-for-index-term-epub-type-attribute-3 "§ 9.4.2 Escapability")
- [§ 10. Processing structural semantics](#ref-for-index-term-epub-type-attribute-4 "§ 10. Processing structural semantics")
- [§ 11. Processing property values](#ref-for-index-term-epub-type-attribute-5 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#sec-escapability)

**Referenced in:**

- [§ 9.4.2 Escapability](#ref-for-index-term-escapable-structures-1 "§ 9.4.2 Escapability")

[Permalink](https://www.w3.org/TR/epub-33/#sec-fxl-icb-html)

**Referenced in:**

- [§ 8.1.2 Initial containing block dimensions](#ref-for-index-term-expressing-in-html-1 "§ 8.1.2 Initial containing block dimensions")

[Permalink](https://www.w3.org/TR/epub-33/#sec-fxl-icb-svg)

**Referenced in:**

- [§ 8.1.2 Initial containing block dimensions](#ref-for-index-term-expressing-the-icb-in-svg-1 "§ 8.1.2 Initial containing block dimensions")

[Permalink](https://www.w3.org/TR/epub-33/#confreq-cd-scripted-flbk)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-fallbacks-for-scripted-content-documents-1 "§ 6.4 Scripting")

[Permalink](https://www.w3.org/TR/epub-33/#sec-container-filenames)

**Referenced in:**

- [§ 4.1.2 File names](#ref-for-index-term-file-name-and-file-path-restrictions-1 "§ 4.1.2 File names")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-fixed-layout-document)

**Referenced in:**

- [§ 2.3 Error reporting](#ref-for-index-term-fixed-layout-document-1 "§ 2.3 Error reporting")
- [§ 8.1.3 Viewport rendering](#ref-for-index-term-fixed-layout-document-2 "§ 8.1.3 Viewport rendering")
- [§ 8.3 The viewport meta tag](#ref-for-index-term-fixed-layout-document-3 "§ 8.3 The viewport meta tag")
- [§ 14. Accessibility](#ref-for-index-term-fixed-layout-document-4 "§ 14. Accessibility")

[Permalink](https://www.w3.org/TR/epub-33/#sec-fixed-layouts)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-fixed-layout-documents-1 "§ 6.4 Scripting")
- [§ 8.1 Fixed-layout documents](#ref-for-index-term-fixed-layout-documents-2 "§ 8.1 Fixed-layout documents")

[Permalink](https://www.w3.org/TR/epub-33/#sec-font-obfuscation)

**Referenced in:**

- [§ 4.3 Font obfuscation](#ref-for-index-term-font-obfuscation-1 "§ 4.3 Font obfuscation")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-foreign-resource)

**Referenced in:**

- [§ 3.2 Foreign resources](#ref-for-index-term-foreign-resource-1 "§ 3.2 Foreign resources")

[Permalink](https://www.w3.org/TR/epub-33/#sec-foreign-resources)

**Referenced in:**

- [§ 3.2 Foreign resources](#ref-for-index-term-foreign-resources-1 "§ 3.2 Foreign resources")

[Permalink](https://www.w3.org/TR/epub-33/#sec-media-overlays-fragids)

**Referenced in:**

- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-fragment-identifier-1 "§ 9.2.3 Rendering EPUB content document elements")

[Permalink](https://www.w3.org/TR/epub-33/#app-rendering-vocab)

**Referenced in:**

- [§ 5.5.1 Spine overrides](#ref-for-index-term-global-rendering-property-1 "§ 5.5.1 Spine overrides")
- [§ 8.4 Custom properties](#ref-for-index-term-global-rendering-property-2 "§ 8.4 Custom properties")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-hreflang)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-hreflang-attributes-1 "§ 3.7 Internationalization")
- [§ 5.3 Metadata](#ref-for-index-term-hreflang-attributes-2 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#identifier-type)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-identifier-type-property-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#cmt-grp-image)

**Referenced in:**

- [§ 3.1 Core Media types](#ref-for-index-term-image-core-media-type-resources-1 "§ 3.1 Core Media types")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-item)

**Referenced in:**

- [§ 9. Media overlays processing](#ref-for-index-term-item-element-1 "§ 9. Media overlays processing")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-item-element-2 "§ 9.1 Loading the media overlay")
- [§ 11. Processing property values](#ref-for-index-term-item-element-3 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-itemref)

**Referenced in:**

- [§ 2.1 Requirements](#ref-for-index-term-itemref-element-1 "§ 2.1 Requirements")
- [§ 5.5.1 Spine overrides](#ref-for-index-term-itemref-element-2 "§ 5.5.1 Spine overrides")
- [§ 8.1.1.1 The rendition:layout property](#ref-for-index-term-itemref-element-3 "§ 8.1.1.1 The rendition:layout property")
- [§ 8.2.1 The rendition:flow property](#ref-for-index-term-itemref-element-4 "§ 8.2.1 The rendition:flow property")
- [§ 11. Processing property values](#ref-for-index-term-itemref-element-5 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#sec-nav-landmarks)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-landmarks-nav-element-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#layout-overrides)

**Referenced in:**

- [§ 5.5.1 Spine overrides](#ref-for-index-term-layout-pre-paginated-override-1 "§ 5.5.1 Spine overrides")

[Permalink](https://www.w3.org/TR/epub-33/#sec-pkg-legacy)

**Referenced in:**

- [§ 5.7 Legacy features](#ref-for-index-term-legacy-features-1 "§ 5.7 Legacy features")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-link)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-link-element-1 "§ 3.7 Internationalization")
- [§ 11. Processing property values](#ref-for-index-term-link-element-2 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#sec-link-elem)

**Referenced in:**

- [§ 3.9 External links](#ref-for-index-term-linked-records-1 "§ 3.9 External links")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-linked-resource)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-linked-resources-1 "§ 5.3 Metadata")
- [§ 5.4 Manifest](#ref-for-index-term-linked-resources-2 "§ 5.4 Manifest")

[Permalink](https://www.w3.org/TR/epub-33/#confreq-nav-a)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-links-and-headings-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#flow-overrides)

**Referenced in:**

- [§ 8.2.1 The rendition:flow property](#ref-for-index-term-locally-overridden-1 "§ 8.2.1 The rendition:flow property")

[Permalink](https://www.w3.org/TR/epub-33/#sec-manifest-fallbacks)

**Referenced in:**

- [§ 5.4 Manifest](#ref-for-index-term-manifest-fallback-chain-1 "§ 5.4 Manifest") [(2)](#ref-for-index-term-manifest-fallback-chain-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#sec-item-elem)

**Referenced in:**

- [§ 5.5 Spine](#ref-for-index-term-manifest-items-1 "§ 5.5 Spine")

[Permalink](https://www.w3.org/TR/epub-33/#sec-container-metainf-manifest.xml)

**Referenced in:**

- [§ 4.1.3 META-INF directory](#ref-for-index-term-manifest-xml-file-1 "§ 4.1.3 META-INF directory")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-media-overlay-document)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-media-overlay-documents-1 "§ 3.7 Internationalization")
- [§ 9.3.1 Navigation](#ref-for-index-term-media-overlay-documents-2 "§ 9.3.1 Navigation")
- [§ 11. Processing property values](#ref-for-index-term-media-overlay-documents-3 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#sec-media-overlays)

**Referenced in:**

- [§ 9. Media overlays processing](#ref-for-index-term-media-overlays-1 "§ 9. Media overlays processing")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-item-media-overlay)

**Referenced in:**

- [§ 9. Media overlays processing](#ref-for-index-term-media-overlay-attribute-1 "§ 9. Media overlays processing")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-meta)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-meta-element-1 "§ 5.3 Metadata") [(2)](#ref-for-index-term-meta-element-2 "Reference 2")
- [§ 8.1.1.1 The rendition:layout property](#ref-for-index-term-meta-element-3 "§ 8.1.1.1 The rendition:layout property")
- [§ 8.1.1.2 The rendition:orientation property](#ref-for-index-term-meta-element-4 "§ 8.1.1.2 The rendition:orientation property")
- [§ 8.1.1.3 The rendition:spread property](#ref-for-index-term-meta-element-5 "§ 8.1.1.3 The rendition:spread property")
- [§ 11. Processing property values](#ref-for-index-term-meta-element-6 "§ 11. Processing property values") [(2)](#ref-for-index-term-meta-element-7 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#sec-container-metainf-metadata.xml)

**Referenced in:**

- [§ 4.1.3 META-INF directory](#ref-for-index-term-metadata-xml-files-1 "§ 4.1.3 META-INF directory")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-ocf-abstract-container)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-ocf-abstract-container-1 "§ 4.1.1 URL of the root directory")
- [§ 4.2 OCF ZIP container](#ref-for-index-term-ocf-abstract-container-2 "§ 4.2 OCF ZIP container")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-ocf-zip-container)

**Referenced in:**

- [§ 4.2 OCF ZIP container](#ref-for-index-term-ocf-zip-container-1 "§ 4.2 OCF ZIP container")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-package-document)

**Referenced in:**

- [§ 2.1 Requirements](#ref-for-index-term-package-document-1 "§ 2.1 Requirements")
- [§ 3.7 Internationalization](#ref-for-index-term-package-document-2 "§ 3.7 Internationalization") [(2)](#ref-for-index-term-package-document-3 "Reference 2")
- [§ 3.9 External links](#ref-for-index-term-package-document-4 "§ 3.9 External links")
- [§ 4.1.3 META-INF directory](#ref-for-index-term-package-document-5 "§ 4.1.3 META-INF directory")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-package-document-6 "§ 9.1 Loading the media overlay")
- [§ 11. Processing property values](#ref-for-index-term-package-document-7 "§ 11. Processing property values")
- [§ 12. Backward compatibility](#ref-for-index-term-package-document-8 "§ 12. Backward compatibility")
- [§ 13. Forward compatibility](#ref-for-index-term-package-document-9 "§ 13. Forward compatibility")

[Permalink](https://www.w3.org/TR/epub-33/#sec-package-doc)

**Referenced in:**

- [§ 5. Package document processing](#ref-for-index-term-package-document-0-1 "§ 5. Package document processing")
- [§ 15.2 Threat model](#ref-for-index-term-package-document-0-2 "§ 15.2 Threat model")

[Permalink](https://www.w3.org/TR/epub-33/#elemdef-opf-metadata)

**Referenced in:**

- [§ 8.1.1.1 The rendition:layout property](#ref-for-index-term-package-document-metadata-1 "§ 8.1.1.1 The rendition:layout property")
- [§ 8.1.1.2 The rendition:orientation property](#ref-for-index-term-package-document-metadata-2 "§ 8.1.1.2 The rendition:orientation property")
- [§ 8.1.1.3 The rendition:spread property](#ref-for-index-term-package-document-metadata-3 "§ 8.1.1.3 The rendition:spread property")
- [§ 8.2.1 The rendition:flow property](#ref-for-index-term-package-document-metadata-4 "§ 8.2.1 The rendition:flow property")

[Permalink](https://www.w3.org/TR/epub-33/#sec-nav-pagelist)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-page-list-nav-element-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-spine-page-progression-direction)

**Referenced in:**

- [§ 5.5 Spine](#ref-for-index-term-page-progression-direction-attribute-1 "§ 5.5 Spine")
- [§ 8.1.1.4 The rendition:page-spread-\* properties](#ref-for-index-term-page-progression-direction-attribute-2 "§ 8.1.1.4 The rendition:page-spread-* properties")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-par)

**Referenced in:**

- [§ 9.2.1 Timing and synchronization](#ref-for-index-term-par-element-1 "§ 9.2.1 Timing and synchronization")

[Permalink](https://www.w3.org/TR/epub-33/#sec-parsing-urls-metainf)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-parsing-urls-in-the-meta-inf-directory-1 "§ 4.1.1 URL of the root directory")

[Permalink](https://www.w3.org/TR/epub-33/#playback-active-class)

**Referenced in:**

- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-playback-active-class-1 "§ 9.2.3 Rendering EPUB content document elements")

[Permalink](https://www.w3.org/TR/epub-33/#property.ebnf.prefix)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-prefix-1 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-itemref-linear)

**Referenced in:**

- [§ 5.5 Spine](#ref-for-index-term-primary-linear-itemref-1 "§ 5.5 Spine") [(2)](#ref-for-index-term-primary-linear-itemref-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-req)

**Referenced in:**

- [§ 6. EPUB content document processing](#ref-for-index-term-prohibiting-css-for-setting-language-and-direction-1 "§ 6. EPUB content document processing")

[Permalink](https://www.w3.org/TR/epub-33/#sec-item-resource-properties)

**Referenced in:**

- [§ 5.4 Manifest](#ref-for-index-term-properties-attribute-1 "§ 5.4 Manifest")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-item-properties)

**Referenced in:**

- [§ 5.4 Manifest](#ref-for-index-term-properties-attribute-0-1 "§ 5.4 Manifest")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-properties)

**Referenced in:**

- [§ 5.5 Spine](#ref-for-index-term-properties-attributes-1 "§ 5.5 Spine")
- [§ 5.5.1 Spine overrides](#ref-for-index-term-properties-attributes-2 "§ 5.5.1 Spine overrides")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-meta-property)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-property-attributes-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#sec-property-datatype)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-property-data-type-values-1 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#sec-publication-resources)

**Referenced in:**

- [§ 3. Publication resource processing](#ref-for-index-term-publication-resources-1 "§ 3. Publication resource processing")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-publication-resource)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-publication-resources-0-1 "§ 3.7 Internationalization") [(2)](#ref-for-index-term-publication-resources-0-2 "Reference 2")
- [§ 5.3 Metadata](#ref-for-index-term-publication-resources-0-3 "§ 5.3 Metadata")
- [§ 5.4 Manifest](#ref-for-index-term-publication-resources-0-4 "§ 5.4 Manifest")
- [§ 7. Navigation document processing](#ref-for-index-term-publication-resources-0-5 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#property.ebnf.reference)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-reference-1 "§ 11. Processing property values") [(2)](#ref-for-index-term-reference-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#sec-reflowable-layouts)

**Referenced in:**

- [§ 8.2 Reflowable layouts](#ref-for-index-term-reflowable-layout-properties-1 "§ 8.2 Reflowable layouts")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-remote-resource)

**Referenced in:**

- [§ 3.3 Resource locations](#ref-for-index-term-remote-resources-1 "§ 3.3 Resource locations")
- [§ 15.2 Threat model](#ref-for-index-term-remote-resources-2 "§ 15.2 Threat model") [(2)](#ref-for-index-term-remote-resources-3 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-33/#layout)

**Referenced in:**

- [§ 8.1.1.1 The rendition:layout property](#ref-for-index-term-rendition-layout-property-1 "§ 8.1.1.1 The rendition:layout property")

[Permalink](https://www.w3.org/TR/epub-33/#orientation)

**Referenced in:**

- [§ 8.1.1.2 The rendition:orientation property](#ref-for-index-term-rendition-orientation-property-1 "§ 8.1.1.2 The rendition:orientation property")

[Permalink](https://www.w3.org/TR/epub-33/#fxl-page-spread-left)

**Referenced in:**

- [§ 8.1.1.4 The rendition:page-spread-\* properties](#ref-for-index-term-rendition-page-spread-left-property-1 "§ 8.1.1.4 The rendition:page-spread-* properties")

[Permalink](https://www.w3.org/TR/epub-33/#fxl-page-spread-right)

**Referenced in:**

- [§ 8.1.1.4 The rendition:page-spread-\* properties](#ref-for-index-term-rendition-page-spread-right-property-1 "§ 8.1.1.4 The rendition:page-spread-* properties")

[Permalink](https://www.w3.org/TR/epub-33/#spread)

**Referenced in:**

- [§ 8.1.1.3 The rendition:spread property](#ref-for-index-term-rendition-spread-1 "§ 8.1.1.3 The rendition:spread property")

[Permalink](https://www.w3.org/TR/epub-33/#sec-container-metainf-files)

**Referenced in:**

- [§ 4.1.3 META-INF directory](#ref-for-index-term-reserved-files-1 "§ 4.1.3 META-INF directory")

[Permalink](https://www.w3.org/TR/epub-33/#sec-reserved-prefixes)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-reserved-prefix-1 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#sec-resource-locations)

**Referenced in:**

- [§ 3.3 Resource locations](#ref-for-index-term-resource-locations-1 "§ 3.3 Resource locations")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-root-directory)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-root-directory-1 "§ 4.1.1 URL of the root directory")
- [§ 4.2 OCF ZIP container](#ref-for-index-term-root-directory-2 "§ 4.2 OCF ZIP container")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-rootfile)

**Referenced in:**

- [§ 4.1.3 META-INF directory](#ref-for-index-term-rootfile-element-1 "§ 4.1.3 META-INF directory")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-scheme)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-scheme-attribute-1 "§ 5.3 Metadata")
- [§ 11. Processing property values](#ref-for-index-term-scheme-attribute-2 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-scripted-content-document)

**Referenced in:**

- [§ 3.8 Network access](#ref-for-index-term-scripted-content-documents-1 "§ 3.8 Network access")
- [§ 6.4 Scripting](#ref-for-index-term-scripted-content-documents-2 "§ 6.4 Scripting")
- [§ B.2 Description](#ref-for-index-term-scripted-content-documents-3 "§ B.2 Description")

[Permalink](https://www.w3.org/TR/epub-33/#sec-scripted-content)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-scripting-1 "§ 6.4 Scripting")

[Permalink](https://www.w3.org/TR/epub-33/#sec-security-privacy)

**Referenced in:**

- [§ 15.1 Overview](#ref-for-index-term-security-and-privacy-section-1 "§ 15.1 Overview")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-seq)

**Referenced in:**

- [§ 9.2.1 Timing and synchronization](#ref-for-index-term-seq-element-1 "§ 9.2.1 Timing and synchronization")

[Permalink](https://www.w3.org/TR/epub-33/#sec-container-metainf-signatures.xml)

**Referenced in:**

- [§ 4.1.3 META-INF directory](#ref-for-index-term-signatures-xml-file-1 "§ 4.1.3 META-INF directory")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-spine)

**Referenced in:**

- [§ 5.5 Spine](#ref-for-index-term-spine-element-1 "§ 5.5 Spine")
- [§ 5.5.1 Spine overrides](#ref-for-index-term-spine-element-2 "§ 5.5.1 Spine overrides")
- [§ 8.1.2 Initial containing block dimensions](#ref-for-index-term-spine-element-3 "§ 8.1.2 Initial containing block dimensions")

[Permalink](https://www.w3.org/TR/epub-33/#sec-scripted-spine)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-spine-level-scripting-1 "§ 6.4 Scripting") [(2)](#ref-for-index-term-spine-level-scripting-2 "Reference 2")
- [§ 6.4.3 Security considerations](#ref-for-index-term-spine-level-scripting-3 "§ 6.4.3 Security considerations")
- [§ B.4.1.2 Features](#ref-for-index-term-spine-level-scripting-4 "§ B.4.1.2 Features") [(2)](#ref-for-index-term-spine-level-scripting-5 "Reference 2") [(3)](#ref-for-index-term-spine-level-scripting-6 "Reference 3")

[Permalink](https://www.w3.org/TR/epub-33/#app-structural-semantics)

**Referenced in:**

- [§ 10. Processing structural semantics](#ref-for-index-term-structural-semantics-1 "§ 10. Processing structural semantics")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-svg-content-document)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-svg-content-documents-1 "§ 3.7 Internationalization")
- [§ 6.1.2.3.1 Embedded SVG and CSS](#ref-for-index-term-svg-content-documents-2 "§ 6.1.2.3.1 Embedded SVG and CSS")
- [§ 8.1.2 Initial containing block dimensions](#ref-for-index-term-svg-content-documents-3 "§ 8.1.2 Initial containing block dimensions")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-svg-content-documents-4 "§ 9.1 Loading the media overlay")

[Permalink](https://www.w3.org/TR/epub-33/#sec-svg)

**Referenced in:**

- [§ 6.2 SVG content documents](#ref-for-index-term-svg-content-documents-0-1 "§ 6.2 SVG content documents")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-synthetic-spread)

**Referenced in:**

- [§ 1.2 Terminology](#ref-for-index-term-synthetic-spreads-1 "§ 1.2 Terminology")
- [§ 8.1.1.1 The rendition:layout property](#ref-for-index-term-synthetic-spreads-2 "§ 8.1.1.1 The rendition:layout property")
- [§ 8.1.1.3 The rendition:spread property](#ref-for-index-term-synthetic-spreads-3 "§ 8.1.1.3 The rendition:spread property")
- [§ 8.1.1.4 The rendition:page-spread-\* properties](#ref-for-index-term-synthetic-spreads-4 "§ 8.1.1.4 The rendition:page-spread-* properties")

[Permalink](https://www.w3.org/TR/epub-33/#sec-terminology)

**Referenced in:**

- [§ 1.2 Terminology](#ref-for-index-term-terminology-defined-in-epub-3-3-1 "§ 1.2 Terminology")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-text)

**Referenced in:**

- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-text-element-1 "§ 9.2.3 Rendering EPUB content document elements")
- [§ 9.3.3 Text-to-speech](#ref-for-index-term-text-element-2 "§ 9.3.3 Text-to-speech")

[Permalink](https://www.w3.org/TR/epub-33/#confreq-nav-a-title)

**Referenced in:**

- [§ 14. Accessibility](#ref-for-index-term-text-alternatives-for-visual-content-1 "§ 14. Accessibility")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-package-version)

**Referenced in:**

- [§ 5.7 Legacy features](#ref-for-index-term-this-version-of-epub-1 "§ 5.7 Legacy features")
- [§ 12. Backward compatibility](#ref-for-index-term-this-version-of-epub-2 "§ 12. Backward compatibility")
- [§ 13. Forward compatibility](#ref-for-index-term-this-version-of-epub-3 "§ 13. Forward compatibility")

[Permalink](https://www.w3.org/TR/epub-33/#sec-nav-toc)

**Referenced in:**

- [§ 7. Navigation document processing](#ref-for-index-term-toc-nav-element-1 "§ 7. Navigation document processing")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-top-level-content-document)

**Referenced in:**

- [§ 3.4 Data URLs](#ref-for-index-term-top-level-content-documents-1 "§ 3.4 Data URLs")
- [§ 5.4 Manifest](#ref-for-index-term-top-level-content-documents-2 "§ 5.4 Manifest")
- [§ B.4.1.2 Features](#ref-for-index-term-top-level-content-documents-3 "§ B.4.1.2 Features")

[Permalink](https://www.w3.org/TR/epub-33/#under-implemented)

**Referenced in:**

- [§ 5.1 Base direction](#ref-for-index-term-under-implemented-1 "§ 5.1 Base direction")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-unique-identifier)

**Referenced in:**

- [§ 5.2 Unique identifier](#ref-for-index-term-unique-identifier-1 "§ 5.2 Unique identifier")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-value)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-values-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-viewport)

**Referenced in:**

- [§ 1.2 Terminology](#ref-for-index-term-viewport-1 "§ 1.2 Terminology")
- [§ 2.1 Requirements](#ref-for-index-term-viewport-2 "§ 2.1 Requirements")
- [§ 3.1 Core Media types](#ref-for-index-term-viewport-3 "§ 3.1 Core Media types")
- [§ 6.1.2.2 MathML](#ref-for-index-term-viewport-4 "§ 6.1.2.2 MathML")
- [§ 6.2 SVG content documents](#ref-for-index-term-viewport-5 "§ 6.2 SVG content documents")
- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-viewport-6 "§ 6.3 Cascading Style Sheets (CSS)")
- [§ 8.1.1.3 The rendition:spread property](#ref-for-index-term-viewport-7 "§ 8.1.1.3 The rendition:spread property")
- [§ 8.1.3 Viewport rendering](#ref-for-index-term-viewport-8 "§ 8.1.3 Viewport rendering")
- [§ 8.2.2 The rendition:align-x-center property](#ref-for-index-term-viewport-9 "§ 8.2.2 The rendition:align-x-center property")
- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-viewport-10 "§ 9.2.3 Rendering EPUB content document elements")

[Permalink](https://www.w3.org/TR/epub-33/#app-viewport-meta)

**Referenced in:**

- [§ 8.3 The viewport meta tag](#ref-for-index-term-viewport-meta-declarations-1 "§ 8.3 The viewport meta tag")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css)

**Referenced in:**

- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-visual-rendering-of-xhtml-content-documents-via-css-1 "§ 6.3 Cascading Style Sheets (CSS)")

[Permalink](https://www.w3.org/TR/epub-33/#sec-vocab-assoc)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-vocabulary-association-mechanisms-1 "§ 11. Processing property values")

[Permalink](https://www.w3.org/TR/epub-33/#dfn-xhtml-content-document)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-xhtml-content-documents-1 "§ 3.7 Internationalization")
- [§ 5.5 Spine](#ref-for-index-term-xhtml-content-documents-2 "§ 5.5 Spine")
- [§ 6.1.2.2 MathML](#ref-for-index-term-xhtml-content-documents-3 "§ 6.1.2.2 MathML")
- [§ 6.1.2.3 Embedded SVG](#ref-for-index-term-xhtml-content-documents-4 "§ 6.1.2.3 Embedded SVG")
- [§ 6.1.2.3.1 Embedded SVG and CSS](#ref-for-index-term-xhtml-content-documents-5 "§ 6.1.2.3.1 Embedded SVG and CSS")
- [§ 8.1.1.4 The rendition:page-spread-\* properties](#ref-for-index-term-xhtml-content-documents-6 "§ 8.1.1.4 The rendition:page-spread-* properties")
- [§ 8.1.2 Initial containing block dimensions](#ref-for-index-term-xhtml-content-documents-7 "§ 8.1.2 Initial containing block dimensions")
- [§ 8.2.1 The rendition:flow property](#ref-for-index-term-xhtml-content-documents-8 "§ 8.2.1 The rendition:flow property")
- [§ 9.1 Loading the media overlay](#ref-for-index-term-xhtml-content-documents-9 "§ 9.1 Loading the media overlay")
- [§ 9.3.1 Navigation](#ref-for-index-term-xhtml-content-documents-10 "§ 9.3.1 Navigation")

[Permalink](https://www.w3.org/TR/epub-33/#sec-xhtml)

**Referenced in:**

- [§ 6.1 XHTML content documents](#ref-for-index-term-xhtml-content-documents-0-1 "§ 6.1 XHTML content documents")

[Permalink](https://www.w3.org/TR/epub-33/#attrdef-xml-lang)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-xml-lang-1 "§ 3.7 Internationalization")

[Permalink](https://www.w3.org/TR/epub-tts-10/#)

**Referenced in:**

- [§ 9.3.3 Text-to-speech](#ref-for-index-term-epub-3-text-to-speech-support-1 "§ 9.3.3 Text-to-speech")

[Permalink](https://html.spec.whatwg.org/multipage/#encoding-microdata)

**Referenced in:**

- [§ 6.1.2.1 Microdata](#ref-for-index-term-attribute-processing-model-1 "§ 6.1.2.1 Microdata")

[Permalink](https://html.spec.whatwg.org/multipage/#json)

**Referenced in:**

- [§ 6.1.2.1 Microdata](#ref-for-index-term-conversion-to-json-1 "§ 6.1.2.1 Microdata")

[Permalink](https://html.spec.whatwg.org/multipage/#dom-document-cookie)

**Referenced in:**

- [§ 6.4.1 Local storage](#ref-for-index-term-cookies-1 "§ 6.4.1 Local storage")
- [§ 6.4.3 Security considerations](#ref-for-index-term-cookies-2 "§ 6.4.3 Security considerations")

[Permalink](https://html.spec.whatwg.org/multipage/#the-end)

**Referenced in:**

- [§ B.2 Description](#ref-for-index-term-domcontentloaded-event-is-triggered-1 "§ B.2 Description")

[Permalink](https://html.spec.whatwg.org/multipage/forms.html#the-form-element)

**Referenced in:**

- [§ 6.1.2.4 Form submission](#ref-for-index-term-form-element-1 "§ 6.1.2.4 Form submission")

[Permalink](https://html.spec.whatwg.org/multipage/#dom-localstorage)

**Referenced in:**

- [§ 6.4.1 Local storage](#ref-for-index-term-local-storage-1 "§ 6.4.1 Local storage")

[Permalink](https://html.spec.whatwg.org/multipage/system-state.html#navigator)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-navigator-interface-1 "§ B.1 Interface definition") [(2)](#ref-for-index-term-navigator-interface-2 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/#the-navigator-object)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-navigator-object-1 "§ 6.4 Scripting")

[Permalink](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element)

**Referenced in:**

- [§ 6.1.2.3.1 Embedded SVG and CSS](#ref-for-index-term-object-type-1 "§ 6.1.2.3.1 Embedded SVG and CSS")

[Permalink](https://html.spec.whatwg.org/multipage/#origin)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-origin-1 "§ 4.1.1 URL of the root directory")
- [§ 6.4 Scripting](#ref-for-index-term-origin-2 "§ 6.4 Scripting") [(2)](#ref-for-index-term-origin-3 "Reference 2")
- [§ 6.4.3 Security considerations](#ref-for-index-term-origin-4 "§ 6.4.3 Security considerations")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#attr-style)

**Referenced in:**

- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-style-attribute-for-html-global-element-1 "§ 6.3 Cascading Style Sheets (CSS)")

[Permalink](https://html.spec.whatwg.org/multipage/#rendering)

**Referenced in:**

- [§ 6.3 Cascading Style Sheets (CSS)](#ref-for-index-term-suggested-default-rendering-1 "§ 6.3 Cascading Style Sheets (CSS)")

[Permalink](https://html.spec.whatwg.org/multipage/document-sequences.html#top-level-browsing-context)

**Referenced in:**

- [§ 3.4 Data URLs](#ref-for-index-term-top-level-browsing-contexts-1 "§ 3.4 Data URLs")

[Permalink](https://html.spec.whatwg.org/multipage/#webstorage)

**Referenced in:**

- [§ 6.4.1 Local storage](#ref-for-index-term-web-storage-1 "§ 6.4.1 Local storage")
- [§ 6.4.3 Security considerations](#ref-for-index-term-web-storage-2 "§ 6.4.3 Security considerations")

[Permalink](https://html.spec.whatwg.org/multipage/workers.html#workernavigator)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-workernavigator-interface-1 "§ B.1 Interface definition")

[Permalink](https://infra.spec.whatwg.org/#nulls)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-null-1 "§ 11. Processing property values") [(2)](#ref-for-index-term-null-2 "Reference 2") [(3)](#ref-for-index-term-null-3 "Reference 3") [(4)](#ref-for-index-term-null-4 "Reference 4") [(5)](#ref-for-index-term-null-5 "Reference 5") [(6)](#ref-for-index-term-null-6 "Reference 6")

[Permalink](https://infra.spec.whatwg.org/#string)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-string-1 "§ 11. Processing property values") [(2)](#ref-for-index-term-string-2 "Reference 2") [(3)](#ref-for-index-term-string-3 "Reference 3")

[Permalink](https://infra.spec.whatwg.org/#strip-and-collapse-ascii-whitespace)

**Referenced in:**

- [§ 5.3 Metadata](#ref-for-index-term-strip-and-collapse-ascii-whitespace-1 "§ 5.3 Metadata")

[Permalink](https://www.w3.org/TR/MathML3/chapter5.html#mixing.elements.annotation.xml)

**Referenced in:**

- [§ 6.1.2.2 MathML](#ref-for-index-term-annotation-xml-elements-1 "§ 6.1.2.2 MathML")

[Permalink](https://www.w3.org/TR/MathML3/chapter4.html#)

**Referenced in:**

- [§ 6.1.2.2 MathML](#ref-for-index-term-content-mathml-1 "§ 6.1.2.2 MathML")

[Permalink](https://www.w3.org/TR/MathML3/chapter2.html#fund.mathmlconf)

**Referenced in:**

- [§ 6.1.2.2 MathML](#ref-for-index-term-input-compliant-processor-1 "§ 6.1.2.2 MathML")

[Permalink](https://www.w3.org/TR/MathML3/chapter3.html#)

**Referenced in:**

- [§ 6.1.2.2 MathML](#ref-for-index-term-presentation-mathml-1 "§ 6.1.2.2 MathML")

[Permalink](https://www.w3.org/TR/rdfa-core/#s_model)

**Referenced in:**

- [§ 6.1.1.1 RDFa](#ref-for-index-term-attribute-processing-model-0-1 "§ 6.1.1.1 RDFa")

[Permalink](https://url.spec.whatwg.org/#concept-base-url)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-base-1 "§ 4.1.1 URL of the root directory") [(2)](#ref-for-index-term-base-2 "Reference 2") [(3)](#ref-for-index-term-base-3 "Reference 3")

[Permalink](https://url.spec.whatwg.org/#origin)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-origin-0-1 "§ 4.1.1 URL of the root directory")

[Permalink](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-path-relative-scheme-less-url-string-1 "§ 11. Processing property values")

[Permalink](https://url.spec.whatwg.org/#concept-url-scheme)

**Referenced in:**

- [§ 3.9 External links](#ref-for-index-term-scheme-1 "§ 3.9 External links")

[Permalink](https://url.spec.whatwg.org/#concept-url-parser)

**Referenced in:**

- [§ 4.1.1 URL of the root directory](#ref-for-index-term-url-parser-1 "§ 4.1.1 URL of the root directory") [(2)](#ref-for-index-term-url-parser-2 "Reference 2")
- [§ 11. Processing property values](#ref-for-index-term-url-parser-3 "§ 11. Processing property values")

[Permalink](https://url.spec.whatwg.org/#url-fragment-string)

**Referenced in:**

- [§ 9.2.3 Rendering EPUB content document elements](#ref-for-index-term-url-fragment-string-1 "§ 9.2.3 Rendering EPUB content document elements")

[Permalink](https://url.spec.whatwg.org/#url-scheme-string)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-url-scheme-string-1 "§ 11. Processing property values")

[Permalink](https://url.spec.whatwg.org/#valid-url-string)

**Referenced in:**

- [§ 11. Processing property values](#ref-for-index-term-valid-url-string-1 "§ 11. Processing property values")

[Permalink](https://webidl.spec.whatwg.org/#idl-boolean)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-boolean-type-1 "§ B.1 Interface definition")

[Permalink](https://webidl.spec.whatwg.org/#idl-DOMString)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-domstring-interface-1 "§ B.1 Interface definition") [(2)](#ref-for-index-term-domstring-interface-2 "Reference 2")

[Permalink](https://webidl.spec.whatwg.org/#Exposed)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-exposed-extended-attribute-1 "§ B.1 Interface definition")

[Permalink](https://webidl.spec.whatwg.org/#LegacyUnforgeable)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-legacyunforgeable-extended-attribute-1 "§ B.1 Interface definition")

[Permalink](https://webidl.spec.whatwg.org/#SameObject)

**Referenced in:**

- [§ B.1 Interface definition](#ref-for-index-term-sameobject-extended-attribute-1 "§ B.1 Interface definition")

[Permalink](https://www.w3.org/TR/xml/#sec-external-ent)

**Referenced in:**

- [§ 15.3 Recommendations](#ref-for-index-term-external-1 "§ 15.3 Recommendations")

[Permalink](https://www.w3.org/TR/xml/#NT-ExternalID)

**Referenced in:**

- [§ 15.3 Recommendations](#ref-for-index-term-external-identifiers-1 "§ 15.3 Recommendations")

[Permalink](https://www.w3.org/TR/xml/#sec-internal-ent)

**Referenced in:**

- [§ 15.3 Recommendations](#ref-for-index-term-internal-1 "§ 15.3 Recommendations")

[Permalink](https://www.w3.org/TR/xml/#sec-lang-tag)

**Referenced in:**

- [§ 3.7 Internationalization](#ref-for-index-term-xml-lang-attribute-1 "§ 3.7 Internationalization")
