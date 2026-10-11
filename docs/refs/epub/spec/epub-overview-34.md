[![W3C](https://www.w3.org/StyleSheets/TR/2021/logos/W3C)](https://www.w3.org/)

# EPUB 3 Overview

[W3C Group Note](https://www.w3.org/standards/types#NOTE) 09 March 2026

More details about this document

This version:  
[https://www.w3.org/TR/2026/NOTE-epub-overview-34-20260309/](https://www.w3.org/TR/2026/NOTE-epub-overview-34-20260309/)

Latest published version:  
<https://www.w3.org/TR/epub-overview-34/>

Latest editor's draft:  
<https://w3c.github.io/epub-specs/epub34/overview/>

History:  
<https://www.w3.org/standards/history/epub-overview-34/>

[Commit history](https://github.com/w3c/epub-specs/commits/main)

Editors:  
Matt Garrish ([DAISY Consortium](https://daisy.org))

[Ivan Herman](https://www.w3.org/People/Ivan/)[![](data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld2JveD0iMCAwIDI1NiAyNTYiPgogICAgPHN0eWxlPgoKICAgICAgLnN0MSB7CiAgICAgICAgZmlsbDogI2ZmZjsKICAgICAgfQogICAgCjwvc3R5bGU+CiAgICA8cGF0aCBkPSJNMjU2IDEyOGMwIDcwLjctNTcuMyAxMjgtMTI4IDEyOFMwIDE5OC43IDAgMTI4IDU3LjMgMCAxMjggMHMxMjggNTcuMyAxMjggMTI4eiIgZmlsbD0iI2E2Y2UzOSIgLz4KICAgIDxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik04Ni4zIDE4Ni4ySDcwLjlWNzkuMWgxNS40djEwNy4xek0xMDguOSA3OS4xaDQxLjZjMzkuNiAwIDU3IDI4LjMgNTcgNTMuNiAwIDI3LjUtMjEuNSA1My42LTU2LjggNTMuNmgtNDEuOFY3OS4xem0xNS40IDkzLjNoMjQuNWMzNC45IDAgNDIuOS0yNi41IDQyLjktMzkuN0MxOTEuNyAxMTEuMiAxNzggOTMgMTQ4IDkzaC0yMy43djc5LjR6TTg4LjcgNTYuOGMwIDUuNS00LjUgMTAuMS0xMC4xIDEwLjFzLTEwLjEtNC42LTEwLjEtMTAuMWMwLTUuNiA0LjUtMTAuMSAxMC4xLTEwLjFzMTAuMSA0LjYgMTAuMSAxMC4xeiIgLz4KICA8L3N2Zz4=)](https://orcid.org/0000-0003-0782-2704) ([W3C](https://www.w3.org))

Feedback:  
[GitHub w3c/epub-specs](https://github.com/w3c/epub-specs/) ([pull requests](https://github.com/w3c/epub-specs/pulls/), [new issue](https://github.com/w3c/epub-specs/issues/new/choose), [open issues](https://github.com/w3c/epub-specs/issues/))

[public-pm-wg@w3.org](mailto:public-pm-wg@w3.org?subject=%5Bepub-overview-34%5D%20YOUR%20TOPIC%20HERE) with subject line \[epub-overview-34\] *… message topic …* ([archives](https://lists.w3.org/Archives/Public/public-pm-wg))

[Copyright](https://www.w3.org/policies/#copyright) © 1999-2026 [International Digital Publishing Forum](https://www.idpf.org) and [World Wide Web Consortium](https://www.w3.org/). W3C^(®) [liability](https://www.w3.org/policies/#Legal_Disclaimer), [trademark](https://www.w3.org/policies/#W3C_Trademarks) and [permissive document license](https://www.w3.org/copyright/software-license-2023/ "W3C Software and Document Notice and License") rules apply.

------------------------------------------------------------------------

## Abstract

EPUB® 3 defines a distribution and interchange format for digital publications and documents. The EPUB format provides a means of representing, packaging, and encoding structured and semantically enhanced web content — including HTML, CSS, SVG, and other resources — for distribution in a single-file container.

This overview provides a general starting point for anyone curious to understand the features available in EPUB 3 publications. It is not intended as a technical introduction to the format or to building reading systems.

## Status of This Document

*This section describes the status of this document at the time of its publication. A list of current W3C publications and the latest revision of this technical report can be found in the [W3C standards and drafts index](https://www.w3.org/TR/).*

This document was published by the [Publishing Maintenance Working Group](https://www.w3.org/groups/wg/pm) as a Group Note using the [Note track](https://www.w3.org/policies/process/20250818/#recs-and-notes).

This Group Note is endorsed by the [Publishing Maintenance Working Group](https://www.w3.org/groups/wg/pm), but is not endorsed by W3C itself nor its Members.

The [W3C Patent Policy](https://www.w3.org/policies/patent-policy/) does not carry any licensing requirements or commitments on this document.

This document is governed by the [18 August 2025 W3C Process Document](https://www.w3.org/policies/process/20250818/).

## Table of Contents

1.  [Abstract](#abstract)
2.  [Status of This Document](#sotd)
3.  [1. Introduction](#intro)
    1.  [1.1 Reading this document](#reading-overview)
    2.  [1.2 Reading the specifications](#reading-specs)
    3.  [1.3 Version numbering](#version-num)
4.  [2. The EPUB container](#sec-container)
5.  [3. The package document](#sec-package-file)
6.  [4. Reading order](#sec-nav-order)
7.  [5. Navigation document](#sec-nav-nav-doc)
8.  [6. Content documents](#sec-content-docs)
    1.  [6.1 Rendering and CSS](#sec-rendering)
    2.  [6.2 Multimedia](#sec-multimedia)
    3.  [6.3 Fonts](#sec-fonts)
    4.  [6.4 Scripting](#sec-scripting)
    5.  [6.5 Semantic enrichment](#sec-semantic-enrichment)
    6.  [6.6 Structural semantics](#sec-structural-semantics)
9.  [7. Layouts](#sec-layouts)
    1.  [7.1 Reflowable layouts](#sec-reflow)
    2.  [7.2 Fixed layouts](#sec-fxl)
10. [8. Aural rendering](#sec-aural-rendering)
    1.  [8.1 Text-to-speech](#text-to-speech)
    2.  [8.2 Media overlays](#sec-mediaoverlays)
11. [9. Global language support](#sec-gls)
12. [10. Accessibility](#sec-accessibility)
13. [11. Annotations](#sec-annotation)
14. [12. New and experimental features](#sec-experimental)
15. [A. EPUB 3 documents](#app-documents)
    1.  [A.1 Specifications](#sec-doc-rec)
    2.  [A.2 Notes](#sec-doc-notes)
16. [B. EPUB revision history](#app-revision-history)
    1.  [B.1 OEB, OCF and EPUB 2: 1999—2010](#epub2)
    2.  [B.2 EPUB 3.0: 2010](#epub30)
    3.  [B.3 EPUB 3.0.1: 2014](#epub301)
    4.  [B.4 EPUB 3.1: 2017](#epub31)
    5.  [B.5 EPUB 3.2: 2018](#epub32)
    6.  [B.6 EPUB 3.3: 2022](#epub33)
    7.  [B.7 EPUB 3.4: 2027](#epub34)
17. [C. Index](#index)
    1.  [C.1 Terms defined by reference](#index-defined-elsewhere)
18. [D. References](#references)
    1.  [D.1 Informative references](#informative-references)

## 1. Introduction

[](#intro)

### 1.1 Reading this document

[](#reading-overview)

The EPUB 3 format offers publishers the ability to create advanced reading experiences by leveraging the features and functionalities of the Open Web Platform. The ability to use HTML, SVG, CSS, and JavaScript enables not only rich and interactive reading experiences but allows content to be produced for languages regardless of their default horizontal or vertical writing directions. The choice of these technologies also allows [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication) to be accessibly produced for a wide range of user needs.

This overview explores, at a high level, the authoring features of EPUB 3 that provide this functionality. This document is not intended as a tutorial on creating EPUB publications and does not delve into the technical details of the format or how reading systems operate. Rather, it is intended for a more general audience seeking to understand the benefits of creating their digital publications using the EPUB 3 format without having to read through technical specifications.

Before jumping straight into the features, however, it is helpful to have a basic conceptual understanding of how an EPUB publication is constructed. An EPUB file is effectively just a ZIP file with some identifying metadata that allows reading systems to recognize and render the publication inside (the ZIP file is formally called the [EPUB container](https://www.w3.org/TR/epub-34/#dfn-epub-container) in the specifications).

One of the key files in this rendering process is called the [package document](https://www.w3.org/TR/epub-34/#dfn-package-document). It provides the metadata about the publication, lists all of the resources, and specifies the order in which to present the [EPUB content documents](https://www.w3.org/TR/epub-34/#dfn-epub-content-document) (i.e., the XHTML and SVG documents that, when rendered, provide the content).

The other key file is the [EPUB navigation document](https://www.w3.org/TR/epub-34/#dfn-epub-navigation-document). This document includes the table of contents for the publication, and it may also contain other navigation aids the publisher has defined (e.g., a page list or list of landmarks).

The following figure visually represents the structure of an EPUB publication:

![Visual structure of the main constituents of an EPUB publication](images/epub.svg)

[Figure 1](#fig-epub-structure) Structure of an EPUB publication.

Image description

'EPUB (OCF) container' as the outer most component which encapsulates the 'EPUB Publication' containing two documents 'Package Document' and 'Navigation Document' along with a inner component labelled 'Publication Resources' which contains multiple 'Content document (XHTML, SVG)', and multiple 'Other resource (CSS, png, mp3, mov,…)'.

The body of this document explores these resources in greater detail with the goal of providing greater insight into the array of features they enable in EPUB 3 publications.

### 1.2 Reading the specifications

[](#reading-specs)

For those interested in going beyond the general introduction presented in this document, the EPUB 3.4 specification \[[epub-34](#bib-epub-34 "EPUB 3.4")\] contains all the essential authoring information.

In addition, accessibility requirements for [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication) are described in the EPUB Accessibility specification \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\]. One of the great advantages of a digital format like EPUB 3 is that it breaks down the accessibility barriers of static print content. When constructed with accessibility in mind, publications are usable by users with diverse needs.

While reading the Reading Systems specification \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] can help understand how content gets rendered, the technical details of this process are not necessary for authoring content.

Note

For a list of all the recommendation-track EPUB 3 specifications and non-normative notes, refer to [A. EPUB 3 documents](#app-documents).

### 1.3 Version numbering

[](#version-num)

An initial point of confusion for people new to EPUB is the difference between "EPUB 3" the format and the EPUB 3 specification numbering. The current version of EPUB 3 is defined in the EPUB 3.4 specification \[[epub-34](#bib-epub-34 "EPUB 3.4")\]. The minor number attached to the specification (".4") differentiates one release of the specification from the next, but each new release does not represent a new format.

The W3C working group that maintains EPUB 3 strives not to invalidate content produced to earlier versions of the specification, so an EPUB 3 publication produced to the EPUB 3.0 specification, for example, should also be valid to the EPUB 3.4 requirements.

That is also why this overview is for "EPUB 3", as it typically does not change significantly from one specification release to the next.

Note

At this moment, the [EPUB 3.4](https://www.w3.org/TR/epub-34/) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] version is in development; it is based on the stable [EPUB 3.3](https://www.w3.org/TR/epub-33/) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] version, but the Working Group is adding some new features.

Note

For a general overview of the changes made in each revision, refer to [B. EPUB revision history](#app-revision-history).

## 2. The EPUB container

[](#sec-container)

An [EPUB publication](https://www.w3.org/TR/epub-34/#dfn-epub-publication) is transported and interchanged as a single file (a "portable document") that contains the [package document](https://www.w3.org/TR/epub-34/#dfn-package-document), the [EPUB content documents](https://www.w3.org/TR/epub-34/#dfn-epub-content-document), and all other required resources for processing the publication. The single-file container format for EPUB is based on the widely adopted ZIP format, and an XML document that identifies the location of the package document for the publication in the ZIP archive is located at a pre-defined location within the archive.

This approach provides a clear contract between any creator of an EPUB publication and any system which consumes such EPUB publications, as well as a reliable representation that is independent of network transport or file system specifics.

It also ensures that EPUB publications may be created and are editable using widely available ZIP tools. Publishers have the flexibility to use either commercially available editing applications or build their own content transformation pipelines.

For more information about an EPUB publication's representation as a container file, refer to the [Open Container Format (OCF)](https://www.w3.org/TR/epub-34/#sec-ocf) section of \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

## 3. The package document

[](#sec-package-file)

Every [EPUB publication](https://www.w3.org/TR/epub-34/#dfn-epub-publication) is represented by a [package document](https://www.w3.org/TR/epub-34/#dfn-package-document). The package document specifies all the resources required to render that representation of the content. The package document also defines a reading order for linear consumption (called a [spine](https://www.w3.org/TR/epub-34/#dfn-spine)), and associates metadata and navigation information.

The package document defines a layer on top of the traditional structuring of a typical web site. This layer includes a list of resources and indicates reading order. A web site, for example, embeds references to its resources within its content, which, while a simple and flexible means of identifying resources, makes it difficult to enumerate all the resources required to render it. In addition, there is no standard way for a web site to define that a sequence of pages make up a larger publication, which is precisely what EPUB's [`spine`](https://www.w3.org/TR/epub-34/#dfn-spine) element \[[epub-34](#bib-epub-34 "EPUB 3.4")\] does (i.e., it provides an external declarative means to explicitly specify navigation through a collection of documents).

The package document also provides a standard way to represent metadata globally applicable to the content. Each package document includes a [metadata section](https://www.w3.org/TR/epub-34/#sec-pkg-metadata) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] for general information about the EPUB publication, allowing titles, authors, identifiers, and other information to be easily accessed and presented to users. It also provides the means to attach complete bibliographic records using the [`link`](https://www.w3.org/TR/epub-34/#dfn-link) element \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

The package document also allows a [unique identifier](https://www.w3.org/TR/epub-34/#dfn-unique-identifier) to be established for the EPUB publication using the [`unique-identifier` attribute](https://www.w3.org/TR/epub-34/#attrdef-package-unique-identifier) \[[epub-34](#bib-epub-34 "EPUB 3.4")\]. This identifier provides a way for publishers to differentiate one publication from another, and even one edition from another.

For more information about the package document, refer to the [Package document](https://www.w3.org/TR/epub-34/#sec-package-doc) section of \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

## 4. Reading order

[](#sec-nav-order)

A key concept of EPUB is that an [EPUB publication](https://www.w3.org/TR/epub-34/#dfn-epub-publication) consists of multiple resources that can be completely navigated and consumed by a person or program *in some specific order*.

Many types of publication have an obvious reading order, or logical progression through their content. A novel is an example of a highly sequential document — it typically has a beginning, middle, and end — but not all publications are so ordered: a cookbook or a collection of photographic images is more like a database. All documents do, however, have at least one logical ordering of all their top-level content items, whether by date, topic, location, or some other criteria (e.g., a cookbook is typically arranged by recipe type).

Each EPUB publication defines at least one logical order by listing its top-level content in the [spine](https://www.w3.org/TR/epub-34/#dfn-epub-spine). Each also defines a declarative table of contents in the [EPUB navigation document](#sec-nav-nav-doc) \[[epub-34](#bib-epub-34 "EPUB 3.4")\]. EPUB publications make these data structures available in a machine-readable way *external* to the content, simplifying their discovery and use.

EPUB publications are not limited to the linear ordering of their contents, nor do they preclude linking in arbitrary ways — just like the web, EPUB publications are built on hypertext — but the basic consumption and navigation can be reliably accomplished in a way that is not true for a set of HTML pages.

## 5. Navigation document

[](#sec-nav-nav-doc)

Each [EPUB publication](https://www.w3.org/TR/epub-34/#dfn-epub-publication) contains a special [XHTML content document](https://www.w3.org/TR/epub-34/#dfn-xhtml-content-document) called the [EPUB navigation document](https://www.w3.org/TR/epub-34/#dfn-epub-navigation-document). This document uses the \[[html](#bib-html "HTML Standard")\] [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) element to define human- and machine-readable navigation information. All [reading systems](https://www.w3.org/TR/epub-34/#dfn-epub-reading-system) make use of the EPUB navigation document to present a table of contents to their users.

The EPUB navigation document provides baseline accessibility and navigation support and offers features to enhance navigation for all users. Prime among these are support for internationalization (for example, as an XHTML document itself, the EPUB navigation document natively supports [ruby annotations](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-ruby-element)) and support for embedded formats (MathML and SVG can be included within navigation links).

Although EPUB reading systems are not required to support these advanced text formatting features when they process the data to create their own table of contents, the dual role of the EPUB navigation document means the features can still be useful for their intended audience. Publishers can include the EPUB navigation document in the [spine](https://www.w3.org/TR/epub-34/#dfn-epub-spine) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] (i.e., as a page of content in the publication) so that users have direct access to the full HTML.

Including the EPUB navigation document in the body of an EPUB publication also allows publishers to tailor the display differently for users and reading systems. In highly structured documents, for example, it might not be desirable to display the complete table of contents to users in the body of the publication. In this case, the display level can be modified using the [`hidden` attribute](https://www.w3.org/TR/epub-34/#sec-nav-doc-use-spine) \[[epub-34](#bib-epub-34 "EPUB 3.4")\]. This attribute is ignored by reading systems when they render the table of contents outside the [spine](https://www.w3.org/TR/epub-34/#dfn-epub-spine) (e.g., in their own specialized views), which avoids minimizing the information that is available and improves the overall accessibility.

Publishers can also supply additional [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) elements if their EPUB publications contain non-structural points of interest, such as to page breaks, landmarks, figures, tables, etc., to further enhance access to the content.

For more information about the structure and semantics of EPUB navigation documents, refer to the [EPUB navigation document](https://www.w3.org/TR/epub-34/#sec-nav) section of \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

## 6. Content documents

[](#sec-content-docs)

Each [EPUB publication](https://www.w3.org/TR/epub-34/#dfn-epub-publication) contains one or more [EPUB content documents](https://www.w3.org/TR/epub-34/#dfn-epub-content-document), as defined in \[[epub-34](#bib-epub-34 "EPUB 3.4")\]. These are HTML or SVG documents that describe the readable content and reference associated media resources (e.g., images, audio, and video clips).

HTML documents for EPUB are formally defined as a [profile of HTML](https://www.w3.org/TR/epub-34/#sec-xhtml) \[[html](#bib-html "HTML Standard")\]. In particular, that profile requires the usage of the [XML syntax](https://html.spec.whatwg.org/multipage/#writing-xhtml-documents) \[[html](#bib-html "HTML Standard")\], referred to as [XHTML content documents](https://www.w3.org/TR/epub-34/#dfn-xhtml-content-document) in the EPUB specifications.

Note

The term "XHTML" should not be confused with an earlier, fully XML based version of HTML denoted as "XHTML 1.1" \[xhtml11\]. XHTML 1.1 was originally published in 2001 and was officially retired by the W3C in 2018, whereas an [XHTML content documents](https://www.w3.org/TR/epub-34/#dfn-xhtml-content-document) relies on the latest versions of \[[html](#bib-html "HTML Standard")\]. This means, for example, that an XHTML document in EPUB may contain [`audio`](https://html.spec.whatwg.org/multipage/media.html#audio) or [`video`](https://html.spec.whatwg.org/multipage/media.html#video) elements, which was not possible in "XHTML 1.1". See also [B.2 EPUB 3.0: 2010](#epub30) for further details.

### 6.1 Rendering and CSS

[](#sec-rendering)

A key concept of EPUB is that content presentation adapts to the user, rather than the user having to adapt to a particular presentation of content. HTML was originally designed to support dynamic rendering of structured content, but over time HTML as supported in web browsers has become focused on the needs of web applications, and many popular web sites now have layouts with less flexibility.

[EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication), however, are designed to maximize accessibility for all users, and [reading systems](https://www.w3.org/TR/epub-34/#dfn-epub-reading-system) typically perform text line layout and pagination on the fly, adapting to the size of the display area, the user's preferred font size, and other environmental factors. This behavior is not guaranteed in EPUB; images, vector graphics, video, and other non-reflowable content might be included, and some reading systems might not paginate on the fly, or at all. Nevertheless, supporting dynamic adaptive layout and accessibility has been a primary design consideration throughout the evolution of the EPUB standard.

EPUB content documents can reference CSS style sheets, allowing publishers to define the desired rendering properties and possibly sophisticated layouts. EPUB 3 follows support for CSS as defined in the \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\].

EPUB 3 also supports CSS styles that enable both horizontal and vertical layout and both left-to-right and right-to-left writing.

### 6.2 Multimedia

[](#sec-multimedia)

EPUB 3 supports the embedding of audio and video in [XHTML content documents](https://www.w3.org/TR/epub-34/#dfn-xhtml-content-document) via the \[[html](#bib-html "HTML Standard")\] [`audio`](https://html.spec.whatwg.org/multipage/media.html#audio) and [`video`](https://html.spec.whatwg.org/multipage/media.html#video) elements, inheriting all the functionality and features these elements provide (e.g., built-in start, stop, and volume controls). For more information on the audio and video formats EPUB 3 supports, refer to the section on [core media types](https://www.w3.org/TR/epub-34/#sec-core-media-types) \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

### 6.3 Fonts

[](#sec-fonts)

EPUB 3 supports two closely related font formats — OpenType \[[opentype](#bib-opentype "OpenType specification")\] and WOFF \[[woff](#bib-woff "WOFF File Format 1.0")\] \[[woff2](#bib-woff2 "WOFF File Format 2.0")\] — to accommodate both traditional publishing workflows and emerging web-based workflows. Word processing programs used to create [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication) are likely to have access only to a collection of installed OpenType fonts, for example, whereas web-archival EPUB generators will likely only have access to WOFF resources (which cannot be converted to OpenType without undesirable, and potentially unlicensed, stripping of WOFF metadata).

### 6.4 Scripting

[](#sec-scripting)

EPUB strives to treat content *declaratively* — as data that can be manipulated, not as programs to be executed — but does support scripting as defined in \[[html](#bib-html "HTML Standard")\] and \[[svg](#bib-svg "SVG")\]. This allows publishers to build and add dynamic content such as quizzes, interactive games, and so forth.

Scripting in an EPUB publication can create security considerations that are different from scripting within a web browser, however. For example, typical same-origin policies are not applicable to content that has been downloaded to a user's local system. For these reasons, scripting is best limited to cases where it is essential to the user experience, since it greatly increases the likelihood that content will not be portable across all reading systems and creates barriers to accessibility and content reusability.

It is also important to note that EPUB 3 does not require scripting support in reading systems, and scripting might be disabled for security reasons. Publishers need to consider how their publications will remain readable by users before scripting content essential to its understanding.

Refer to the section on [Scripting](https://www.w3.org/TR/epub-34/#sec-scripted-content) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] for more information on scripting capabilities.

### 6.5 Semantic enrichment

[](#sec-semantic-enrichment)

[XHTML content documents](https://www.w3.org/TR/epub-34/#dfn-xhtml-content-document) also include the means of adding rich metadata to document markup, making them more semantically meaningful and useful both for processing and accessibility purposes. Publishers can use both RDFa \[[rdfa-in-html](#bib-rdfa-in-html "HTML+RDFa 1.1 - Second Edition")\] and Microdata \[[microdata](#bib-microdata "HTML Microdata")\] attributes for this purpose, and also embed JSON-LD metadata records \[[json-ld](#bib-json-ld "JSON-LD 1.0")\] in the \[[html](#bib-html "HTML Standard")\] [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) element.

### 6.6 Structural semantics

[](#sec-structural-semantics)

EPUB 3 also includes the [`epub:type`](https://www.w3.org/TR/epub-34/#dfn-epub-type) attribute \[[epub-34](#bib-epub-34 "EPUB 3.4")\] for adding additional information to any element in an [EPUB content document](https://www.w3.org/TR/epub-34/#dfn-epub-content-document) to express its purpose and meaning within the work.

Although these semantics are primarily for use in publishers' internal workflows, they do provide enhanced [reading system](https://www.w3.org/TR/epub-34/#dfn-epub-reading-system) behaviors in some cases (specifically, for pop-up footnotes).

Refer to the section on [Expressing structural semantics](https://www.w3.org/TR/epub-34/#app-structural-semantics) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] for more information.

## 7. Layouts

[](#sec-layouts)

### 7.1 Reflowable layouts

[](#sec-reflow)

At its core, EPUB is designed for dynamic layout: content is typically intended to be formatted on the fly rather than being typeset in a paginated manner in advance. This core capability is useful for optimizing rendering onto different-sized device screens or window sizes, and it facilitates and simplifies content accessibility.

EPUB 3 also offers metadata allowing publishers to specify their preferred rendering of reflowable content. Supporting reading systems could offer users a scrolled view of a reflowable document, for example, instead of paginating it.

For more information, refer to the section on [Reflowable layouts](https://www.w3.org/TR/epub-34/#sec-reflowable-layouts) \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

### 7.2 Fixed layouts

[](#sec-fxl)

Although EPUB's history is steeped in enabling reflowable content, not all publications lend themselves easily to reflowing. Page-precise layouts are required to meaningfully represent children's books, comics and manga, magazines, and many other content forms.

EPUB 3 includes metadata that allows the creation of [fixed-layout XHTML content documents](https://www.w3.org/TR/epub-34/#sec-fixed-layouts) \[[epub-34](#bib-epub-34 "EPUB 3.4")\], in addition to existing capabilities for fixed layouts in SVG. This metadata enables the control of the [page dimensions](https://www.w3.org/TR/epub-34/#sec-fxl-content-dimensions) \[[epub-34](#bib-epub-34 "EPUB 3.4")\], creating a canvas on which elements can be absolutely positioned.

Fixed layouts come in two flavors, namely:

- [Pre-paginated](https://www.w3.org/TR/epub-34/#sec-pre-paginated), where each fixed-layout document in the spine represents one page of content. Reading systems are expected to scale the document to fit the viewport or synthetic spread. Typical usage examples may be children's books, comics, or cookbooks.
- [Roll](https://www.w3.org/TR/epub-34/#sec-roll), where each fixed-layout document in the spine is fit to the viewport by the reading system, and the contents are displayed in a continuous roll with no visible gaps. Typical usage examples are webtoons.

For more information, refer to the section on [Fixed layouts](https://www.w3.org/TR/epub-34/#sec-fixed-layouts) \[[epub-34](#bib-epub-34 "EPUB 3.4")\]. See also the visual examples for a [pre-paginated](https://www.w3.org/TR/epub-34/#spread-page-spread-right-figure) and a [roll](https://www.w3.org/TR/epub-34/#layout-roll-figure) publication in the \[[epub-34](#bib-epub-34 "EPUB 3.4")\] specification.

Note

Roll layout is a new feature in EPUB 3.4. It will take some years before it becomes available in major reading systems. Users should be aware of this limitation.

## 8. Aural rendering

[](#sec-aural-rendering)

Although EPUB 3 is primarily considered a visual reading format, EPUB publications are designed to enable their aural rendering as well. There are two primary ways this can done:

- through the text-to-speech rendering of an EPUB publication's text content; and
- through the provision of prerecorded audio whose playback is synchronized with the text, referred to as media overlays.

### 8.1 Text-to-speech

[](#text-to-speech)

Unfortunately, there are currently no broadly supported technologies for text-to-speech, which also means that the EPUB specification cannot normatively refer any specific approach. Nevertheless, there exist a number of specifications that may be used to "assist" text-to-speech, like SSML \[[ssml](#bib-ssml "Speech Synthesis Markup Language (SSML) Version 1.1")\], pronunciation lexicons \[[pronunciation-lexicon](#bib-pronunciation-lexicon "Pronunciation Lexicon Specification (PLS) Version 1.0")\], or CSS speech \[[css-speech](#bib-css-speech "CSS Speech Module Level 1")\]. These are all valid for EPUB publications. However, with the lack of dominant text-to-speech technologies the implementation of these specifications is often lacking in reading systems. With the evolution of relevant techniques, new approaches may come to the fore in coming years, which can hopefully be added to future versions of the EPUB specification.

For more information about these technologies and how they can be used in EPUB 3, refer to the Working Group Note [EPUB 3 Text-to-Speech Enhancements 1.0](https://www.w3.org/TR/epub-tts-10/) \[[epub-tts-10](#bib-epub-tts-10 "EPUB 3 Text-to-Speech Enhancements 1.0")\].

### 8.2 Media overlays

[](#sec-mediaoverlays)

A key multimedia feature of EPUB 3 is the ability to define media overlays. When pre-recorded narration is available for an [EPUB publication](https://www.w3.org/TR/epub-34/#dfn-epub-publication), media overlays provide the ability to synchronize the playback of that audio with the text of an [EPUB content document](https://www.w3.org/TR/epub-34/#dfn-epub-content-document). Users can watch as the text of the publication is highlighted while it is read back to them, or just listen to the audio.

Media overlays have benefits beyond the obvious accessibility one of allowing users who cannot see the content to listen to it. They are used, for example, to synchronize text and audio as a tool for learning to read.

For more information about creating media overlays, refer to the section on [Media overlays](https://www.w3.org/TR/epub-34/#sec-media-overlays) \[[epub-34](#bib-epub-34 "EPUB 3.4")\].

## 9. Global language support

[](#sec-gls)

EPUB 3 leverages the features in XHTML, SVG, CSS, or MathML for global language support. Publishers may use the Internationalization Tag Set (ITS) \[[its20](#bib-its20 "Internationalization Tag Set (ITS) Version 2.0")\] to facilitate translations and multilingual publications. EPUB 3 also relies on \[[unicode](#bib-unicode "The Unicode Standard")\] for encoding the content. This means that [EPUB content documents](https://www.w3.org/TR/epub-34/#dfn-epub-content-document) can use different character sets and express bidirectional text, ruby annotations, or typography for many different languages and cultures.

The following list describes some of the key additions for global language support that are specific to EPUB 3:

Alternate language metadata  
EPUB 3 supports alternate representations of all text metadata items in the package metadata section to improve global distribution of [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication). The [`alternate-script` property](https://www.w3.org/TR/epub-34/#alternate-script) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] can be combined with the `xml:lang` attribute to include and identify alternate script renderings of language-specific metadata.

Using this property, a Japanese EPUB publication could, for example, include an alternate Roman-script representation of the author's name and/or one or more representations of the title in a Romance language.

Base text direction  
Text metadata items may also rely on [attributes specifying base direction](https://www.w3.org/TR/epub-34/#attrdef-dir) \[[epub-34](#bib-epub-34 "EPUB 3.4")\] that allow for a finer control of bidirectional texts (e.g., titles that combine Latin and Arabic or Hebrew characters).

Page progression direction  
The `page-progression-direction` attribute in the [package document](https://www.w3.org/TR/epub-34/#dfn-package-document) allows the content flow direction to be globally specified for all EPUB content documents to facilitate rendering (see the [page-progression-direction](https://www.w3.org/TR/epub-34/#attrdef-spine-page-progression-direction) attribute in \[[epub-34](#bib-epub-34 "EPUB 3.4")\]).

Fonts  
EPUB 3 does not require that reading systems come with a set of built-in system fonts. As occurs in web contexts, users in a particular locale might have installed fonts that omit characters required for other locales and reading systems might utilize intrinsic fonts or font engines that do not utilize operating system installed fonts. As a result, the text content of an EPUB publication might not natively render as intended on all reading systems.

EPUB 3's support for embedding fonts facilitates the rendering of text content by ensuring content is rendered as intended.

Support for embedded fonts also ensures that publishers can embed characters and glyphs unique to an EPUB publication for proper display.

Container  
The OCF container format supports UTF-8, allowing for internationalized file and directory naming of content resources.

## 10. Accessibility

[](#sec-accessibility)

A major goal of EPUB is to facilitate content accessibility. To achieve this goal, the EPUB Accessibility specification \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] provides a framework for evaluating the accessibility of [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication). It leverages the extensive work done to define web content accessibility in the Web Content Accessibility Guidelines \[[wcag21](#bib-wcag21 "Web Content Accessibility Guidelines (WCAG) 2.1")\], an internationally recognized standard for content accessibility.

The specification defines requirements to produce [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication) that can be accessed by a wide range of users. It is accompanied by a techniques document \[[epub-a11y-tech-12](#bib-epub-a11y-tech-12 "EPUB Accessibility Techniques 1.2")\] that outlines best practices for meeting these requirements.

It is important to note that while accessibility is important in its own right, accessible content is also more valuable content: an accessible EPUB publication will be adaptable to more devices and be easier to reuse, in whole or in part, via human and automated workflows.

Some specific content features of EPUB 3 that enable the creation of highly accessible content include:

HTML semantic markup  
HTML incorporates a number of elements that make markup more semantically meaningful. These include, for example, the [`section`](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element), and [`aside`](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element) elements. These elements allow content to be better grouped and defined, both to represent the structure of documents and to facilitate their logical navigation.

HTML multimedia elements  
The [`audio`](https://html.spec.whatwg.org/multipage/media.html#audio) and [`video`](https://html.spec.whatwg.org/multipage/media.html#video) elements of HTML come with built-in controls that work with assistive technologies. These new elements allow users to control playback, no longer requiring plugins with poor accessibility support.

Reflowable layouts  
The default for EPUB publications is to reflow to fit the available screen space. This allows users to change the display to their liking (e.g., increasing font size, line and word spacing) without causing a publication to become unreadable — the resized content re-adapts itself to the available space.

ARIA support  
EPUB includes support for expressing ARIA \[[wai-aria-1.2](#bib-wai-aria-1.2 "Accessible Rich Internet Applications (WAI-ARIA) 1.2")\] and DPUB-ARIA \[[dpub-aria-1.1](#bib-dpub-aria-1.1 "Digital Publishing WAI-ARIA Module 1.1")\] roles, states, and properties both in XHTML and SVG content documents. These attributes allow publishers to improve the accessibility of scripted controls and components.

## 11. Annotations

[](#sec-annotation)

Most [reading systems](https://www.w3.org/TR/epub-34/#dfn-epub-reading-system) include the possibility to add annotations to their content. These are usually anchored to a specific position in a way that the anchor remains valid even if the content is repaginated or changed. The annotation itself is, traditionally textual, although newer reading systems also allow the usage of images (usually created with an interactive pen).

A major limitation of current systems is that these annotations are kept private. They cannot be exported and imported to another reading system, let that be a different piece of software or hardware used by the same user, or exchanged with the user's peers. In other words, annotations cannot be *shared*.

However, there are communities that need such annotation sharing. A teacher may want to annotate a pupil's work, members of a research team may want to share their notes on a document, etc. There are even cases when the annotations themselves gain a literary or scientific value on their own right, e.g., in religious or scientific literature.

To overcome these restrictions, EPUB 3.4 defines an EPUB Annotation format \[[epub-anno-10](#bib-epub-anno-10 "EPUB Annotations 1.0")\] whose goals can be summarized as follows:

- Define a standard data model to structure and store annotations as a simple JSON data file. This JSON content can then be exported and/or imported by reading systems.

- Specify a number of standard anchoring methods (referred to as "selectors") which provide a common base for importing and re-attaching external annotations to the local content.

Technically, the EPUB Annotation model is defined as a restricted profile of an existing W3C standard called the [Web Annotation Data Model](https://www.w3.org/TR/annotation-model/) \[[annotation-model](#bib-annotation-model "Web Annotation Data Model")\].

Note

EPUB Annotation is a new feature in EPUB 3.4. It will take some years before it becomes available by major reading systems. Users should be aware of this limitation.

## 12. New and experimental features

[](#sec-experimental)

EPUB 3 is continuously evolving with the web to adapt new features and technologies. The specification references a number of web standards that automatically becomes valid to use as soon as they change. HTML, for example, is now called a "living standard" because new features are added once there are at least two implementations. EPUB 3 also references versions of SVG \[[svg](#bib-svg "SVG")\], JavaScript \[[ecmascript](#bib-ecmascript "ECMAScript Language Specification")\], and Unicode \[[unicode](#bib-unicode "The Unicode Standard")\] that adapt to new releases, and the CSS reference is tied to the latest snapshot \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\].

What this means for EPUB 3 is that as new features are added to these standards, they are also immediately valid to use in [EPUB publications](https://www.w3.org/TR/epub-34/#dfn-epub-publication). (That does not mean it is always wise to use such features right away, as [reading systems](https://www.w3.org/TR/epub-34/#dfn-epub-reading-system) often take longer to implement support, and vendors may not always allow the new features past their validation routines.)

The EPUB Working Group may also introduce new and experimental features from time-to-time outside of the core specifications. This is typically done because the features do not have sufficient real-world support in reading systems yet, or because the Working Group is looking for implementation feedback before trying to standardize the technology.

There are currently two such experimental features: multiple-rendition publications \[[epub-multi-rend-11](#bib-epub-multi-rend-11 "EPUB 3 Multiple-Rendition Publications 1.1")\] and text-to-speech enhancements \[[epub-tts-10](#bib-epub-tts-10 "EPUB 3 Text-to-Speech Enhancements 1.0")\]. Publishers may use these features in their publications but should do so with the awareness that there may be limited support.

Note

Experimental features are usually published in separate Working Group Notes, and are not part of the core specifications. See [the list of notes](#sec-doc-notes) below.

## A. EPUB 3 documents

[](#app-documents)

### A.1 Specifications

[](#sec-doc-rec)

EPUB 3 is currently defined by the following specifications:

- EPUB 3.4 \[[epub-34](#bib-epub-34 "EPUB 3.4")\]: defines the authoring format and requirements for EPUB publications, comprising features such as the [package](#sec-package-file) and [navigation](#sec-nav-nav-doc) Documents, [EPUB content documents](#sec-content-docs), [fixed layouts](#sec-fxl), [media overlays](#para-media-overlay), and the [container format](#sec-container).
- EPUB Reading Systems 3.4 \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\]: defines the conformance requirements for EPUB 3 reading systems — the user agents that render EPUB 3 Publications.
- EPUB Accessibility 1.2 \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\]: specifies content conformance requirements for verifying the accessibility of EPUB 3 Publications.
- EPUB Annotations 1.0 \[[epub-anno-10](#bib-epub-anno-10 "EPUB Annotations 1.0")\]: specifies a JSON based data format for annotations that can be exported and imported by Reading Systems.

Note

The recommendation-track documents include detailed change logs on the substantive changes since the previous official releases. See the change log for [EPUB 3.4](https://www.w3.org/TR/epub-34/#change-log), [EPUB reading systems 3.4](https://www.w3.org/TR/epub-rs-34/#change-log), [EPUB Accessibility 1.2](https://www.w3.org/TR/epub-a11y-12/#change-log), and [EPUB Annotations 1.0](https://www.w3.org/TR/epub-anno-10/#change-log), respectively.

### A.2 Notes

[](#sec-doc-notes)

Although the following documents are informative, they provide guidance related to implementing the EPUB 3 specifications as well as define experimental features.

- EPUB Accessibility - EU Accessibility Act Mapping \[[epub-a11y-eaa-mapping](#bib-epub-a11y-eaa-mapping "EPUB Accessibility - EU Accessibility Act Mapping")\]: aims to demonstrate that the technical requirements of the [European Accessibility Act](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32019L0882) related to ebooks are met by the EPUB standard.
- EPUB Accessibility Techniques 1.2 \[[epub-a11y-tech-12](#bib-epub-a11y-tech-12 "EPUB Accessibility Techniques 1.2")\]: provides guidance on how to meet the EPUB Accessibility 1.2 \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] discovery and accessibility requirements for EPUB publications.
- The EPUB Accessibility exemption property \[[epub-a11y-exemption](#bib-epub-a11y-exemption "The EPUB Accessibility exemption property")\]: the `exemption` property is used to indicate that an EPUB publication that does not meet accessibility conformance requirements has an exemption under the applicable jurisdiction's laws.
- EPUB Accessibility - Fixed Layout Challenges and Best Practices\[[epub-fxl-a11y](#bib-epub-fxl-a11y "EPUB Accessibility - Fixed Layout Challenges and Best Practices")\]: provides guidance on how to make fixed-layout EPUB publications accessible.
- EPUB Multiple-Rendition Publications 1.1 \[[epub-multi-rend-11](#bib-epub-multi-rend-11 "EPUB 3 Multiple-Rendition Publications 1.1")\]: defines the creation and rendering of EPUB publications consisting of more than one Rendition.
- EPUB 3 Structural Semantics Vocabulary 1.1 \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]: defines a set of properties relating to the description of structural semantics of written works.
- EPUB 3 Text-to-Speech Enhancements 1.0 \[[epub-tts-10](#bib-epub-tts-10 "EPUB 3 Text-to-Speech Enhancements 1.0")\]: describes authoring features and reading system support for improving the voicing of EPUB 3 publications.
- EPUB Type to ARIA Role Authoring Guide 1.1 \[[epub-aria-authoring-11](#bib-epub-aria-authoring-11 "EPUB Type to ARIA Role Authoring Guide 1.1")\]: provides guidance for publishers looking to move from the use of the EPUB 3 epub:type attribute to ARIA roles for accessibility.

## B. EPUB revision history

[](#app-revision-history)

### B.1 OEB, OCF and EPUB 2: 1999—2010

[](#epub2)

EPUB has its roots in the interchange format known as the Open EBook Publication Structure (OEBPS). OEBPS 1.0 was approved in 1999 by the Open eBook Forum, an organization that later became the International Digital Publishing Forum (IDPF). Subsequent revisions 1.1 and 1.2 were approved by the IDPF in 2001 and 2002, respectively.

It was realized that a need existed for a format standard that could be used for delivery as well as interchange, and work began in late 2005 on a single-file container format for OEPBS, which was approved by the IDPF as the OEBPS Container Format (OCF) in 2006. Work on a 2.0 revision of OEBPS began in parallel which was renamed EPUB 2.0 in October 2007 and approved in September 2010. This revision consisted of a triumvirate of specifications: Open Package Format (OPF), Open Publication Structure (OPS), and OCF. EPUB 2.0.1, which was a maintenance update to the 2.0 specification set, primarily intended to clarify and correct errata in the specifications. See \[[opf-201](#bib-opf-201 "Open Packaging Format 2.0.1")\] \[[ops-201](#bib-ops-201 "Open Publication Structure 2.0.1")\] \[[ocf-201](#bib-ocf-201 "EPUB Open Container Format (OCF) 2.0.1")\].

### B.2 EPUB 3.0: 2010

[](#epub30)

Work on a major revision of the EPUB specifications began in 2010, with the goal of aligning EPUB more closely with HTML. As part of that alignment, the reference to HTML was changed: while EPUB 2.0 referred to XHTML 1.1 \[[xhtml11](#bib-xhtml11 "XHTML™ 1.1 - Module-based XHTML - Second Edition")\], EPUB 3.0 relies on the XML serialization of HTML \[[html](#bib-html "HTML Standard")\] (referred to as "HTML5" at the time). This resulted in bringing new, native multimedia features, sophisticated CSS layout rendering and font embedding, MathML support, scripted interactivity, vertical writing and other enhanced global language support, and improved accessibility.

A new specification for EPUB Media Overlays was also introduced, allowing for text and audio synchronization in EPUB publications. To better align the specification names with the standard, the Open Package Format specification was renamed EPUB publications, and the Open Publication Format specification was renamed EPUB Content Documents. The EPUB 3.0 specifications were approved in October 2011. See \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\] \[[epubcontentdocs-30](#bib-epubcontentdocs-30 "EPUB Content Documents 3.0")\] \[[ocf-30](#bib-ocf-30 "EPUB Open Container Format (OCF) 3.0")\] \[[epubmediaoverlays-30](#bib-epubmediaoverlays-30 "EPUB Media Overlays 3.0")\] \[[epubchanges-30](#bib-epubchanges-30 "EPUB 3 Changes from 2.0.1")\].

### B.3 EPUB 3.0.1: 2014

[](#epub301)

The EPUB 3.0.1 revision was undertaken in 2013-14. Although introducing mostly minor fixes and updates, it did see the integration of fixed layout documents to provide greater control over the presentation of EPUB publications. See \[[epubpublications-301](#bib-epubpublications-301 "EPUB Publications 3.0.1")\] \[[epubcontentdocs-301](#bib-epubcontentdocs-301 "EPUB Content Documents 3.0.1")\] \[[ocf-301](#bib-ocf-301 "EPUB Open Container Format (OCF) 3.0.1")\] \[[epubmediaoverlays-301](#bib-epubmediaoverlays-301 "EPUB Media Overlays 3.0.1")\] \[[epubchanges-301](#bib-epubchanges-301 "EPUB 3.0.1 Changes from 3.0")\].

### B.4 EPUB 3.1: 2017

[](#epub31)

EPUB 3.1 was the first minor revision of EPUB 3. The goal of that revision was to better align EPUB 3 with web standards of the time. References to important standards were made undated, meaning that whenever they are updated they are legal to use in EPUB 3 content (e.g., the latest version of HTML is always valid to use; a revision of EPUB is not needed). The use of CSS was also clarified, and the use of EPUB-specific properties reduced.

Many EPUB-specific features were also removed from the standard, in particular content switching, triggers, and bindings. This change necessitated a new package document version number. See \[[epub-31](#bib-epub-31 "EPUB 3.1")\] \[[epubpackages-31](#bib-epubpackages-31 "EPUB Packages 3.1")\] \[[epubcontentdocs-31](#bib-epubcontentdocs-31 "EPUB Content Documents 3.1")\] \[[ocf-31](#bib-ocf-31 "Open Container Format (OCF) 3.1")\] \[[epubmediaoverlays-31](#bib-epubmediaoverlays-31 "EPUB Media Overlays 3.1")\] \[[epubchanges-31](#bib-epubchanges-31 "EPUB 3.1 Changes from 3.0.1")\]

### B.5 EPUB 3.2: 2018

[](#epub32)

The work on EPUB 3.2 was undertaken shortly after EPUB 3.1 to restore compatibility of content to EPUB 3. The change of version number introduced in EPUB 3.1 meant that publishers, vendors and reading system developers would have had to produce, distribute, and consume two versions of EPUB content, but the costs of this change outweighed the benefits of the new version. EPUB 3.2 instead kept all the best parts of EPUB 3.1 but deprecated elements instead of removing them so that a new version number was not necessary in the package document. See \[[epub-32](#bib-epub-32 "EPUB 3.2")\] \[[epubpackages-32](#bib-epubpackages-32 "EPUB Packages 3.2")\] \[[epubcontentdocs-32](#bib-epubcontentdocs-32 "EPUB Content Documents 3.2")\] \[[ocf-32](#bib-ocf-32 "Open Container Format (OCF) 3.2")\] \[[epubmediaoverlays-32](#bib-epubmediaoverlays-32 "EPUB Media Overlays 3.2")\] \[[epubchanges-32](#bib-epubchanges-32 "EPUB 3.2 Changes")\]

### B.6 EPUB 3.3: 2022

[](#epub33)

The work on EPUB 3.3 \[[epub-33](#bib-epub-33 "EPUB 3.3")\] was undertaken in 2020-21, and was the first version of the EPUB 3 series published as a W3C Recommendation. EPUB 3.3 did not include any significant technical change to, and is strongly backward compatible with, EPUB 3.2. This means that any valid EPUB 3.2 Publication is also a valid EPUB 3.3 Publication.

The documents themselves have been restructured. The primary motivation for this restructuring, as well as an extensive editorial revision, was to make the documents more readable. Also, as part of the thorough testing regime developed by the [W3C EPUB 3 Working Group](https://www.w3.org/publishing/groups/epub-wg/), this restructuring led to the separation of Recommendations and Working Group Notes (see also [the detailed list of documents](#app-documents)). Features specified in the Recommendations were thoroughly tested, were widely implemented in reading systems, and they can be considered as interoperable. On the other hand, features specified in Working Group Notes, although they may have some authoring uptakes, still lacked support in reading systems; as a result, these technologies should not yet be considered stable and interoperable.

The separate [section](https://www.w3.org/TR/epub-33/#change-log) in \[[epub-33](#bib-epub-33 "EPUB 3.3")\] provides a more detailed overview of the changes.

The W3C Recommendation was published in 2023, with a minor update in 2025.

### B.7 EPUB 3.4: 2027

[](#epub34)

Part of the work on EPUB 3.4, which started in 2025, was simplification: a number of attributes, primarily related to layout, were removed from the specification. These attributes were usually ignored by reading systems, due to the way these systems interact with the users. A good example was the choice between landscape and portrait view of the content: in EPUB 3.3 the publisher had the possibility to choose between these two. However, reading systems usually preferred to leave this choice to the end user, and the attribute was ignored.

EPUB 3.4 has also added some new features to EPUB 3. The most notable are:

- The introduction of [roll layout](#item-fxl-roll), making it possible to include "webtoons" into EPUB publications.
- [Exchanging annotations](#sec-annotation) among reading systems, particularly useful in, for example, scholarly publications or higher education.

The separate [section](https://www.w3.org/TR/epub-34/#change-log) in \[[epub-34](#bib-epub-34 "EPUB 3.4")\] provides a more detailed overview of the changes.

Note

EPUB 3.4 is expected to be published as a W3C Recommendation in 2027.

## C. Index

[](#index)

### C.1 Terms defined by reference

[](#index-defined-elsewhere)

- \[[EPUB-33](#bib-epub-33)\] defines the following:
  - section
- \[[EPUB-34](#bib-epub-34)\] defines the following:
  - alternate-script property
  - attributes specifying base direction
  - core media types
  - EPUB 3.4
  - EPUB container
  - EPUB content documents
  - EPUB navigation document
  - EPUB navigation document
  - EPUB publications
  - EPUB spine
  - `epub:type` attribute
  - Expressing structural semantics
  - fixed-layout XHTML content documents
  - hidden attribute
  - `link` element
  - Media overlays
  - metadata section
  - Open Container Format (OCF)
  - package document
  - Package document
  - page dimensions
  - page-progression-direction
  - pre-paginated
  - Pre-paginated
  - profile of HTML
  - reading systems
  - Reflowable layouts
  - roll
  - Roll
  - Scripting
  - `spine` element
  - unique identifier
  - unique-identifier attribute
  - XHTML content document
- \[[EPUB-A11Y-12](#bib-epub-a11y-12)\] defines the following:
  - EPUB Accessibility 1.2
- \[[EPUB-ANNO-10](#bib-epub-anno-10)\] defines the following:
  - EPUB Annotations 1.0
- \[[EPUB-RS-34](#bib-epub-rs-34)\] defines the following:
  - EPUB reading systems 3.4
- \[[HTML](#bib-html)\] defines the following:
  - `aside` element
  - `audio` element
  - `nav` element
  - `ruby` element
  - `script` element
  - `section` element
  - `video` element
  - XML syntax

## D. References

[](#references)

### D.1 Informative references

[](#informative-references)

\[annotation-model\]  
[Web Annotation Data Model](https://www.w3.org/TR/annotation-model/). Robert Sanderson; Paolo Ciccarese; Benjamin Young. W3C. 23 February 2017. W3C Recommendation. URL: <https://www.w3.org/TR/annotation-model/>

\[css-speech\]  
[CSS Speech Module Level 1](https://www.w3.org/TR/css-speech-1/). Léonie Watson; Elika Etemad. W3C. 14 February 2023. CRD. URL: <https://www.w3.org/TR/css-speech-1/>

\[csssnapshot\]  
[CSS Snapshot](https://www.w3.org/TR/CSS/). URL: <https://www.w3.org/TR/CSS/>

\[dpub-aria-1.1\]  
[Digital Publishing WAI-ARIA Module 1.1](https://www.w3.org/TR/dpub-aria-1.1/). Matt Garrish; Tzviya Siegman. W3C. 12 June 2025. W3C Recommendation. URL: <https://www.w3.org/TR/dpub-aria-1.1/>

\[ecmascript\]  
[ECMAScript Language Specification](https://tc39.es/ecma262/multipage/). Ecma International. URL: <https://tc39.es/ecma262/multipage/>

\[epub-31\]  
[EPUB 3.1](http://idpf.org/epub/31/spec/epub-spec-20170105.html). Markus Gylling; Tzviya Siegman; Matt Garrish. IDPF. 05 January 2017. URL: <http://idpf.org/epub/31/spec/epub-spec-20170105.html>

\[epub-32\]  
[EPUB 3.2](https://www.w3.org/publishing/epub32/epub-spec.html). Matt Garrish; Dave Cramer. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-spec.html>

\[epub-33\]  
[EPUB 3.3](https://www.w3.org/TR/epub-33/). Ivan Herman; Matt Garrish; Dave Cramer. W3C. 13 January 2026. W3C Recommendation. URL: <https://www.w3.org/TR/epub-33/>

\[epub-34\]  
[EPUB 3.4](https://www.w3.org/TR/epub-34/). Matt Garrish; Ivan Herman. W3C. 5 March 2026. W3C Working Draft. URL: <https://www.w3.org/TR/epub-34/>

\[epub-a11y-12\]  
[EPUB Accessibility 1.2](https://www.w3.org/TR/epub-a11y-12/). Matt Garrish; George Kerscher; Charles LaPierre; Gregorio Pellegrino; Avneesh Singh. W3C. 3 March 2026. W3C Working Draft. URL: <https://www.w3.org/TR/epub-a11y-12/>

\[epub-a11y-eaa-mapping\]  
[EPUB Accessibility - EU Accessibility Act Mapping](https://www.w3.org/TR/epub-a11y-eaa-mapping/). Cristina Mussinelli; Gregorio Pellegrino. W3C. 28 August 2025. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-a11y-eaa-mapping/>

\[epub-a11y-exemption\]  
[The EPUB Accessibility exemption property](https://www.w3.org/TR/epub-a11y-exemption/). Matt Garrish; Gregorio Pellegrino. W3C. 4 February 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-a11y-exemption/>

\[epub-a11y-tech-12\]  
[EPUB Accessibility Techniques 1.2](https://www.w3.org/TR/epub-a11y-tech-12/). Matt Garrish; George Kerscher; Charles LaPierre; Gregorio Pellegrino; Avneesh Singh. W3C. 3 March 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-a11y-tech-12/>

\[epub-anno-10\]  
[EPUB Annotations 1.0](https://www.w3.org/TR/epub-anno-10/). Ivan Herman; Laurent Le Meur. W3C. 24 February 2026. FPWD. URL: <https://www.w3.org/TR/epub-anno-10/>

\[epub-aria-authoring-11\]  
[EPUB Type to ARIA Role Authoring Guide 1.1](https://www.w3.org/TR/epub-aria-authoring-11/). Matt Garrish. W3C. 14 March 2023. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-aria-authoring-11/>

\[epub-fxl-a11y\]  
[EPUB Accessibility - Fixed Layout Challenges and Best Practices](https://www.w3.org/TR/epub-fxl-a11y/). Wendy Reid. W3C. 25 September 2025. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-fxl-a11y/>

\[epub-multi-rend-11\]  
[EPUB 3 Multiple-Rendition Publications 1.1](https://www.w3.org/TR/epub-multi-rend-11/). Matt Garrish. W3C. 20 January 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-multi-rend-11/>

\[epub-rs-34\]  
[EPUB Reading Systems 3.4](https://www.w3.org/TR/epub-rs-34/). Matt Garrish; Ivan Herman. W3C. 12 February 2026. W3C Working Draft. URL: <https://www.w3.org/TR/epub-rs-34/>

\[epub-ssv-11\]  
[EPUB 3 Structural Semantics Vocabulary 1.1](https://www.w3.org/TR/epub-ssv-11/). Ivan Herman; Matt Garrish. W3C. 28 August 2025. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-ssv-11/>

\[epub-tts-10\]  
[EPUB 3 Text-to-Speech Enhancements 1.0](https://www.w3.org/TR/epub-tts-10/). Matt Garrish. W3C. 28 August 2025. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-tts-10/>

\[epubchanges-30\]  
[EPUB 3 Changes from 2.0.1](http://idpf.org/epub/30/spec/epub30-changes-20111011.html). William McCoy; Markus Gylling. IDPF. 11 October 2011. URL: <http://idpf.org/epub/30/spec/epub30-changes-20111011.html>

\[epubchanges-301\]  
[EPUB 3.0.1 Changes from 3.0](http://idpf.org/epub/301/spec/epub-changes-20140626.html). Markus Gylling; Matt Garrish. IDPF. 26 June 2014. URL: <http://idpf.org/epub/301/spec/epub-changes-20140626.html>

\[epubchanges-31\]  
[EPUB 3.1 Changes from 3.0.1](http://idpf.org/epub/31/spec/epub-changes-20170105.html). Markus Gylling; Matt Garrish. IDPF. 05 January 2017. URL: <http://idpf.org/epub/31/spec/epub-changes-20170105.html>

\[epubchanges-32\]  
[EPUB 3.2 Changes](https://www.w3.org/publishing/epub32/epub-changes.html). Matt Garrish; Dave Cramer. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-changes.html>

\[epubcontentdocs-30\]  
[EPUB Content Documents 3.0](http://idpf.org/epub/30/spec/epub30-contentdocs-20111011.html). Markus Gylling; William McCoy; Elika J. Etimad; Matt Garrish. IDPF. 11 October 2011. URL: <http://idpf.org/epub/30/spec/epub30-contentdocs-20111011.html>

\[epubcontentdocs-301\]  
[EPUB Content Documents 3.0.1](http://idpf.org/epub/301/spec/epub-contentdocs-20140626.html). Markus Gylling; William McCoy; Elika J. Etimad; Matt Garrish. IDPF. 26 June 2014. URL: <http://idpf.org/epub/301/spec/epub-contentdocs-20140626.html>

\[epubcontentdocs-31\]  
[EPUB Content Documents 3.1](http://idpf.org/epub/31/spec/epub-contentdocs-20170105.html). Markus Gylling; William McCoy; Dave Cramer; Elika J. Etimad; Matt Garrish. IDPF. 05 January 2017. URL: <http://idpf.org/epub/31/spec/epub-contentdocs-20170105.html>

\[epubcontentdocs-32\]  
[EPUB Content Documents 3.2](https://www.w3.org/publishing/epub32/epub-contentdocs.html). Dave Cramer; Matt Garrish. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-contentdocs.html>

\[epubmediaoverlays-30\]  
[EPUB Media Overlays 3.0](http://idpf.org/epub/30/spec/epub30-mediaoverlays-20111011.html). Marisa DeMeglio; Daniel Weck. IDPF. 11 October 2011. URL: <http://idpf.org/epub/30/spec/epub30-mediaoverlays-20111011.html>

\[epubmediaoverlays-301\]  
[EPUB Media Overlays 3.0.1](http://idpf.org/epub/301/spec/epub-mediaoverlays-20140626.html). Marisa DeMeglio; Daniel Weck. IDPF. 26 June 2014. URL: <http://idpf.org/epub/301/spec/epub-mediaoverlays-20140626.html>

\[epubmediaoverlays-31\]  
[EPUB Media Overlays 3.1](http://idpf.org/epub/31/spec/epub-mediaoverlays-20170105.html). Marisa DeMeglio; Daniel Weck. IDPF. 05 January 2017. URL: <http://idpf.org/epub/31/spec/epub-mediaoverlays-20170105.html>

\[epubmediaoverlays-32\]  
[EPUB Media Overlays 3.2](https://www.w3.org/publishing/epub32/epub-mediaoverlays.html). Marisa DeMeglio; Daniel Weck. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-mediaoverlays.html>

\[epubpackages-31\]  
[EPUB Packages 3.1](http://idpf.org/epub/31/spec/epub-packages-20170105.html). Markus Gylling; William McCoy; Matt Garrish. IDPF. 05 January 2017. URL: <http://idpf.org/epub/31/spec/epub-packages-20170105.html>

\[epubpackages-32\]  
[EPUB Packages 3.2](https://www.w3.org/publishing/epub32/epub-packages.html). Matt Garrish; Dave Cramer. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-packages.html>

\[epubpublications-30\]  
[EPUB Publications 3.0](http://idpf.org/epub/30/spec/epub30-publications-20111011.html). Markus Gylling; William McCoy; Matt Garrish. IDPF. 11 October 2011. URL: <http://idpf.org/epub/30/spec/epub30-publications-20111011.html>

\[epubpublications-301\]  
[EPUB Publications 3.0.1](http://idpf.org/epub/301/spec/epub-publications-20140626.html). Markus Gylling; William McCoy; Matt Garrish. IDPF. 26 June 2014. URL: <http://idpf.org/epub/301/spec/epub-publications-20140626.html>

\[html\]  
[HTML Standard](https://html.spec.whatwg.org/multipage/). Anne van Kesteren; Domenic Denicola; Dominic Farolino; Ian Hickson; Philip Jägenstedt; Simon Pieters. WHATWG. Living Standard. URL: <https://html.spec.whatwg.org/multipage/>

\[its20\]  
[Internationalization Tag Set (ITS) Version 2.0](https://www.w3.org/TR/its20/). David Filip; Shaun McCance; David Lewis; Christian Lieske; Arle Lommel; Jirka Kosek; Felix Sasaki; Yves Savourel. W3C. 29 October 2013. W3C Recommendation. URL: <https://www.w3.org/TR/its20/>

\[json-ld\]  
[JSON-LD 1.0](https://www.w3.org/TR/json-ld/). Manu Sporny; Gregg Kellogg; Markus Lanthaler. W3C. 3 November 2020. W3C Recommendation. URL: <https://www.w3.org/TR/json-ld/>

\[microdata\]  
[HTML Microdata](https://www.w3.org/TR/microdata/). Chaals Nevile; Dan Brickley; Ian Hickson. W3C. 28 January 2021. W3C Working Group Note. URL: <https://www.w3.org/TR/microdata/>

\[ocf-201\]  
[EPUB Open Container Format (OCF) 2.0.1](http://idpf.org/epub/20/spec/OCF_2.0.1_draft.doc). IDPF. 04 September 2010. URL: <http://idpf.org/epub/20/spec/OCF_2.0.1_draft.doc>

\[ocf-30\]  
[EPUB Open Container Format (OCF) 3.0](http://idpf.org/epub/30/spec/epub30-ocf-20111011.html). James Pritchett; Markus Gylling. IDPF. 11 October 2011. URL: <http://idpf.org/epub/30/spec/epub30-ocf-20111011.html>

\[ocf-301\]  
[EPUB Open Container Format (OCF) 3.0.1](http://idpf.org/epub/301/spec/epub-ocf-20140626.html). James Pritchett; Markus Gylling. IDPF. 26 June 2014. URL: <http://idpf.org/epub/301/spec/epub-ocf-20140626.html>

\[ocf-31\]  
[Open Container Format (OCF) 3.1](http://idpf.org/epub/31/spec/epub-ocf-20170105.html). James Pritchett; Markus Gylling. IDPF. 05 January 2017. URL: <http://idpf.org/epub/31/spec/epub-ocf-20170105.html>

\[ocf-32\]  
[Open Container Format (OCF) 3.2](https://www.w3.org/publishing/epub32/epub-ocf.html). Garth Conboy. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-ocf.html>

\[opentype\]  
[OpenType specification](http://www.microsoft.com/typography/otspec/default.htm). Microsoft. URL: <http://www.microsoft.com/typography/otspec/default.htm>

\[opf-201\]  
[Open Packaging Format 2.0.1](http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm). IDPF. 04 September 2010. URL: <http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm>

\[ops-201\]  
[Open Publication Structure 2.0.1](http://idpf.org/epub/20/spec/OPS_2.0.1_draft.htm). IDPF. 04 September 2010. URL: <http://idpf.org/epub/20/spec/OPS_2.0.1_draft.htm>

\[pronunciation-lexicon\]  
[Pronunciation Lexicon Specification (PLS) Version 1.0](https://www.w3.org/TR/pronunciation-lexicon/). Paolo Baggia. W3C. 14 October 2008. W3C Recommendation. URL: <https://www.w3.org/TR/pronunciation-lexicon/>

\[rdfa-in-html\]  
[HTML+RDFa 1.1 - Second Edition](https://www.w3.org/TR/html-rdfa/). Manu Sporny. W3C. 17 March 2015. W3C Recommendation. URL: <https://www.w3.org/TR/html-rdfa/>

\[ssml\]  
[Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis11/). Daniel Burnett; Zhi Wei Shuang. W3C. 7 September 2010. W3C Recommendation. URL: <https://www.w3.org/TR/speech-synthesis11/>

\[svg\]  
[SVG](https://www.w3.org/TR/SVG/). W3C. URL: <https://www.w3.org/TR/SVG/>

\[unicode\]  
[The Unicode Standard](https://www.unicode.org/versions/latest/). Unicode Consortium. URL: <https://www.unicode.org/versions/latest/>

\[wai-aria-1.2\]  
[Accessible Rich Internet Applications (WAI-ARIA) 1.2](https://www.w3.org/TR/wai-aria-1.2/). Joanmarie Diggs; James Nurthen; Michael Cooper; Carolyn MacLeod. W3C. 6 June 2023. W3C Recommendation. URL: <https://www.w3.org/TR/wai-aria-1.2/>

\[wcag21\]  
[Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG21/). Michael Cooper; Andrew Kirkpatrick; Joshue O'Connor; Alastair Campbell. W3C. 6 May 2025. W3C Recommendation. URL: <https://www.w3.org/TR/WCAG21/>

\[woff\]  
[WOFF File Format 1.0](https://www.w3.org/TR/WOFF/). Jonathan Kew; Tal Leming; Erik van Blokland. W3C. 13 December 2012. W3C Recommendation. URL: <https://www.w3.org/TR/WOFF/>

\[woff2\]  
[WOFF File Format 2.0](https://www.w3.org/TR/WOFF2/). Vladimir Levantovsky. W3C. 8 August 2024. W3C Recommendation. URL: <https://www.w3.org/TR/WOFF2/>

\[xhtml11\]  
[XHTML™ 1.1 - Module-based XHTML - Second Edition](https://www.w3.org/TR/xhtml11/). Masayasu Ishikawa; Shane McCarron. W3C. 27 March 2018. W3C Recommendation. URL: <https://www.w3.org/TR/xhtml11/>

[↑](#title)

[Permalink](https://www.w3.org/TR/epub-33/#change-log)

**Referenced in:**

- [§ B.6 EPUB 3.3: 2022](#ref-for-index-term-section-1 "§ B.6 EPUB 3.3: 2022")

[Permalink](https://www.w3.org/TR/epub-34/#alternate-script)

**Referenced in:**

- [§ 9. Global language support](#ref-for-index-term-alternate-script-property-1 "§ 9. Global language support")

[Permalink](https://www.w3.org/TR/epub-34/#attrdef-dir)

**Referenced in:**

- [§ 9. Global language support](#ref-for-index-term-attributes-specifying-base-direction-1 "§ 9. Global language support")

[Permalink](https://www.w3.org/TR/epub-34/#sec-core-media-types)

**Referenced in:**

- [§ 6.2 Multimedia](#ref-for-index-term-core-media-types-1 "§ 6.2 Multimedia")

[Permalink](https://www.w3.org/TR/epub-34/#change-log)

**Referenced in:**

- [§ A.1 Specifications](#ref-for-index-term-epub-3-4-1 "§ A.1 Specifications")
- [§ B.7 EPUB 3.4: 2027](#ref-for-index-term-epub-3-4-2 "§ B.7 EPUB 3.4: 2027")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-container)

**Referenced in:**

- [§ 1.1 Reading this document](#ref-for-index-term-epub-container-1 "§ 1.1 Reading this document")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-content-document)

**Referenced in:**

- [§ 1.1 Reading this document](#ref-for-index-term-epub-content-documents-1 "§ 1.1 Reading this document")
- [§ 2. The EPUB container](#ref-for-index-term-epub-content-documents-2 "§ 2. The EPUB container")
- [§ 6. Content documents](#ref-for-index-term-epub-content-documents-3 "§ 6. Content documents")
- [§ 6.6 Structural semantics](#ref-for-index-term-epub-content-documents-4 "§ 6.6 Structural semantics")
- [§ 8.2 Media overlays](#ref-for-index-term-epub-content-documents-5 "§ 8.2 Media overlays")
- [§ 9. Global language support](#ref-for-index-term-epub-content-documents-6 "§ 9. Global language support")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-navigation-document)

**Referenced in:**

- [§ 1.1 Reading this document](#ref-for-index-term-epub-navigation-document-1 "§ 1.1 Reading this document")
- [§ 5. Navigation document](#ref-for-index-term-epub-navigation-document-2 "§ 5. Navigation document")

[Permalink](https://www.w3.org/TR/epub-34/#sec-nav)

**Referenced in:**

- [§ 5. Navigation document](#ref-for-index-term-epub-navigation-document-0-1 "§ 5. Navigation document")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-publication)

**Referenced in:**

- [§ 1.1 Reading this document](#ref-for-index-term-epub-publications-1 "§ 1.1 Reading this document")
- [§ 1.2 Reading the specifications](#ref-for-index-term-epub-publications-2 "§ 1.2 Reading the specifications")
- [§ 2. The EPUB container](#ref-for-index-term-epub-publications-3 "§ 2. The EPUB container")
- [§ 3. The package document](#ref-for-index-term-epub-publications-4 "§ 3. The package document")
- [§ 4. Reading order](#ref-for-index-term-epub-publications-5 "§ 4. Reading order")
- [§ 5. Navigation document](#ref-for-index-term-epub-publications-6 "§ 5. Navigation document")
- [§ 6. Content documents](#ref-for-index-term-epub-publications-7 "§ 6. Content documents")
- [§ 6.1 Rendering and CSS](#ref-for-index-term-epub-publications-8 "§ 6.1 Rendering and CSS")
- [§ 6.3 Fonts](#ref-for-index-term-epub-publications-9 "§ 6.3 Fonts")
- [§ 8.2 Media overlays](#ref-for-index-term-epub-publications-10 "§ 8.2 Media overlays")
- [§ 9. Global language support](#ref-for-index-term-epub-publications-11 "§ 9. Global language support")
- [§ 10. Accessibility](#ref-for-index-term-epub-publications-12 "§ 10. Accessibility") [(2)](#ref-for-index-term-epub-publications-13 "Reference 2")
- [§ 12. New and experimental features](#ref-for-index-term-epub-publications-14 "§ 12. New and experimental features")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-spine)

**Referenced in:**

- [§ 4. Reading order](#ref-for-index-term-epub-spine-1 "§ 4. Reading order")
- [§ 5. Navigation document](#ref-for-index-term-epub-spine-2 "§ 5. Navigation document") [(2)](#ref-for-index-term-epub-spine-3 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-type)

**Referenced in:**

- [§ 6.6 Structural semantics](#ref-for-index-term-epub-type-attribute-1 "§ 6.6 Structural semantics")

[Permalink](https://www.w3.org/TR/epub-34/#app-structural-semantics)

**Referenced in:**

- [§ 6.6 Structural semantics](#ref-for-index-term-expressing-structural-semantics-1 "§ 6.6 Structural semantics")

[Permalink](https://www.w3.org/TR/epub-34/#sec-fixed-layouts)

**Referenced in:**

- [§ 7.2 Fixed layouts](#ref-for-index-term-fixed-layout-xhtml-content-documents-1 "§ 7.2 Fixed layouts") [(2)](#ref-for-index-term-fixed-layout-xhtml-content-documents-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-34/#sec-nav-doc-use-spine)

**Referenced in:**

- [§ 5. Navigation document](#ref-for-index-term-hidden-attribute-1 "§ 5. Navigation document")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-link)

**Referenced in:**

- [§ 3. The package document](#ref-for-index-term-link-element-1 "§ 3. The package document")

[Permalink](https://www.w3.org/TR/epub-34/#sec-media-overlays)

**Referenced in:**

- [§ 8.2 Media overlays](#ref-for-index-term-media-overlays-1 "§ 8.2 Media overlays")

[Permalink](https://www.w3.org/TR/epub-34/#sec-pkg-metadata)

**Referenced in:**

- [§ 3. The package document](#ref-for-index-term-metadata-section-1 "§ 3. The package document")

[Permalink](https://www.w3.org/TR/epub-34/#sec-ocf)

**Referenced in:**

- [§ 2. The EPUB container](#ref-for-index-term-open-container-format-ocf-1 "§ 2. The EPUB container")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-package-document)

**Referenced in:**

- [§ 1.1 Reading this document](#ref-for-index-term-package-document-1 "§ 1.1 Reading this document")
- [§ 2. The EPUB container](#ref-for-index-term-package-document-2 "§ 2. The EPUB container")
- [§ 3. The package document](#ref-for-index-term-package-document-3 "§ 3. The package document")
- [§ 9. Global language support](#ref-for-index-term-package-document-4 "§ 9. Global language support")

[Permalink](https://www.w3.org/TR/epub-34/#sec-package-doc)

**Referenced in:**

- [§ 3. The package document](#ref-for-index-term-package-document-0-1 "§ 3. The package document")

[Permalink](https://www.w3.org/TR/epub-34/#sec-fxl-content-dimensions)

**Referenced in:**

- [§ 7.2 Fixed layouts](#ref-for-index-term-page-dimensions-1 "§ 7.2 Fixed layouts")

[Permalink](https://www.w3.org/TR/epub-34/#attrdef-spine-page-progression-direction)

**Referenced in:**

- [§ 9. Global language support](#ref-for-index-term-page-progression-direction-1 "§ 9. Global language support")

[Permalink](https://www.w3.org/TR/epub-34/#spread-page-spread-right-figure)

**Referenced in:**

- [§ 7.2 Fixed layouts](#ref-for-index-term-pre-paginated-1 "§ 7.2 Fixed layouts")

[Permalink](https://www.w3.org/TR/epub-34/#sec-pre-paginated)

**Referenced in:**

- [§ 7.2 Fixed layouts](#ref-for-index-term-pre-paginated-0-1 "§ 7.2 Fixed layouts")

[Permalink](https://www.w3.org/TR/epub-34/#sec-xhtml)

**Referenced in:**

- [§ 6. Content documents](#ref-for-index-term-profile-of-html-1 "§ 6. Content documents")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-epub-reading-system)

**Referenced in:**

- [§ 5. Navigation document](#ref-for-index-term-reading-systems-1 "§ 5. Navigation document")
- [§ 6.1 Rendering and CSS](#ref-for-index-term-reading-systems-2 "§ 6.1 Rendering and CSS")
- [§ 6.6 Structural semantics](#ref-for-index-term-reading-systems-3 "§ 6.6 Structural semantics")
- [§ 11. Annotations](#ref-for-index-term-reading-systems-4 "§ 11. Annotations")
- [§ 12. New and experimental features](#ref-for-index-term-reading-systems-5 "§ 12. New and experimental features")

[Permalink](https://www.w3.org/TR/epub-34/#sec-reflowable-layouts)

**Referenced in:**

- [§ 7.1 Reflowable layouts](#ref-for-index-term-reflowable-layouts-1 "§ 7.1 Reflowable layouts")

[Permalink](https://www.w3.org/TR/epub-34/#layout-roll-figure)

**Referenced in:**

- [§ 7.2 Fixed layouts](#ref-for-index-term-roll-1 "§ 7.2 Fixed layouts")

[Permalink](https://www.w3.org/TR/epub-34/#sec-roll)

**Referenced in:**

- [§ 7.2 Fixed layouts](#ref-for-index-term-roll-0-1 "§ 7.2 Fixed layouts")

[Permalink](https://www.w3.org/TR/epub-34/#sec-scripted-content)

**Referenced in:**

- [§ 6.4 Scripting](#ref-for-index-term-scripting-1 "§ 6.4 Scripting")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-spine)

**Referenced in:**

- [§ 3. The package document](#ref-for-index-term-spine-element-1 "§ 3. The package document") [(2)](#ref-for-index-term-spine-element-2 "Reference 2")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-unique-identifier)

**Referenced in:**

- [§ 3. The package document](#ref-for-index-term-unique-identifier-1 "§ 3. The package document")

[Permalink](https://www.w3.org/TR/epub-34/#attrdef-package-unique-identifier)

**Referenced in:**

- [§ 3. The package document](#ref-for-index-term-unique-identifier-attribute-1 "§ 3. The package document")

[Permalink](https://www.w3.org/TR/epub-34/#dfn-xhtml-content-document)

**Referenced in:**

- [§ 5. Navigation document](#ref-for-index-term-xhtml-content-document-1 "§ 5. Navigation document")
- [§ 6. Content documents](#ref-for-index-term-xhtml-content-document-2 "§ 6. Content documents") [(2)](#ref-for-index-term-xhtml-content-document-3 "Reference 2")
- [§ 6.2 Multimedia](#ref-for-index-term-xhtml-content-document-4 "§ 6.2 Multimedia")
- [§ 6.5 Semantic enrichment](#ref-for-index-term-xhtml-content-document-5 "§ 6.5 Semantic enrichment")

[Permalink](https://www.w3.org/TR/epub-a11y-12/#change-log)

**Referenced in:**

- [§ A.1 Specifications](#ref-for-index-term-epub-accessibility-1-2-1 "§ A.1 Specifications")

[Permalink](https://www.w3.org/TR/epub-anno-10/#change-log)

**Referenced in:**

- [§ A.1 Specifications](#ref-for-index-term-epub-annotations-1-0-1 "§ A.1 Specifications")

[Permalink](https://www.w3.org/TR/epub-rs-34/#change-log)

**Referenced in:**

- [§ A.1 Specifications](#ref-for-index-term-epub-reading-systems-3-4-1 "§ A.1 Specifications")

[Permalink](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element)

**Referenced in:**

- [§ 10. Accessibility](#ref-for-index-term-aside-element-1 "§ 10. Accessibility")

[Permalink](https://html.spec.whatwg.org/multipage/media.html#audio)

**Referenced in:**

- [§ 6. Content documents](#ref-for-index-term-audio-element-1 "§ 6. Content documents")
- [§ 6.2 Multimedia](#ref-for-index-term-audio-element-2 "§ 6.2 Multimedia")
- [§ 10. Accessibility](#ref-for-index-term-audio-element-3 "§ 10. Accessibility")

[Permalink](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element)

**Referenced in:**

- [§ 5. Navigation document](#ref-for-index-term-nav-element-1 "§ 5. Navigation document") [(2)](#ref-for-index-term-nav-element-2 "Reference 2")
- [§ 10. Accessibility](#ref-for-index-term-nav-element-3 "§ 10. Accessibility")

[Permalink](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-ruby-element)

**Referenced in:**

- [§ 5. Navigation document](#ref-for-index-term-ruby-element-1 "§ 5. Navigation document")

[Permalink](https://html.spec.whatwg.org/multipage/scripting.html#script)

**Referenced in:**

- [§ 6.5 Semantic enrichment](#ref-for-index-term-script-element-1 "§ 6.5 Semantic enrichment")

[Permalink](https://html.spec.whatwg.org/multipage/sections.html#the-section-element)

**Referenced in:**

- [§ 10. Accessibility](#ref-for-index-term-section-element-1 "§ 10. Accessibility")

[Permalink](https://html.spec.whatwg.org/multipage/media.html#video)

**Referenced in:**

- [§ 6. Content documents](#ref-for-index-term-video-element-1 "§ 6. Content documents")
- [§ 6.2 Multimedia](#ref-for-index-term-video-element-2 "§ 6.2 Multimedia")
- [§ 10. Accessibility](#ref-for-index-term-video-element-3 "§ 10. Accessibility")

[Permalink](https://html.spec.whatwg.org/multipage/#writing-xhtml-documents)

**Referenced in:**

- [§ 6. Content documents](#ref-for-index-term-xml-syntax-1 "§ 6. Content documents")
