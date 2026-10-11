[![W3C](https://www.w3.org/StyleSheets/TR/2021/logos/W3C)](https://www.w3.org/)

# EPUB 3.4

[W3C Candidate Recommendation Draft](https://www.w3.org/standards/types#CRD) 02 October 2026

More details about this document

This version:  
[https://www.w3.org/TR/2026/CRD-epub-34-20261002/](https://www.w3.org/TR/2026/CRD-epub-34-20261002/)

Latest published version:  
<https://www.w3.org/TR/epub-34/>

Latest editor's draft:  
<https://w3c.github.io/epub-specs/epub34/authoring/>

History:  
<https://www.w3.org/standards/history/epub-34/>

[Commit history](https://github.com/w3c/epub-specs/commits/main)

Test suite:  
<https://w3c.github.io/epub-tests/index.html>

Implementation report:  
<https://w3c.github.io/epub-specs/epub34/reports/>

Editors:  
Matt Garrish ([DAISY Consortium](https://daisy.org))

[Ivan Herman](https://www.w3.org/People/Ivan/)[![](data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld2JveD0iMCAwIDI1NiAyNTYiPgogICAgPHN0eWxlPgoKICAgICAgLnN0MSB7CiAgICAgICAgZmlsbDogI2ZmZjsKICAgICAgfQogICAgCjwvc3R5bGU+CiAgICA8cGF0aCBkPSJNMjU2IDEyOGMwIDcwLjctNTcuMyAxMjgtMTI4IDEyOFMwIDE5OC43IDAgMTI4IDU3LjMgMCAxMjggMHMxMjggNTcuMyAxMjggMTI4eiIgZmlsbD0iI2E2Y2UzOSIgLz4KICAgIDxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik04Ni4zIDE4Ni4ySDcwLjlWNzkuMWgxNS40djEwNy4xek0xMDguOSA3OS4xaDQxLjZjMzkuNiAwIDU3IDI4LjMgNTcgNTMuNiAwIDI3LjUtMjEuNSA1My42LTU2LjggNTMuNmgtNDEuOFY3OS4xem0xNS40IDkzLjNoMjQuNWMzNC45IDAgNDIuOS0yNi41IDQyLjktMzkuN0MxOTEuNyAxMTEuMiAxNzggOTMgMTQ4IDkzaC0yMy43djc5LjR6TTg4LjcgNTYuOGMwIDUuNS00LjUgMTAuMS0xMC4xIDEwLjFzLTEwLjEtNC42LTEwLjEtMTAuMWMwLTUuNiA0LjUtMTAuMSAxMC4xLTEwLjFzMTAuMSA0LjYgMTAuMSAxMC4xeiIgLz4KICA8L3N2Zz4=)](https://orcid.org/0000-0003-0782-2704) ([W3C](https://www.w3.org))

Former editor:  
Dave Cramer (W3C Invited Expert)

Feedback:  
[GitHub w3c/epub-specs](https://github.com/w3c/epub-specs/) ([pull requests](https://github.com/w3c/epub-specs/pulls/), [new issue](https://github.com/w3c/epub-specs/issues/new/choose), [open issues](https://github.com/w3c/epub-specs/issues/))

[public-pm-wg@w3.org](mailto:public-pm-wg@w3.org?subject=%5Bepub-34%5D%20YOUR%20TOPIC%20HERE) with subject line \[epub-34\] *… message topic …* ([archives](https://lists.w3.org/Archives/Public/public-pm-wg))

[Copyright](https://www.w3.org/policies/#copyright) © 1999-2026 [International Digital Publishing Forum](https://www.idpf.org) and [World Wide Web Consortium](https://www.w3.org/). W3C^(®) [liability](https://www.w3.org/policies/#Legal_Disclaimer), [trademark](https://www.w3.org/policies/#W3C_Trademarks) and [permissive document license](https://www.w3.org/copyright/software-license-2023/ "W3C Software and Document Notice and License") rules apply.

------------------------------------------------------------------------

## Abstract

EPUB® 3 defines a distribution and interchange format for digital publications and documents. The EPUB format provides a means of representing, packaging, and encoding structured and semantically enhanced web content — including HTML, CSS, SVG, and other resources — for distribution in a single-file container.

This specification defines the authoring requirements for [EPUB publications](#dfn-epub-publication) — works of intellectual or artistic content that are represented by a set of interrelated resources and packaged for distribution in a specialized ZIP container.

## Status of This Document

*This section describes the status of this document at the time of its publication. A list of current W3C publications and the latest revision of this technical report can be found in the [W3C standards and drafts index](https://www.w3.org/TR/).*

This document was published by the [Publishing Maintenance Working Group](https://www.w3.org/groups/wg/pm) as a Candidate Recommendation Draft using the [Recommendation track](https://www.w3.org/policies/process/20250818/#recs-and-notes).

Publication as a Candidate Recommendation does not imply endorsement by W3C and its Members. A Candidate Recommendation Draft integrates changes from the previous Candidate Recommendation that the Working Group intends to include in a subsequent Candidate Recommendation Snapshot.

This is a draft document and may be updated, replaced, or obsoleted by other documents at any time. It is inappropriate to cite this document as other than a work in progress. Future updates to this upcoming Recommendation may incorporate [new features](https://www.w3.org/policies/process/20250818/#allow-new-features).

This document was produced by a group operating under the [W3C Patent Policy](https://www.w3.org/policies/patent-policy/). W3C maintains a [public list of any patent disclosures](https://www.w3.org/groups/wg/pm/ipr) made in connection with the deliverables of the group; that page also includes instructions for disclosing a patent. An individual who has actual knowledge of a patent that the individual believes contains [Essential Claim(s)](https://www.w3.org/policies/patent-policy/#def-essential) must disclose the information in accordance with [section 6 of the W3C Patent Policy](https://www.w3.org/policies/patent-policy/#sec-Disclosure).

This document is governed by the [18 August 2025 W3C Process Document](https://www.w3.org/policies/process/20250818/).

## Table of Contents

1.  [Abstract](#abstract)
2.  [Status of This Document](#sotd)
3.  [1. Introduction](#sec-introduction)
    1.  [1.1 Overview](#sec-intro-overview)
    2.  [1.2 Organization](#sec-intro-spec-org)
    3.  [1.3 Relationship to other specifications](#sec-intro-relations)
        1.  [1.3.1 Relationship to HTML](#sec-overview-relations-html)
        2.  [1.3.2 Relationship to SVG](#sec-overview-relations-svg)
        3.  [1.3.3 Relationship to CSS](#sec-overview-relations-css)
        4.  [1.3.4 Relationship to MathML](#sec-overview-relations-mathml)
        5.  [1.3.5 Relationship to SMIL](#sec-overview-relations-smil)
        6.  [1.3.6 Relationship to URL](#sec-overview-relations-url)
    4.  [1.4 Terminology](#sec-terminology)
    5.  [1.5 Conformance](#conformance)
    6.  [1.6 Authoring shorthands](#sec-intro-shorthands)
4.  [2. EPUB publication conformance](#sec-epub-conf)
    1.  [2.1 Conformance checking](#sec-conformance-checking)
5.  [3. Publication resources](#sec-publication-resources)
    1.  [3.1 Introduction](#sec-pub-res-intro)
        1.  [3.1.1 The manifest plane](#sec-manifest-plane)
        2.  [3.1.2 The spine plane](#sec-spine-plane)
        3.  [3.1.3 The content plane](#sec-content-plane)
    2.  [3.2 Core media types](#sec-core-media-types)
    3.  [3.3 Foreign resources](#sec-foreign-resources)
    4.  [3.4 Exempt resources](#sec-exempt-resources)
    5.  [3.5 Resource fallbacks](#sec-resource-fallbacks)
        1.  [3.5.1 Manifest fallbacks](#sec-manifest-fallbacks)
        2.  [3.5.2 Intrinsic fallbacks](#sec-intrinsic-fallbacks)
            1.  [3.5.2.1 HTML `audio` and `video` fallbacks](#sec-fallbacks-audio)
            2.  [3.5.2.2 HTML `img` fallbacks](#sec-fallbacks-img)
            3.  [3.5.2.3 HTML `script` element](#html-script-element)
    6.  [3.6 Resource locations](#sec-resource-locations)
    7.  [3.7 Data URLs](#sec-data-urls)
    8.  [3.8 File URLs](#sec-file-urls)
    9.  [3.9 XML conformance](#sec-xml-constraints)
6.  [4. Open Container Format (OCF)](#sec-ocf)
    1.  [4.1 Introduction](#sec-ocf-intro)
    2.  [4.2 OCF abstract container](#sec-container-abstract)
        1.  [4.2.1 Introduction](#sec-container-abstract-intro)
        2.  [4.2.2 File and directory structure](#sec-container-file-and-dir-structure)
        3.  [4.2.3 File paths and file names](#sec-container-filenames)
        4.  [4.2.4 Deriving file paths](#sec-file-names-to-path-names)
        5.  [4.2.5 URLs in the OCF abstract container](#sec-container-iri)
        6.  [4.2.6 `META-INF` directory](#sec-container-metainf)
            1.  [4.2.6.1 Inclusion in OCF abstract container](#sec-container-metainf-inc)
            2.  [4.2.6.2 Parsing URLs in the `META-INF` directory](#sec-parsing-urls-metainf)
            3.  [4.2.6.3 Reserved files](#sec-container-metainf-files)
                1.  [4.2.6.3.1 Container file (`container.xml`)](#sec-container-metainf-container.xml)
                    1.  [4.2.6.3.1.1 The `container` element](#sec-container.xml-container-elem)
                    2.  [4.2.6.3.1.2 The `rootfiles` element](#sec-container.xml-rootfiles-elem)
                    3.  [4.2.6.3.1.3 The `rootfile` element](#sec-container.xml-rootfile-elem)
                    4.  [4.2.6.3.1.4 The `links` element](#sec-container.xml-links-elem)
                    5.  [4.2.6.3.1.5 The `link` element](#sec-container.xml-link-elem)
                    6.  [4.2.6.3.1.6 Examples](#sec-container-container.xml-example)
                2.  [4.2.6.3.2 Encryption file (`encryption.xml`)](#sec-container-metainf-encryption.xml)
                    1.  [4.2.6.3.2.1 The `encryption` element](#sec-encryption.xml-encryption)
                    2.  [4.2.6.3.2.2 Order of compression and encryption](#sec-enc-compression)
                3.  [4.2.6.3.3 Manifest file (`manifest.xml`)](#sec-container-metainf-manifest.xml)
                4.  [4.2.6.3.4 Metadata file (`metadata.xml`)](#sec-container-metainf-metadata.xml)
                5.  [4.2.6.3.5 Rights management file (`rights.xml`)](#sec-container-metainf-rights.xml)
                6.  [4.2.6.3.6 Digital signatures file (`signatures.xml`)](#sec-container-metainf-signatures.xml)
                    1.  [4.2.6.3.6.1 The `signatures` element](#sec-signatures.xml-signatures)
    3.  [4.3 OCF ZIP container](#sec-container-zip)
        1.  [4.3.1 Introduction](#sec-container-zip-intro)
        2.  [4.3.2 ZIP file requirements](#sec-zip-container-zipreqs)
        3.  [4.3.3 OCF ZIP container media type identification](#sec-zip-container-mime)
7.  [5. Package document](#sec-package-doc)
    1.  [5.1 Introduction](#sec-package-intro)
    2.  [5.2 Parsing URLs in the package document](#sec-parse-package-urls)
    3.  [5.3 Vocabulary association mechanisms](#sec-vocab-assoc)
        1.  [5.3.1 Introduction](#vocab-assoc-intro)
        2.  [5.3.2 The compact URL data type](#sec-compact-url-datatype)
        3.  [5.3.3 Default vocabularies](#sec-default-vocab)
        4.  [5.3.4 The `prefix` attribute](#sec-prefix-attr)
        5.  [5.3.5 Reserved prefixes](#sec-reserved-prefixes)
    4.  [5.4 Shared attributes](#sec-shared-attrs)
        1.  [5.4.1 The `dir` attribute](#attrdef-dir)
        2.  [5.4.2 The `href` attribute](#attrdef-href)
        3.  [5.4.3 The `id` attribute](#attrdef-id)
        4.  [5.4.4 The `media-type` attribute](#attrdef-media-type)
        5.  [5.4.5 The `properties` attribute](#attrdef-properties)
        6.  [5.4.6 The `refines` attribute](#attrdef-refines)
        7.  [5.4.7 The `xml:lang` attribute](#attrdef-xml-lang)
    5.  [5.5 The `package` element](#sec-package-elem)
    6.  [5.6 Metadata section](#sec-pkg-metadata)
        1.  [5.6.1 The `metadata` element](#sec-metadata-elem)
        2.  [5.6.2 Metadata values](#sec-metadata-values)
        3.  [5.6.3 Dublin Core](#sec-opf-dcmes-hd)
            1.  [5.6.3.1 Required elements](#sec-opf-dcmes-required-hd)
                1.  [5.6.3.1.1 The `dc:identifier` element](#sec-opf-dcidentifier)
                2.  [5.6.3.1.2 The `dc:title` element](#sec-opf-dctitle)
                3.  [5.6.3.1.3 The `dc:language` element](#sec-opf-dclanguage)
            2.  [5.6.3.2 Optional elements](#sec-opf-dcmes-optional-hd)
                1.  [5.6.3.2.1 General definition](#sec-opf-dcmes-optional-def)
                2.  [5.6.3.2.2 The `dc:contributor` element](#sec-opf-dccontributor)
                3.  [5.6.3.2.3 The `dc:creator` element](#sec-opf-dccreator)
                4.  [5.6.3.2.4 The `dc:date` element](#sec-opf-dcdate)
                5.  [5.6.3.2.5 The `dc:subject` element](#sec-opf-dcsubject)
                6.  [5.6.3.2.6 The `dc:type` element](#sec-opf-dctype)
        4.  [5.6.4 The `meta` element](#sec-meta-elem)
        5.  [5.6.5 Last modified date](#sec-metadata-last-modified)
        6.  [5.6.6 The `link` element](#sec-link-elem)
    7.  [5.7 Manifest section](#sec-pkg-manifest)
        1.  [5.7.1 The `manifest` element](#sec-manifest-elem)
        2.  [5.7.2 The `item` element](#sec-item-elem)
            1.  [5.7.2.1 Resource properties](#sec-item-resource-properties)
            2.  [5.7.2.2 Examples](#sec-item-elem-examples)
    8.  [5.8 Spine section](#sec-pkg-spine)
        1.  [5.8.1 The `spine` element](#sec-spine-elem)
        2.  [5.8.2 The `itemref` element](#sec-itemref-elem)
8.  [6. Layouts](#sec-layouts)
    1.  [6.1 Introduction](#sec-general-rendering-intro)
    2.  [6.2 Reflowable layouts](#sec-reflowable)
    3.  [6.3 Fixed layouts](#sec-fixed-layouts)
        1.  [6.3.1 Pre-paginated](#sec-pre-paginated)
            1.  [6.3.1.1 Synthetic spreads](#page-spread)
        2.  [6.3.2 Roll](#sec-roll)
9.  [7. EPUB content documents](#sec-contentdocs)
    1.  [7.1 XHTML content documents](#sec-xhtml)
        1.  [7.1.1 Introduction](#sec-xhtml-intro)
        2.  [7.1.2 XHTML requirements](#sec-xhtml-req)
        3.  [7.1.3 HTML extensions](#sec-xhtml-extensions)
            1.  [7.1.3.1 Structural semantics](#sec-xhtml-structural-semantics)
            2.  [7.1.3.2 RDFa](#sec-xhtml-rdfa)
            3.  [7.1.3.3 Internationalization tag set (ITS)](#sec-xhtml-its)
            4.  [7.1.3.4 Custom attributes](#sec-xhtml-custom-attributes)
        4.  [7.1.4 HTML deviations and constraints](#sec-xhtml-deviations)
            1.  [7.1.4.1 Embedded MathML](#sec-xhtml-mathml)
            2.  [7.1.4.2 Embedded SVG](#sec-xhtml-svg)
            3.  [7.1.4.3 Discouraged constructs](#sec-xhtml-deviations-discouraged)
                1.  [7.1.4.3.1 The `base` element](#sec-xhtml-deviations-base)
                2.  [7.1.4.3.2 The `rp` element](#sec-xhtml-deviations-rp)
                3.  [7.1.4.3.3 The `embed` element](#sec-xhtml-deviations-embed)
    2.  [7.2 SVG content documents](#sec-svg)
        1.  [7.2.1 Introduction](#sec-svg-intro)
        2.  [7.2.2 SVG requirements](#sec-svg-req)
        3.  [7.2.3 Restrictions on SVG](#sec-svg-restrictions)
    3.  [7.3 Fixed-layout documents](#sec-fxl-docs)
        1.  [7.3.1 Introduction](#sec-fxl-intro)
        2.  [7.3.2 Fixed-layout document dimensions](#sec-fxl-content-dimensions)
    4.  [7.4 Common resource requirements](#sec-common-resource-req)
        1.  [7.4.1 Cascading Style Sheets (CSS)](#sec-css)
            1.  [7.4.1.1 Introduction](#sec-css-intro)
            2.  [7.4.1.2 CSS requirements](#sec-css-req)
            3.  [7.4.1.3 Reading system support considerations](#sec-css-rs)
        2.  [7.4.2 Scripting](#sec-scripted-content)
            1.  [7.4.2.1 Script inclusion](#sec-scripted-support)
            2.  [7.4.2.2 Scripting contexts](#sec-scripted-context)
                1.  [7.4.2.2.1 Container-constrained scripts](#sec-scripted-container-constrained)
                2.  [7.4.2.2.2 Spine-level scripts](#sec-scripted-spine)
            3.  [7.4.2.3 Event model](#sec-scripted-content-events)
            4.  [7.4.2.4 Scripting accessibility](#sec-scripted-a11y)
            5.  [7.4.2.5 Scripting fallbacks](#confreq-cd-scripted-flbk)
        3.  [7.4.3 The `epub:type` attribute](#sec-epub-type-attribute)
            1.  [7.4.3.1 Structural semantics](#sec-structural-semantics)
            2.  [7.4.3.2 Syntax](#type-attr-syntax)
10. [8. EPUB navigation document](#sec-nav)
    1.  [8.1 Introduction](#sec-nav-intro)
    2.  [8.2 Navigation document requirements](#sec-nav-content-req)
    3.  [8.3 The `nav` element: restrictions](#sec-nav-def-model)
    4.  [8.4 The `nav` element: types](#sec-nav-def-types)
        1.  [8.4.1 Introduction](#sec-nav-def-types-intro)
        2.  [8.4.2 The `toc nav` element](#sec-nav-toc)
        3.  [8.4.3 The `page-list nav` element](#sec-nav-pagelist)
        4.  [8.4.4 The `landmarks nav` element](#sec-nav-landmarks)
        5.  [8.4.5 Other `nav` elements](#sec-nav-def-types-other)
    5.  [8.5 Using in the spine](#sec-nav-doc-use-spine)
11. [9. Aural rendering](#sec-aural-rendering)
    1.  [9.1 Introduction](#sec-aural-intro)
    2.  [9.2 Text-to-speech](#sec-tts)
    3.  [9.3 Media overlays](#sec-media-overlays)
        1.  [9.3.1 Introduction](#sec-overlays-introduction)
        2.  [9.3.2 Media overlay documents](#sec-overlay-docs)
            1.  [9.3.2.1 Media overlay document requirements](#sec-overlay-req)
            2.  [9.3.2.2 Media overlay document definition](#sec-overlays-def)
                1.  [9.3.2.2.1 The `smil` element](#sec-smil-smil-elem)
                2.  [9.3.2.2.2 The `head` element](#sec-smil-head-elem)
                3.  [9.3.2.2.3 The `metadata` element](#sec-smil-metadata-elem)
                4.  [9.3.2.2.4 The `body` element](#sec-smil-body-elem)
                5.  [9.3.2.2.5 The `seq` element](#sec-smil-seq-elem)
                6.  [9.3.2.2.6 The `par` element](#sec-smil-par-elem)
                7.  [9.3.2.2.7 The `text` element](#sec-smil-text-elem)
                8.  [9.3.2.2.8 The `audio` element](#sec-smil-audio-elem)
        3.  [9.3.3 Creating media overlays](#sec-overlay-doc-create)
            1.  [9.3.3.1 Introduction](#sec-docs-intro)
            2.  [9.3.3.2 Relationship to the EPUB content document](#sec-docs-relations)
                1.  [9.3.3.2.1 Overlay structure](#sec-media-overlays-structure)
                2.  [9.3.3.2.2 Referencing document fragments](#sec-media-overlays-fragids)
                3.  [9.3.3.2.3 Overlay granularity](#sec-media-overlays-granularity)
                4.  [9.3.3.2.4 Text-to-speech rendering](#sec-mo-tts)
            3.  [9.3.3.3 Structural semantics in overlays](#sec-docs-structural-semantic)
            4.  [9.3.3.4 Associating style information](#sec-docs-assoc-style)
            5.  [9.3.3.5 Media overlays packaging](#sec-docs-package)
                1.  [9.3.3.5.1 Including media overlays](#sec-package-including)
                2.  [9.3.3.5.2 Overlays package metadata](#sec-mo-package-metadata)
        4.  [9.3.4 Skippability and escapability](#sec-behaviors-skip-escape)
            1.  [9.3.4.1 Skippability](#sec-skippability)
            2.  [9.3.4.2 Escapability](#sec-escapability)
        5.  [9.3.5 Navigation document overlays](#sec-mo-nav-doc)
12. [10. Accessibility](#sec-accessibility)
13. [11. Security and privacy](#sec-security-privacy)
    1.  [11.1 Overview](#security-privacy-overview)
    2.  [11.2 Threat model](#epub-threat-model)
        1.  [11.2.1 EPUB-specific features](#privacy-security-epub-features)
    3.  [11.3 Recommendations](#security-privacy-recommendations)
14. [A. Detailed examples](#app-examples)
    1.  [A.1 Resources](#publication-resources-example)
    2.  [A.2 Scripting contexts](#scripted-contexts-example)
    3.  [A.3 Packaged EPUB](#ocf-example)
    4.  [A.4 Clock values](#clock-examples)
15. [B. Allowed external identifiers](#app-identifiers-allowed)
16. [C. The `viewport meta` tag](#app-viewport-meta)
    1.  [C.1 Introduction](#app-viewport-meta-intro)
    2.  [C.2 Syntax](#app-viewport-meta-syntax)
17. [D. Vocabularies](#app-vocabs)
    1.  [D.1 Property field definitions](#sec-property-field-definitions)
    2.  [D.2 Meta properties vocabulary](#app-meta-property-vocab)
        1.  [D.2.1 alternate-script](#sec-alternate-script)
        2.  [D.2.2 authority](#sec-authority)
        3.  [D.2.3 belongs-to-collection](#sec-belongs-to-collection)
        4.  [D.2.4 collection-type](#sec-collection-type)
        5.  [D.2.5 display-seq](#sec-display-seq)
        6.  [D.2.6 file-as](#sec-file-as)
        7.  [D.2.7 group-position](#sec-group-position)
        8.  [D.2.8 identifier-type](#sec-identifier-type)
        9.  [D.2.9 pageBreakSource](#sec-pageBreakSource)
        10. [D.2.10 role](#sec-role)
        11. [D.2.11 term](#sec-term)
        12. [D.2.12 title-type](#sec-title-type)
        13. [D.2.13 Examples](#sec-property-examples)
    3.  [D.3 Metadata link vocabulary](#app-link-vocab)
        1.  [D.3.1 Link relationships](#sec-link-rel)
            1.  [D.3.1.1 alternate](#sec-alternate)
            2.  [D.3.1.2 record](#sec-record)
            3.  [D.3.1.3 voicing](#sec-voicing)
        2.  [D.3.2 Link properties](#sec-link-properties)
            1.  [D.3.2.1 onix](#sec-onix)
    4.  [D.4 Package rendering vocabulary](#app-rendering-vocab)
        1.  [D.4.1 Layout control](#sec-layout-specify)
            1.  [D.4.1.1 rendition:layout](#layout-def)
            2.  [D.4.1.2 Layout overrides](#layout-overrides)
                1.  [D.4.1.2.1 rendition:layout-pre-paginated](#sec-layout-pre-paginated)
                2.  [D.4.1.2.2 rendition:layout-reflowable](#sec-layout-reflowable)
        2.  [D.4.2 Synthetic spread placement](#spread-placement)
            1.  [D.4.2.1 rendition:page-spread-center](#sec-rendition-page-spread-center)
            2.  [D.4.2.2 rendition:page-spread-left](#sec-rendition-page-spread-left)
            3.  [D.4.2.3 rendition:page-spread-right](#sec-rendition-page-spread-right)
    5.  [D.5 Custom rendering properties](#sec-rendering-custom-properties)
    6.  [D.6 Manifest properties vocabulary](#app-item-properties-vocab)
        1.  [D.6.1 cover-image](#sec-cover-image)
        2.  [D.6.2 mathml](#sec-mathml)
        3.  [D.6.3 nav](#sec-nav-prop)
        4.  [D.6.4 remote-resources](#sec-remote-resources)
        5.  [D.6.5 scripted](#sec-scripted)
        6.  [D.6.6 svg](#sec-svg-prop)
        7.  [D.6.7 switch](#sec-switch)
    7.  [D.7 Spine properties vocabulary](#app-itemref-properties-vocab)
        1.  [D.7.1 page-spread-left](#sec-page-spread-left)
        2.  [D.7.2 page-spread-right](#sec-page-spread-right)
        3.  [D.7.3 Examples](#examples-itemref-properties)
    8.  [D.8 Media overlays vocabulary](#app-overlays-vocab)
        1.  [D.8.1 active-class](#sec-active-class)
        2.  [D.8.2 duration](#sec-duration)
        3.  [D.8.3 narrator](#sec-narrator)
        4.  [D.8.4 playback-active-class](#sec-playback-active-class)
18. [E. Obsolete features](#app-obsolete)
    1.  [E.1 Outdated features](#sec-obs-conform)
    2.  [E.2 Deprecated features](#sec-obs-deprecated)
19. [F. Schemas](#app-schemas)
    1.  [F.1 Package document schema](#app-package-schema)
    2.  [F.2 OCF schemas](#app-ocf-schema)
        1.  [F.2.1 Schema for `container.xml`](#app-schema-container)
        2.  [F.2.2 Schema for `encryption.xml`](#app-schema-encryption)
        3.  [F.2.3 Schema for `signatures.xml`](#app-schema-signatures)
    3.  [F.3 Media overlays schema](#app-schema-overlays)
20. [G. Media type registrations](#app-media-types)
    1.  [G.1 The `application/oebps-package+xml` media type](#app-media-type-app-oebps-package)
    2.  [G.2 The `application/epub+zip` media type](#app-media-type)
21. [H. Index](#index)
    1.  [H.1 Terms defined by this specification](#index-defined-here)
    2.  [H.2 Terms defined by reference](#index-defined-elsewhere)
22. [I. Change log](#change-log)
23. [J. Acknowledgements](#ack)
24. [K. References](#references)
    1.  [K.1 Normative references](#normative-references)
    2.  [K.2 Informative references](#informative-references)

## 1. Introduction

[](#sec-introduction)

### 1.1 Overview

[](#sec-intro-overview)

*This section is non-normative.*

EPUB 3 has been widely adopted as the format for digital books (ebooks), and this revision continues to increase the format's capabilities to better support a wider range of publication requirements, including complex layouts, rich media and interactivity, and global typography features. The expectation is that publishers will utilize the EPUB 3 format for a broad range of content, including books, magazines, and educational, professional, and scientific publications.

This specification represents the core of EPUB 3 and includes the conformance requirements for [EPUB publications](#dfn-epub-publication) — the product of the standard. The other specifications that comprise EPUB 3 are as follows:

- [EPUB 3 Reading Systems](https://www.w3.org/TR/epub-rs-34/#) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] — defines the processing requirements for [EPUB reading systems](#dfn-epub-reading-system) — the applications that consume EPUB publications and present their content to users.

- [EPUB Accessibility](https://www.w3.org/TR/epub-a11y-12/#) \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] — defines accessibility conformance and discovery requirements for EPUB publications.

These specifications represent the formal list recognized as belonging to EPUB 3 and that contain functionality normatively referenced as part of the standard. The development of extension specifications periodically adds new functionality to EPUB publications. Features and functionality defined outside of core revisions to the standard, while not formally recognized in this specification, are nonetheless available for use in EPUB publications and implementation in reading systems.

The non-normative [EPUB 3 Overview](https://www.w3.org/TR/epub-overview-34/#) \[[epub-overview-34](#bib-epub-overview-34 "EPUB 3 Overview")\] provides a general introduction to EPUB 3. A list of technical changes from the previous version is also available in the [change log](#change-log).

### 1.2 Organization

[](#sec-intro-spec-org)

*This section is non-normative.*

This section reviews the organization of this specification through the central product it defines: the [EPUB publication](#dfn-epub-publication).

An EPUB publication is, in its most basic sense, a bundle of resources with instructions on how to render those resources to present the content in a logical order. The types of resources that are allowed in EPUB publication, as well as restrictions on their use, are defined in [3. Publication resources](#sec-publication-resources).

A ZIP-based archive with the file extension `.epub` bundles the EPUB publication's resources for distribution. As conformant ZIP archives, EPUB publications can be unzipped by many software programs, simplifying both their production and consumption.

The container format not only provides a means of determining that the zipped content represents an EPUB publication (the `mimetype` file), but also provides a universally named directory of non-normative resources (`/META-INF`). Key among these resources is the `container.xml` file, which directs reading systems to the available [package documents](#dfn-package-document). Refer to [4. Open Container Format (OCF)](#sec-ocf) for more information about the container format.

An EPUB publication is typically represented by a single package document. This document includes metadata used by [reading systems](#dfn-epub-reading-system) to present the content to the user, such as the title and author for display in a bookshelf as well as rendering metadata (e.g., whether the content is reflowable or has a fixed layout). It also provides a manifest of resources and includes a [spine](#dfn-epub-spine) that lists the default sequence in which to render documents as a user progresses through the content. Refer to [5. Package document](#sec-package-doc) for the requirements for the package document.

EPUB publications by default are intended to reflow to fit the available screen space. It is also possible to create publications that have pixel-precise fixed layouts using images and/or CSS positioning. The metadata to control layouts are defined in [6. Layouts](#sec-layouts).

The actual content of an EPUB publication — what users are presented with when they begin reading — is built on the Open Web Platform and comes in two flavors: XHTML and SVG. Called [EPUB content documents](#dfn-epub-content-document), these documents typically reference many additional resources necessary for their proper rendering, such as images, audio and video clips, scripts, and style sheets.

Refer to [7. EPUB content documents](#sec-contentdocs) for detailed information about the rules and requirements to produce EPUB content documents, and \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] for accessibility requirements.

An EPUB publication also includes another key file called the [EPUB navigation document](#dfn-epub-navigation-document). This document provides critical navigation capabilities, such as the table of contents, that allow users to navigate the content quickly and easily. The navigation document is a specialized type of [XHTML content document](#dfn-xhtml-content-document) which also allows for its use in the content (i.e., avoiding one table of contents for machine processing and another for user consumption). Refer to [8. EPUB navigation document](#sec-nav) for more information about this document.

[Media overlay documents](#dfn-media-overlay-document) complement EPUB content documents. They provide declarative markup for synchronizing the text in EPUB content documents with prerecorded audio. The result is the ability to create a read-aloud experience where [reading systems](#dfn-epub-reading-system) highlight the text as it is narrated. Refer to [9.3 Media overlays](#sec-media-overlays) for the definition of media overlay documents.

While conceptually simple, an EPUB publication is more than just a collection of HTML pages and dependent assets in a ZIP package as presented here. Additional information about the primary features and functionality that EPUB publications provide to enhance the reading experience is available from the referenced specifications, and a more general introduction to the features of EPUB 3 is provided in the non-normative \[[epub-overview-34](#bib-epub-overview-34 "EPUB 3 Overview")\].

Refer to \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] for the processing requirements for reading systems. Although it is not necessary to read that document to create EPUB publications, an understanding of how reading systems present the content can help in crafting publications for optimal presentation to users.

### 1.3 Relationship to other specifications

[](#sec-intro-relations)

*This section is non-normative.*

Caution

The technologies EPUB 3 builds on are constantly evolving. Some, typically referred to as "living" or "evergreen" standards, are subject to change daily and their impact on the validity of EPUB publications is immediate. Others are updated less frequently and the changes might not affect [EPUB publications](#dfn-epub-publication) until EPUB 3 undergoes a new revision.

In all cases, it is possible that previously valid features might become obsolete (e.g., due to a lack of support or because of security issues). It is also possible that new features become available to use before they are widely supported in [reading systems](#dfn-epub-reading-system).

Consequently, it is advised to only use features with broad support and keep [EPUB conformance checkers](#dfn-epub-conformance-checker) up to date.

#### 1.3.1 Relationship to HTML

[](#sec-overview-relations-html)

The \[[html](#bib-html "HTML Standard")\] standard is continuously evolving — there are no longer versioned releases of it. That standard, in turn, references various technologies that also continue to evolve, such as MathML, SVG, CSS, and JavaScript.

The benefit of this approach is that EPUB 3 is always up to date with the web, but it also means that this specification does not track changes to HTML and the technologies it references. Those standards have to be monitored separately to ensure that authoring processes are kept up to date.

The \[[html](#bib-html "HTML Standard")\] standard defines a single content model with rules for expressing a tag set using either the [HTML syntax](https://html.spec.whatwg.org/multipage/#syntax) or the [XML syntax](https://html.spec.whatwg.org/multipage/#the-xhtml-syntax). EPUB 3, however, only allows authoring of content documents using the XML syntax, in what are referred to as [XHTML content documents](#dfn-xhtml-content-document).

The [XHTML profile defined by this specification](#sec-xhtml) inherits all definitions of semantics, structure and processing behaviors from \[[html](#bib-html "HTML Standard")\] unless otherwise specified.

In addition, this specification [defines a set of extensions](#sec-xhtml-extensions) to the \[[html](#bib-html "HTML Standard")\] document model that can be included in XHTML content documents.

#### 1.3.2 Relationship to SVG

[](#sec-overview-relations-svg)

This specification does not reference a specific version of \[[svg](#bib-svg "SVG")\], but instead uses an undated reference. Whenever there is any ambiguity in this reference, the latest recommended version is the authoritative reference.

The benefit of this approach is that EPUB 3 is always up to date with the SVG standard, but it also means that this specification does not track changes to SVG. The SVG standards has to be monitored separately to ensure that authoring processes are kept up to date.

#### 1.3.3 Relationship to CSS

[](#sec-overview-relations-css)

EPUB 3 supports CSS as defined by the CSS Working Group Snapshot \[[csssnapshot](#bib-csssnapshot "CSS Snapshot")\].

#### 1.3.4 Relationship to MathML

[](#sec-overview-relations-mathml)

EPUB 3 only supports [Presentation Markup](https://www.w3.org/TR/MathML3/chapter3.html) \[[mathml3](#bib-mathml3 "Mathematical Markup Language (MathML) Version 3.0 2nd Edition")\]. [Content Markup](https://www.w3.org/TR/MathML3/chapter4.html) is only allowed in [structured markup annotations](https://www.w3.org/TR/MathML3/chapter5.html#mixing.elements.annotation.xml).

#### 1.3.5 Relationship to SMIL

[](#sec-overview-relations-smil)

This specification relies on a subset of \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\], from which the media overlays elements and attributes defined in [9.3.2.2 Media overlay document definition](#sec-overlays-def) are derived.

#### 1.3.6 Relationship to URL

[](#sec-overview-relations-url)

This specification refers to the \[[url](#bib-url "URL Standard")\] standard for terminology and processing related to URLs expressed in [EPUB publications](#dfn-epub-publication). It is anticipated that new and revised web formats will adopt this standard, but until then this could put this specification in conflict with the internal requirements for some formats (e.g., valid relative paths), specifically with respect to the use of internationalized URLs. If a format does not allow internationalized URLs (i.e., URLs have to conform to \[[rfc3986](#bib-rfc3986 "Uniform Resource Identifier (URI): Generic Syntax")\] or earlier), that requirement takes precedence within those resources.

### 1.4 Terminology

[](#sec-terminology)

This specification defines the following terms specific to EPUB 3.

Note

Only the first instance of a term in a section links to its definition.

codec  
Codec refers to content that has intrinsic binary format qualities, such as video and audio media types designed for optimum compression or that provide optimized streaming capabilities.

container resource  
A [publication resource](#dfn-publication-resource) that is located within the [EPUB container](#dfn-epub-container), as opposed to a [remote resource](#dfn-remote-resource) which is not.

Refer to [3.6 Resource locations](#sec-resource-locations) for media type-specific rules for resource locations.

container root URL  
The [URL](https://url.spec.whatwg.org/#concept-url) \[[url](#bib-url "URL Standard")\] of the [root directory](#dfn-root-directory) representing the [OCF abstract container](#dfn-ocf-abstract-container). Although the container root URL is implementation specific, its properties are defined in [4.2.5 URLs in the OCF abstract container](#sec-container-iri).

content URL  
The [URL](https://url.spec.whatwg.org/#concept-url) of a file or directory in the [OCF abstract container](#dfn-ocf-abstract-container), defined in [4.2.5 URLs in the OCF abstract container](#sec-container-iri).

core media type resource  
A [publication resource](#dfn-publication-resource) that conforms to one of the MIME media types \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] listed in [3.2 Core media types](#sec-core-media-types) and, therefore, does not require the provision of a [fallback](#sec-foreign-resources) (cf. [foreign resource](#dfn-foreign-resource)).

The designation "core media type resource" only applies when a resource is used in the rendering of [EPUB content documents](#dfn-epub-content-document) and [foreign content documents](#dfn-foreign-content-document). A core media type resource cannot be used in the [spine](#dfn-epub-spine), for example, without a fallback unless it also has the media type of an EPUB content document.

EPUB conformance checker  
An application that verifies the requirements of this specification against [EPUB publications](#dfn-epub-publication) and reports on their conformance.

EPUB container\
OCF ZIP container  
The ZIP-based packaging and distribution format for [EPUB publications](#dfn-epub-publication) defined in [4.3 OCF ZIP container](#sec-container-zip).

EPUB container and OCF ZIP container are synonymous.

EPUB content document  
A [publication resource](#dfn-publication-resource) referenced from the [spine](#dfn-epub-spine) or a [manifest fallback chain](#dfn-manifest-fallback-chain) that conforms to either the [XHTML](#dfn-xhtml-content-document) or [SVG content document](#dfn-svg-content-document) definitions.

EPUB content documents contain all or part of the content of an [EPUB publication](#dfn-epub-publication) (i.e., the textual, visual and/or audio content).

EPUB publications can reference EPUB content documents from the spine without the provision of [fallbacks](#sec-foreign-resources).

EPUB manifest (or manifest)  
The section of the [package document](#dfn-package-document) that lists the [publication resources](#dfn-publication-resource).

Refer to [5.7.1 The `manifest` element](#sec-manifest-elem) for more information.

EPUB navigation document  
A specialization of the [XHTML content document](#dfn-xhtml-content-document) that contains human- and machine-readable global navigation information. The EPUB navigation document conforms to the constraints expressed in [8. EPUB navigation document](#sec-nav).

EPUB publication  
A logical document entity consisting of a set of interrelated [resources](#dfn-publication-resource) packaged in an [EPUB container](#dfn-epub-container).

An EPUB publication typically represents a single intellectual or artistic work, but this specification does not restrict the nature of the content.

EPUB reading system (or reading system)  
A system that processes [EPUB publications](#dfn-epub-publication) for presentation to a user in a manner conformant with this specification.

EPUB spine (or spine)  
The section of the [package document](#dfn-package-document) that defines an ordered list of [EPUB content documents](#dfn-epub-content-document) and [foreign content documents](#dfn-foreign-content-document). This list represents the default reading order of the [EPUB publication](#dfn-epub-publication).

Refer to [5.8.1 The `spine` element](#sec-spine-elem) for more information.

exempt resource  
Exempt resources are a special class of [publication resources](#dfn-publication-resource) that do not require [fallbacks](#sec-foreign-resources) and that reading systems do not have to support the rendering of.

Refer to [3.4 Exempt resources](#sec-exempt-resources) for more information.

file name  
The name of any type of file within an [OCF abstract container](#dfn-ocf-abstract-container), whether a directory or a file within a directory.

file path  
The file path of a file or directory is its full path relative to the [root directory](#dfn-root-directory), as defined by the algorithm specified in [4.2.4 Deriving file paths](#sec-file-names-to-path-names).

fixed-layout document  
An [EPUB content document](#dfn-epub-content-document) with fixed dimensions directly referenced from the [spine](#dfn-epub-spine). Fixed-layout documents are displayed in either [pre-paginated](#def-layout-pre-paginated) or [roll](#def-layout-roll) layouts.

foreign content document  
Any [publication resource](#dfn-publication-resource) referenced from a [spine](#dfn-epub-spine) [`itemref`](#dfn-itemref) element, or a [manifest fallback chain](#dfn-manifest-fallback-chain), that is not an [EPUB content document](#dfn-epub-content-document).

When a foreign content document is referenced from a spine `itemref` element, it requires a manifest fallback chain with at least one EPUB content document.

Note

With the exception of XHTML and SVG, all [core media type resources](#dfn-core-media-type-resource) are foreign content documents when referenced directly from the spine.

foreign resource  
A [publication resource](#dfn-publication-resource) with a MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] that does not match any of those listed in [3.2 Core media types](#sec-core-media-types). Foreign resources are subject to the fallback requirements defined in [3.3 Foreign resources](#sec-foreign-resources).

The designation "foreign resource" only applies to resources used in the rendering of [EPUB content documents](#dfn-epub-content-document) and [foreign content documents](#dfn-foreign-content-document).

Note

Foreign resource and foreign content document are not interchangeable terms. The types of resources considered foreign when used in the spine is greater than the types of resources considered foreign when used in [EPUB content documents](#sec-contentdocs).

linked resource  
A resource that is only referenced from a [package document](#dfn-package-document) [`link`](#dfn-link) element (i.e., not also used in the rendering of an [EPUB publication](#dfn-epub-publication).

Linked resources are not [publication resources](#dfn-publication-resource) but can be stored in the [EPUB container](#dfn-epub-container). They do not require fallbacks.

media overlay document  
An XML document that associates the [XHTML content document](#dfn-xhtml-content-document) with pre-recorded audio narration to provide a synchronized playback experience, as defined in [9.3 Media overlays](#sec-media-overlays).

non-codec  
Non-codec refers to content types that benefit from compression due to the nature of their internal data structure, such as file formats based on character strings (for example, HTML, CSS, etc.).

OCF abstract container  
The OCF abstract container defines a file system model for the contents of the [OCF ZIP container](#dfn-ocf-zip-container), as defined in [4.2 OCF abstract container](#sec-container-abstract).

package document  
A [publication resource](#dfn-publication-resource) that describes the rendering of an [EPUB publication](#dfn-epub-publication), as defined in [5. Package document](#sec-package-doc). The package document carries meta information about the EPUB publication, provides a manifest of resources, and defines a default reading order.

publication resource  
A resource that contains content or instructions that contribute to the logic and rendering of an [EPUB publication](#dfn-epub-publication). In the absence of this resource, [reading systems](#dfn-epub-reading-system) might not render the EPUB publication as intended. Examples of publication resources include the [package document](#dfn-package-document), [EPUB content documents](#dfn-epub-content-document), CSS Style Sheets, audio, video, images, embedded fonts, and scripts.

The package document [manifest](#dfn-epub-manifest) has to include a list of all publication resources that typically have to be bundled in the [EPUB container](#dfn-epub-container) (the exception being that resources listed in [3.6 Resource locations](#sec-resource-locations) can be located outside the EPUB container).

Note

Resources on the web identified in outbound hyperlinks (e.g., referenced from the `href` attribute of an \[[html](#bib-html "HTML Standard")\] [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element) element) are not publication resources.

[Data urls](#sec-data-urls) are also not publication resources — they are considered part of the resource they are embedded in.

remote resource  
A [publication resource](#dfn-publication-resource) that is located outside of the [EPUB container](#dfn-epub-container), typically on the web.

Publication resources within the EPUB container are referred to as [container resources](#dfn-container-resource).

Refer to [3.6 Resource locations](#sec-resource-locations) for media type specific rules for resource locations.

root directory  
The root directory represents the base of the [OCF abstract container](#dfn-ocf-abstract-container) file system. This directory is [virtual in nature](https://www.w3.org/TR/epub-rs-34/#confreq-zip-rootdir).

scripted content document  
An [EPUB content document](#dfn-epub-content-document) that includes scripting or an [XHTML content document](#dfn-xhtml-content-document) that contains \[[html](#bib-html "HTML Standard")\] [`form`](https://html.spec.whatwg.org/multipage/forms.html#the-form-element) elements.

Refer to [7.4.2 Scripting](#sec-scripted-content) for more information.

SVG content document  
An [EPUB content document](#dfn-epub-content-document) that conforms to the constraints expressed in [7.2 SVG content documents](#sec-svg).

synthetic spread  
The rendering of two adjacent pages simultaneously on a device screen.

top-level content document  
An [EPUB content document](#dfn-epub-content-document) or [foreign content document](#dfn-foreign-content-document) referenced from the [spine](#dfn-epub-spine), whether directly or via a [fallback chain](#sec-manifest-fallbacks).

XHTML content document  
An [EPUB content document](#dfn-epub-content-document) that conforms to the profile of \[[html](#bib-html "HTML Standard")\] defined in [7.1 XHTML content documents](#sec-xhtml).

XHTML content documents are expressed using the [XML syntax](https://html.spec.whatwg.org/multipage/#the-xhtml-syntax) \[[html](#bib-html "HTML Standard")\].

Note

Although the \[[html](#bib-html "HTML Standard")\] standard no longer refers to the XML syntax as "XHTML", the name XHTML was still current at the time EPUB 3.0 was developed. The name "XHTML content document" was also used in EPUB 2, so keeping it unchanged was intended to help ease transition to the new format. Unlike in EPUB 2, XHTML in this document does not refer to \[[xhtml11](#bib-xhtml11 "XHTML™ 1.1 - Module-based XHTML - Second Edition")\], which was officially superseded in 2018.

unique identifier  
The primary identifier for an [EPUB publication](#dfn-epub-publication). The unique identifier is the [value](#dfn-value) of the [`dc:identifier`](#dfn-dc-identifier) element specified by the [`unique-identifier` attribute](#attrdef-package-unique-identifier) in the [package document](#dfn-package-document).

Significant revision, abridgement, etc. of the content requires a new unique identifier.

viewport  
The region of an [EPUB reading system](#dfn-epub-reading-system) in which an [EPUB publication](#dfn-epub-publication) is rendered visually to a user.

### 1.5 Conformance

[](#conformance)

As well as sections marked as non-normative, all authoring guidelines, diagrams, examples, and notes in this specification are non-normative. Everything else in this specification is normative.

The key words *MAY*, *MUST*, *MUST NOT*, *OPTIONAL*, *RECOMMENDED*, *REQUIRED*, *SHOULD*, and *SHOULD NOT* in this document are to be interpreted as described in [BCP 14](https://www.rfc-editor.org/info/bcp14) \[[RFC2119](#bib-rfc2119 "Key words for use in RFCs to Indicate Requirement Levels")\] \[[RFC8174](#bib-rfc8174 "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words")\] when, and only when, they appear in all capitals, as shown here.

All caution boxes, explanatory statements in parentheses, and algorithm explanations are also *non-normative*.

### 1.6 Authoring shorthands

[](#sec-intro-shorthands)

*This section is non-normative.*

In [package document](#dfn-package-document) metadata examples, [reserved prefixes](#sec-metadata-reserved-prefixes) are used without declaration.

References to Dublin Core elements \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] use the `dc:` prefix. This prefix has to be declared in the [package document](#dfn-package-document) for their use to be valid (`xmlns:dc="http://purl.org/dc/elements/1.1/"`).

The `epub` namespace prefix \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\] is also used on elements and attributes without always having an explicit declaration (`xmlns:epub="http://www.idpf.org/2007/ops"`).

## 2. EPUB publication conformance

[](#sec-epub-conf)

An [EPUB publication](#dfn-epub-publication):

- *MUST* define at least one rendering of its content as follows:

  - *MUST* contain a [package document](#dfn-package-document) that conforms to [5. Package document](#sec-package-doc) and meet all [publication resource](#dfn-publication-resource) requirements for the package document.

  - *MUST* contain an [EPUB navigation document](#dfn-epub-navigation-document) that conforms to [8. EPUB navigation document](#sec-nav).

- *SHOULD* conform to the accessibility requirements defined in \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\].

- *MUST* be packaged in an [EPUB container](#dfn-epub-container) as defined in [4. Open Container Format (OCF)](#sec-ocf).

In addition, all publication resources *MUST* adhere to the requirements in [3. Publication resources](#sec-publication-resources).

The rest of this specification covers specific conformance details.

### 2.1 Conformance checking

[](#sec-conformance-checking)

*This section is non-normative.*

Due to the complexity of this specification and number of technologies used in [EPUB publications](#dfn-epub-publication), it is advised to use an [EPUB conformance checker](#dfn-epub-conformance-checker) to verify content conformance.

[EPUBCheck](https://www.w3.org/publishing/epubcheck/) is the de facto EPUB conformance checker used by the publishing industry and has been updated with each new version of EPUB. It is integrated into a number of authoring tools and is also available in alternative interfaces and other languages (for more information, refer to its [Apps and Tools page](https://www.w3.org/publishing/epubcheck/docs/apps-and-tools/)).

When verifying EPUB publications, ensure that they do not violate the requirements of this specification (practices identified by the keywords "*MUST*", "*MUST NOT*", and "*REQUIRED*"). These types of issues will often result in EPUB publications not rendering or rendering in inconsistent ways. These issues are typically reported as errors or critical errors.

Also ensure that EPUB publications do not violate the recommendations of this specification (practices identified by the keywords "*SHOULD*", "*SHOULD NOT*", and "*RECOMMENDED*"). Failure to follow these practices does not result in an invalid EPUB publication but can lead to interoperability problems and other issues that impact the user reading experience. These issues are typically reported as warnings.

Note

Vendors, distributors, and other retailers of EPUB publications need to consider the importance of recommended practices before basing their acceptance or rejection on a zero-issue outcome from an EPUB conformance checker. There will be legitimate reasons why EPUB publications cannot adhere to recommended practices in all cases.

## 3. Publication resources

[](#sec-publication-resources)

### 3.1 Introduction

[](#sec-pub-res-intro)

*This section is non-normative.*

An [EPUB publication](#dfn-epub-publication) is made up of many different categories of resources, not all of which are mutually exclusive. Some resources are [publication resources](#dfn-publication-resource), some are not. Some publication resources are allowed in the [spine](#dfn-epub-spine) by default, while all others require fallbacks. Some resources can be used in rendering [EPUB content documents](#dfn-epub-content-document), while others can only be used with fallbacks.

Trying to understand these differences by reading the technical definitions of each category of resource can be complex. To make the categorizations easier to understand, this introduction uses the concept of different planes to explain how resources are grouped and referred to.

The three planes are:

- The [manifest plane](#dfn-manifest-plane) — The manifest plane holds all the resources of the EPUB publication (namely, publication resources and [linked resources](#dfn-linked-resource)).
- The [spine plane](#dfn-spine-plane) — The spine plane holds only the resources used in rendering the spine (namely, EPUB content documents and [foreign content documents](#dfn-foreign-content-document)).
- The [content plane](#dfn-content-plane) — The content plane holds only the resources used in the rendering of EPUB and foreign content documents (namely, [core media type resources](#dfn-core-media-type-resource), [foreign resources](#dfn-foreign-resource) and [exempt resources](#dfn-exempt-resource)).

The same resource can exist on more than one plane and will be referred to differently in this specification depending on which plane is being discussed. For example, a core media type resource used in the rendering of an EPUB content document (on the content plane) can also be a foreign content document if it is also listed in the spine (the spine plane).

The following sections describe these planes in more detail.

Note

Refer to [A.1 Resources](#publication-resources-example) for a detailed example showing how resources fit into the different planes.

#### 3.1.1 The manifest plane

[](#sec-manifest-plane)

The manifest plane defines all the resources of an [EPUB publication](#dfn-epub-publication). It is analogous to the [package document](#dfn-package-document) [manifest](#dfn-epub-manifest), but includes resources not present in that list.

The primary resources in this group are designated [publication resources](#dfn-publication-resource), which are all the resources used in rendering an EPUB publication to the user. The [`manifest`](#dfn-manifest) element has to contain a complete list these resources.

Publication resources are further classified by their use(s) in the [spine plane](#dfn-spine-plane) and [content plane](#dfn-content-plane).

The manifest plane also contains a set of [linked resources](#dfn-linked-resource). These resources are tangential to the direct rendering. They include, for example, metadata records and links to external content (e.g., where to purchase an EPUB publication).

Unlike publication resources, they are not listed in the package document manifest (i.e., because they are not essential to rendering the EPUB publication). They are instead defined in [`link`](#dfn-link) elements in the package document metadata. These elements define their nature and purpose similar to how manifest [`item`](#dfn-item) elements define publication resource. (In this way, they are like an extension of the manifest.)

Refer to [5.6.6 The `link` element](#sec-link-elem) for more information about linked resources.

Resources in the manifest plane are also sometimes broken down by where they are located. Although most publication resources have to be located in the EPUB container (called [container resources](#dfn-container-resource)), EPUB 3 allows [audio, video, font and script data resources](#sec-resource-locations) to be hosted outside the container. These exceptions were made to speed up the download and loading of EPUB publications, as these resources are typically quite large, and, in the case of fonts, not essential to the presentation. When remotely hosted, these publication resources are referred to as [remote resources](#dfn-remote-resource).

Since linked resources are not essential to the rendering of an EPUB publication, there are no requirements on where they are located and consequently no special naming of them based on their location. They can be located within the EPUB container or outside it.

Note

Hyperlinked content outside the EPUB container (e.g., web pages) are not publication resources, and consequently are not listed in the manifest. Reading systems will normally open these links in a separate browser instance, not as part of the EPUB publication.

#### 3.1.2 The spine plane

[](#sec-spine-plane)

The spine plane defines resources used in the default reading order established by the [spine](#dfn-epub-spine), which includes both [linear and non-linear content](#attrdef-itemref-linear). The spine instructs [reading systems](#dfn-epub-reading-system) on how to load these resources as the user progresses through the [EPUB publication](#dfn-epub-publication). Although many resources can be bundled in an [EPUB container](#dfn-epub-container), they are not all allowed by default in the spine.

EPUB 3 defines a special class of resources called [EPUB content documents](#dfn-epub-content-document) that can be used in the spine without any restrictions. EPUB content documents encompass both [XHTML content documents](#dfn-xhtml-content-document) and [SVG content documents](#dfn-svg-content-document).

The use of any other type of resource in the spine, including [core media type resources](#dfn-core-media-type-resource), is called a [foreign content document](#dfn-foreign-content-document). Foreign content documents require a [manifest fallback](#sec-manifest-fallbacks) to an EPUB content document. In this model, the [manifest](#dfn-epub-manifest) entry for the foreign content document has to include a [`fallback` attribute](#attrdef-item-fallback) that points to the next possible resource for reading systems to try when they do not support its format. Although not common, a fallback resource can specify another fallback, thereby making chains many resources deep. The one requirement is that there has to be at least one EPUB content document in a [manifest fallback chain](#dfn-manifest-fallback-chain).

Although they are not directly listed in the spine, all of the resources in the fallback chain are considered part of the spine, and by extension part of the spine plane, since any of the resources can be used by a reading system.

This extensibility model allows experimentation with formats while ensuring that reading systems are always able to render something for the user to read, as there is no guarantee of support for foreign content documents.

Refer to [3.5.1 Manifest fallbacks](#sec-manifest-fallbacks) for more information.

Caution

Although manifest fallbacks fulfill the technical requirements of EPUB, there is little practical support for them in reading systems. Their use is strongly discouraged as it can lead to unreadable publications.

Note

It is possible to provide manifest fallbacks for EPUB content documents, but this is not common or a requirement. For example, a [scripted content document](#dfn-scripted-content-document) could have a fallback to an unscripted alternative for reading systems that do not support scripting.

#### 3.1.3 The content plane

[](#sec-content-plane)

The content plane classifies resources that are used when rendering [EPUB content documents](#dfn-epub-content-document) and [foreign content documents](#dfn-foreign-content-document). These types of resources include embedded media, CSS style sheets, scripts, and fonts. These resources fall into three categories based on their reading system support: [core media type resources](#dfn-core-media-type-resource), [foreign resources](#dfn-foreign-resource), and [exempt resources](#dfn-exempt-resource).

A core media type resource is one that [reading systems](#dfn-epub-reading-system) have to support, so it can be used without restriction in EPUB or foreign content documents. For more information about core media type resources, refer to [3.2 Core media types](#sec-core-media-types).

Note

Being a core media type resource does not mean that reading systems will always render the resource, as not all reading systems support all features of EPUB 3. A reading system without a [viewport](#dfn-viewport), for example, will not render visual content such as images.

The opposite of core media type resources are foreign resources. These are resources that reading systems are not guaranteed to support the rendering of. As a result, similar to how using foreign content documents in the spine requires fallbacks to ensure their rendering, using foreign resources in content documents also requires fallbacks. These fallbacks are provided using the capabilities of the host format. Many HTML elements, for example, have intrinsic fallback capabilities. One example is the [`picture`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-picture-element) element \[[html](#bib-html "HTML Standard")\], which allows multiple alternative image formats to be specified.

For more information about foreign resources, refer to [3.3 Foreign resources](#sec-foreign-resources).

Falling between core media type resources and foreign resources are exempt resources. These are most closely associated with foreign resources, as there is no guarantee that reading systems will render them. But like core media types, they do not require fallbacks.

Exempt resources tend to address specific cases for which there are no core media types defined, but for which providing a fallback would prove cumbersome or unnecessary. These include embedding video, adding accessibility tracks, and linking to resources from the \[[html](#bib-html "HTML Standard")\] [`link`](https://html.spec.whatwg.org/multipage/#the-link-element) element.

Refer to [3.4 Exempt resources](#sec-exempt-resources) for more information about these exceptions.

Note

A common point of confusion arising from core media type resources is the listing of XHTML and SVG as core media type resources with the requirement that the markup conform to their respective EPUB content document definitions. This common definition ensures that regardless of whether XHTML and SVG documents are listed in the spine, or embedded in other EPUB content documents, they have the same requirements for authoring and reading system support.

In practice, it means that XHTML and SVG core media type resources are allowed in the spine without any modification or fallback as they are also conforming XHTML and SVG content documents. But, this is a unique case — all other core media type resources become foreign content documents when used in the spine (i.e., foreign content documents include all foreign resources and all core media type resources except for XHTML and SVG).

### 3.2 Core media types

[](#sec-core-media-types)

[Publication resources](#dfn-publication-resource) that conform to the MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] specifications defined in the following table *MAY* be included in [EPUB publications](#dfn-epub-publication) without fallbacks when they are used in [EPUB content documents](#dfn-epub-content-document) and [foreign content documents](#dfn-foreign-content-document). These resources are classified as [core media type resources](#dfn-core-media-type-resource).

Only [XHTML content documents](#dfn-xhtml-content-document) and [SVG content documents](#dfn-svg-content-document) can be referenced from the spine without a [manifest fallback](#sec-manifest-fallbacks). All other core media type resources *MUST* include a manifest fallback if referenced directly from the [spine](#dfn-epub-spine). In this case, they are [foreign content documents](#dfn-foreign-content-document).

The columns in the table represent the following information:

- **Media Type**—The MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] used to represent the given publication resource in the [manifest](#dfn-epub-manifest).

  If a resource has more than one media type, the first one listed is the preferred media type. It is advised to use this media type to declare resources.

- **Content Type Definition**—The specification to which the given core media type resource has to conform.

- **Applies to**—The publication resource type(s) that the Media Type and Content Type Definition applies to.

- **In EPUB 3 since**—The version of EPUB 3 which has adopted that Media Type. Note that some formats have a longer history (going back to EPUB 2), not detailed in the table.

[TABLE]

Note

Inclusion as a core media type resource does not mean that all [reading systems](#dfn-epub-reading-system) will support the rendering of a resource. Reading system support also depends on the capabilities of the application (e.g., a reading system with a [viewport](#dfn-viewport) has to support image core media type resources, but a reading system without a viewport does not). Refer to [Core media types](https://www.w3.org/TR/epub-rs-34/#sec-epub-rs-conf-cmt) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] for more information about which reading systems rendering capabilities require support for which core media type resources.

Caution

The Working Group typically only includes formats as core media type resources when they have broad support in web browser cores — the rendering engines that EPUB 3 reading systems build upon — as at that stage they can be relied on for rendering in up-to-date reading systems. Nevertheless, authors must be aware that newer formats — introduced after EPUB 3.0, see the last column of the table — may not be supported on reading systems that, for example, rely on their own rendering engines, or have not been updated recently.

### 3.3 Foreign resources

[](#sec-foreign-resources)

A [foreign resource](#dfn-foreign-resource) can be used in an [EPUB content document](#dfn-epub-content-document) or [foreign content document](#dfn-foreign-content-document). However, unlike a [core media type resource](#sec-core-media-types), a foreign resource is not guaranteed [reading system](#dfn-epub-reading-system) support.

Fallbacks *MUST* be provided for foreign resources. Fallbacks are typically provided using the intrinsic fallback mechanisms of the host format (e.g., \[[html](#bib-html "HTML Standard")\] elements often provide the ability to reference more than one media type or to display an alternate embedded message when a media type cannot be rendered).

Note

Refer to the \[[html](#bib-html "HTML Standard")\] and \[[svg](#bib-svg "SVG")\] specifications for the intrinsic fallback capabilities their elements provide.

[3.5.2 Intrinsic fallbacks](#sec-intrinsic-fallbacks) also provides additional information about how fallbacks are interpreted for specific elements.

Note

Although the [outdated](#outdated) [content fallbacks](#content-fallbacks) feature can be used to provide fallbacks for foreign resources, its use is strongly discouraged.

### 3.4 Exempt resources

[](#sec-exempt-resources)

An [exempt resource](#dfn-exempt-resource) shares properties with both [foreign resources](#dfn-foreign-resource) and [core media type resources](#dfn-core-media-type-resource). It is most similar to a [foreign resource](#dfn-foreign-resource) in that it is not guaranteed [reading system](#dfn-epub-reading-system) support, but, like a core media type resource, does not require a fallback.

In some cases, the exemptions defined in this section overlap with how existing core media type resources are included in [EPUB content documents](#dfn-epub-content-document) (e.g., using the \[[html](#bib-html "HTML Standard")\] [`link`](https://html.spec.whatwg.org/multipage/#the-link-element) element to include CSS style sheets, importing fonts into CSS, or using the \[[html](#bib-html "HTML Standard")\] [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) element for JavaScripts). Although this superficially makes the resources similar in terms of not requiring fallbacks, core media types are differentiated by having stronger support expectations in reading systems. A core media type resource does not become an exempt resource just because they share the same inclusion mechanism. And without an exemption, an exempt resource would be a [foreign resource](#dfn-foreign-resource).

There are only a small set of special cases for exempt resources. Video, for example, are exempt from fallbacks because there is no consensus on a core media type video format at this time (i.e., there is no format to fallback to). Similarly, audio and video tracks are exempt for accessibility purposes so whatever format reading systems support best can be used.

The following list details cases of content-specific exempt resources, including any restrictions on where they can be used.

Fonts  
Font resources are exempt resources.

This exemption allows the use of any font format without a fallback, regardless of reading system support expectations, as CSS rules will ensure a fallback font in case of no support.

Refer to the [reading system support requirements for fonts](https://www.w3.org/TR/epub-rs-34/#confreq-css-rs-fonts) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] for more information.

Linked resources  
Any resource referenced from the \[[html](#bib-html "HTML Standard")\] [`link`](https://html.spec.whatwg.org/multipage/#the-link-element) element is an exempt resource.

Scripts  
Any resource \[[html](#bib-html "HTML Standard")\] allows the [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) element to reference is an exempt resource.

Tracks  
Audio and video tracks (e.g., \[[webvtt](#bib-webvtt "WebVTT: The Web Video Text Tracks Format")\] captions, subtitles and descriptions) referenced from the \[[html](#bib-html "HTML Standard")\] [`track`](https://html.spec.whatwg.org/multipage/media.html#the-track-element) element are exempt resources.

Video  
Video codecs referenced from the \[[html](#bib-html "HTML Standard")\] [`video`](https://html.spec.whatwg.org/multipage/media.html#video) — including any child [`source`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element) elements — are exempt resources.

Note

Although reading systems are encouraged to support at least one of the H.264 \[[h264](#bib-h264 "H.264 : Advanced video coding for generic audiovisual services")\] and VP8 \[[rfc6386](#bib-rfc6386 "VP8 Data Format and Decoding Guide")\] video codecs, support for video codecs is not a conformance requirement. When deciding which video formats to include, consider factors such as the breadth of support in reading systems, playback quality, and technology royalties.

Note

The exemptions made above do not apply to the [spine](#dfn-epub-spine). If an exempt resource is used in the spine, and it is not also an EPUB content document, it will require a fallback in that context.

In addition to the content-specific exemptions, a resource is classified as an exempt resource if:

- it is not referenced from a spine [`itemref`](#dfn-itemref) element (i.e., used as a [foreign content document](#dfn-foreign-content-document)); ***and***

- it is not directly rendered in its native format in an EPUB content document.

This exemption allows the inclusion of resources in the [EPUB container](#dfn-epub-container) that are not for use by EPUB reading systems, such as:

- script code modules, such as WebAssembly \[[wasm-core-2](#bib-wasm-core-2 "WebAssembly Core Specification")\];
- script inputs, such as fetched \[[fetch](#bib-fetch "Fetch Standard")\] data or images (refer to [7.4.2.5 Scripting fallbacks](#confreq-cd-scripted-flbk) for restrictions on dynamically adding such resources to EPUB content documents);
- data files for use by external applications (e.g., a scientific journal might include a data set with instructions on how to extract it from the EPUB container).

A foreign image resource referenced from a [`url` function](https://www.w3.org/TR/css-values-4/#urls) \[[css-values](#bib-css-values "CSS Values and Units Module Level 4")\] in a CSS style sheet is an example of a resource not exempted by this rule as it would result in the non-core media type format being displayed.

The exemption also allows the use of foreign resources in foreign content documents without reading systems or [EPUB conformance checkers](#dfn-epub-conformance-checker) having to understand the fallback capabilities of those resources (i.e., the requirement for a fallback for the foreign content document covers any rendering issues within it). As the resource is not referenced from an EPUB content document, it automatically becomes exempt from fallbacks.

### 3.5 Resource fallbacks

[](#sec-resource-fallbacks)

#### 3.5.1 Manifest fallbacks

[](#sec-manifest-fallbacks)

Manifest fallbacks are a feature of the [package document](#dfn-package-document) that create a manifest fallback chain of alternative resources that a [reading system](#dfn-epub-reading-system) can use in place of a [top-level content document](#dfn-top-level-content-document), allowing it to select a format it can render if the default resource is not supported in the [spine](#dfn-epub-spine).

Fallback chains are created using the [`fallback` attribute](#attrdef-item-fallback) on [manifest](#dfn-epub-manifest) [`item`](#dfn-item) elements. This attribute references the [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of another manifest `item` that is a fallback for the current `item`. The ordered list of all the references that a reading system can reach, starting from a given `item`'s `fallback` attribute, represents both the full and preferred fallback chain for that `item`.

A [foreign content document](#dfn-foreign-content-document) *MUST* specify a fallback chain that *MUST* include at least one [EPUB content document](#dfn-epub-content-document) to ensure that reading systems can always render the [spine](#dfn-epub-spine) item.

EPUB content documents *MAY* specify a fallback. For example, to provide a [fallback for scripted content](#confreq-cd-scripted-flbk).

When a fallback chain includes more than one EPUB content document, the [`properties` attribute](#attrdef-properties) can be used to differentiate the purpose of each.

Manifest fallback chains *MUST NOT* contain self-references or circular references to `item` elements in the chain.

#### 3.5.2 Intrinsic fallbacks

[](#sec-intrinsic-fallbacks)

The following sections provide clarifications about the intrinsic fallback requirements of specific elements in \[[html](#bib-html "HTML Standard")\].

##### 3.5.2.1 HTML `audio` and `video` fallbacks

[](#sec-fallbacks-audio)

\[[html](#bib-html "HTML Standard")\] [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2) embedded within [`audio`](https://html.spec.whatwg.org/multipage/#the-audio-element) or [`video`](https://html.spec.whatwg.org/multipage/#the-video-element) elements does not count as an intrinsic fallback for [foreign resources](#dfn-foreign-resource). Only child [`source`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element) elements \[[html](#bib-html "HTML Standard")\] provide intrinsic fallback capabilities.

Only older [reading systems](#dfn-epub-reading-system) that do not recognize the `audio` or the `video` elements (e.g., EPUB 2 reading systems) will render the embedded content. When reading systems support these elements but not the available media formats, they do not render the embedded content for the user.

Note

The requirement for fallbacks only applies to audio foreign resources referenced from `audio` and `video` elements. Fallbacks are not necessary for video resources; they are [exempt resources](#dfn-exempt-resource).

##### 3.5.2.2 HTML `img` fallbacks

[](#sec-fallbacks-img)

To provide alternative format fallbacks, the \[[html](#bib-html "HTML Standard")\] [`img`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element) element can be used as the child of a [`picture`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-picture-element) element provided the following are true:

- the `img` element *MUST* only reference core media type resources from its `src` and `srcset` attributes when those attributes are set; and
- each [`source`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element) element *MUST* only reference [core media type resources](#dfn-core-media-type-resource) from its [`src`](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-source-src) and [`srcset`](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-source-srcset) attributes unless it specifies the MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] of a [foreign resource](#dfn-foreign-resource) in its [`type`](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-source-type) attribute.

When an `img` is not the child of `picture`, its `src` and `srcset` attributes *MUST NOT* be used to provide fallbacks for foreign resources.

##### 3.5.2.3 HTML `script` element

[](#html-script-element)

Although data blocks have a separate MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] from their containing [XHTML content document](#dfn-xhtml-content-document), it is not possible to provide intrinsic fallbacks as no such mechanisms are specified for the \[[html](#bib-html "HTML Standard")\] [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) element.

But, as the `script` element does not represent user content — [data blocks](https://html.spec.whatwg.org/multipage/#data-block) are not rendered unless manipulated by script, and content rendered by scripts already has [core media type requirements](#confreq-cd-scripted-flbk) — requiring fallbacks for the raw data does not serve a useful purpose.

Consequently, data blocks are exempt from fallback requirements to allow their use by scripts.

Note

This exemption aligns data blocks with the [exemption for data files](#confreq-foreign-no-fallback).

Note

\[[svg](#bib-svg "SVG")\] does not define data blocks as of publication, but the same exclusion would apply if a future update adds the concept.

### 3.6 Resource locations

[](#sec-resource-locations)

The following types of [publication resources](#dfn-publication-resource) *MAY* be hosted outside the [EPUB container](#dfn-epub-container):

- [Audio resources](#cmt-grp-audio).

- [Video resources](#exempt-video).

- Resources retrieved via scripting APIs (e.g., XmlHttpRequest \[[xhr](#bib-xhr "XMLHttpRequest Standard")\] and Fetch \[[fetch](#bib-fetch "Fetch Standard")\]).

- [Font resources](#cmt-grp-font).

All other resources *MUST* be stored within the EPUB container.

Storing all resources inside the EPUB container is strongly encouraged whenever possible as it allows users access to the entire presentation regardless of connectivity status.

When resources have to be located outside the EPUB container, it is *RECOMMENDED* to reference them via the secure `https` URI scheme \[[rfc9110](#bib-rfc9110 "HTTP Semantics")\] to limit the threat of exposing their publications, and users, to network attacks. [Reading systems](#dfn-epub-reading-system) might not load [remote resources](#dfn-remote-resource) referenced using insecure schemes such as `http`.

These rules for locating publication resource apply regardless of whether the given resource is a [core media type resource](#dfn-core-media-type-resource) or a [foreign resource](#dfn-foreign-resource).

Note

Refer to the [`remote-resources` property](#remote-resources) for more information on how to indicate that a [manifest](#dfn-epub-manifest) [`item`](#dfn-item) references a [remote resource](#dfn-remote-resource).

[Example 1](#example-referencing-a-container-resource): Referencing a container resource

In this example, the audio file referenced from the \[[html](#bib-html "HTML Standard")\] [`audio`](https://html.spec.whatwg.org/multipage/#the-audio-element) element is located inside the EPUB container.

``` xml
<html …>
   …
   <body>
      …
      <audio
          src="audio/ch01.mp4"
          controls="controls"/>
      …
   </body>
</html>
```

[Example 2](#example-referencing-a-remote-resource): Referencing a remote resource

In this example, the audio file referenced from the \[[html](#bib-html "HTML Standard")\] [`audio`](https://html.spec.whatwg.org/multipage/#the-audio-element) element is hosted on the web.

``` xml
<html …>
   …
   <body>
      …
         <audio
             src="http://www.example.com/book/audio/ch01.mp4"
             controls="controls"/>
      …
   </body>
</html>
```

### 3.7 Data URLs

[](#sec-data-urls)

The [`data:` URL scheme](https://www.rfc-editor.org/info/rfc2397/#) \[[rfc2397](#bib-rfc2397 "The "data" URL scheme")\] is used to encode resources directly into a URL string. The advantage of this scheme is that it allows a resource to be embedded within another, avoiding the need for an external file.

Data URLs *MUST NOT* be used in the following scenarios as they will result in a [top-level content document](#dfn-top-level-content-document) or [top-level browsing context](https://html.spec.whatwg.org/multipage/document-sequences.html#top-level-browsing-context) \[[html](#bib-html "HTML Standard")\]:

- in `href` attributes in the package document — this applies both to manifest [`item`](#dfn-item) elements and metadata [`link`](#dfn-link) elements;

- in the `href` attribute on \[[html](#bib-html "HTML Standard")\] or \[[svg](#bib-svg "SVG")\] `a` elements, except when inside an [`iframe`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) element \[[html](#bib-html "HTML Standard")\];

- in the `href` attribute on \[[html](#bib-html "HTML Standard")\] `area` elements, except when inside an `iframe` element;

- in calls to \[[ecmascript](#bib-ecmascript "ECMAScript Language Specification")\] `window.open` or `document.open`.

Note

These restrictions on the use of data URLs are to prevent security issues and also to ensure that [reading systems](#dfn-epub-reading-system) can determine where to take a user next (i.e., because data URLs cannot be referenced from the [spine](#dfn-epub-spine)).

The list of prohibited uses for data URLs is subject to change as the respective standards that allow their use evolve.

A consequence of embedding is that the data in a data URL is not considered its own unique [publication resource](#dfn-publication-resource) for manifest reporting purposes (i.e., only its containing publication resource gets listed). As this data has its own media type, however, it is still subject to [foreign resource restrictions](#sec-foreign-resources). Therefore, data URLs *MUST* be encoded as [core media type resources](#dfn-core-media-type-resource) or have a fallback using the intrinsic fallback mechanisms of the host format.

### 3.8 File URLs

[](#sec-file-urls)

The [`file:` URL scheme](https://www.rfc-editor.org/info/rfc8089/#) is defined in \[[rfc8089](#bib-rfc8089 "The "file" URI Scheme")\] as "identifying an object (a 'file') stored in a structured object naming and accessing environment on a host (a 'file system')." It is typically used to retrieve files from the local operating system.

Using a file URL in an [EPUB publication](#dfn-epub-publication), which can be transferred among different hosts, represents a security risk and is also non-interoperable. Consequently, file URLs *MUST NOT* be used in EPUB publications.

### 3.9 XML conformance

[](#sec-xml-constraints)

Any [publication resource](#dfn-publication-resource) that is an XML-based media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\]:

- *MUST* be a conformant XML 1.0 Document as defined in [Conformance of Documents](https://www.w3.org/TR/xml-names/#Conformance) \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\].

- *MAY* only specify a [document type declaration](https://www.w3.org/TR/xml/#dt-doctype) that references an [external identifier](https://www.w3.org/TR/xml/#NT-ExternalID) appropriate for its media type — as defined in [B. Allowed external identifiers](#app-identifiers-allowed) — or that omits external identifiers \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\].

- *MUST NOT* contain [external entity](https://www.w3.org/TR/xml/#dt-extent) declarations in the internal DTD subset \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\].

- *MUST NOT* make use of XInclude \[[xinclude](#bib-xinclude "XML Inclusions (XInclude) Version 1.0 (Second Edition)")\].

- *MUST* be encoded in UTF-8 or UTF-16 \[[unicode](#bib-unicode "The Unicode Standard")\], with UTF-8 as the *RECOMMENDED* encoding.

The above constraints apply regardless of whether the given publication resource is a [core media type resource](#dfn-core-media-type-resource) or a [foreign resource](#dfn-foreign-resource).

Note

It is advised to avoid the XML `base` attribute \[[xmlbase](#bib-xmlbase "XML Base (Second Edition)")\] as \[[html](#bib-html "HTML Standard")\] and \[[svg](#bib-svg "SVG")\] are removing support for it.

## 4. Open Container Format (OCF)

[](#sec-ocf)

### 4.1 Introduction

[](#sec-ocf-intro)

*This section is non-normative.*

OCF is the container technology for [EPUB publications](#dfn-epub-publication). It can play a role in the following workflows:

- During the preparation steps in producing an EPUB publication, OCF can be used as the container format when exchanging in-progress publications between different individuals and/or different organizations.
- When providing an EPUB publication from publisher or conversion house to the distribution or sales channel, OCF is the preferred container format for transport.
- When delivering the final EPUB publication to an [EPUB reading system](#dfn-epub-reading-system) or user, OCF has to be used as the format for the container that holds all of the assets that make up the publication.

This section defines the rules for structuring the file collection in the abstract: the "abstract container". It also defines the rules for the representation of this abstract container within a ZIP archive: the "physical container". The rules for ZIP physical containers build upon the ZIP technologies used by \[[odf](#bib-odf "Open Document Format for Office Applications (OpenDocument) v1.0")\].

OCF also retains an [outdated](#outdated) algorithm for [obfuscating embedded fonts](#sec-font-obfuscation) but this functionality is no longer advised.

### 4.2 OCF abstract container

[](#sec-container-abstract)

#### 4.2.1 Introduction

[](#sec-container-abstract-intro)

*This section is non-normative.*

The [OCF abstract container](#dfn-ocf-abstract-container) file system model uses a single common [root directory](#dfn-root-directory). All [container resources](#dfn-container-resource) are located within the directory tree headed by the root directory, but no specific file system structure for them is mandated by this specification.

The file system model also includes a mandatory directory named `META-INF` that is a direct child of the root directory and stores the following special files:

`container.xml` `[required]`  
Identifies one or more [package documents](#dfn-package-document) that define the [EPUB publication](#dfn-epub-publication).

`signatures.xml` `[optional]`  
Contains digital signatures for various assets.

`encryption.xml` `[optional]`  
Contains information about the encryption of [publication resources](#dfn-publication-resource). This file is mandatory when using the [outdated](#outdated) [font obfuscation feature](#sec-font-obfuscation).

`metadata.xml` `[optional]`  
Used to store metadata about the [OCF ZIP container](#dfn-ocf-zip-container).

`rights.xml` `[optional]`  
Used to store information about digital rights.

`manifest.xml` `[optional]`  
A manifest of container contents as allowed by Open Document Format \[[odf](#bib-odf "Open Document Format for Office Applications (OpenDocument) v1.0")\].

Refer to [4.2.6 `META-INF` directory](#sec-container-metainf) for conformance requirements for the various files in the `META-INF` directory.

#### 4.2.2 File and directory structure

[](#sec-container-file-and-dir-structure)

The virtual file system for the [OCF abstract container](#dfn-ocf-abstract-container) *MUST* have a single common [root directory](#dfn-root-directory) for all the contents of the container.

The OCF abstract container *MUST* include a directory for configuration files named `META-INF` that is a direct child of the container's root directory. Refer to [4.2.6 `META-INF` directory](#sec-container-metainf) for the requirements for the contents of this directory.

The file name `mimetype` in the root directory is reserved for use by [OCF ZIP containers](#dfn-ocf-zip-container), as explained in [4.3 OCF ZIP container](#sec-container-zip).

Files in the `META-INF` directory and the `mimetype` file are not [publication resources](#dfn-publication-resource) so *MUST NOT* be listed in the [manifest](#dfn-epub-manifest).

All other files within the OCF abstract container *MAY* be stored in any location descendant from the root directory provided they are not within the `META-INF` directory. [EPUB publications](#dfn-epub-publication) *MUST NOT* contain references to files in the `META-INF` directory.

Note

Some [reading systems](#dfn-epub-reading-system) do not provide access to resources outside the directory where the [package document](#dfn-package-document) is stored even though this is not a restriction defined in \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\]. To avoid interoperability issues with these reading systems, it is advised to place all resources at or below the directory containing the package document.

#### 4.2.3 File paths and file names

[](#sec-container-filenames)

In the context of the [OCF abstract container](#dfn-ocf-abstract-container), [file paths](#dfn-file-path) and [file names](#dfn-file-name) are [scalar value strings](https://infra.spec.whatwg.org/#scalar-value-string) \[[infra](#bib-infra "Infra Standard")\] (i.e., their values are case sensitive).

In addition, the following restrictions are designed to allow file paths and file names to be used without modification on most operating systems:

- File names *MUST NOT* exceed 255 bytes.

- The file paths for any directory or file within the OCF abstract container *MUST NOT* exceed 65535 bytes.

- File names *MUST NOT* use the following \[[unicode](#bib-unicode "The Unicode Standard")\] characters as commonly used operating systems might not support these characters consistently:

  - SOLIDUS: `/` (`U+002F`)

  - QUOTATION MARK: `"` (`U+0022`)

  - ASTERISK: `*` (`U+002A`)

  - FULL STOP as the last character: `.` (`U+002E`)

  - COLON: `:` (`U+003A`)

  - LESS-THAN SIGN: `<` (`U+003C`)

  - GREATER-THAN SIGN: `>` (`U+003E`)

  - QUESTION MARK: `?` (`U+003F`)

  - REVERSE SOLIDUS: `\` (`U+005C`)

  - VERTICAL LINE: `|` (`U+007C`)

  - DEL (`U+007F`)

  - C0 range (`U+0000 … U+001F`)

  - C1 range (`U+0080 … U+009F`)

  - Private Use Area (`U+E000 … U+F8FF`)

  - All Unicode Non Characters, specifically:

    - The 32 contiguous characters in the Basic Multilingual Plane (`U+FDD0 … U+FDEF`)

    - The last two code points of the Basic Multilingual Plane (`U+FFFE` and `U+FFFF`)

    - The last two code points at the end of the Supplementary Planes (`U+1FFFE, U+1FFFF … U+EFFFE, U+EFFFF`)

  - Specials (`U+FFF0 … U+FFFF`)

  - Supplementary Private Use Area-A (`U+F0000 … U+FFFFF`)

  - Supplementary Private Use Area-B (`U+100000 … U+10FFFF`)

  Note

  The Unicode Character Database \[[uax44](#bib-uax44 "Unicode Character Database")\] includes a [list of deprecated characters](https://www.unicode.org/Public/UCD/latest/ucd/PropList.txt). It is also advised to avoid these characters as it is expected that [EPUB conformance checkers](#dfn-epub-conformance-checker) will flag their use.

- For compatibility with older [reading systems](#dfn-epub-reading-system), file names *SHOULD NOT* contain SPACE (U+0020) characters.

- All file names within the same directory *MUST* be unique following Unicode canonical normalization \[[uax15](#bib-uax15 "Unicode Normalization Forms")\] and then full case folding \[[unicode](#bib-unicode "The Unicode Standard")\]. (Refer to [Unicode Canonical Case Fold Normalization Step](https://www.w3.org/TR/charmod-norm/#CanonicalFoldNormalizationStep) \[[charmod-norm](#bib-charmod-norm "Character Model for the World Wide Web: String Matching")\] for more information.)

Note

If [EPUB publications](#dfn-epub-publication) are created by dynamically integrating resources (i.e., where the naming is not known in advance), be aware that automatic truncation of file names to keep them within the 255 bytes limit can lead to corruption. This is due to the difference between bytes and characters in multibyte encodings such as UTF-8. Therefore, it is important to avoid mid-character truncation. See the section on ["Truncating or limiting the length of strings"](https://www.w3.org/TR/international-specs/#char_truncation) in \[[international-specs](#bib-international-specs "Internationalization Best Practices for Spec Developers")\] for more information.

Note

Use an abundance of caution naming files when interoperability of content is key. The [list of restricted characters](#ocf-fn-chars) is intended to help avoid some known problem areas but it does not ensure that all other Unicode characters are supported. Although Unicode support is much better now than in earlier iterations of EPUB, older tools and toolchains can still be encountered (e.g., ZIP tools that only support \[[us-ascii](#bib-us-ascii "&quot;Coded Character Set - 7-bit American Standard Code for Information Interchange&quot;, ANSI X3.4, 1986.")\]).

#### 4.2.4 Deriving file paths

[](#sec-file-names-to-path-names)

To **derive the file path**, given a file or directory `file` in the [OCF abstract container](#sec-container-abstract), apply the following steps (expressed using the terminology of \[[infra](#bib-infra "Infra Standard")\]):

1.  Let `path` be an empty [list](https://infra.spec.whatwg.org/#list).
2.  Let `current` be `file`.
3.  While `current` is not the [root directory](#dfn-root-directory):
    1.  [prepend](https://infra.spec.whatwg.org/#list-prepend) the [file name](#dfn-file-name) of `current` to `path`;
    2.  set `current` to the parent directory of `current`.
4.  Return the [concatenation](https://infra.spec.whatwg.org/#string-concatenate) of `path` using the `U+002F (/)` character.

#### 4.2.5 URLs in the OCF abstract container

[](#sec-container-iri)

The [container root URL](#dfn-container-root-url) is the [URL](https://url.spec.whatwg.org/#concept-url) \[[url](#bib-url "URL Standard")\] of the [root directory](#dfn-root-directory). Although the container root URL is implementation-specific, it *MUST* have the following properties:

- The result of [parsing](https://url.spec.whatwg.org/#concept-url-parser) "`/`" with the [container root URL](#dfn-container-root-url) as [`base`](https://url.spec.whatwg.org/#concept-base-url) is the [container root URL](#dfn-container-root-url).
- The result of [parsing](https://url.spec.whatwg.org/#concept-url-parser) "`..`" with the [container root URL](#dfn-container-root-url) as [`base`](https://url.spec.whatwg.org/#concept-base-url) is the [container root URL](#dfn-container-root-url).

The [content URL](#dfn-content-url) of a file or directory in the [OCF abstract container](#dfn-ocf-abstract-container) is the result of [parsing](https://url.spec.whatwg.org/#concept-url-parser) the file's [file path](#dfn-file-path) with the container root URL as [`base`](https://url.spec.whatwg.org/#concept-base-url).

Note

The container root URL is the URL assigned by the [reading system](#dfn-epub-reading-system) to the root of the [EPUB container](#dfn-epub-container). It typically depends on how the reading system internally implements the container file system.

However, a reading system cannot arbitrarily use any URL, but one that honors the constraints defined above. These constraints ensure that any relative URL string found in the EPUB will always be parsed to a URL of a resource within the container (which might or might not exist). The primary reason for these constraints is to avoid potential run-time security issues that would be caused by parsed URLs "leaking" outside the container files.

For example, URLs like `https://localhost:12345/` or `https://www.example.org:12345/` honor these properties. But URLs like `https://localhost:12345/path/to.epub/`, `file:///path/to.epub#path=/`, or `jar:file:/path/to.epub!/EPUB/` do not (parsing the URL string "`..`" with these three examples as base would return `https://localhost:12345/path/`, `file:///path/`, and a parsing error, respectively). It is the responsibility of the reading system to assign a URL to the root directory that complies with the properties defined above.

Note

Parsing might replace some characters in the file path by their [percent encoded](https://url.spec.whatwg.org/#percent-encode) alternative. For example, `A/B/C/file name.xhtml` becomes `A/B/C/file%20name.xhtml`.

A string `url` is a valid-relative-ocf-URL-with-fragment string if it is a [path-relative-scheme-less-url string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string), optionally followed by `U+0023 (#)` and a [url-fragment string](https://url.spec.whatwg.org/#url-fragment-string), and if the following steps return `true`:

1.  Set the [container root URL](#dfn-container-root-url) to `https://a.example.org/A/`.

    Explanation

    The goal of the algorithm is to detect whether `url` could be seen as "leaking" outside the container. To do that, the standard [URL parsing algorithm](https://url.spec.whatwg.org/#concept-url-parser) is used with an artificial root URL; the detection of the "leak" is done by comparing the result of the parsing with the presence of the first test path segment (`A`). (Note that the artificial container root URL wilfully violates, for the purpose of this algorithm, the [required properties](#sec-root-url-properties) by using that first test path segment.)

2.  Let `base` be the [base URL](https://url.spec.whatwg.org/#concept-base-url) that is used to parse `url` as defined by the context (document or environment) where `url` is used, and according to the content URL of the [package document](#dfn-package-document) (see [5.2 Parsing URLs in the package document](#sec-parse-package-urls)).

    Explanation

    In the case of a URL in the package document the `base` variable is set to the content URL of the package document. In the case of a document within the `META-INF` directory, the `base` variable is set to the container root URL (see [4.2.6.2 Parsing URLs in the `META-INF` directory](#sec-parsing-urls-metainf)). In the case of a URL in an [XHTML content document](#dfn-xhtml-content-document), the base URL used for parsing is defined by the [HTML standard](https://html.spec.whatwg.org/multipage/#resolving-urls). Typically, it will be the content URL of the content document (unless the [discouraged](#sec-xhtml-deviations-base) `base` element is used).

3.  Let `testURLRecord` be the result of applying the [URL parser](https://url.spec.whatwg.org/#concept-url-parser) to `url`, with `base`.

4.  Let `testURLStringA` be the result of applying the [URL Serializer](https://url.spec.whatwg.org/#concept-url-serializer) to `testURLRecord`.

5.  Set the [container root URL](#dfn-container-root-url) to `https://b.example.org/B/`.

    Explanation

    The reasons to repeat the same steps twice with different, and artificial, settings of the container root URL is to avoid collision which can occur if the `url` string also includes `/A/`. Consider, for example, the case where `url` is `../../A/doc.xhtml`.

6.  Set `base` to be the [base URL](https://url.spec.whatwg.org/#concept-base-url) that is used to parse `url` as defined by the context (document or environment) where `url` is used, and according to the content URL of the package document (see [5.2 Parsing URLs in the package document](#sec-parse-package-urls)).

7.  Set `testURLRecord` to be the result of applying the [URL parser](https://url.spec.whatwg.org/#concept-url-parser) to `url`, with `base`.

8.  Let `testURLStringB` be the result of applying the [URL Serializer](https://url.spec.whatwg.org/#concept-url-serializer) to `testURLRecord`.

9.  If `testURLStringA` does not start with `https://a.example.org/` or `testURLStringB` does not start with `https://b.example.org/`, return `true`.

    Explanation

    If any of the result does not share the test URL host, it means that `url`, or its base URL (for example, in HTML, if it is explicitly set with the `base` element), was *absolute* and points outside the container. This is acceptable.

10. If `testURLStringA` starts with `https://a.example.org/A/` and `testURLStringB` starts with `https://b.example.org/B/`, return `true`.

    Explanation

    The presence of the first test path segments (`A`, respectively `B`) indicate that the URL doesn't leak outside the container.

11. Return `false`.

In the OCF abstract container, any URL string *MUST* be an [absolute-url-with-fragment string](https://url.spec.whatwg.org/#absolute-url-with-fragment-string) or a [valid-relative-ocf-URL-with-fragment string](#dfn-valid-relative-container-url-with-fragment-string).

In addition, all [relative-URL-with-fragment strings](https://url.spec.whatwg.org/#relative-url-with-fragment-string) \[[url](#bib-url "URL Standard")\] *MUST*, after [parsing](https://url.spec.whatwg.org/#concept-url-parser), be equal to the content URL of an existing file in the OCF abstract container.

Note

These constraints on URL strings mean that:

- relative URL strings starting with a `/` (`U+002F`) (for example, `/EPUB/content.xhtml`) are disallowed;
- relative URL strings containing more [double-dot URL path segments](https://url.spec.whatwg.org/#double-dot-path-segment) than needed to reach the target file (for example, `EPUB/../../../../config.xml`) are disallowed;
- any other absolute or relative URL string is allowed.

Note that in any case, even the disallowed URL strings described above will not "leak" outside the container after parsing (as explained in the [first note](#note-cru-explanation) of this section). They are nevertheless disallowed for better interoperability with non-conforming or legacy reading systems and toolchains.

[Example 3](#example-referencing-a-file-in-the-same-directory): Referencing a file in the same directory

In this example, the file `image1.jpg` is in the same directory as the XHTML content document.

``` xml
<html …>
   …
   <body>
      <img
          src="image1.jpg"
          alt="…" />
   …
   </body>
</html>
```

[Example 4](#example-an-out-of-container-url): An "out-of-container" URL

Given the following container structure:

``` css
/
├── mimetype
├── META-INF
│   └── container.xml
└── EPUB
    └── content.xhtml
```

A URL `../../../../EPUB/secret.xhtml` appearing in `content.xhtml` would be parsed by a reading system into a content URL with a path `EPUB/secret.xhtml`, following the constraints on the container root URL. However, as the URL could be perceived as one of a resource outside the container, and create interoperability issues; it would be reported as an error by a checker tool.

#### 4.2.6 `META-INF` directory

[](#sec-container-metainf)

##### 4.2.6.1 Inclusion in OCF abstract container

[](#sec-container-metainf-inc)

All [OCF abstract containers](#dfn-ocf-abstract-container) *MUST* include a directory called `META-INF` in their [root directory](#dfn-root-directory).

This directory is reserved for configuration files, specifically those defined in [4.2.6.3 Reserved files](#sec-container-metainf-files).

##### 4.2.6.2 Parsing URLs in the `META-INF` directory

[](#sec-parsing-urls-metainf)

To parse a URL string `url` used in files located in the `META-INF` directory the [URL parser](https://url.spec.whatwg.org/#concept-url-parser) *MUST* be applied to `url`, with the [container root URL](#dfn-container-root-url) as [`base`](https://url.spec.whatwg.org/#concept-base-url).

[Example 5](#example-resolving-paths-in-the-container-file): Resolving paths in the container file

If container file (`META-INF/container.xml`) has the following content:

``` xml
<?xml version="1.0"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
   <rootfiles>
      <rootfile
          full-path="EPUB/Great_Expectations.opf"
          media-type="application/oebps-package+xml" />
   </rootfiles>
</container>
```

then the path `EPUB/Great_Expectations.opf` is relative to the [root directory](#dfn-root-directory) for the [OCF abstract container](#dfn-ocf-abstract-container) and not relative to the `META-INF` directory.

##### 4.2.6.3 Reserved files

[](#sec-container-metainf-files)

###### 4.2.6.3.1 Container file (`container.xml`)

[](#sec-container-metainf-container.xml)

The *REQUIRED* `container.xml` file in the `META-INF` directory identifies the [package documents](#dfn-package-document) available in the [OCF abstract container](#dfn-ocf-abstract-container).

All \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] elements defined in this section are in the `urn:oasis:names:tc:opendocument:xmlns:container` namespace \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\] unless specified otherwise.

The contents of this file *MUST* be valid to the definition in this section after removing all elements and attributes from other namespaces (including all attributes and contents of such elements).

Note

An [XML Schema](#app-schema-container) also informally defines the content of this file.

###### 4.2.6.3.1.1 The `container` element

[](#sec-container.xml-container-elem)

The `container` element encapsulates all the information in the `container.xml` file.

Element Name:  
`container`

Usage:  
*REQUIRED* [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the `container.xml` file.

Attributes:  
`version` `[required]`  
This attribute *MUST* have the value "`1.0`".

Content Model:  
In this order:

- [`rootfiles`](#dfn-rootfiles) \[exactly one\]
- [`links`](#dfn-links) \[0 or 1\]

###### 4.2.6.3.1.2 The `rootfiles` element

[](#sec-container.xml-rootfiles-elem)

The `rootfiles` element contains a list of [package documents](#dfn-package-document) available in the [EPUB container](#dfn-epub-container).

Element Name:  
`rootfiles`

Usage:  
*REQUIRED* first child of [`container`](#dfn-container).

Attributes:  
None

Content Model:  
- [`rootfile`](#dfn-rootfile) \[1 or more\]

###### 4.2.6.3.1.3 The `rootfile` element

[](#sec-container.xml-rootfile-elem)

Each `rootfile` element identifies the location of one [package document](#dfn-package-document) in the [EPUB container](#dfn-epub-container).

Element Name:  
`rootfile`

Usage:  
As child of the [`rootfiles`](#dfn-rootfiles) element. Repeatable.

Attributes:  
`full-path` `[required]`  
Identifies the location of a package document.

The value of the attribute *MUST* be a [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string) \[[url](#bib-url "URL Standard")\]. The path is relative to the [root directory](#dfn-root-directory).

`media-type` `[required]`  
Identifies the media type of the package document.

The value of the attribute *MUST* be "`application/oebps-package+xml`".

Content Model:  
Empty

If more than one `rootfile` element is specified, each *MUST* reference a package document that conforms to the same version of EPUB. Each package document represents one rendering of the [EPUB publication](#dfn-epub-publication).

Note

Although the EPUB container provides the ability to reference more than one package document, this specification does not define how to interpret, or select from, the available options. Refer to \[[epub-multi-rend-11](#bib-epub-multi-rend-11 "EPUB 3 Multiple-Rendition Publications 1.1")\] for more information on how to bundle more than one rendering of the content.

###### 4.2.6.3.1.4 The `links` element

[](#sec-container.xml-links-elem)

The `links` element identifies resources necessary for the processing of the [OCF ZIP container](#dfn-ocf-zip-container).

Element Name:  
`links`

Usage:  
*OPTIONAL* second child of [`container`](#dfn-container). Repeatable.

Attributes:  
None

Content Model:  
- [`link`](#elemdef-link) \[1 or more\]

Note

This specification currently does not define uses for the `links` element. Refer to \[[epub-multi-rend-11](#bib-epub-multi-rend-11 "EPUB 3 Multiple-Rendition Publications 1.1")\] for an example of its use.

###### 4.2.6.3.1.5 The `link` element

[](#sec-container.xml-link-elem)

Element Name:  
`link`

Usage:  
As child of the [`links`](#dfn-links) element. Repeatable.

Attributes:  
`href` `[required]`  
Identifies the location of a resource.

The value of the `link` element `href` attribute *MUST* be a [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string) \[[url](#bib-url "URL Standard")\]. The path is relative to the [root directory](#dfn-root-directory).

`media-type` `[optional]`  
Identifies the type and format of the referenced resource.

The value of the attribute *MUST* be a media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\].

`rel` `[required]`  
Identifies the relationship of the resource.

The value of the attribute *MUST* be a space-separated list of tokens.

Content Model:  
Empty

###### 4.2.6.3.1.6 Examples

[](#sec-container-container.xml-example)

*This section is non-normative.*

[Example 6](#example-a-basic-container-file): A basic container file

``` xml
<?xml version="1.0"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
   <rootfiles>
      <rootfile
          full-path="EPUB/My_Crazy_Life.opf"
          media-type="application/oebps-package+xml" />
   </rootfiles>
</container>
```

###### 4.2.6.3.2 Encryption file (`encryption.xml`)

[](#sec-container-metainf-encryption.xml)

The *OPTIONAL* `encryption.xml` file in the `META-INF` directory holds all encryption information on the contents of the container. If an any resources within the container are encrypted, there *MUST* be an `encryption.xml` file to provide information about the encryption used.

###### 4.2.6.3.2.1 The `encryption` element

[](#sec-encryption.xml-encryption)

Element Name:  
`encryption`

Namespace:  
`urn:oasis:names:tc:opendocument:xmlns:container`

Usage:  
*REQUIRED* [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the `encryption.xml` file.

Attributes:  
None

Content Model:  
In any order:

- `EncryptedKey` \[1 or more\]
- `EncryptedData` \[1 or more\]

The `encryption` element contains child elements of type `EncryptedKey` and `EncryptedData` as defined by \[[xmlenc-core1](#bib-xmlenc-core1 "XML Encryption Syntax and Processing Version 1.1")\].

An `EncryptedKey` element describes each encryption key used in the container, while an `EncryptedData` element describes each encrypted file. Each `EncryptedData` element refers to an `EncryptedKey` element, as described in XML Encryption.

Note

An [XML Schema](#app-schema-encryption) also informally defines the content of the `encryption.xml` file.

OCF encrypts individual files independently, trading off some security for improved performance, allowing the container contents to be incrementally decrypted. Encryption in this way exposes the directory structure and file naming of the whole package.

OCF uses XML Encryption \[[xmlenc-core1](#bib-xmlenc-core1 "XML Encryption Syntax and Processing Version 1.1")\] to provide a framework for encryption, allowing a variety of algorithms to be used. XML Encryption specifies a process for encrypting arbitrary data and representing the result in XML. Even if an [OCF abstract container](#dfn-ocf-abstract-container) contains non-XML data, XML Encryption can be used to encrypt that data. OCF encryption supports only the encryption of entire files within the container, not parts of files.

The following files *MUST NOT* be encrypted:

- `mimetype`
- `META-INF/container.xml`
- `META-INF/encryption.xml`
- `META-INF/manifest.xml`
- `META-INF/metadata.xml`
- `META-INF/rights.xml`
- `META-INF/signatures.xml`
- [package document](#dfn-package-document)

Encrypted data replaces unencrypted data in an OCF abstract container. For example, if an image named `photo.jpeg` is encrypted, the contents of the `photo.jpeg` resource is replaced with its encrypted contents. Encrypted files within the ZIP directory *SHOULD NOT* be compressed.

Note that some situations require obfuscating the storage of embedded fonts referenced by an [EPUB publication](#dfn-epub-publication) to make them more difficult to extract for unrestricted use. Although obfuscation is not encryption, reading systems use the `encryption.xml` file in conjunction with the [outdated](#outdated) [font obfuscation algorithm](#sec-font-obfuscation) to identify fonts to deobfuscate.

The Decryption Transform for XML Signature \[[xmlenc-decrypt](#bib-xmlenc-decrypt "Decryption Transform for XML Signature")\] *MAY* subsequently be used to encrypt signed resources. This feature enables a [reading system](#dfn-epub-reading-system) to distinguish data encrypted before signing from data encrypted after signing.

[Example 7](#example-an-encrypted-image): An encrypted image

In this example, adapted from [Section 2.2.1](https://www.w3.org/TR/xmlenc-core1/#sec-eg-Symmetric-Key) of \[[xmlenc-core1](#bib-xmlenc-core1 "XML Encryption Syntax and Processing Version 1.1")\], the resource `image.jpeg` is encrypted using a symmetric key algorithm (AES) and the symmetric key is further encrypted using an asymmetric key algorithm (RSA) with a key of "John Smith".

``` xml
<encryption
    xmlns ="urn:oasis:names:tc:opendocument:xmlns:container"
    xmlns:enc="http://www.w3.org/2001/04/xmlenc#"
    xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
   <enc:EncryptedKey Id="EK">
      <enc:EncryptionMethod
          Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-1_5"/>
      <ds:KeyInfo>
         <ds:KeyName>
            John Smith
         </ds:KeyName>
      </ds:KeyInfo>
      <enc:CipherData>
         <enc:CipherValue>
            xyzabc
         </enc:CipherValue>
      </enc:CipherData>
   </enc:EncryptedKey>
   <enc:EncryptedData Id="ED1">
      <enc:EncryptionMethod
          Algorithm="http://www.w3.org/2001/04/xmlenc#kw-aes128"/>
      <ds:KeyInfo>
         <ds:RetrievalMethod
             URI="#EK"
             Type="http://www.w3.org/2001/04/xmlenc#EncryptedKey"/>
      </ds:KeyInfo>
      <enc:CipherData>
         <enc:CipherReference
             URI="image.jpeg"/>
      </enc:CipherData>
   </enc:EncryptedData>
</encryption>
```

###### 4.2.6.3.2.2 Order of compression and encryption

[](#sec-enc-compression)

When stored in an [OCF ZIP container](#dfn-ocf-zip-container), streams of data with [non-codec](#dfn-non-codec) content types *SHOULD* be compressed before encrypting them. Deflate compression *MUST* be used. This practice ensures that file entries stored in the ZIP container have a smaller size.

Streams of data with [codec](#dfn-codec) content types *SHOULD NOT* be compressed before encrypting them. In such cases, additional compression introduces unnecessary processing overhead at production time (especially with large resource files) and impacts audio/video playback performance at consumption time. In some cases, the combination of compression with some encryption schemes might even compromise the ability of [reading systems](#dfn-epub-reading-system) to handle partial content requests (e.g. HTTP byte ranges), due to the technical impossibility to determine the length of the full resource ahead of media playback (e.g. HTTP Content-Length header).

When streams of data are compressed before encrypting, additional `EncryptionProperties` metadata *SHOULD* be provided to specify the size of the initial resource (i.e., before compression and encryption), as per the `Compression` XML element defined below. When streams of data are not compressed before encrypting, additional `EncryptionProperties` metadata *MAY* be provided to specify the size of the initial resource (i.e., before encryption).

Element Name:  
`Compression`

Namespace:  
`http://www.idpf.org/2016/encryption#compression`

Usage:  
*OPTIONAL* child of `EncryptionProperty`.

Attributes:  
Method `[required]`  
Identifies the compression method used.

Value is either "`0`" (no compression) or "`8`" (Deflate algorithm).

OriginalLength `[required]`  
Represents the size of the initial resource (number of bytes).

Value is a positive integer.

Content Model:  
Empty

[Example 8](#example-a-compressed-video): A compressed video

In this example, the MP4 file has been Deflate compressed. Its original size was 3500000 bytes.

``` xml
<encryption
    xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
   <enc:EncryptedData
       xmlns:enc="http://www.w3.org/2001/04/xmlenc#">
      …
      <enc:CipherData>
         <enc:CipherReference
             URI="OEPBS/video.mp4"/>
      </enc:CipherData>
      <enc:EncryptionProperties>
         <enc:EncryptionProperty
             xmlns:ns="http://www.idpf.org/2016/encryption#compression">
            <ns:Compression
                Method="8"
                OriginalLength="3500000"/>
         </enc:EncryptionProperty>
      </enc:EncryptionProperties>
      …
   </enc:EncryptedData>
</encryption>
```

###### 4.2.6.3.3 Manifest file (`manifest.xml`)

[](#sec-container-metainf-manifest.xml)

The *OPTIONAL* `manifest.xml` file in the `META-INF` directory provides a manifest of files in the container.

The OCF specification does not mandate a format for the manifest.

Note that [package documents](#dfn-package-document) specify the only manifests used for processing [EPUB publications](#dfn-epub-publication). Reading systems do not use this file.

Note

This feature exists only for compatibility with \[[odf](#bib-odf "Open Document Format for Office Applications (OpenDocument) v1.0")\].

###### 4.2.6.3.4 Metadata file (`metadata.xml`)

[](#sec-container-metainf-metadata.xml)

The *OPTIONAL* `metadata.xml` file in the `META-INF` directory is only for container-level metadata.

If a `metadata.xml` file is included, it *SHOULD* include only namespace-qualified elements \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\]. The file *SHOULD* contain the [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] `metadata` in the namespace `http://www.idpf.org/2013/metadata`, but this specification allows other root elements for backwards compatibility.

This version of the specification does not define metadata for use in the `metadata.xml` file. Future versions of this specification *MAY* define container-level metadata.

###### 4.2.6.3.5 Rights management file (`rights.xml`)

[](#sec-container-metainf-rights.xml)

This specification reserves the *OPTIONAL* `rights.xml` file in the `META-INF` directory for the trusted exchange of [EPUB publications](#dfn-epub-publication) among rights holders, intermediaries, and users.

When a `rights.xml` file is not included, no part of the [OCF abstract container](#dfn-ocf-abstract-container) is rights governed at the container level. Rights expressions might exist within the EPUB publication.

###### 4.2.6.3.6 Digital signatures file (`signatures.xml`)

[](#sec-container-metainf-signatures.xml)

Note

Adding a digital signature is not a guarantee that a malicious actor cannot tamper with an [EPUB publication](#dfn-epub-publication) as [reading systems](#dfn-epub-reading-system) do not have to check signatures.

The *OPTIONAL* `signatures.xml` file in the `META-INF` directory holds digital signatures for the container and its contents.

###### 4.2.6.3.6.1 The `signatures` element

[](#sec-signatures.xml-signatures)

Element Name:  
`signatures`

Namespace:  
`urn:oasis:names:tc:opendocument:xmlns:container`

Usage:  
*REQUIRED* [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the `signature.xml` file.

Attributes:  
None

Content Model:  
- `Signature` \[1 or more\]

The `signatures` element contains child elements of type `Signature`, as defined by \[[xmldsig-core1](#bib-xmldsig-core1 "XML Signature Syntax and Processing Version 1.1")\]. Signatures can be applied to an EPUB publication as a whole or to its parts. They can also be used to sign any kind of data (i.e., not just XML).

Note

An [XML Schema](#app-schema-signatures) also informally defines the content of the `signatures.xml` file.

When a `signatures.xml` file is not included, no part of the [OCF abstract container](#dfn-ocf-abstract-container) is signed at the container level but digital signing might exist within the EPUB publication.

When a data signature is created for the OCF abstract container, the signature *SHOULD* be stored as the last child `Signature` element of the `signatures` element.

Note

Each `Signature` in the `signatures.xml` file identifies by URL \[[url](#bib-url "URL Standard")\] the data to which the signature applies, using the \[[xmldsig-core1](#bib-xmldsig-core1 "XML Signature Syntax and Processing Version 1.1")\] `Manifest` element and its `Reference` sub-elements. Individual container files can be signed separately or together. Separately signing each file creates a digest value for the resource that reading systems can validate independently. This approach might make a Signature element larger. If the files are signed together, list the set of signed files in a single XML Signature `Manifest` element and reference them from one or more `Signature` elements.

Any or all files in the OCF abstract container can be signed in their entirety, except for the `signatures.xml` file since that file will contain the computed signature information.

How to sign the `signatures.xml` file depends on the objective:

- To allow signatures to be added or removed from the OCF abstract container without invalidating its signature, the `signatures.xml` file *SHOULD NOT* be signed.
- To have any addition or removal of a signature invalidate the signature for the OCF abstract container, the signer can use the Enveloped Signature transform defined in [Section 6.6.4](https://www.w3.org/TR/xmldsig-core/#sec-EnvelopedSignature) of \[[xmldsig-core1](#bib-xmldsig-core1 "XML Signature Syntax and Processing Version 1.1")\] to sign the entire pre-existing signature file excluding the `Signature` being created. This transform would sign all previous signatures, and it would become invalid if a subsequent signature were added to the package.

Note

If it is desired to have only the removal of an existing signature invalidate the signature for the OCF abstract container (i.e., allow the addition of new signatures), an XPath transform could be used to sign just the existing signatures. The details of such a transform are outside the scope of this specification.

The \[[xmldsig-core1](#bib-xmldsig-core1 "XML Signature Syntax and Processing Version 1.1")\] specification does not associate any semantics with a signature; an agent might include semantic information, for example, by adding information to the Signature element that describes the signature. The \[[xmldsig-core1](#bib-xmldsig-core1 "XML Signature Syntax and Processing Version 1.1")\] specification describes how additional information can be added to a signature, such as by use the `SignatureProperties` element.

[Example 9](#example-signing-resources): Signing resources

In this example, based on the examples found in [Section 2](https://www.w3.org/TR/xmldsig-core1/#sec-Overview) of \[[xmldsig-core1](#bib-xmldsig-core1 "XML Signature Syntax and Processing Version 1.1")\], one signature applies to two resources (`EPUB/book.xhtml` and `EPUB/images/cover.jpeg`).

``` xml
<signatures
    xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
   <Signature
       Id="sig"
       xmlns="http://www.w3.org/2000/09/xmldsig#">
      <SignedInfo>
         <CanonicalizationMethod
             Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
            <SignatureMethod
                Algorithm="http://www.w3.org/2000/09/xmldsig#dsa-sha1"/>
            <Reference
                URI="#Manifest1">
               <DigestMethod
                   Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
               <DigestValue>j6lwx3rvEPO0vKtMup4NbeVu8nk=</DigestValue>
            </Reference>
      </SignedInfo>
      <SignatureValue>
         …
      </SignatureValue>
      <KeyInfo>
         <KeyValue>
            <DSAKeyValue>
               <P>…</P>
               <Q>…</Q>
               <G>…</G>
               <Y>…</Y>
            </DSAKeyValue>
         </KeyValue>
      </KeyInfo>
      <Object>
         <Manifest
             Id="Manifest1">
            <Reference
                URI="EPUB/book.xhtml">
               <Transforms>
                  <Transform
                      Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
               </Transforms>
               <DigestMethod
                   Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
               <DigestValue>…</DigestValue>
            </Reference>
            <Reference URI="EPUB/images/cover.jpeg">
               <Transforms>
                  <Transform
                      Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
               </Transforms>
               <DigestMethod
                   Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
               <DigestValue>…</DigestValue>
            </Reference>
         </Manifest>
      </Object>
   </Signature>
</signatures>
```

### 4.3 OCF ZIP container

[](#sec-container-zip)

#### 4.3.1 Introduction

[](#sec-container-zip-intro)

*This section is non-normative.*

An [OCF ZIP container](#dfn-ocf-zip-container) is a physical single-file manifestation of an [OCF abstract container](#dfn-ocf-abstract-container). The container allows:

- the exchange of in-progress [EPUB publication](#dfn-epub-publication) between different individuals and/or different organizations;

- the transfer of EPUB publications from a publisher or conversion house to the distribution or sales channel; and

- the delivery of EPUB publications to [EPUB reading systems](#dfn-epub-reading-system) or users.

#### 4.3.2 ZIP file requirements

[](#sec-zip-container-zipreqs)

An [OCF ZIP container](#dfn-ocf-zip-container) uses the ZIP format as specified by \[[zip](#bib-zip ".ZIP File Format Specification")\], but with the following constraints and clarifications:

- The contents of the OCF ZIP container *MUST* be a conforming [OCF abstract container](#sec-container-abstract).

- OCF ZIP containers *MUST NOT* use the features in the ZIP application note \[[zip](#bib-zip ".ZIP File Format Specification")\] that allow ZIP files to be spanned across multiple storage media or be split into multiple files.

- OCF ZIP containers *MUST* include only stored (uncompressed) and Deflate-compressed ZIP entries within the ZIP archive.

- OCF ZIP containers *MAY* use the ZIP64 extensions defined as ["Version 1"](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT#:~:text=4.3.14.2) in [section 4.3.14 ("Zip64 end of central directory record")](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT#:~:text=4.3.14%20%20Zip64%20end%20of%20central%20directory%20record) \[[zip](#bib-zip ".ZIP File Format Specification")\] and *SHOULD* use only those extensions when the content requires them.

- OCF ZIP containers *MUST NOT* use the encryption features defined by the ZIP format; instead, encryption *MUST* be done using the features described in [4.2.6.3.2 Encryption file (`encryption.xml`)](#sec-container-metainf-encryption.xml).

- OCF ZIP containers *MUST* encode file system names using UTF-8 \[[unicode](#bib-unicode "The Unicode Standard")\].

The following constraints apply to specific fields in the OCF ZIP container archive:

- In the local file header table, the `version needed to extract` fields *MUST* be set to `10`, `20` or `45` to match the maximum version level needed by the given file (e.g., `20` for Deflate, `45` for ZIP64).

- In the local file header table, the `compression` method field *MUST* be set to `0` or `8`.

#### 4.3.3 OCF ZIP container media type identification

[](#sec-zip-container-mime)

The `mimetype` file *MUST* be the first file in the [OCF ZIP container](#dfn-ocf-zip-container). In addition:

- The contents of the `mimetype` file *MUST* be the MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] string `application/epub+zip` encoded in US-ASCII \[[us-ascii](#bib-us-ascii "&quot;Coded Character Set - 7-bit American Standard Code for Information Interchange&quot;, ANSI X3.4, 1986.")\].
- The `mimetype` file *MUST NOT* contain any leading or trailing padding or whitespace.
- The `mimetype` file *MUST NOT* begin with the Unicode byte order mark U+FEFF.
- The `mimetype` file *MUST NOT* be compressed or encrypted.
- The `mimetype` file *MUST NOT* include an extra field in its ZIP header.

Note

Refer to [G.2 The `application/epub+zip` media type](#app-media-type) for further information about the `application/epub+zip` media type.

## 5. Package document

[](#sec-package-doc)

All \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] elements defined in this section are in the `http://www.idpf.org/2007/opf` namespace \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\] unless otherwise specified.

### 5.1 Introduction

[](#sec-package-intro)

*This section is non-normative.*

The [package document](#dfn-package-document) is an [XML document](#sec-xml-constraints) that consists of a set of elements that each encapsulate information about a particular aspect of an [EPUB publication](#dfn-epub-publication). These elements serve to centralize metadata, detail the individual resources, and provide the reading order and other information necessary for its rendering.

The following list summarizes the information found in the package document:

- [Metadata](#sec-pkg-metadata) — mechanisms to include and/or reference information about the EPUB publication.

- A [manifest](#sec-manifest-elem) — identifies via URL \[[url](#bib-url "URL Standard")\], and describes via MIME media type \[[rfc4839](#bib-rfc4839 "Media Type Registrations for the Open eBook Publication Structure (OEBPS) Package File (OPF)")\], the set of [publication resources](#dfn-publication-resource).

- A [spine](#sec-spine-elem) — an ordered sequence of ID references to top-level resources in the manifest from which [reading systems](#dfn-epub-reading-system) can reach or utilize all other resources in the set. The spine defines the default reading order.

- [Manifest fallback chains](#dfn-manifest-fallback-chain) — a mechanism that defines an ordered list of top-level resources as content equivalents. A reading system can then choose between the resources based on which it is capable of rendering.

Note

An EPUB publication can reference more than one package document, allowing for alternative representations of the content. For more information, refer to [4.2.6.3.1 Container file (`container.xml`)](#sec-container-metainf-container.xml)

Note

Refer to [G.1 The `application/oebps-package+xml` media type](#app-media-type-app-oebps-package) for information about the file properties of package documents.

### 5.2 Parsing URLs in the package document

[](#sec-parse-package-urls)

To parse a URL string `url` used in the [package document](#dfn-package-document), the [URL parser](https://url.spec.whatwg.org/#concept-url-parser) \[[url](#bib-url "URL Standard")\] *MUST* be applied to `url`, with the [content URL](#dfn-content-url) of the package document as `base`.

### 5.3 Vocabulary association mechanisms

[](#sec-vocab-assoc)

#### 5.3.1 Introduction

[](#vocab-assoc-intro)

*This section is non-normative.*

The package document allows metadata expressions, and metadata extensibility, through the use of [compact URLs](#dfn-compact-url). A compact URL is very similar to a CURIE \[[rdfa-core](#bib-rdfa-core "RDFa Core 1.1 - Third Edition")\] in how they represent URLs \[[url](#bib-url "URL Standard")\] — both expressions consist of an optional prefix followed by a required reference.

The prefix, whether literal or implied, is a shorthand mapping of a URL that typically resolves to a vocabulary, such as Dublin Core \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] or Schema.org \[[schema-org](#bib-schema-org "Schema.org")\]. For example, the prefix `dcterms` is used instead of having to add the full URL `http://purl.org/dc/terms/` every time. Using prefixes makes authoring metadata less error prone while still retaining the uniqueness of the vocabulary being used.

The reference is the specific term or property being declared. It is separated from its prefix by a colon. A prefix is not always required for a compact URL because of what are called [default vocabularies](#dfn-default-vocabulary). Each attribute that accepts a compact URL also defines a default vocabulary of terms or properties. The absence of a prefix means the compact URL represents a value from the default vocabulary.

[Example 10](#example-types-of-compact-urls): Types of compact URLs

In this example, the compact URL in the `property` attribute has both a prefix (`dcterms`) and a reference (`modified`).

``` xml
<meta property="dcterms:modified">2025-10-18T12:00:00Z</meta>
```

In this example, the compact URL in the `properties` attribute is taken from its default vocabulary so only the reference (`cover-image`) is present:

``` abnf
<item href="images/cover.jpg" properties="cover-image" media-type="image/jpeg" />
```

When a [reading system](#dfn-epub-reading-system) converts a compact URL to a full URL, the result usually resolves to a fragment within that vocabulary that contains human- and/or machine-readable information about the term, but this is not required. Prefixes are ultimately just unique identifiers, similar to how XML namespaces \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\] work.

Note

Although compact URL prefixes look a lot like XML namespace prefixes, and both serve as unique identifiers for their references, that is where their similarities end. Compact URL prefixes are not declared using the `xmlns:` syntax. Refer to [5.3.4 The `prefix` attribute](#sec-prefix-attr) for more information.

The power of the compact URL data type lies in its easy extensibility. To incorporate new terms and properties, it is only necessary to declare a [prefix](#sec-prefix-attr). In another authoring convenience, this specification also [reserves prefixes](#sec-metadata-reserved-prefixes) for many commonly used publishing vocabularies (i.e., their declaration is not required).

There are several attributes in the package document that accept compact URLs, with the [`meta`](#dfn-meta) element's [`property` attribute](#attrdef-meta-property), the [`link`](#dfn-link) element's [`rel` attribute](#attrdef-link-rel), and the manifest [`item`](#dfn-item) element's [`properties` attribute](#sec-item-resource-properties) being the more commonly used ones. Compact URLs are also used beyond the package document in EPUB 3, with the [`epub:type`](#dfn-epub-type) attribute using them to express structural semantics in [EPUB content documents](#dfn-epub-content-document).

The following sections provide additional details on creating and using compact URLs.

#### 5.3.2 The compact URL data type

[](#sec-compact-url-datatype)

The compact URL data type is a compact means of expressing a URL \[[url](#bib-url "URL Standard")\] and consists of an *OPTIONAL* prefix separated from a reference by a colon.

[TABLE]

(EBNF productions \[[iso14977](#bib-iso14977 "ISO/IEC 14977:1996 — Information technology — Syntactic metalanguage — Extended BNF")\])\
All terminal symbols are in the Unicode Block 'Basic Latin' (U+0000 to U+007F).\
XML Schema datatypes \[[xmlschema-2](#bib-xmlschema-2 "XML Schema Part 2: Datatypes Second Edition")\] use the prefix `xsd:`. {.productionset}

This specification derives the compact URL data type from the CURIE data type defined in \[[rdfa-core](#bib-rdfa-core "RDFa Core 1.1 - Third Edition")\]. A compact URL represents a subset of CURIEs.

There are two key differences from CURIEs:

- an empty `reference` does not represent a valid compact URL even though it is valid to the definition above (i.e., a compact URL that only consists of a prefix and colon is invalid).

- an empty string does not represent a valid compact URL even though it is valid to the definition above.

[Example 11](#example-expanding-a-compact-url): Expanding a compact URL

In this example, the compact URL in the `property` attribute is composed of the prefix `dcterms` and the reference `modified`.

``` xml
<meta property="dcterms:modified">2011-01-01T12:00:00Z</meta>
```

After [processing](https://www.w3.org/TR/epub-rs-34/#sec-compact-url-values) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\], this property would expand to the following URL:

http://purl.org/dc/terms/modified

as the `dcterms:` prefix is a [reserved prefix](#sec-metadata-reserved-prefixes) that maps to the URL "`http://purl.org/dc/terms/`".

When a prefix is omitted from a compact URL value, the specified term is taken from the [default vocabulary](#dfn-default-vocabulary) for that attribute.

[Example 12](#example-expanding-a-manifest-compact-url): Expanding a manifest compact URL

In this example, the [`mathml` property](#mathml) is specified on a manifest [`item`](#dfn-item) element:

``` abnf
<item … properties="mathml"/>
```

This property expands to:

``` javascript
http://idpf.org/epub/vocab/package/item/#mathml
```

when the prefix URL for the vocabulary is concatenated with the reference.

#### 5.3.3 Default vocabularies

[](#sec-default-vocab)

A default vocabulary is one whose terms and properties *MUST NOT* have a [prefix](#sec-prefix-attr) when a [compact URL](#dfn-compact-url) is expected.

A prefix *MUST NOT* be assigned to the URLs associated with these vocabularies using the [`prefix`](#sec-prefix-attr) attribute.

Note

Refer to the definition of each attribute that takes a compact URL data type for more information about its default vocabulary.

#### 5.3.4 The `prefix` attribute

[](#sec-prefix-attr)

The `prefix` attribute defines prefix mappings for use in [compact URLs](#dfn-compact-url).

The value of the `prefix` attribute is a whitespace-separated list of one or more prefix-to-URL mappings of the form:

|  |  |  |  |
|----|----|----|----|
| [prefixes](#prefix.ebnf.def) | `=` | [mapping](#prefix.ebnf.mapping) , { [whitespace](#prefix.ebnf.whitespace), { [whitespace](#prefix.ebnf.space) } , [mapping](#prefix.ebnf.mapping) } ; |   |
| [mapping](#prefix.ebnf.mapping) | `=` | [prefix](#prefix.ebnf.prefix) , ":" , [space](#prefix.ebnf.space) , { [space](#prefix.ebnf.space) } , ? xsd:anyURI ? ; |   |
| [prefix](#prefix.ebnf.prefix) | `=` | ? xsd:NCName ? ; |   |
| [space](#prefix.ebnf.space) | `=` | \#x20 ; |   |
| [whitespace](#prefix.ebnf.whitespace) | `=` | (#x20 \| \#x9 \| \#xD \| \#xA) ; |   |

(EBNF productions \[[iso14977](#bib-iso14977 "ISO/IEC 14977:1996 — Information technology — Syntactic metalanguage — Extended BNF")\])\
All terminal symbols are in the Unicode Block 'Basic Latin' (U+0000 to U+007F).\
XML Schema datatypes \[[xmlschema-2](#bib-xmlschema-2 "XML Schema Part 2: Datatypes Second Edition")\] use the prefix `xsd:`. {.productionset}

With the exception of [reserved prefixes](#sec-reserved-prefixes), all prefixes used in a document *MUST* be declared. The `prefix` attribute *MUST* be specified only on the [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the respective format.

The attribute is not namespaced when used in the [package document](#dfn-package-document).

[Example 13](#example-declaring-prefixes-in-the-package-document): Declaring prefixes in the package document

In this example, the prefixes for the Friend of a Friend (`foaf`) and DBPedia (`dbp`) vocabularies are declared in the `prefix` attribute.

``` xml
<package
    …
    prefix="foaf: http://xmlns.com/foaf/spec/
            dbp: http://dbpedia.org/ontology/">
   …
</package>
```

The attribute *MUST* be declared in the namespace `http://www.idpf.org/2007/ops` when used in [EPUB content documents](#dfn-epub-content-document) and [media overlay documents](#dfn-media-overlay-document).

[Example 14](#example-declaring-prefixes-in-an-xhtml-content-document): Declaring prefixes in an XHTML content document

In this example, a prefix is declared for the Z39.98 Structural Semantics Vocabulary.

``` xml
<html …
      xmlns:epub="http://www.idpf.org/2007/ops"
      epub:prefix="z3998: https://www.daisy.org/z3998/2012/vocab/structure/">
   …
</html>
```

Note

Although the `prefix` attribute is modeled on the identically named `prefix` attribute in \[[rdfa-core](#bib-rdfa-core "RDFa Core 1.1 - Third Edition")\], the attributes cannot be used interchangeably. The `prefix` attribute without a namespace in EPUB content documents is the RDFa attribute.

It is common for both attributes to appear in EPUB content documents that also specify RDFa expressions.

``` xml
<html … prefix="…"
        xmlns:epub="http://www.idpf.org/2007/ops"
        epub:prefix="…">   …
</html>
```

Note that for [SVG embedded by inclusion](#sec-xhtml-svg-inclusion), prefixes *MUST* be declared on the \[[html](#bib-html "HTML Standard")\] root [`html`](https://html.spec.whatwg.org/multipage/semantics.html#the-html-element) element.

To avoid conflicts, the `prefix` attribute *MUST NOT* be used to declare a prefix that maps to a [default vocabulary](#dfn-default-vocabulary).

The prefix '\_' *MUST NOT* be declared as this specification reserves this prefix for future compatibility with RDFa \[[rdfa-core](#bib-rdfa-core "RDFa Core 1.1 - Third Edition")\] processing.

For future compatibility with alternative serializations of the package document, a prefix *MUST NOT* be declared for the Dublin Core */elements/1.1/* namespace \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\]. Only the \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] elements are [allowed in the package document metadata](#sec-pkg-metadata).

#### 5.3.5 Reserved prefixes

[](#sec-reserved-prefixes)

Caution

Although reserved prefixes are an authoring convenience, they can cause issues. Vendors, for example, will often reject new prefixes until they update their [EPUB conformance checkers](#dfn-epub-conformance-checker). It is advised to declare all prefixes to avoid any issues.

Reserved prefixes *MAY* be used in attributes that expect a [compact URL](#dfn-compact-url) without declaring them in a [`prefix` attribute](#sec-prefix-attr).

Reserved prefixes *SHOULD NOT* be overridden in the [`prefix` attribute](#sec-prefix-attr).

The reserved prefixes that can be used depends on the context:

Package document  
The following prefixes *MAY* be used in [package document](#dfn-package-document) attributes without having to declare them.

| Prefix | URL | Usage |
|----|----|----|
| a11y | http://www.idpf.org/epub/vocab/package/a11y/# | To declare properties from them EPUB Accessibility namespace. These are typically defined in [EPUB Accessibility 1.2](https://www.w3.org/TR/epub-a11y-12/#app-a11y-vocab) \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\]. |
| dcterms | http://purl.org/dc/terms/ | To declare properties from the [Dublin Core /terms/ namespace](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/#section-2) \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\]. |
| marc | http://id.loc.gov/vocabulary/ | Primarily used in the [`scheme` attribute](#attrdef-scheme) to indicate that creator and contributor roles are defined in the the [MARC relators code list](https://www.loc.gov/marc/relators/relaterm.html) \[[marc-relators](#bib-marc-relators "MARC Code List for Relators")\]. Can be used to reference other vocabularies published by the Library of Congress. |
| media | http://www.idpf.org/epub/vocab/overlays/# | To declare properties from the [Media Overlays vocabulary](#app-overlays-vocab). |
| onix | http://www.editeur.org/ONIX/book/codelists/current.html# | Used in the `scheme` attribute to identify the [ONIX code list](https://ns.editeur.org/onix/en) \[[onix](#bib-onix "ONIX for Books 3.0")\] a value corresponds to. |
| rendition | http://www.idpf.org/vocab/rendition/# | To declare properties from the [Package rendering vocabulary](#app-rendering-vocab). |
| schema | http://schema.org/ | To declare properties from the [Schema.org vocabulary](https://schema.org) \[[schema-org](#bib-schema-org "Schema.org")\]. |

### 5.4 Shared attributes

[](#sec-shared-attrs)

This section provides definitions for shared attributes (i.e., attributes allowed on two or more elements).

#### 5.4.1 The `dir` attribute

[](#attrdef-dir)

Note

The `dir` attribute currently does not have sufficient [implementation experience](https://www.w3.org/policies/process/#adequate-implementation), as [reading systems](#dfn-epub-reading-system) typically only support a single default directionality for metadata display.

Although it lacks the necessary reading system support, it is integral to the content model on which EPUB is built (i.e., for internationalization support in the [package document](#dfn-package-document)). Consequently, it is strongly encouraged to set the proper directionality of text values in the package document to ensure proper rendering once this situation improves.

The lessening of requirements for this attribute was only done to account for the different process under which EPUB was developed prior to being brought into W3C. New features developed under W3C processes will not receive a similar exemption.

Specifies the [base direction](https://www.unicode.org/reports/tr9/tr9-52.html#BD5) \[[bidi](#bib-bidi "Unicode Bidirectional Algorithm")\] of the textual content and attribute values of the carrying element and its descendants.

Allowed values are:

- `ltr` — left-to-right base direction;
- `rtl` — right-to-left base direction; and
- `auto` — base direction is determined using the Unicode Bidi Algorithm \[[bidi](#bib-bidi "Unicode Bidirectional Algorithm")\].

Reading systems will assume the value `auto` when the attribute is not present or has an invalid value.

Note

The base direction specified in the `dir` attribute does not affect the ordering of characters within directional runs, only the relative ordering of those runs and the placement of weak directional characters such as punctuation.

[Example 15](#example-setting-the-global-base-direction-for-package-document-text): Setting the global base direction for package document text

``` xml
<package … dir="ltr">
   …
</package>
```

Allowed on: [`collection`](#sec-collection-elem), [Dublin Core elements](#sec-opf-dcmes), [`meta`](#dfn-meta), and [`package`](#dfn-package).

Note

The Working Group advises that [EPUB conformance checkers](#dfn-epub-conformance-checker) alert about the presence of `dir` when encountered in EPUB publications but as its inclusion is not a violation of the standard to not emit an error or warning.

#### 5.4.2 The `href` attribute

[](#attrdef-href)

A [valid URL string](https://url.spec.whatwg.org/#valid-url-string) \[[url](#bib-url "URL Standard")\] that references a resource.

The URL string *MUST NOT* reference resources via elements in the package document (e.g., via a manifest [`item`](#dfn-item) or spine [`itemref`](#dfn-itemref) declaration).

[Example 16](#example-linking-a-metadata-record): Linking a metadata record

``` xml
<package …>
   <metadata …>
      …
      <link
          rel="record"
          href="meta/9780000000001.xml"
          media-type="application/marc"/>
      …
   </metadata>
   …
</package>
```

Allowed on: [`item`](#dfn-item) and [`link`](#dfn-link).

#### 5.4.3 The `id` attribute

[](#attrdef-id)

The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

[Example 17](#example-adding-an-identifier-attribute): Adding an identifier attribute

``` xml
<dc:title id="pub-title">The Lord of the Rings</dc:title>
```

Allowed on: [`collection`](#sec-collection-elem), [Dublin Core elements](#sec-opf-dcmes), [`item`](#dfn-item), [`itemref`](#dfn-itemref), [`link`](#dfn-link), [`manifest`](#dfn-manifest), [`meta`](#dfn-meta), [`package`](#dfn-package), and [`spine`](#dfn-spine).

#### 5.4.4 The `media-type` attribute

[](#attrdef-media-type)

A media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] that specifies the type and format of the referenced resource.

[Example 18](#example-adding-the-media-type-for-a-linked-record): Adding the media type for a linked record

``` xml
<package …>
   <metadata …>
      …
      <link
          rel="record"
          href="http://example.org/meta/12389347?format=onix"
          media-type="application/xml"
          properties="onix"/>
      …
   </metadata>
   …
</package>
```

Allowed on: [`item`](#dfn-item) and [`link`](#dfn-link).

#### 5.4.5 The `properties` attribute

[](#attrdef-properties)

A space-separated list of [compact URLs](#dfn-compact-url).

Refer to each element's definition for the [default vocabulary](#dfn-default-vocabulary) for the attribute.

[Example 19](#example-identifying-the-epub-navigation-document-in-the-manifest): Identifying the EPUB navigation document in the manifest

``` xml
<package …>
   …
   <manifest>
      …
      <item
          id="nav"
          href="nav.xhtml"
          properties="nav"
          media-type="application/xhtml+xml"/>
      …
   </manifest>
   …
</package>
```

Allowed on: [`item`](#dfn-item), [`itemref`](#dfn-itemref), and [`link`](#dfn-link).

#### 5.4.6 The `refines` attribute

[](#attrdef-refines)

Establishes an association between the current expression and the element or resource identified by its value. The value of the attribute *MUST* be a [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string), optionally followed by `U+0023 (#)` and a [URL-fragment string](https://url.spec.whatwg.org/#url-fragment-string) that references the resource or element being described.

[Example 20](#example-specifying-that-a-creator-is-the-illustrator): Specifying that a creator is the illustrator

``` xml
<package …>
   <metadata …>
      …
      <dc:creator id="creator02">
         E.H. Shepard
      </dc:creator>
      <meta
          refines="#creator02"
          property="role"
          scheme="marc:relators">
         ill
      </meta>
      …
   </metadata>
   …
</package>
```

The `refines` attribute is *OPTIONAL* depending on the type of metadata expressed. When omitted, the element defines a [primary expression](#primary-expression).

When creating expressions about a [publication resource](#dfn-publication-resource), the `refines` attribute *SHOULD* specify a fragment identifier that references the [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the resource's [manifest entry](#sec-item-elem).

Refinement chains *MUST NOT* contain circular references or self-references.

[Example 21](#example-setting-the-duration-of-a-media-overlay-document): Setting the duration of a media overlay document

``` xml
<package …>
   <metadata …>
      …
      <meta
          property="media:duration"
          refines="#c01_overlay">
         0:32:29
      </meta>
      …
   </metadata>
   <manifest>
      …
      <item
          id="c01_overlay"
          href="overlays/chapter01.smil"
          media-type="application/smil+xml"/>
      …
   </manifest>
   …
</package>
```

Allowed on: [`link`](#dfn-link) and [`meta`](#dfn-meta).

#### 5.4.7 The `xml:lang` attribute

[](#attrdef-xml-lang)

Specifies the language of the textual content and attribute values of the carrying element and its descendants, as defined in section [2.12 Language Identification](https://www.w3.org/TR/xml/#sec-lang-tag) of \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\]. The value of each `xml:lang` attribute *MUST* be a [well-formed language tag](https://www.rfc-editor.org/info/bcp47#section-2.2.9) \[[bcp47](#bib-bcp47 "Tags for Identifying Languages")\].

[Example 22](#example-setting-the-global-language-for-package-document-text): Setting the global language for package document text

``` xml
<package … xml:lang="ja">
   …
</package>
```

Allowed on: [`collection`](#sec-collection-elem), [Dublin Core elements](#sec-opf-dcmes), [`meta`](#dfn-meta), and [`package`](#dfn-package).

### 5.5 The `package` element

[](#sec-package-elem)

The `package` element encapsulates all the information expressed in the [package document](#dfn-package-document).

Element Name:  
`package`

Usage:  
*REQUIRED* [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the package document.

Attributes:  
- [`dir`](#attrdef-dir) `[optional]`

- [`id`](#attrdef-id) `[optional]`

- [`prefix`](#attrdef-package-prefix) `[optional]`

- [`xml:lang`](#attrdef-xml-lang) `[optional]`

- [`unique-identifier`](#attrdef-package-unique-identifier) `[required]`

- [`version`](#attrdef-package-version) `[required]`

Content Model:  
In this order:

- [`metadata`](#dfn-metadata) `[exactly 1]`

- [`manifest`](#dfn-manifest) `[exactly 1]`

- [`spine`](#dfn-spine) `[exactly 1]`

- [`guide`](#sec-opf2-guide) `[0 or 1]` ([outdated](#outdated))

- [`collection`](#sec-collection-elem) `[0 or more]` ([outdated](#outdated))

The `version` attribute specifies the EPUB specification version to which the given [EPUB publication](#dfn-epub-publication) conforms. The attribute *MUST* have the value "`3.0`" to indicate conformance with EPUB 3.

Note

Updates to this specification do not represent new versions of EPUB 3 (i.e., each new 3.X specification is a continuation of the EPUB 3 format). The Working Group is committed to minimizing any changes that would invalidate existing content, allowing the `version` attribute value to remain unchanged.

The `unique-identifier` attribute takes an IDREF \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] that identifies the [`dc:identifier`](#dfn-dc-identifier) element that provides the preferred, or primary, identifier.

The `prefix` attribute provides a declaration mechanism for prefixes not [reserved by this specification](#sec-metadata-reserved-prefixes). Refer to [5.3.4 The `prefix` attribute](#sec-prefix-attr) for more information.

### 5.6 Metadata section

[](#sec-pkg-metadata)

#### 5.6.1 The `metadata` element

[](#sec-metadata-elem)

The `metadata` element encapsulates meta information.

Element Name:  
`metadata`

Usage:  
*REQUIRED* first child of [`package`](#dfn-package).

Attributes:  
None

Content Model:  
In any order:

- [`dc:identifier`](#dfn-dc-identifier) `[1 or more]`

- [`dc:title`](#dfn-dc-title) `[1 or more]`

- [`dc:language`](#dfn-dc-language) `[1 or more]`

- [`Dublin Core Optional Elements`](#sec-opf-dcmes-optional) `[0 or more]`

- [`meta`](#dfn-meta) `[1 or more]`

- [OPF2 `meta`](#sec-opf2-meta) `[0 or more]` ([outdated](#outdated))

- [`link`](#dfn-link) `[0 or more]`

The [package document](#dfn-package-document) `metadata` element has two primary functions:

1.  to provide a minimal set of meta information for [reading systems](#dfn-epub-reading-system) to use to internally catalogue an [EPUB publication](#dfn-epub-publication) and make it available to a user (e.g., to present in a bookshelf).

2.  to provide access to all rendering metadata needed to control the layout and display of the content (e.g., [package rendering properties](#app-rendering-vocab)).

The package document does not provide complex metadata encoding capabilities. If more detailed information needs to be provided, metadata records (e.g., that conform to an international standard such as \[[onix](#bib-onix "ONIX for Books 3.0")\] or are created for custom purposes) can be associated with the EPUB publication using the [`link`](#dfn-link) element. This approach allows reading systems to process the metadata in its native form, avoiding the potential problems and information loss caused by translating to use the minimal package document structure.

In keeping with this philosophy, the package document only has the following minimal metadata requirements: it *MUST* contain the \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] [`dc:title`](#dfn-dc-title), [`dc:identifier`](#dfn-dc-identifier), and [`dc:language`](#dfn-dc-language) elements together with the \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] [`dcterms:modified`](#dfn-dcterms-modified) property. All other metadata is *OPTIONAL*.

[Example 23](#example-the-minimal-set-of-metadata-necessary-in-the-package-document): The minimal set of metadata necessary in the package document

``` xml
<package … unique-identifier="pub-id">
    …
    <metadata …>
       <dc:identifier
           id="pub-id">
          urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809
       </dc:identifier>
       <dc:title>
          Norwegian Wood
       </dc:title>
       <dc:language>
          en
       </dc:language>
       <meta
           property="dcterms:modified">
          2011-01-01T12:00:00Z
       </meta>
    </metadata>
    …
</package>
```

The [`meta`](#dfn-meta) element provides a generic mechanism for including [metadata properties from any vocabulary](#sec-vocab-assoc). Although this mechanism can be used for any metadata purposes, it is typically used to include rendering and accessibility metadata defined in EPUB specifications.

Note

See \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] for accessibility metadata recommendations.

#### 5.6.2 Metadata values

[](#sec-metadata-values)

The Dublin Core elements \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] and [`meta`](#dfn-meta) element have mandatory [child text content](https://dom.spec.whatwg.org/#concept-child-text-content) \[[dom](#bib-dom "DOM Standard")\]. In the descriptions for these elements, this specification refers to this content as the element's value.

These elements *MUST* have non-empty values after [leading and trailing ASCII whitespace](https://infra.spec.whatwg.org/#strip-leading-and-trailing-ascii-whitespace) \[[infra](#bib-infra "Infra Standard")\] is stripped (i.e., they have to consist of at least one non-whitespace character).

Whitespace within these element values is not significant. Sequences of one or more whitespace characters are [collapsed to a single space](https://infra.spec.whatwg.org/#strip-and-collapse-ascii-whitespace) \[[infra](#bib-infra "Infra Standard")\] during processing .

#### 5.6.3 Dublin Core

[](#sec-opf-dcmes-hd)

##### 5.6.3.1 Required elements

[](#sec-opf-dcmes-required-hd)

###### 5.6.3.1.1 The `dc:identifier` element

[](#sec-opf-dcidentifier)

The `dc:identifier` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] contains an identifier such as a UUID, DOI or ISBN.

Element Name:  
`dc:identifier`

Namespace:  
`http://purl.org/dc/elements/1.1/`

Usage:  
*REQUIRED* child of [`metadata`](#dfn-metadata). Repeatable.

Attributes:  
- [`id`](#attrdef-id) `[conditionally required]`

Content Model:  
Text

An [EPUB publication](#dfn-epub-publication) *MUST* include a `dc:identifier` element that specifies an identifier that is unique to itself — its [unique identifier](#dfn-unique-identifier). This element *MUST* be referenced from the [`package`](#dfn-package) element's [`unique-identifier` attribute](#attrdef-package-unique-identifier).

[Example 24](#example-specifying-the-element-with-the-unique-identifier): Specifying the element with the unique identifier

``` xml
<package … unique-identifier="pub-id">
    <metadata …>
       <dc:identifier id="pub-id">
           urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809
       </dc:identifier>
       …
    </metadata>
</package>
```

Although not static, avoid changing the unique identifier too often. Unique Identifiers are intended to have maximal persistence both for referencing and distribution purposes. Do not issue new identifiers when making minor revisions such as updating metadata, fixing errata, or making similar minor changes.

Additional identifiers *MAY* be specified.

Note

It is advised to use [absolute-URL strings](https://url.spec.whatwg.org/#absolute-url-string) \[[url](#bib-url "URL Standard")\] for identifiers whenever possible. The inclusion of a domain can improve the uniqueness of the identifier, for example, while the use of a URN with a [namespace identifier](https://datatracker.ietf.org/doc/html/rfc8141#section-2.1) \[[rfc8141](#bib-rfc8141 "Uniform Resource Names (URNs)")\] improves processing by reading systems.

The [`identifier-type` property](#identifier-type) *MAY* be used to indicate that the value of a `dc:identifier` element conforms to an established system or an issuing authority granted it.

[Example 25](#example-specifying-the-type-of-the-identifier): Specifying the type of the identifier

In this example, the `identifier-type` property is used with the [ONIX codelist 5](https://ns.editeur.org/onix/en/5) scheme to indicate the product identifier type is a [DOI](https://www.doi.org) (i.e., the value `06` in codelist 5 is for DOIs).

``` xml
<metadata …>
   <dc:identifier
       id="pub-id">
      urn:doi:10.1016/j.iheduc.2008.03.001
   </dc:identifier>
   <meta
       refines="#pub-id"
       property="identifier-type"
       scheme="onix:codelist5">
      06
   </meta>
   …
</metadata>
```

###### 5.6.3.1.2 The `dc:title` element

[](#sec-opf-dctitle)

The `dc:title` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] represents an instance of a name for the [EPUB publication](#dfn-epub-publication).

Element Name:  
`dc:title`

Namespace:  
`http://purl.org/dc/elements/1.1/`

Usage:  
*REQUIRED* child of [`metadata`](#dfn-metadata). Repeatable.

Attributes:  
- [`dir`](#attrdef-dir) `[optional]`

- [`id`](#attrdef-id) `[optional]`

- [`xml:lang`](#attrdef-xml-lang) `[optional]`

Content Model:  
Text

The first `dc:title` element in document order is the main title of the EPUB publication (i.e., the primary one reading systems present to users).

[Example 26](#example-a-basic-title-element): A basic title element

``` xml
<metadata …>
   <dc:title>
      Norwegian Wood
   </dc:title>
   …
</metadata>
```

It is advised to use only a single `dc:title` element to ensure consistent rendering of the title in [reading systems](#dfn-epub-reading-system).

Note

Although it is possible to include more than one `dc:title` element for multipart titles, reading system support for additional `dc:title` elements is inconsistent. Reading systems might ignore the additional segments or combine them in unexpected ways.

For example, the following example shows a basic multipart title:

``` xml
<metadata …>
   <dc:title>
      THE LORD OF THE RINGS
   </dc:title>
   <dc:title>
      Part One: The Fellowship of the Ring
   </dc:title>
   …
</metadata>
```

The same title could instead be expressed using a single `dc:title` element as follows:

``` xml
<metadata …>
   <dc:title>
       THE LORD OF THE RINGS, Part One:
       The Fellowship of the Ring
   </dc:title>
   …
</metadata>
```

Previous versions of this specification advised using the [`title-type`](#sec-title-type) and [`display-seq`](#sec-display-seq) properties to identify and format the segments of multipart titles (see the [Great Cookbooks example](#cookbook-ex)). It is still possible to add these semantics, but they are also not well supported.

###### 5.6.3.1.3 The `dc:language` element

[](#sec-opf-dclanguage)

The `dc:language` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] specifies the language of the content of the [EPUB publication](#dfn-epub-publication).

Element Name:  
`dc:language`

Namespace:  
`http://purl.org/dc/elements/1.1/`

Usage:  
*REQUIRED* child of [`metadata`](#dfn-metadata). Repeatable.

Attributes:  
[`id`](#attrdef-id) `[optional]`

Content Model:  
Text

The [value](#dfn-value) of each `dc:language` element *MUST* be a [well-formed language tag](https://www.rfc-editor.org/info/bcp47#section-2.2.9) \[[bcp47](#bib-bcp47 "Tags for Identifying Languages")\].

[Example 27](#example-specifying-u-s-english-as-the-language-of-the-epub-publication): Specifying U.S. English as the language of the EPUB publication

``` xml
<metadata …>
   …
   <dc:language>
      en-US
   </dc:language>
   …
</metadata>
```

Although additional `dc:language` elements *MAY* be specified for multilingual [EPUB publications](#dfn-epub-publication), [reading systems](#dfn-epub-reading-system) will treat the first `dc:language` element in document order as the primary language.

Note

[Publication resources](#dfn-publication-resource) do not inherit their language from `dc:language` element(s). The language of each resource has to be set using the intrinsic methods of the format.

##### 5.6.3.2 Optional elements

[](#sec-opf-dcmes-optional-hd)

###### 5.6.3.2.1 General definition

[](#sec-opf-dcmes-optional-def)

All \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] elements except for [`dc:identifier`](#dfn-dc-identifier), [`dc:language`](#dfn-dc-language), and [`dc:title`](#dfn-dc-title) are designated as *OPTIONAL*. These elements conform to the following generalized definition:

Element Name:  
`dc:contributor` \| `dc:coverage` \| `dc:creator` \| `dc:date` \| `dc:description` \| `dc:format` \| `dc:publisher` \| `dc:relation` \| `dc:rights` \| `dc:source` \| `dc:subject` \| `dc:type`

Namespace:  
`http://purl.org/dc/elements/1.1/`

Usage:  
*OPTIONAL* child of [`metadata`](#dfn-metadata). Repeatable.

Attributes:  
- [`dir`](#attrdef-dir) `[optional]`

- [`id`](#attrdef-id) `[optional]`

- [`xml:lang`](#attrdef-xml-lang) `[optional]`

Content Model:  
Text

This specification does not modify the \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] element definitions except as noted in the following sections.

###### 5.6.3.2.2 The `dc:contributor` element

[](#sec-opf-dccontributor)

The `dc:contributor` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] is used to represent the name of a person, organization, etc. that played a secondary role in the creation of the content.

The requirements for the `dc:contributor` element are identical to those for the [`dc:creator`](#dfn-dc-creator) element in all other respects.

###### 5.6.3.2.3 The `dc:creator` element

[](#sec-opf-dccreator)

The `dc:creator` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] represents the name of a person, organization, etc. responsible for the creation of the content. A [`role` property](#role) *MAY* be [associated](#subexpression) with the element to indicate the function the creator played.

[Example 28](#example-specifying-that-a-creator-is-an-author): Specifying that a creator is an author

In this example, the [MARC relators](https://id.loc.gov/vocabulary/relators.html) scheme is used to indicate the role (i.e., the value `aut` indicates an author in MARC).

``` xml
<metadata …>
   …
   <dc:creator
       id="creator">
      Haruki Murakami
   </dc:creator>
   <meta
       refines="#creator"
       property="role"
       scheme="marc:relators"
       id="role">
      aut
   </meta>
   …
</metadata>
```

It is advised that the `dc:creator` element contain the name of the creator as [reading systems](#dfn-epub-reading-system) are expected to display it to users.

The [`file-as` property](#file-as) *MAY* be used [to associate](#subexpression) a normalized form of the creator's name, and the [`alternate-script` property](#alternate-script) to represent the creator's name in another language or script.

[Example 29](#example-expressing-sorting-and-rendering-information-for-a-creator): Expressing sorting and rendering information for a creator

``` xml
<metadata …>
   …
   <dc:creator
       id="creator">
      Haruki Murakami
   </dc:creator>
   <meta
       refines="#creator"
       property="alternate-script"
       xml:lang="ja">
      村上 春樹
   </meta>
   <meta
       refines="#creator"
       property="file-as">
      Murakami, Haruki
   </meta>
   …
</metadata>
```

If an [EPUB publication](#dfn-epub-publication) has more than one creator, specify each in a separate `dc:creator` element.

The document order of `dc:creator` elements in the `metadata` section determines the display priority, where the first `dc:creator` element encountered is the primary creator.

[Example 30](#example-expressing-the-primary-creator): Expressing the primary creator

In this example, Lewis Carroll is the primary creator because he is listed first.

``` xml
<metadata …>
   …
   <dc:creator
       id="creator01">
      Lewis Carroll
   </dc:creator>
   <dc:creator
       id="creator02">
      John Tenniel
   </dc:creator>
   …
</metadata>
```

Secondary contributors are represented using the [`dc:contributor`](#dfn-dc-contributor) element.

###### 5.6.3.2.4 The `dc:date` element

[](#sec-opf-dcdate)

The `dc:date` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] defines the publication date of the [EPUB publication](#dfn-epub-publication). The publication date is not the same as the [last modified date](#last-modified-date) (the last time the EPUB publication was changed).

It is *RECOMMENDED* that the date string conform to \[[iso8601-1](#bib-iso8601-1 "Date and time — Representations for information interchange — Part 1: Basic rules. ISO 8601-1:2019.")\], particularly the subset expressed in W3C Date and Time Formats \[[datetime](#bib-datetime "Date and Time Formats")\], as such strings are both human and machine readable.

[Example 31](#example-expressing-the-publication-date): Expressing the publication date

``` xml
<metadata …>
   …
   <dc:date>
      2000-01-01T00:00:00Z
   </dc:date>
   …
</metadata>
```

Additional dates can be expressed using the specialized date properties available in the \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] vocabulary, or similar.

EPUB publications *MUST NOT* contain more than one `dc:date` element.

###### 5.6.3.2.5 The `dc:subject` element

[](#sec-opf-dcsubject)

The `dc:subject` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] identifies the subject of the [EPUB publication](#dfn-epub-publication). It is advised to set the [value](#dfn-value) of the element to the human-readable heading or label, but a code value can be used if the subject taxonomy does not provide a separate descriptive label.

The system or scheme the element's [value](#dfn-value) is drawn from can be identified using the [`authority` property](#authority).

When a scheme is identified, a subject code *MUST* be [associated](#subexpression) with the element using the [`term` property](#term).

[Example 32](#example-specifying-a-bisac-code-and-heading): Specifying a BISAC code and heading

``` xml
<metadata …>
   <dc:subject id="subject01">
      FICTION / Occult &amp; Supernatural
   </dc:subject>
   <meta
       refines="#subject01"
       property="authority">
      BISAC
   </meta>
   <meta
       refines="#subject01"
       property="term">
      FIC024000
   </meta>
</metadata>
```

[Example 33](#example-specifying-a-url-for-the-scheme): Specifying a URL for the scheme

``` xml
<metadata …>
   <dc:subject id="sbj01">
      Number Theory
   </dc:subject>
   <meta
       refines="#sbj01"
       property="authority">
      http://www.ams.org/msc/msc2010.html
   </meta>
   <meta
      refines="#sbj01"
      property="term">
     11
  </meta>
</metadata>
```

The `term` property *MUST NOT* be [associated with a `dc:subject` element](#subexpression) that does not specify a scheme.

The [values](#dfn-value) of the `dc:subject` element and `term` property are case sensitive only when the designated scheme requires.

###### 5.6.3.2.6 The `dc:type` element

[](#sec-opf-dctype)

The `dc:type` element \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] is used to indicate that the [EPUB publication](#dfn-epub-publication) is of a specialized type (e.g., annotations or a dictionary packaged in EPUB format).

The element's [value](#dfn-value) *MAY* be any text string.

Note

The former IDPF EPUB 3 Working Group maintained a [non-normative registry of specialized EPUB publication types](http://idpf.org/epub/vocab/package/types/) for use with this element. This Working Group no longer maintains the registry and does not anticipate developing new specialized publication types.

#### 5.6.4 The `meta` element

[](#sec-meta-elem)

The `meta` element provides a generic means of including package metadata.

Element Name:  
`meta`

Usage:  
As child of the [`metadata`](#dfn-metadata) element. Repeatable.

Attributes:  
- [`dir`](#attrdef-dir) `[optional]`

- [`id`](#attrdef-id) `[optional]`

- [`property`](#attrdef-meta-property) `[required]`

- [`refines`](#attrdef-refines) `[optional]`

- [`scheme`](#attrdef-scheme) `[optional]`

- [`xml:lang`](#attrdef-xml-lang) `[optional]`

Content Model:  
Text

Each `meta` element defines a metadata expression. The `property` attribute takes a [compact URL](#dfn-compact-url) that defines the statement made in the expression, and the text content of the element represents the assertion. (Refer to [5.3 Vocabulary association mechanisms](#sec-vocab-assoc) for more information.)

This specification defines two types of metadata expressions that can be defined using the `meta` element:

- A *primary expression* is one in which the expression defined in the `meta` element establishes some aspect of the [EPUB publication](#dfn-epub-publication). A `meta` element that omits a refines attribute defines a primary expression.
- A *subexpression* is one in which the expression defined in the `meta` element is associated with another expression or resource using the `refines` attribute to enhance its meaning. A subexpression might refine a media clip, for example, by expressing its duration, or refine a creator or contributor expression by defining the role of the person.

Subexpressions *MAY* be used to refine the meaning of other subexpressions, thereby creating chains of information.

Note

All the \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] elements represent primary expressions, and permit refinement by meta element subexpressions.

The [Meta Properties Vocabulary](#app-meta-property-vocab) is the [default vocabulary](#dfn-default-vocabulary) for use with the `property` attribute.

Terms from other vocabularies *MAY* be added as defined in [5.3 Vocabulary association mechanisms](#sec-vocab-assoc).

[Example 34](#example-using-properties-with-reserved-prefixes): Using properties with reserved prefixes

For the full list of reserved prefixes, refer to [5.3.5 Reserved prefixes](#sec-reserved-prefixes).

``` xml
<metadata …>
   …
   <meta
       property="dcterms:modified">
      2016-02-29T12:34:56Z
   </meta>
   <meta
       property="rendition:layout">
      pre-paginated
   </meta>
   <meta
       property="media:active-class">
      my-active-item
   </meta>
   …
</metadata>
```

The `scheme` attribute identifies the system or scheme the element's [value](#dfn-value) was obtained from. The value of the attribute *MUST* be a [compact URL](#dfn-compact-url) that resolves to the resource that defines the scheme. The `scheme` attribute does not have a [default vocabulary](#dfn-default-vocabulary) (i.e., all values require a [prefix](#compact-url.ebnf.prefix)).

[Example 35](#example-using-values-from-a-scheme): Using values from a scheme

In this example, the `scheme` attribute indicates that the [value](#dfn-value) of the tag is from \[[onix](#bib-onix "ONIX for Books 3.0")\] code list 5 (i.e., the value `15` indicates a 13 digit ISBN).

``` xml
<metadata …>
   …
   <meta
       refines="#isbn-id"
       property="identifier-type"
       scheme="onix:codelist5">
      15
   </meta>
   …
</metadata>
```

#### 5.6.5 Last modified date

[](#sec-metadata-last-modified)

The `metadata` section *MUST* contain exactly one `dcterms:modified` property \[[dcterms](#bib-dcterms "DCMI Metadata Terms")\] containing the last modification date. The [value](#dfn-value) of this property *MUST* be an \[[iso8601-1](#bib-iso8601-1 "Date and time — Representations for information interchange — Part 1: Basic rules. ISO 8601-1:2019.")\] complete representation of a date and time of day matching the extended format:

```
YYYY-MM-DDThh:mm:ssZ
```

Note

The "Z" (Zulu) time indicator at the end of the pattern means the last modification date is always expressed in Coordinated Universal Time (UTC).

[Example 36](#example-expressing-a-last-modification-date): Expressing a last modification date

``` xml
<metadata …>
   …
   <meta
       property="dcterms:modified">
      2016-01-01T00:00:01Z
   </meta>
   …
</metadata>
```

It is advised to update the last modified date whenever changes are made to the [EPUB publication](#dfn-epub-publication).

Additional `dcterms:modified` properties *MAY* be specified in the [package document](#dfn-package-document) metadata, but they *MUST* have a different subject (i.e., they require a `refines` attribute that references an element or resource).

Note

The requirements for the last modification date are to ensure compatibility with earlier versions of EPUB 3 that defined a [release identifier](https://www.w3.org/publishing/epub32/epub-packages.html#sec-metadata-elem-identifiers-pid) \[[epubpackages-32](#bib-epubpackages-32 "EPUB Packages 3.2")\] for EPUB publications.

#### 5.6.6 The `link` element

[](#sec-link-elem)

The `link` element associates resources with an [EPUB publication](#dfn-epub-publication), such as metadata records.

Element Name:  
`link`

Usage:  
As a child of [`metadata`](#dfn-metadata). Repeatable.

Attributes:  
- [`href`](#attrdef-href) `[required]`

- [`hreflang`](#attrdef-hreflang) `[optional]`

- [`id`](#attrdef-id) `[optional]`

- [`media-type`](#attrdef-link-media-type) `[conditionally required]`

- [`properties`](#attrdef-properties) `[optional]`

- [`refines`](#attrdef-refines) `[optional]`

- [`rel`](#attrdef-link-rel) `[required]`

Content Model:  
Empty

The [`metadata`](#dfn-metadata) element *MAY* contain zero or more `link` elements, each of which identifies the location of a [publication resource](#dfn-publication-resource) or a [linked resource](#dfn-linked-resource) in its *REQUIRED* `href` attribute.

Resources referenced from the `link` element are [publication resources](#dfn-publication-resource) only when they are:

- referenced from the [spine](#dfn-epub-spine); or

- included or embedded in an [EPUB content document](#dfn-epub-content-document) (e.g., a metadata record serialized as RDFa \[[rdfa-core](#bib-rdfa-core "RDFa Core 1.1 - Third Edition")\] or as JSON-LD \[[json-ld11](#bib-json-ld11 "JSON-LD 1.1")\] embedded in an \[[html](#bib-html "HTML Standard")\] [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) element).

In all other cases (e.g., when linking to standalone \[[onix](#bib-onix "ONIX for Books 3.0")\] records), the resources referenced are not [publication resources](#dfn-publication-resource) (i.e., are not subject to [core media type requirements](#sec-core-media-types)) and *MUST NOT* be listed in the [manifest](#sec-manifest-elem).

[Example 37](#example-reference-to-a-record-embedded-in-an-xhtml-content-document): Reference to a record embedded in an XHTML content document

In this example, the metadata record is embedded in a `script` element. Note that the media type of the embedded record (i.e., `application/ld+json`) is obtained from the `type` attribute on the `script` element; it is not specified in the `link` element.

``` javascript
Package document:

<package …>
   <metadata …>
      …
      <link rel="record"
          href="front.xhtml#meta-json"
          media-type="application/xhtml+xml"
          hreflang="en"/>
      …
   </metadata>
   …
</package>

XHTML:

<html …>
   <head>
      …
      <script id="meta-json" type="application/ld+json">
          "@context" : "http://schema.org",
          "name" : "…",
         …
      </script>
      …
   </head>
   <body>
      …
   </body>
</html>
```

Although linked resources *MAY* be located outside the [EPUB container](#dfn-epub-container), [reading systems](#dfn-epub-reading-system) do not have to retrieve [remote resources](#dfn-remote-resource). It is advised to consider what impact this might have on the user's reading experience before hosting them remotely.

The [`media-type` attribute](#attrdef-media-type) *MUST* be specified for all linked resources within the EPUB container. It is *OPTIONAL* for linked resources located outside the EPUB container as more than one media type could be served from the same URL \[[url](#bib-url "URL Standard")\].

The *OPTIONAL* `hreflang` attribute identifies the language of the linked resource. The value *MUST* be a [well-formed language tag](https://www.rfc-editor.org/info/bcp47#section-2.2.9) \[[bcp47](#bib-bcp47 "Tags for Identifying Languages")\].

The *REQUIRED* `rel` attribute takes a space-separated list of [compact URLs](#dfn-compact-url) that establish the relationship the linked resource has with the EPUB publication.

[Example 38](#example-linking-to-a-marc-xml-record): Linking to a MARC XML record

``` abnf
<metadata …>
   …
   <link
       rel="record"
       href="meta/9780000000001.xml"
       media-type="application/marc"/>
   …
</metadata>
```

The value of the `media-type` attribute is not always sufficient to identify the type of linked resource (e.g., many XML-based record formats use the media type "`application/xml`"). To aid reading systems in the identification of such generic resources, a semantic identifier *MAY* be specified in the `properties` attribute.

[Example 39](#example-identifying-a-record-type-via-a-property): Identifying a record type via a property

In this example, the `properties` attribute identifies the link is to an ONIX record.

``` abnf
<metadata …>
   …
   <link rel="record"
       href="http://example.org/meta/12389347?format=onix"
       media-type="application/xml"
       properties="onix"/>
   …
</metadata>
```

The [Metadata Link Vocabulary](#app-link-vocab) is the [default vocabulary](#dfn-default-vocabulary) for the `rel` and `properties` attributes.

Relationships and properties from other vocabularies *MAY* be added as defined in [5.3 Vocabulary association mechanisms](#sec-vocab-assoc).

[Example 40](#example-declaring-a-new-link-relationship): Declaring a new link relationship

In this example, the `link` element is used to associate an author's home page using the FOAF vocabulary. Note that as `foaf` is not a [reserved prefix](#sec-metadata-reserved-prefixes), it has to be declared in the [prefix attribute](#attrdef-package-prefix).

``` xml
<package
    …
    prefix="foaf: http://xmlns.com/foaf/spec/">
   <metadata …>
      …
      <link
          refines="#creator01"
          rel="foaf:homepage"
          href="http://example.org/book-info/12389347" />
      …
   </metadata>
   …
</package>
```

One or more [linked metadata records](#record) *MAY* be provided.

[Example 41](#example-specifying-linked-records): Specifying linked records

In this example, an ONIX record is hosted remotely while a JSON-LD record is included in the EPUB container.

``` abnf
<metadata …>
   <link rel="record"
       href="http://example.org/onix/12389347"
       media-type="application/xml"
       properties="onix" />

   <link rel="record"
       href="meta/meta.jsonld"
       media-type="application/ld+json" />
    …
</metadata>
```

Note

Due to the variety of metadata record formats and serializations that can be linked to an EPUB publication, and the complexity of comparing metadata properties between them, this specification does not require reading systems to process linked records.

In addition to full records, the `link` element *MAY* be used to identify individual metadata properties available in an alternative format.

[Example 42](#example-link-to-a-description): Link to a description

In this example, the description of the EPUB publication is contained in an HTML document.

``` abnf
<metadata …>
   …
   <link
       rel="dcterms:description"
       href="description.html"
       media-type="text/html"/>
   …
</metadata>
```

### 5.7 Manifest section

[](#sec-pkg-manifest)

#### 5.7.1 The `manifest` element

[](#sec-manifest-elem)

The `manifest` element provides an exhaustive list of [publication resources](#dfn-publication-resource) used in the rendering of the content.

Element Name:  
`manifest`

Usage:  
*REQUIRED* second child of [`package`](#dfn-package), following [`metadata`](#dfn-metadata).

Attributes:  
[`id`](#attrdef-id) `[optional]`

Content Model:  
[`item`](#dfn-item) `[1 or more]`

With the exception of the [package document](#dfn-package-document), the `manifest` *MUST* list all publication resources regardless of whether they are [container resources](#dfn-container-resource) or [remote resources](#dfn-remote-resource).

As the package document is already identified by the [`container.xml` file](#sec-container-metainf-container.xml), the `manifest` *MUST NOT* specify an `item` element for it (i.e., a self-reference serves no purpose).

Note

The manifest is only for listing publication resources. [Linked resources](#dfn-linked-resource) and [the special files for processing the OCF Container](#sec-container-file-and-dir-structure) (i.e., files in the `META-INF` directory, and the `mimetype` file) are restricted from inclusion.

Failure to provide a complete manifest of publication resources can lead to rendering issues. [Reading systems](#dfn-epub-reading-system) might not unzip such resources or could prevent access to them for security reasons.

#### 5.7.2 The `item` element

[](#sec-item-elem)

The `item` element represents a [publication resource](#dfn-publication-resource).

Element Name:  
`item`

Usage:  
As a child of [`manifest`](#dfn-manifest). Repeatable.

Attributes:  
- [`fallback`](#attrdef-item-fallback) `[conditionally required]`

- [`href`](#attrdef-item-href) `[required]`

- [`id`](#attrdef-id) `[required]`

- [`media-overlay`](#attrdef-item-media-overlay) `[optional]`

- [`media-type`](#attrdef-item-media-type) `[required]`

- [`properties`](#sec-item-resource-properties) `[optional]`

Content Model:  
Empty

Each `item` element identifies a publication resource by the URL \[[url](#bib-url "URL Standard")\] in its [`href` attribute](#attrdef-href). The value *MUST* be an [absolute-](https://url.spec.whatwg.org/#absolute-url-string) or [path-relative-scheme-less-URL](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string) string \[[url](#bib-url "URL Standard")\]. Each URL *MUST* be unique within the `manifest` scope after [parsing](#sec-parse-package-urls).

The publication resource identified by an `item` element *MUST* conform to the applicable specification(s) as inferred from the MIME media type \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] provided in the [`media-type` attribute](#attrdef-media-type). For [core media type resources](#dfn-core-media-type-resource), the media type designated in [3.2 Core media types](#sec-core-media-types) *MUST* be used.

The `fallback` attribute specifies the fallback for the referenced publication resource. The `fallback` attribute's [IDREF](https://www.w3.org/TR/xml/#idref) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] value *MUST* resolve to another `item` in the `manifest`.

The fallback for one `item` *MAY* specify a fallback to another `item`, and so on, creating a chain of fallback options. Refer to [3.5.1 Manifest fallbacks](#sec-manifest-fallbacks) for additional requirements related to the use of fallback chains.

The `media-overlay` attribute takes an IDREF \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] that identifies the [media overlay document](#dfn-media-overlay-document) for the resource described by this `item`. Refer to [9.3.3.5 Media overlays packaging](#sec-docs-package) for more information.

Note

The order of `item` elements in the `manifest` is not significant. The [`spine`](#dfn-spine) element provides the presentation sequence of content documents.

##### 5.7.2.1 Resource properties

[](#sec-item-resource-properties)

The [`properties` attribute](#attrdef-properties) provides information to [reading systems](#dfn-epub-reading-system) about the content of a resource. This information enables discovery of key resources, such as the cover image and [EPUB navigation document](#dfn-epub-navigation-document). It also allows reading systems to optimize rendering by indicating, for example, whether the resource contains embedded scripting, MathML, or SVG.

The [Manifest Properties Vocabulary](#app-item-properties-vocab) is the [default vocabulary](#dfn-default-vocabulary) for the `properties` attribute.

The following properties *MUST* be set whenever a resource referenced by an `item` element matches their respective definitions:

- [mathml](#sec-mathml)
- [remote-resources](#sec-remote-resources)
- [scripted](#sec-scripted)
- [svg](#sec-svg)
- [switch](#sec-switch)

[Example 43](#example-item-properties-scripted-mathml): Identifying a scripted content document with embedded MathML

```
<item
    properties="scripted mathml"
    id="c2"
    href="c2.xhtml"
    media-type="application/xhtml+xml" />
```

These properties do not apply recursively to content included into a resource (e.g., via the \[[html](#bib-html "HTML Standard")\] [`iframe`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) element). For example, if a non-scripted [XHTML content document](#dfn-xhtml-content-document) embeds a [scripted content document](#dfn-scripted-content-document), only the embedded document's manifest `item` `properties` attribute will have the `scripted` value.

Exactly one `item` *MUST* be declared as the EPUB navigation document using the [`nav` property](#sec-nav-prop).

[Example 44](#example-item-properties-nav): Identifying the EPUB navigation document

```
<item
    properties="nav"
    id="c1"
    href="c1.xhtml"
    media-type="application/xhtml+xml" />
```

If an EPUB publication contains a cover image, it is advised to set the *OPTIONAL* [`cover-image` property](#sec-cover-image).

[Example 45](#example-item-properties-cover-image): Identifying the cover image

```
<item
    properties="cover-image"
    id="ci"
    href="cover.svg"
    media-type="image/svg+xml" />
```

Terms from other vocabularies *MAY* be added as defined in [5.3 Vocabulary association mechanisms](#sec-vocab-assoc).

##### 5.7.2.2 Examples

[](#sec-item-elem-examples)

[Example 46](#example-manifest-cmt): A manifest with only core media type resources

``` abnf
<package …>
   …
   <manifest>
      <item
          id="nav"
          href="nav.xhtml"
          properties="nav"
          media-type="application/xhtml+xml"/>
      <item
          id="intro"
          href="intro.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="c1"
          href="chap1.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="c1-answerkey"
          href="chap1-answerkey.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="c2"
          href="chap2.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="c2-answerkey"
          href="chap2-answerkey.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="c3"
          href="chap3.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="c3-answerkey"
          href="chap3-answerkey.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="notes"
          href="notes.xhtml"
          media-type="application/xhtml+xml"/>
      <item
          id="cover"
          href="./images/cover.svg"
          properties="cover-image"
          media-type="image/svg+xml"/>
      <item
          id="f1"
          href="./images/fig1.jpg"
          media-type="image/jpeg"/>
      <item
          id="f2"
          href="./images/fig2.jpg"
          media-type="image/jpeg"/>
      <item
          id="css"
          href="./style/book.css"
          media-type="text/css"/>
   </manifest>
   …
</package>
```

[Example 47](#example-manifest-flbk): Foreign content document in spine with fallback

The following example shows the [manifest fallback chain](#dfn-manifest-fallback-chain) allowing a [foreign content document](#dfn-foreign-content-document) (JPEG) to be listed in the spine with fallback to an SVG content document.

``` xml
<package …>
   …
   <manifest>
      …
      <item
          id="page-001"
          href="images/page-001.jpg"
          media-type="image/jpeg"
          fallback="page-001-svg"/>

      <item
          id="page-001-svg"
          href="images/page-001.svg"
          media-type="image/svg+xml"/>
      …
      …
   </manifest>
   <spine>
      …
      <itemref idref="page-001"/>
      …
   </spine>
</package>
```

[Example 48](#example-embedded-core-media-type-resource-with-link-to-view-as-top-level-content-document): Embedded core media type resource with Link to View as top-level content document

The following example shows a JPEG embedded in an [EPUB content document](#dfn-epub-content-document) (via the `img` tag) with a hyperlink that allows it to open as a separate page (e.g., for easier zooming). Although embedding the image using the `img` tag does not require it to be listed in the [spine](#dfn-epub-spine) or have a fallback, adding the hyperlink causes the document to open as a [top-level content document](#dfn-top-level-content-document). As its use in the spine makes it a [foreign content document](#dfn-foreign-content-document), it includes a fallback to an EPUB content document.

``` javascript
XHTML:
<html …>
   …
   <body>
      …
      <img
          src="images/infographic.jpg"
          alt="…"/>
      <a
          href="images/infographic.jpg">
         Expand Image
      </a>
      …
   </body>
</html>

Package document:
<package …>
   …
   <manifest>
      …
      <item
          id="img01"
          href="images/infographic.jpg"
          media-type="image/jpeg"
          fallback="infographic-svg"/>

      <item
          id="infographic-svg"
          href="images/infographic.svg"
          media-type="image/svg+xml"/>
      …
   </manifest>
   <spine>
      …
      <itemref
          idref="img01"
          properties="layout-pre-paginated"
          linear="no"/>
      …
   </spine>
</package>
```

[Example 49](#example-link-to-view-foreign-resource-as-top-level-content-document): Link to View foreign resource as top-level content document

The following example shows a link to the raw CSV data file. As the data will open in the [reading system](#dfn-epub-reading-system) as a [top-level content document](#dfn-top-level-content-document), it has to be listed in the spine. As its use in the spine makes it a [foreign content document](#dfn-foreign-content-document), it includes a fallback to an [EPUB content document](#dfn-epub-content-document). Because there is no guarantee users will be able to access the data in its raw form, it also provides instructions on how to extract the file from the [EPUB container](#dfn-epub-container).

``` javascript
XHTML:
<html …>
   …
   <body>
      …
      <p>
         <a href="../data/raw.csv">
            [Open the raw CSV data for this project.]
         </a>
      </p>
      <p class="small">To extract the data file
         from this publication, unzip the EPUB file.
         The data is located in the
        <code>/EPUB/data/raw.csv</code> file.
      </p>
      …
   </body>
</html>

Package document:
<package …>
   …
   <manifest>
      …
      <item
          id="data01"
          href="data/raw.csv"
          media-type="text/csv"
          fallback="data-html"/>

      <item
          id="data-html"
          href="xhtml/data-table.html"
          media-type="application/xhtml+xml"/>
      …
   </manifest>
   <spine>
      …
      <itemref
          idref="data01"
          linear="no"/>
      …
   </spine>
</package>
```

[Example 50](#example-remote-resources-that-are-publication-resources): Remote resources that are publication resources

The following example shows a reference to a remote audio file. Because the `audio` element embeds the audio in its [EPUB content document](#dfn-epub-content-document), the file is considered a [publication resource](#dfn-publication-resource). The audio file is therefore listed in the manifest and the entry for its host EPUB content document indicates it contains a [remote resource](#dfn-remote-resource).

``` javascript
XHTML:
<html …>
   …
   <body>
      …
      <audio
          src="http://www.example.com/book/audio/ch01.mp4"
          controls="controls"/>
      …
   </body>
</html>

Package document:
<package …>
   …
   <manifest>
      …
      <item
          id="audio01"
          href="http://www.example.com/book/audio/ch01.mp4"
          media-type="audio/mp4"/>

      <item
          id="c01"
          href="XHTML/chapter001.xhtml"
          media-type="application/xhtml+xml"
          properties="remote-resources"/>
      …
   </manifest>
   …
</package>
```

[Example 51](#example-external-resources-that-are-not-publication-resources): External Resources that are not publication resources

The following example shows a hyperlink to an audio file hosted on the web. [Reading systems](#dfn-epub-reading-system) will open such external content in a new browser window; the audio file is not rendered within the publication. In this case, the file is not listed in the manifest because it is not a [publication resource](#dfn-publication-resource).

``` javascript
XHTML:
<html …>
   …
   <body>
      …
      <a
          href="http://www.example.com/book/audio/ch01.mp4">
         Listen to audio
      </a>
      …
   </body>
</html>

Manifest:
No Entry
```

### 5.8 Spine section

[](#sec-pkg-spine)

#### 5.8.1 The `spine` element

[](#sec-spine-elem)

The `spine` element defines an ordered list of [manifest `item` references](#sec-itemref-elem) that represent the default reading order.

Element Name:  
`spine`

Usage:  
*REQUIRED* third child of [`package`](#dfn-package), following [`manifest`](#dfn-manifest).

Attributes:  
- [`id`](#attrdef-id) `[optional]`

- [`page-progression-direction`](#attrdef-spine-page-progression-direction) `[optional]`

- [`toc`](#sec-opf2-ncx) `[optional]` ([outdated](#outdated))

Content Model:  
[`itemref`](#dfn-itemref) `[1 or more]`

The `spine` *MUST* specify at least one [EPUB content document](#dfn-epub-content-document) or [foreign content document](#dfn-foreign-content-document).

All EPUB and foreign content documents that are hyperlinked to from publication resources in the `spine` *MUST* be listed in the `spine`, where hyperlinking encompasses any linking mechanism that requires the user to navigate away from the current resource. Common hyperlinking mechanisms include the [`href`](https://html.spec.whatwg.org/multipage/links.html#attr-hyperlink-href) attribute of the \[[html](#bib-html "HTML Standard")\] [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element) and [`area`](https://html.spec.whatwg.org/multipage/image-maps.html#the-area-element) elements and scripted links (e.g., using DOM Events and/or form elements). The requirement to list hyperlinked resources applies recursively (i.e., all EPUB and foreign content documents hyperlinked to from hyperlinked documents have to be listed, and so on.).

All EPUB and foreign content documents hyperlinked to from the [EPUB navigation document](#dfn-epub-navigation-document) *MUST* also be listed in the `spine`, regardless of whether the EPUB navigation document is included in the `spine`.

Note

As hyperlinks to resources outside the EPUB container are not [publication resources](#dfn-publication-resource), they are not subject to the requirement to include in the spine (e.g., web pages and web-hosted resources).

Publication resources used in the rendering of spine items (e.g., referenced from \[[html](#bib-html "HTML Standard")\] [embedded content](https://html.spec.whatwg.org/multipage/dom.html#embedded-content-category)) similarly do not have to be included in the spine.

The `page-progression-direction` attribute sets the global direction in which the content flows. Allowed values are `ltr` (left-to-right), `rtl` (right-to-left) and `default`. When the `default` value is specified, no preference is being expressed and the [reading system](#dfn-epub-reading-system) can choose the rendering direction.

Although the `page-progression-direction` attribute sets the global flow direction, individual EPUB content documents and parts of EPUB content documents *MAY* override this setting (e.g., via the `writing-mode` CSS property). Reading systems might also provide mechanisms to override the default direction (e.g., buttons or settings that allow the application of alternate style sheets).

The [outdated](#outdated) `toc` attribute takes an [IDREF](https://www.w3.org/TR/xml/#idref) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] that identifies the manifest item that represents the [NCX](#sec-opf2-ncx).

#### 5.8.2 The `itemref` element

[](#sec-itemref-elem)

The `itemref` element identifies an [EPUB content document](#dfn-epub-content-document) or [foreign content document](#dfn-foreign-content-document) in the default reading order.

Element Name:  
`itemref`

Usage:  
As a child of [`spine`](#dfn-spine). Repeatable.

Attributes:  
- [`id`](#attrdef-id) `[optional]`

- [`idref`](#attrdef-itemref-idref) `[required]`

- [`linear`](#attrdef-itemref-linear) `[optional]`

- [`properties`](#attrdef-properties) `[optional]`

Content Model:  
Empty

Each `itemref` element *MUST* reference the [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of an [`item`](#dfn-item) in the [manifest](#dfn-epub-manifest) via the [IDREF](https://www.w3.org/TR/xml/#idref) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] in its `idref` attribute. `item` element IDs *MUST NOT* be referenced more than once.

Each referenced manifest `item` *MUST* be either a) an [EPUB content document](#dfn-epub-content-document) or b) a [foreign content document](#dfn-foreign-content-document) that includes an EPUB content document in its [manifest fallback chain](#dfn-manifest-fallback-chain).

Note

Although [EPUB publications](#dfn-epub-publication) [require an EPUB navigation document](#confreq-nav), it is not mandatory to include it in the [spine](#dfn-epub-spine).

The `linear` attribute indicates whether the referenced `item` contains content that contributes to the primary reading order and that [reading systems](#dfn-epub-reading-system) are expected to read sequentially ("`yes`"), or auxiliary content that enhances or augments the primary content that reading systems can access out of sequence ("`no`"). Examples of auxiliary content include notes, descriptions, and answer keys.

The `linear` attribute allows reading systems to distinguish content that a user needs to access as part of the default reading order from supplementary content which a reading system might, for example, present in a popup window or omit from an aural rendering.

Specifying that content is non-linear does not require reading systems to present it in a specific way; it is only a hint to the purpose. Reading systems might present non-linear content where it occurs in the spine, for example, or might skip it until users reach the end of the spine.

Note

It is advised to list non-linear content at the end of the spine except when it makes sense for users to encounter it between linear spine items.

A linear `itemref` element is one whose `linear` attribute value is explicitly set to "`yes`" or that omits the attribute — reading systems will assume the value "`yes`" for `itemref` elements without the attribute. The spine *MUST* contain at least one linear `itemref` element.

As reading systems might not provide access to non-linear content while progressing through the spine, a secondary means of accessing all non-linear content *MUST* be provided (e.g., via hyperlinks in the content or the [EPUB navigation document](#sec-nav)).

The [Spine Properties Vocabulary](#app-itemref-properties-vocab) is the [default vocabulary](#dfn-default-vocabulary) for the `properties` attribute.

Terms from other vocabularies *MAY* be added as defined in [5.3 Vocabulary association mechanisms](#sec-vocab-assoc).

[Example 52](#example-a-basic-spine): A basic spine

In this example, the spine entries correspond to [the manifest example above](#example-manifest-cmt).

``` abnf
<spine
    page-progression-direction="ltr">
   <itemref
       idref="intro"/>
   <itemref
       idref="c1"/>
   <itemref
       idref="c1-answerkey"
       linear="no"/>
   <itemref
       idref="c2"/>
   <itemref
       idref="c2-answerkey"
       linear="no"/>
   <itemref
       idref="c3"/>
   <itemref
       idref="c3-answerkey"
       linear="no"/>
   <itemref
       idref="notes"
       linear="no"/>
</spine>
```

## 6. Layouts

[](#sec-layouts)

### 6.1 Introduction

[](#sec-general-rendering-intro)

*This section is non-normative.*

Not all rendering information can be expressed through the underlying technologies that EPUB 3 is built upon. For example, although HTML with CSS provides powerful layout capabilities, those capabilities are limited to the scope of the document being rendered.

For this reason, EPUB 3 offers both multiple layout options for displaying [EPUB content documents](#dfn-epub-content-document):

- [reflowable](#sec-reflowable) — the default for EPUB 3, where the content of each [spine](#dfn-epub-spine) item reflows to fit the viewport;
- [pre-paginated](#sec-reflowable) — where each spine item is a [fixed-layout document](#dfn-fixed-layout-document) representing one page; and
- [roll](#sec-reflowable) — where fixed-layout documents are presented in a continuous scroll.

This section explains these layout options as well as additional properties that control the expression of package-level rendering intentions (i.e., functionality that can only be implemented by the [EPUB reading system](#dfn-epub-reading-system)). If a reading system supports the desired rendering, these properties allow the content to be presented as it was optimally designed.

### 6.2 Reflowable layouts

[](#sec-reflowable)

A reflowable layout is one where the contents of [EPUB content documents](#dfn-epub-content-document) are reflowed to fit the available space in the [reading system](#dfn-epub-reading-system) viewport. A reading system can then dynamically paginate the content or provide it in a scrolled manner, often providing users the ability to select the reading experience they prefer.

Reflowable layouts are the default for EPUB 3 and typically the most accessible. Because they are the default, it is not required to declare any metadata to state that an [EPUB publication](#dfn-epub-publication) is intended to be reflowed. If an explicit declaration is preferred, however, the [`rendition:layout` property](#layout) can be set in a `meta` element that specifies the value `reflowable`.

[Example 53](#example-declaring-an-epub-publication-is-reflowable): Declaring an EPUB publication is reflowable

``` xml
<package …>
<metadata>
  <meta property="rendition:layout">reflowable</meta>
  …
</metadata>
…
</package>
```

In addition to setting an entire EPUB publication as reflowable, it is possible to override a [pre-paginated fixed layout](#sec-pre-paginated) to specify that some spine items are reflowable. To do so, the [`rendition:layout-reflowable` spine override](#layout-reflowable) is set in the `properties` attribute on each spine `itemref` that is reflowable.

[Example 54](#example-reflowable-document-in-a-pre-paginated-layout): Reflowable document in a pre-paginated layout

``` xml
<package …>
<metadata>
  <meta property="rendition:layout">pre-paginated</meta>
  …
</metadata>
<manifest>
  <item id="reflow1" href="preface.html" media-type="application/xhtml+xml"/>
</manifest>
<spine>
   <itemref idref="reflow1" properties="rendition:layout-reflowable"/>
</spine>
</package>
```

Note

[Roll layouts](#sec-roll) do not support [layout spine overrides](#layout-overrides) so reflowable layouts cannot be similarly mixed with rolls.

When two reflowable EPUB content documents occur sequentially in the spine, the default rendering for their \[[html](#bib-html "HTML Standard")\] [`body`](https://html.spec.whatwg.org/multipage/#the-body-element) elements is consistent with the [`page-break-before` property](https://www.w3.org/TR/CSS2/page.html#propdef-page-break-before) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] having been set to `always`. This behavior *MAY* be overridden through an appropriate style sheet declaration if the reading system supports such overrides.

### 6.3 Fixed layouts

[](#sec-fixed-layouts)

EPUB 3 offers two types of fixed layout using [fixed-layout documents](#dfn-fixed-layout-document). The first, [pre-paginated](#sec-pre-paginated), provides a reading experience much like a traditional print book, with each fixed-layout document representing one page of content. Pre-paginated layouts are commonly used for children's books, comics, and similar content where the design of the page cannot be reflowed without loss of meaning or readability.

The second type of layout, [roll](#sec-roll), offers fixed-layout documents in a continuous scrolling layout. This experience is essential for many comics and manga where paginating the documents creates artificial breaks.

Note

Pre-paginated layouts were commonly referred to as fixed layout EPUBs prior to the introduction of roll layouts. The specification now refers to each fixed layout type by their design to avoid the general confusion of calling only one a "fixed layout".

#### 6.3.1 Pre-paginated

[](#sec-pre-paginated)

In a pre-paginated fixed layout, each fixed-layout document referenced by a [spine](#dfn-epub-spine) [`itemref`](#dfn-itemref) represents one page of content. Reading systems are expected to scale the document to fit the viewport or synthetic spread.

To indicate that an EPUB publication uses a pre-paginated fixed layout, the [`rendition:layout` property](#layout) is declared in a `meta` element that specifies the value pre-paginated.

[Example 55](#example-declaring-an-epub-publication-is-reflowable-0): Declaring an EPUB publication is reflowable

``` xml
<package …>
<metadata>
  <meta property="rendition:layout">pre-paginated</meta>
  …
</metadata>
…
</package>
```

In addition to setting an entire EPUB publication as having a pre-paginated, it is possible to override a [reflowable layout](#sec-reflowable) to specify that some spine items are pre-paginated. To do so, the [`rendition:layout-pre-paginated` spine override](#layout-pre-paginated) is set in the [`properties` attribute](#attrdef-properties) on each spine `itemref` that is pre-paginated.

[Example 56](#example-pre-paginated-document-in-a-reflowable-layout): Pre-paginated document in a reflowable layout

``` xml
<package …>
<metadata>
  <meta property="rendition:layout">reflowable</meta>
  …
</metadata>
<manifest>
  <item id="fxl1" href="page1.html" media-type="application/xhtml+xml"/>
</manifest>
<spine>
   <itemref idref="fxl1" properties="rendition:layout-pre-paginated"/>
</spine>
</package>
```

Note

[Roll layouts](#sec-roll) do not support spine overrides so pre-paginated layouts cannot be similarly mixed with rolls.

When the property is set to `pre-paginated` for a spine item, the [`itemref`](#dfn-itemref) element *MUST* reference a [fixed layout document](#sec-fxl-docs) or there *MUST* be one in the [manifest fallback chain](#dfn-manifest-fallback-chain).

Note

Reading systems typically restrict or deny the application of user or user agent style sheets to pre-paginated documents because dynamic style changes are likely to have unintended consequence on the intrinsic properties of such documents. When choosing to use pre-paginated content, it is advised to consider the negative impact on usability and accessibility that these restrictions have. Refer to [Guideline 1.4 - Provide text configuration](https://www.w3.org/TR/UAAG20/#gl-text-config) \[[uaag20](#bib-uaag20 "User Agent Accessibility Guidelines (UAAG) 2.0")\] for related information.

[Example 57](#fxl-ex1): Fixed Layout Document with media queries

In this example, the document's layout is set to `pre-paginated` (i.e., it is defined to be a [fixed-layout document](#dfn-fixed-layout-document)). Furthermore, media queries \[[mediaqueries-3](#bib-mediaqueries-3 "Media Queries Level 3")\] are used to apply different style sheets for three different device categories. Note that the media queries only affect the style sheet applied to the document; the size of the content area set in the `viewport meta` tag is static.

Package document:

``` xml
<package …>
<metadata …>
  …
  <meta
      property="rendition:layout">
     pre-paginated
  </meta>
  …
</metadata>
…
</package>
```

XHTML

``` xml
<html …>
<head>
  <meta
      name="viewport"
      content="width=1200,
      height=900"/>

  <link
      rel="stylesheet"
      href="eink-style.css"
      media="(max-monochrome: 3)"/>

  <link
      rel="stylesheet"
      href="skinnytablet-style.css"
      media="((color) and (max-height:600px) and (orientation:landscape),
              (color) and (max-width:600px) and (orientation:portrait))"/>

  <link
      rel="stylesheet"
      href="fattablet-style.css"
      media="((color) and (min-height:601px) and (orientation:landscape),
              (color) and (min-width:601px) and (orientation:portrait))"/>
</head>
…
</html>
```

##### 6.3.1.1 Synthetic spreads

[](#page-spread)

By default for [pre-paginated](#def-layout-pre-paginated) layouts, a [reading system](#dfn-epub-reading-system) will present each [fixed-layout document](#dfn-fixed-layout-document) separately in the [viewport](#dfn-viewport), and replace the document with the next fixed-layout document in [spine](#dfn-epub-spine) order.

Reading systems might also provide the option for synthetic spreads, where two viewports are rendered so that two fixed-layout documents can be displayed side-by-side or a single fixed-layout document can be displayed alone in one of the two available viewports (e.g., to have a blank page before the start of a new chapter). In this case, the reading system will render the first document on its own — either alone in one of the two available slots (which slot is determined by the given [page progression direction](#attrdef-spine-page-progression-direction) or by local declarations within the [EPUB content documents](#dfn-epub-content-document)) or centered on its own (equivalent to setting the `rendition:page-spread-center` property). After the first document, it will populate the spread by rendering the next two successive [EPUB content documents](#dfn-epub-content-document). Both documents in the spread are then replaced each time the user progresses forward or backward through the publication.

The automatic population behavior *MAY* be overridden by specifying one of the following properties in a spine [`itemref`](#dfn-itemref) element's [`properties` attribute](#attrdef-properties):

- [`rendition:page-spread-center`](#rendition-page-spread-center) — do not use a synthetic spread and center the fixed-layout document in the viewport.
- [`rendition:page-spread-left`](#rendition-page-spread-left) — place the referenced fixed-layout document in the left-hand slot of a synthetic spread.
- [`rendition:page-spread-right`](#rendition-page-spread-right) — place the referenced fixed-layout document in the right-hand slot of a synthetic spread.

The `rendition:page-spread-center`, `rendition:page-spread-left`, and `rendition:page-spread-right` properties only apply when the reading system is creating synthetic spreads. They also only apply to pre-paginated content, although it is possible to have spreads within a reflowable layout when the layout of spine items is overridden to pre-paginated.

Note

The `rendition:page-spread-left` and `rendition:page-spread-right` properties were created to allow the use of a single vocabulary for package rendering properties. Either property set can be used, but older reading systems might only recognize the unprefixed versions.

The `rendition:page-spread-center` was created to make it easier to understand the process of switching between two-page spreads and single centered pages.

[Example 58](#spread-page-spread-right-example): Starting the first document on the right

``` xml
<package …>
   <metadata …>
      …
      <meta
          property="rendition:layout">
          pre-paginated
      </meta>
      …
   </metadata>
   <spine page-progression-direction="ltr">
      <itemref
          idref="first-panel"
          properties="rendition:page-spread-right"/>
      …
   </spine>
</package>
```

![Progression of FXL pages in landscape modes, showing synthetic spread in both cases but with the first page appearing on the right side of the first page.](images/example_spread_page_spread_right_34.svg)

[Figure 1](#spread-page-spread-right-figure) Rendering of three fixed-layout documents, with synthetic spread in landscape orientation starting on the right.\
(Illustrations from Kate Greenaway's "A Apple Pie", Frederick Warne, 1900; [Digital Reproduction](http://hdl.loc.gov/loc.rbc/bit.11404) by the US Library of Congress, in public domain.)

Image description

A row of schematic views of three tablets in landscape mode, and linked with left-to-right arrows. They all show 1900 style children book illustrations, each with a single text on a background of children engaged in various activities around an apple pie.

The first tablet shows a single image on the right side of the tablet, with the text "Apple Pie, by Kate Greenway". The second tablet shows two images on the left and right parts of the tablet, respectively: the left side contains the text "A Apple Pie", the right side contains the text "B Bit It". The third tablet shows also two images on the left and right parts of the tablet, respectively: the left side contains the text "C Cut It", the right side contains the text "D Dealt It".

[Example 59](#fxl-ex5): Placing individual spine items in a spread

In this example, the intent is for the reading system to create a two-page fixed-layout center plate using synthetic spreads.

``` xml
<package …>
   <metadata …>
      …
      <meta
          property="rendition:layout">
         reflowable
      </meta>
   </metadata>
   …
   <spine page-progression-direction="ltr">
      …
      <itemref
          idref="center-plate-left"
          properties="rendition:layout-pre-paginated rendition:page-spread-left"/>
      <itemref
          idref="center-plate-right"
          properties="rendition:layout-pre-paginated rendition:page-spread-right"/>
      …
   </spine>
</package>
```

[Example 60](#fxl-ex6): Creating a centered layout

``` xml
<package …>
   <metadata …>
      …
      <meta
          property="rendition:layout">
         pre-paginated
      </meta>
   </metadata>
   <spine>
      …
      <itemref
          idref="center-plate"
          properties="rendition:page-spread-center"/>
      …
   </spine>
   …
</package>
```

#### 6.3.2 Roll

[](#sec-roll)

When the [`rendition:layout` property](#layout) is declared in a `meta` element with the value roll, it indicates that the content is a roll (i.e., reading systems fit the width of each [spine](#dfn-epub-spine) [`itemref`](#dfn-itemref) to the viewport and display them in a continuous roll with no visible gap). The roll layout style applies globally (i.e., for all spine items) and cannot be overridden.

When a `roll` layout is declared, each spine item *MUST* reference a [fixed-layout document](#dfn-fixed-layout-document). The dimensions of each document *MUST* be set as defined in [7.3.2 Fixed-layout document dimensions](#sec-fxl-content-dimensions).

No other properties or spine overrides from the [Package rendering vocabulary](#app-rendering-vocab) can be used to control the rendering of roll layouts.

Note

Reading systems typically restrict or deny the application of user or user agent style sheets to roll documents because dynamic style changes are likely to have unintended consequence on the intrinsic properties of such documents. When choosing to use a roll, it is advised to consider the negative impact on usability and accessibility that these restrictions have. Refer to [Guideline 1.4 - Provide text configuration](https://www.w3.org/TR/UAAG20/#gl-text-config) \[[uaag20](#bib-uaag20 "User Agent Accessibility Guidelines (UAAG) 2.0")\] for related information.

[Example 61](#roll-ex1): Roll layout

In this example, the EPUB publication's layout is set to `roll`.

Package document:

``` abnf
<package …>
<metadata …>
  …
  <meta property="rendition:layout">
     roll
  </meta>
  …
</metadata>
<manifest>
  <item
    media-type="image/avif"
    id="image1"
    href="image1.avif"
    fallback="image1-html"/>
  <item
    media-type="image/avif"
    id="image2"
    href="image2.avif"
    fallback="image2-html"/>
  <item
    media-type="image/avif"
    id="image3"
    href="image3.avif"
    fallback="image3-html"/>
  <item
    media-type="application/xhtml+xml"
    id="image1-html"
    href="image1.html"/>
  <item
    media-type="application/xhtml+xml"
    id="image2-html"
    href="image2.html"/>
  <item
    media-type="application/xhtml+xml"
    id="image3-html"
    href="image3.html"/>
</manifest>
<spine>
  <itemref idref="image1"/>
  <itemref idref="image2"/>
  <itemref idref="image3"/>
</spine>
…
</package>
```

![Progression in a roll layout with a continuously scrolled reading experience.](images/example_rendering_roll_34.svg)

[Figure 2](#layout-roll-figure) Rendering of three fixed-layout documents in a roll\
(Illustrations from Kate Greenaway's "A Apple Pie", Frederick Warne, 1900; [Digital Reproduction](http://hdl.loc.gov/loc.rbc/bit.11404) by the US Library of Congress, in public domain.)

Image description

A schematic view of a tablet in portrait mode, partially overlapping a single vertical stripe of four images. Part of the stripe is shown outside of the table's screen. All images are 1900 style children book illustrations, each with a single text with a background showing children engaging in various activities around an apple pie. From top-to-bottom the text on the images say "A Apple Pie", "B Bit It", "C Cut It", and "D Dealt It".

## 7. EPUB content documents

[](#sec-contentdocs)

### 7.1 XHTML content documents

[](#sec-xhtml)

#### 7.1.1 Introduction

[](#sec-xhtml-intro)

*This section is non-normative.*

An [XHTML content document](#dfn-xhtml-content-document) is an instance of an [XML document](#sec-xml-constraints) expressed using the [XML syntax](https://html.spec.whatwg.org/multipage/#the-xhtml-syntax) of the [HTML Standard](https://html.spec.whatwg.org/multipage/) \[[html](#bib-html "HTML Standard")\].

XHTML content documents that conform to this profile are [core media type resources](#dfn-core-media-type-resource) and one of the two formats that constitute [EPUB content documents](#dfn-epub-content-document) — that can be used without fallbacks in the [`spine`](#dfn-spine).

Note

EPUB 3 does not support the [HTML syntax](https://html.spec.whatwg.org/multipage/#syntax) of \[[html](#bib-html "HTML Standard")\] as a core media type. Although both serializations allow the same elements to be expressed, not all JavaScript libraries and APIs are designed to handle the XML syntax, in particular the shadow DOM. This means, for example, that although the [`template`](https://html.spec.whatwg.org/multipage/scripting.html#the-template-element) element \[[html](#bib-html "HTML Standard")\] can be authored in the XML syntax it may not be usable in the same way as in the HTML syntax.

The Publishing Maintenance Working Group is aware that the HTML Standard no longer recommends the use of the XML syntax. XML, however, is integral to many publishing workflows and expected in many vendor ingestion systems and reading systems. It is also not expected that support for XHTML will be dropped from browsers, even if there are additional support differences between the syntax in the future. Support for the HTML syntax may be addressed in a successor format to EPUB 3.

Note

Earlier versions of EPUB 3 referred to W3C's HTML5 standard to define EPUB content documents, but that standard was largely a snapshot of the HTML Standard maintained by the WHATWG. After reaching an [agreement](https://www.w3.org/2019/04/WHATWG-W3C-MOU.html) on the development of HTML in 2019, the W3C standard was retired and EPUB 3 now exclusively refers to the HTML Standard. It does not mean that EPUB 3 does not support HTML5 anymore in XHTML content documents, only that HTML5 is now a marketing term that refers to the HTML Standard as the successor to HTML 4.01 and XHTML 1.1.

#### 7.1.2 XHTML requirements

[](#sec-xhtml-req)

An XHTML content document:

- *MUST* conform to the conformance criteria for all document constructs defined by \[[html](#bib-html "HTML Standard")\] unless explicitly overridden in [7.1.4 HTML deviations and constraints](#sec-xhtml-deviations).

- *MAY* include extensions to the \[[html](#bib-html "HTML Standard")\] grammar as defined in [7.1.3 HTML extensions](#sec-xhtml-extensions), and *MUST* conform to all content conformance constraints defined therein.

- *MUST* be an \[[html](#bib-html "HTML Standard")\] document that conforms to the [XML syntax](https://html.spec.whatwg.org/multipage/#writing-xhtml-documents).

Unless specified otherwise, XHTML content documents inherit all definitions of semantics, structure, and processing behaviors from the \[[html](#bib-html "HTML Standard")\] specification.

Note

The recommendation that [EPUB publications](#dfn-epub-publication) follow the accessibility requirements in \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] applies to XHTML content documents. See [Accessibility](#confreq-a11y).

#### 7.1.3 HTML extensions

[](#sec-xhtml-extensions)

This section defines EPUB 3 [XHTML content document](#dfn-xhtml-content-document) extensions to the underlying \[[html](#bib-html "HTML Standard")\] document model.

Note

Although \[[html](#bib-html "HTML Standard")\] allows user agents to support [vendor-neutral extensions](https://html.spec.whatwg.org/multipage/#extensibility-2), unless such extensions are listed in this section, they are not supported features of EPUB 3.

##### 7.1.3.1 Structural semantics

[](#sec-xhtml-structural-semantics)

The [`epub:type`](#dfn-epub-type) attribute *MAY* be used in [XHTML content documents](#dfn-xhtml-content-document) to express [structural semantics](#sec-structural-semantics).

The attribute *MUST NOT* be used on the [`head`](https://html.spec.whatwg.org/multipage/#the-head-element) element or [metadata content](https://html.spec.whatwg.org/multipage/dom.html#metadata-content-2) \[[html](#bib-html "HTML Standard")\].

##### 7.1.3.2 RDFa

[](#sec-xhtml-rdfa)

The \[[html-rdfa](#bib-html-rdfa "HTML+RDFa 1.1 - Second Edition")\] specification defines a set of attributes that *MAY* be used in [XHTML content documents](#dfn-xhtml-content-document) to semantically enrich the content. The use of these attributes *MUST* conform to the requirements defined in \[[html-rdfa](#bib-html-rdfa "HTML+RDFa 1.1 - Second Edition")\].

The \[[html-rdfa](#bib-html-rdfa "HTML+RDFa 1.1 - Second Edition")\] specification defines changes to the \[[html](#bib-html "HTML Standard")\] content model when authors use RDFa attributes. This modified content model is valid in XHTML content documents.

Note

The listing of RDFa does not express a preference on the part of the Working Group, only that these attributes represent an extension of the HTML grammar. [Microdata attributes](https://html.spec.whatwg.org/multipage/#microdata) \[[html](#bib-html "HTML Standard")\] and [linked data](https://www.w3.org/TR/json-ld11/#) \[[json-ld11](#bib-json-ld11 "JSON-LD 1.1")\] are natively supported in XHTML content documents and can be used as well.

##### 7.1.3.3 Internationalization tag set (ITS)

[](#sec-xhtml-its)

The \[[its20](#bib-its20 "Internationalization Tag Set (ITS) Version 2.0")\] specification defines a set of attributes that *MAY* be used in [XHTML content documents](#dfn-xhtml-content-document) to add support for internationalization, translation, and localization.

ITS attributes *MUST* only be used as defined in [Using ITS markup in HTML](https://www.w3.org/TR/its20/#html5-markup) \[[its20](#bib-its20 "Internationalization Tag Set (ITS) Version 2.0")\] (i.e., EPUB 3 does not support the namespaced attributes).

The use of these attributes *MUST* conform to the requirements defined in \[[its20](#bib-its20 "Internationalization Tag Set (ITS) Version 2.0")\].

Note

It is also possible to link to an ITS document from an \[[html](#bib-html "HTML Standard")\] [`link`](#dfn-link) element as defined in the section [Global approach in HTML5](https://www.w3.org/TR/its20/#html5-global-approach) \[[its20](#bib-its20 "Internationalization Tag Set (ITS) Version 2.0")\]. As such linked files are [exempt resources](#dfn-exempt-resource), an extension to \[[html](#bib-html "HTML Standard")\] is not required to accommodate this use case.

##### 7.1.3.4 Custom attributes

[](#sec-xhtml-custom-attributes)

[XHTML content documents](#dfn-xhtml-content-document) *MAY* contain custom attributes, which are [prefixed](https://www.w3.org/TR/xml-names/#NT-Prefix) \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\] attributes whose namespace URL does not include either of the following strings in its [domain](https://url.spec.whatwg.org/#concept-domain) \[[url](#bib-url "URL Standard")\]:

- `w3.org`
- `idpf.org`

When using custom attributes, the content *MUST* remain consumable by a user without any information loss or other significant deterioration, regardless of the [reading system](#dfn-epub-reading-system) it is rendered on.

Note

Custom attributes are usually defined in a reading system-specific manner and are not intended for use by other reading systems. The preferred method to add extensions for multiple independent reading systems to use is to extend this specification.

#### 7.1.4 HTML deviations and constraints

[](#sec-xhtml-deviations)

This section defines deviations from, and constraints on, the underlying \[[html](#bib-html "HTML Standard")\] document model applicable to EPUB 3 [XHTML content documents](#dfn-xhtml-content-document).

##### 7.1.4.1 Embedded MathML

[](#sec-xhtml-mathml)

[XHTML content documents](#dfn-xhtml-content-document) support embedded \[[mathml3](#bib-mathml3 "Mathematical Markup Language (MathML) Version 3.0 2nd Edition")\]. Occurrences of MathML markup *MUST* conform to the constraints expressed in the MathML specification \[[mathml3](#bib-mathml3 "Mathematical Markup Language (MathML) Version 3.0 2nd Edition")\], with the following additional restrictions:

Presentation MathML  
The `math` element *MUST* contain only [Presentation MathML](https://www.w3.org/TR/MathML3/chapter3.html#), except within the `annotation-xml` element.

Content MathML  
[Content MathML](https://www.w3.org/TR/MathML3/chapter4.html#) *MAY* be included within MathML markup in XHTML content documents, and, when present, *MUST* be included within an `annotation-xml` child element of a `semantics` element.

When Content MathML is included per the previous condition, the given `annotation-xml` element's `encoding` attribute *MUST* be set to either of the functionally-equivalent values `MathML-Content` or `application/mathml-content+xml`, and the `name` attribute to `contentequiv`.

This subset eases the implementation burden on [reading systems](#dfn-epub-reading-system) and promotes accessibility, while retaining compatibility with \[[html](#bib-html "HTML Standard")\] user agents.

Note

The [`mathml` property](#mathml) of the [manifest](#dfn-epub-manifest) `item` element indicates that an XHTML content document contains embedded MathML.

##### 7.1.4.2 Embedded SVG

[](#sec-xhtml-svg)

[XHTML content documents](#dfn-xhtml-content-document) support the embedding of SVG:

- *by reference* — for example, from an \[[html](#bib-html "HTML Standard")\] [`img`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element) or [`object`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element) element. SVGs embedded by reference are [SVG core media types](#cmt-svg) so their requirements are already defined in [7.2 SVG content documents](#sec-svg).
- *by inclusion* — via direct inclusion of an [SVG document fragment](https://www.w3.org/TR/SVG/conform.html#ConformingSVGXMLFragments) \[[svg](#bib-svg "SVG")\] in an XHTML content document. SVGs embedded by inclusion have the same content conformance constraints as those defined for [SVG content documents](#dfn-svg-content-document) in [7.2.3 Restrictions on SVG](#sec-svg-restrictions).

Note

The [`svg` property](#svg) of the [manifest](#dfn-epub-manifest) [`item`](#dfn-item) element indicates that an XHTML content document contains embedded SVG (either by reference or by inclusion).

##### 7.1.4.3 Discouraged constructs

[](#sec-xhtml-deviations-discouraged)

*This section is non-normative.*

###### 7.1.4.3.1 The `base` element

[](#sec-xhtml-deviations-base)

The \[[html](#bib-html "HTML Standard")\] [`base`](https://html.spec.whatwg.org/multipage/semantics.html#the-base-element) element can be used to specify the [document base URL](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#document-base-url) for the purposes of parsing URLs. When using it in an [EPUB publication](#dfn-epub-publication), the interpretation of the `base` element could inadvertently result in references to [remote resources](#dfn-remote-resource). It could also cause [reading systems](#dfn-epub-reading-system) to misinterpret the location of hyperlinks (e.g., relative links to other documents in the publication might appear as links to a web site if the `base` element specifies an absolute URL). To avoid significant interoperability issues, use of the `base` element is discouraged.

###### 7.1.4.3.2 The `rp` element

[](#sec-xhtml-deviations-rp)

The \[[html](#bib-html "HTML Standard")\] [`rp`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-rp-element) element is intended to provide a fallback for older [reading systems](#dfn-epub-reading-system) that do not recognize ruby markup (i.e., a parenthesis display around `ruby` markup). As EPUB 3 reading systems are ruby-aware, and can provide fallbacks, use of `rp` elements is discouraged.

###### 7.1.4.3.3 The `embed` element

[](#sec-xhtml-deviations-embed)

Since the \[[html](#bib-html "HTML Standard")\] [`embed` element](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-embed-element) element does not include intrinsic fallback facilities for [reading systems](#dfn-epub-reading-system) that do not support scripting, using the element with scripted resources is discouraged. The \[[html](#bib-html "HTML Standard")\] [`object`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element) element is a better alternative as it includes intrinsic fallback capabilities.

### 7.2 SVG content documents

[](#sec-svg)

#### 7.2.1 Introduction

[](#sec-svg-intro)

*This section is non-normative.*

The Scalable Vector Graphics (SVG) specification \[[svg](#bib-svg "SVG")\] defines a format for representing final-form vector graphics and text.

Although [XHTML content documents](#sec-xhtml) are more commonly used as [top-level content documents](#dfn-top-level-content-document), the use of [SVG content documents](#dfn-svg-content-document) is also permitted. SVGs are typically only needed for certain special cases, such as when final-form page images are the only suitable representation of the content (e.g., for cover art or in the context of manga or comic books).

This section defines a profile for \[[svg](#bib-svg "SVG")\] documents. An instance of an XML document that conforms to this profile is a [core media type resource](#dfn-core-media-type-resource) and is referred to in this specification as an [SVG content document](#dfn-svg-content-document).

Note

This section defines conformance requirements for SVG content documents. Refer to [7.1.4.2 Embedded SVG](#sec-xhtml-svg) for the conformance requirements for SVG embedded in XHTML content documents.

#### 7.2.2 SVG requirements

[](#sec-svg-req)

An [SVG content document](#dfn-svg-content-document) *MUST* be a [conforming SVG stand-alone file](https://www.w3.org/TR/SVG/conform.html#ConformingSVGStandAloneFiles) \[[svg](#bib-svg "SVG")\] and conform to all content conformance constraints expressed in [7.2.3 Restrictions on SVG](#sec-svg-restrictions).

Note

The recommendation that [EPUB publications](#dfn-epub-publication) follow the accessibility requirements in \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] applies to SVG content documents. See [Accessibility](#confreq-a11y).

#### 7.2.3 Restrictions on SVG

[](#sec-svg-restrictions)

This specification restricts the content model of [SVG content documents](#dfn-svg-content-document) and [SVG embedded by inclusion in XHTML content documents](#sec-xhtml-svg-inclusion) as follows:

- The \[[svg](#bib-svg "SVG")\] [`foreignObject`](https://www.w3.org/TR/SVG/embedded.html#ForeignObjectElement) element:

  - *MUST* contain either \[[html](#bib-html "HTML Standard")\] [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2) or exactly one \[[html](#bib-html "HTML Standard")\] [`body`](https://html.spec.whatwg.org/multipage/#the-body-element) element.

    Note

    In the case of [SVGs embedded by inclusion](#sec-xhtml-svg-inclusion), a `body` element is not permitted per the [restrictions on SVG](https://html.spec.whatwg.org/multipage/#svg-0) defined in \[[html](#bib-html "HTML Standard")\].

  - *MUST* contain a valid document fragment that conforms to the XHTML content document model defined in [7.1.2 XHTML requirements](#sec-xhtml-req).

- If the \[[svg](#bib-svg "SVG")\] [`title`](https://www.w3.org/TR/SVG/struct.html#elementdef-title) element contains marked-up text, the markup *MUST* contain only elements declared in the [HTML namespace](https://infra.spec.whatwg.org/#html-namespace) \[[infra](#bib-infra "Infra Standard")\].

  Note

  Although the \[[svg](#bib-svg "SVG")\] `title` element allows markup elements, support for this feature is limited. The use of text-only titles is advised for maximum interoperability.

- When specified, the [`epub:type`](#dfn-epub-type) attribute *MUST* only be included on [renderable elements](https://www.w3.org/TR/SVG/render.html#TermRenderableElement) \[[svg](#bib-svg "SVG")\].

  Note

  The SVG content model allows authors to [include namespaced attributes](https://www.w3.org/TR/SVG/struct.html#ForeignNamespaces), so this specification does not need to allow the [`epub:type`](#dfn-epub-type) attribute or [vocabulary association mechanisms](#sec-vocab-assoc).

  One key difference between SVGs embedded by reference and by inclusion, however, is that SVGs embedded by inclusion cannot have an [`epub:prefix`](#sec-prefix-attr) attribute on their root [`svg`](https://www.w3.org/TR/SVG/struct.html#elementdef-svg) element \[[svg](#bib-svg "SVG")\]. For more information, refer to [5.3.4 The `prefix` attribute](#sec-prefix-attr).

### 7.3 Fixed-layout documents

[](#sec-fxl-docs)

#### 7.3.1 Introduction

[](#sec-fxl-intro)

*This section is non-normative.*

[EPUB publications](#dfn-epub-publication), unlike print books or PDF files, are designed to change. The content flows, or reflows, to fit the screen and to fit the needs of the user. As noted in [Rendering and CSS](https://www.w3.org/TR/epub-overview-34/#sec-rendering) "content presentation adapts to the user, rather than the user having to adapt to a particular presentation of content." \[[epub-overview-34](#bib-epub-overview-34 "EPUB 3 Overview")\]

But this principle does not work for all types of documents. Sometimes content and design are so intertwined it is not possible to separate them. Any change in appearance risks changing the meaning or losing all meaning. [Fixed-layout documents](#dfn-fixed-layout-document) give greater control over presentation when a reflowable layout is not suitable for the content.

Fixed-layout documents differ from [`reflowable`](#def-layout-reflowable) EPUB content documents in that they are rendered by reading systems with a set width and height as designated by metadata within the document. This allows the content of the documents to be positioned in a pixel precise manner. Any [foreign resource](#dfn-foreign-resource) can also be designated as having a fixed layout (although these require a fallback to an EPUB content document). Image foreign resources are often used in the spine in fixed layouts, for example, particularly with [roll layouts](#sec-roll).

Whether an EPUB content document, or a foreign resource, represents a fixed-layout document depends on the [layout of the publication](#sec-layouts). [Pre-paginated](#def-layout-pre-paginated) and [roll](#def-layout-roll) fixed layouts both expect that all items referenced from the spine are fixed-layout documents by default (although this behavior can be overridden in the case of pre-paginated layouts). It is also possible to override reflowable layouts to add pre-paginated fixed-layout documents.

The [layout dimensions](#sec-fxl-content-dimensions) of a fixed-layout document are obtained from each respective [EPUB content document](#dfn-epub-content-document). How the documents are presented in a reading systems depends on the layout used — they are displayed in a pre-paginated fashion (one per viewport or synthetic spread slot) or can be presented as a continuous roll.

Note

EPUB 3 supports multiple formats for representing fixed-layout content. When fixed-layout content is necessary, the choice of format will depend on many factors including desired degree of precision, file size, accessibility, etc. This document does not attempt to dictate the choice of format.

The use of images in the spine, in particular, is known to be problematic both for distribution and accessibility. Not all vendors accept EPUB publications with images in the spine, even though EPUB content document fallbacks are required, and reading systems do not always offer users the option to reach those fallbacks. Their use is only advised in specialized ecosystems, such as for comics and manga, that support roll layouts.

#### 7.3.2 Fixed-layout document dimensions

[](#sec-fxl-content-dimensions)

This section defines rules for the expression and interpretation of dimensional properties of [fixed-layout documents](#dfn-fixed-layout-document).

Fixed-layout documents specify their [initial containing block](https://www.w3.org/TR/CSS2/visudet.html#containing-block-details) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] in the manner applicable to their format:

Expressing in XHTML  
For XHTML [fixed-layout documents](#dfn-fixed-layout-document), the [initial containing block](https://www.w3.org/TR/CSS2/visudet.html#containing-block-details) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] is obtained from the *REQUIRED* `height` and `width` definitions in a [`viewport meta` tag](#app-viewport-meta), where:

- the `height` [property](#viewport.ebnf.property) *MUST* have as its [value](#viewport.ebnf.value) a positive [number](https://www.w3.org/TR/CSS2/syndata.html#numbers) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] or the keyword `device-height`; and
- the `width` property *MUST* have as its value a positive [number](https://www.w3.org/TR/CSS2/syndata.html#numbers) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] or the keyword `device-width`.

The `device-width` and `device-height` values refer to 100% of the width and height, respectively, of the reading system's [viewport](#dfn-viewport).

The `height` and `width` definitions *MUST* be specified in the first `viewport meta` tag in document order in the \[[html](#bib-html "HTML Standard")\] [`head`](https://html.spec.whatwg.org/multipage/#the-head-element) element. Reading systems will ignore subsequent `viewport meta` tags.

EPUB creators *MUST NOT* specify more than one `height` or `width` definition within a `viewport meta` tag.

[Example 62](#example-specifying-the-initial-containing-block-in-a-viewport-meta-tag): Specifying the initial containing block in a viewport meta tag

``` xml
<html …>
   <head>
      …
      <meta
          name="viewport"
          content="width=1200, height=600"/>
      …
   </head>
   …
</html>
```

Expressing in SVG  
For SVG [fixed-layout documents](#dfn-fixed-layout-document), the initial containing block \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] dimensions *MUST* be expressed using the [`viewBox` attribute](https://www.w3.org/TR/SVG/coords.html#ViewBoxAttribute) \[[svg](#bib-svg "SVG")\].

[Example 63](#example-specifying-the-initial-containing-block-in-the-viewbox-attribute): Specifying the initial containing block in the viewBox attribute

In this example, the `viewBox` attribute sets the ICB to an aspect ratio of 844 pixels wide by 1200 pixels high.

``` abnf
<svg xmlns="http://www.w3.org/2000/svg"
         version="1.1"
         viewBox="0 0 844 1200">
       …
    </svg>
```

Expressing in image foreign resources  
For image [foreign resources](#dfn-foreign-resource) referenced from the spine, the [initial containing block](https://www.w3.org/TR/CSS2/visudet.html#containing-block-details) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] is obtained from the image's width and height metadata. For information about how this metadata is stored, refer to the image format's documentation.

Note

The initial containing block definition affects only the document where it is defined. The dimensions of the containing blocks in the other content documents within the same publication may be different.

### 7.4 Common resource requirements

[](#sec-common-resource-req)

This section defines requirements for technologies usable in both [XHTML](#dfn-xhtml-content-document) and [SVG content documents](#dfn-svg-content-document).

#### 7.4.1 Cascading Style Sheets (CSS)

[](#sec-css)

##### 7.4.1.1 Introduction

[](#sec-css-intro)

*This section is non-normative.*

CSS is an integral part of the Open Web Platform. Readers, publishers, and document authors expect CSS to "just work," as they expect HTML to just work.

In the past, EPUB defined a profile of CSS that mandated support for certain properties and provided prefixed versions of numerous other properties. Although the CSS Working Group no longer recommends the use of prefixed properties, this specification maintains some prefixed properties to avoid breaking existing content. But with the minor exceptions defined in this section, EPUB defers to the W3C to define CSS and expects [reading systems](#dfn-epub-reading-system) to support it at the level of major browsers.

Although reading systems are expected to support [CSS as defined in the CSS snapshot](https://www.w3.org/TR/epub-rs-34/#confreq-css-rs-support) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\], the reality is that most reading systems currently do not support all desired features of CSS, and often will modify, and allow users to change, the default presentation defined in an EPUB publication. As a result, styling has to be adapted to these realities. For more information, refer to [7.4.1.3 Reading system support considerations](#sec-css-rs).

##### 7.4.1.2 CSS requirements

[](#sec-css-req)

A CSS style sheet:

- *MAY* include any CSS properties, with the following exceptions:

  - It *MUST NOT* include the [`direction` property](https://www.w3.org/TR/css-writing-modes-3/#direction) \[[css-writing-modes-3](#bib-css-writing-modes-3 "CSS Writing Modes Level 3")\].

  - It *MUST NOT* include the [`unicode-bidi` property](https://www.w3.org/TR/css-writing-modes-3/#unicode-bidi) \[[css-writing-modes-3](#bib-css-writing-modes-3 "CSS Writing Modes Level 3")\].

- *MAY* include the [outdated](#outdated) [prefixed properties](#css-prefixes).

- *MUST* be encoded in UTF-8 or UTF-16 \[[unicode](#bib-unicode "The Unicode Standard")\], with UTF-8 as the *RECOMMENDED* encoding.

Note

This specification restricts the use of the `direction` and `unicode-bidi` properties because [reading systems](#dfn-epub-reading-system) might not implement, or might switch off, CSS processing. The following format-specific methods have to be used when control over these aspects of the rendering is needed:

- the [`dir`](https://html.spec.whatwg.org/multipage/dom.html#attr-dir) attribute \[[html](#bib-html "HTML Standard")\] and [`direction`](https://www.w3.org/TR/SVG/text.html#DirectionProperty) attribute \[[svg](#bib-svg "SVG")\] for inline base directionality.

- the [`bdo`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-bdo-element) element with the [`dir`](https://html.spec.whatwg.org/multipage/dom.html#attr-dir) attribute \[[html](#bib-html "HTML Standard")\] and the [presentation attribute alternative](https://www.w3.org/TR/SVG/styling.html#PresentationAttributes) for `unicode-bidi` \[[svg](#bib-svg "SVG")\] for bidirectionality.

##### 7.4.1.3 Reading system support considerations

[](#sec-css-rs)

*This section is non-normative.*

Support for the following CSS features are known to be particularly problematic in [EPUB reading systems](#dfn-epub-reading-system):

- Reading system-induced pagination can interact poorly with style sheets as reading systems sometimes paginate using columns. This could result in incorrect values for viewport sizes. Fixed and absolute positioning are particularly problematic.

- Some types of screens will render animations and transitions poorly (e.g., those with high latency).

Reading systems will typically set some aspects of an [EPUB publication's](#dfn-epub-publication) style (e.g., setting margins appropriate to the application), potentially overriding the default instructions. To mitigate conflicts, and any potential rendering problems, it is advised to consult reading systems' user agent style sheets, when they are made publicly available, and adapt styling choices for optimal display.

Furthermore, reading systems that allow users to change the appearance (e.g., choice of fonts, text justification, or foreground and background colors) will also modify some CSS rendering directions in an EPUB publication. Due to CSS precedence rules, it is advisable to limit the use of \[[html](#bib-html "HTML Standard")\] [`style`](https://html.spec.whatwg.org/multipage/dom.html#attr-style) attributes in EPUB content documents so that the user experience is not negatively impacted (i.e., the users' style choices not being universally applied). Although some reading systems will override inline styles, such behavior is not guaranteed.

#### 7.4.2 Scripting

[](#sec-scripted-content)

##### 7.4.2.1 Script inclusion

[](#sec-scripted-support)

[EPUB content documents](#dfn-epub-content-document) *MAY* contain scripting using the facilities defined for this in the respective underlying specifications (\[[html](#bib-html "HTML Standard")\] and \[[svg](#bib-svg "SVG")\]). When an EPUB content document contains scripting, this specification refers to it as a [scripted content document](#dfn-scripted-content-document). This label also applies to [XHTML content documents](#dfn-xhtml-content-document) that contain \[[html](#bib-html "HTML Standard")\] [`form`](https://html.spec.whatwg.org/multipage/forms.html#the-form-element) elements.

The [`scripted` property](#scripted) of the [manifest](#dfn-epub-manifest) `item` element is used to indicate that an EPUB content document is a scripted content document.

When an \[[html](#bib-html "HTML Standard")\] `script` element contains a [data block](https://html.spec.whatwg.org/multipage/#data-block) \[[html](#bib-html "HTML Standard")\], it does not represent scripted content.

Note

\[[svg](#bib-svg "SVG")\] does not define data blocks as of publication, but the same exclusion would apply if a future update adds the concept.

Note that [reading systems](#dfn-epub-reading-system) have to behave as though a unique [origin](https://html.spec.whatwg.org/multipage/#origin) \[[html](#bib-html "HTML Standard")\] has been assigned to each [EPUB publication](#dfn-epub-publication). In practice, this means that it is not possible for scripts to share data between EPUB publications.

Which [context](#sec-scripted-context) a script is used in also determines the rights and restrictions that a reading system places on it (refer to [Scripting](https://www.w3.org/TR/epub-rs-34/#sec-scripted-content) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] for more information).

Note

Reading systems might render scripted content documents in a manner that disables other EPUB capabilities and/or provides a different rendering and user experience (e.g., by disabling pagination).

##### 7.4.2.2 Scripting contexts

[](#sec-scripted-context)

EPUB 3 defines two contexts for script execution:

- [container constrained](#sec-scripted-container-constrained) — when the execution of a script occurs within an \[[html](#bib-html "HTML Standard")\] [`iframe`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) element; and
- [spine level](#sec-scripted-spine) — when the execution of a script occurs directly within a [top-level content document](#dfn-top-level-content-document).

Note

Scripts can execute in other contexts, but [reading system](#dfn-epub-reading-system) support for these contexts is optional. For example, a scripted SVG document might be referenced from an \[[html](#bib-html "HTML Standard")\] [`object`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element) element.

Refer to the [processing of scripts](https://www.w3.org/TR/epub-rs-34/#sec-scripted-content) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] for more information.

Whether code is embedded directly in a `script` element or referenced via the element's `src` attribute makes no difference to its executing context.

Which context is used for scripts affects both what actions the scripts can perform and the likelihood of support in reading systems, as described in the following subsections.

Note

Refer to [A.2 Scripting contexts](#scripted-contexts-example) for an example of the difference between the two contexts.

###### 7.4.2.2.1 Container-constrained scripts

[](#sec-scripted-container-constrained)

A *container-constrained script* is either of the following:

- An instance of the \[[html](#bib-html "HTML Standard")\] [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) element contained in an [XHTML content document](#dfn-xhtml-content-document) that is embedded in an XHTML content document using the \[[html](#bib-html "HTML Standard")\] [`iframe`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) element.

- An instance of the \[[svg](#bib-svg "SVG")\] [`script`](https://www.w3.org/TR/SVG/interact.html#ScriptElement) element contained in an [SVG content document](#dfn-svg-content-document) that is embedded in a XHTML content document using the \[[html](#bib-html "HTML Standard")\] [`iframe`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) element.

A container-constrained script *MUST NOT* contain instructions for modifying the DOM of the [EPUB content document](#dfn-epub-content-document) that embeds it (i.e., the one that contains the `iframe` element). It also *MUST NOT* contain instructions for manipulating the size of its containing rectangle.

Note that [support for container-constrained scripting in reading systems](https://www.w3.org/TR/epub-rs-34/#sec-scripted-content) is only recommended in reflowable documents \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] and optional in [fixed-layout documents](#dfn-fixed-layout-document).

Ensure that container-constrained scripts degrade gracefully in reading systems without scripting support (see [7.4.2.5 Scripting fallbacks](#sec-scripted-fallbacks)).

Note

Opting to restrict the usage of scripting to the container-constrained model will ensure a more consistent user experience between scripted and non-scripted content (e.g., consistent pagination behavior).

###### 7.4.2.2.2 Spine-level scripts

[](#sec-scripted-spine)

A *spine-level script* is an instance of the \[[html](#bib-html "HTML Standard")\] [`script`](https://html.spec.whatwg.org/multipage/scripting.html#script) or \[[svg](#bib-svg "SVG")\] [`script`](https://www.w3.org/TR/SVG/interact.html#ScriptElement) element contained in a [top-level content document](#dfn-top-level-content-document).

Note that support for spine-level scripting in [reading systems](#dfn-epub-reading-system) is only advised in [fixed-layout documents](https://www.w3.org/TR/epub-rs-34/#confreq-rs-scripted-fxl-support) and [reflowable documents set to scroll](https://www.w3.org/TR/epub-rs-34/#confreq-rs-scripted-scrolled) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\]. Furthermore, reading system support in all other contexts is optional.

[Top-level content documents](#dfn-top-level-content-document) that include spine-level scripting *SHOULD* remain consumable by the user without any information loss or other significant deterioration when scripting is disabled or not available (e.g., by employing progressive enhancement techniques or [fallbacks](#sec-scripted-fallbacks)). Failing to account for non-scripted environments in top-level content documents can result in [EPUB publications](#dfn-epub-publication) being unreadable.

##### 7.4.2.3 Event model

[](#sec-scripted-content-events)

*This section is non-normative.*

The wide variety of possible [reading system](#dfn-epub-reading-system) implementations need to be considered when adding scripting functionality to [EPUB publications](#dfn-epub-publication) (e.g., not all devices have physical keyboards, and in many cases a soft keyboard is activated only for text input elements). Consequently, do not rely on keyboard events alone; always provide alternative ways to trigger a desired action.

##### 7.4.2.4 Scripting accessibility

[](#sec-scripted-a11y)

[EPUB content documents](#dfn-epub-content-document) that contain scripting *SHOULD* employ relevant \[[wai-aria](#bib-wai-aria "Accessible Rich Internet Applications (WAI-ARIA)")\] accessibility techniques to ensure that the content remains consumable by all users.

##### 7.4.2.5 Scripting fallbacks

[](#confreq-cd-scripted-flbk)

[EPUB content documents](#dfn-epub-content-document) that contain scripting *MAY* provide fallbacks for such content, either by using intrinsic fallback mechanisms (such as those available for the \[[html](#bib-html "HTML Standard")\] [`object`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element) and [`canvas`](https://html.spec.whatwg.org/multipage/canvas.html#canvas) elements) or, when an intrinsic fallback is not applicable, by using a [manifest-level fallback](#sec-manifest-fallbacks).

Scripts *MUST* only generate [core media type resources](#sec-core-media-types) or fragments thereof.

#### 7.4.3 The `epub:type` attribute

[](#sec-epub-type-attribute)

##### 7.4.3.1 Structural semantics

[](#sec-structural-semantics)

Structural semantics add additional meaning about the specific structural purpose an element plays. The [`epub:type`](#dfn-epub-type) attribute is used to express domain-specific semantics in [EPUB content documents](#dfn-epub-content-document), with the structural information it carries complementing the underlying vocabulary. It is also usable in [media overlay documents](#dfn-media-overlay-document) to reflect the semantic structure of the content being played back.

The applied semantics refine the meaning of their containing elements without changing their nature for assistive technologies, as happens when using the similar [`role`](https://html.spec.whatwg.org/multipage/infrastructure.html#attr-aria-role) attribute \[[html](#bib-html "HTML Standard")\]. The attribute does not enhance the accessibility of the content, in other words; it only provides hints about the purpose.

Semantic metadata enriches content for use in publishing workflows and for author-defined purposes. It also allows [reading systems](#dfn-epub-reading-system) to learn more about the structure and content of a document (e.g., to enable [skippability and escapability](#sec-behaviors-skip-escape) in media overlays).

This specification defines a method for adding structural semantics using *the attribute axis*: instead of adding new elements, the `epub:type` attribute can be appended to existing elements to add the desired semantics.

##### 7.4.3.2 Syntax

[](#type-attr-syntax)

Attribute Name:  
`epub:type`

Namespace:  
`http://www.idpf.org/2007/ops`

Usage:  
Refer to the requirements for [XHTML](#sec-xhtml-structural-semantics), [SVG](#confreq-svg-structural-semantics), and [media overlays](#sec-overlays-def).

Value:  
A [whitespace-separated](https://www.w3.org/TR/xml/#NT-S) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] list of [compact URLs](#dfn-compact-url), with restrictions as defined in [5.3 Vocabulary association mechanisms](#sec-vocab-assoc).

Caution

Although the `epub:type` attribute is similar in nature to the [`role`](https://html.spec.whatwg.org/multipage/infrastructure.html#attr-aria-role) attribute \[[html](#bib-html "HTML Standard")\], the attributes serve different purposes. The values of the `epub:type` attribute do not enhance access through assistive technologies like screen readers as they do not map to the accessibility APIs used by these technologies. This means that adding `epub:type` values to semantically neutral elements like \[[html](#bib-html "HTML Standard")\] [`div`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-div-element) and [`span`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element) does not make them any more accessible to assistive technologies. Only ARIA roles influence how assistive technologies understand such elements.

The `epub:type` attribute is consequently only intended for publishing semantics and [reading system](#dfn-epub-reading-system) enhancements. Reading systems can use `epub:type` values to provide accessibility enhancements like built-in read aloud or media overlays functionality where interaction with assistive technologies is not essential.

Refer to [Digital Publishing WAI-ARIA Module](https://www.w3.org/TR/dpub-aria/) \[[dpub-aria](#bib-dpub-aria "Digital Publishing WAI-ARIA Module")\] for more information about accessible publishing roles.

The `epub:type` attribute inflects semantics on the element on which it appears. Its value is one or more whitespace-separated terms stemming from external vocabularies associated with the document instance.

The [default vocabulary](#dfn-default-vocabulary) for the `epub:type` attribute is the EPUB 3 Structural Semantics Vocabulary \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]. The prefix URL for referencing its properties is `http://idpf.org/epub/vocab/structure/#`.

Unprefixed terms that are not part of this vocabulary *MAY* be used but the preferred method for adding custom semantics is to use [prefixes](#sec-prefix-attr) for them. Refer to [5.3 Vocabulary association mechanisms](#sec-vocab-assoc) for more information.

[Example 64](#ex.epubtype.note): Identifying a preamble

``` xml
<html
    …
    xmlns:epub="http://www.idpf.org/2007/ops">
   …
   <body>
      …
      <section epub:type="preamble">
         …
      </section>
      …
   </body>
</html>
```

[Example 65](#ex.epubtype.gloss): Identifying a glossary

``` xml
<html
    …
    xmlns:epub="http://www.idpf.org/2007/ops">
   …
   <body>
      …
      <dl epub:type="glossary">
         …
      </dl>
      …
   </body>
</html>
```

[Example 66](#ex.epubtype.pg): Adding page break semantics

``` xml
<html
    …
    xmlns:epub="http://www.idpf.org/2007/ops">
   …
   <body>
      …
      <p>
         …
         <span
            epub:type="pagebreak"
            id="p234"
            role="doc-pagebreak"
            aria-label="234"/>
         …
      </p>
      …
   </body>
</html>
```

## 8. EPUB navigation document

[](#sec-nav)

### 8.1 Introduction

[](#sec-nav-intro)

*This section is non-normative.*

The [EPUB navigation document](#dfn-epub-navigation-document) is a [mandatory component](#confreq-nav) of an [EPUB publication](#dfn-epub-publication). It allows the inclusion of a human- and machine-readable global navigation layer, thereby ensuring increased usability and accessibility for the user.

The EPUB navigation document is a special type of [XHTML content document](#dfn-xhtml-content-document) that defines the [table of contents](#sec-nav-toc) for [reading systems](#dfn-epub-reading-system). It can also include other specialized navigation elements, such as a [page list](#sec-nav-pagelist) and a list of key [landmarks](#sec-nav-landmarks). These navigation elements have [additional restrictions](#sec-nav-def-model) on their content to facilitate their processing.

The EPUB navigation document is not exclusively for machine processing, however. There are no restrictions on the structure or content of the EPUB navigation document outside of the specialized navigation elements (i.e., the rest of the document can be marked up like any other XHTML content document). As a result, it can also be part of the linear reading order, avoiding the need for duplicate tables of contents. Navigation elements that are only meant for machine processing (e.g., the page list) can be hidden using the [`hidden` attribute](#sec-nav-doc-use-spine).

Note that reading systems might strip scripting, styling, and HTML formatting as they generate navigational interfaces from information found in the EPUB navigation document, and this could make the result difficult to read. If such formatting and functionality is necessary, then the EPUB navigation document can also be included in the [spine](#dfn-epub-spine). The use of progressive enhancement techniques for scripting and styling of the navigation document will help ensure the content will retain its integrity when rendered in a non-browser context.

### 8.2 Navigation document requirements

[](#sec-nav-content-req)

A valid EPUB navigation document:

- *MUST* conform to the content conformance constraints for [XHTML content documents](#dfn-xhtml-content-document) defined in [7.1.2 XHTML requirements](#sec-xhtml-req);

- *MUST* conform to the `nav` element constraints defined [8.3 The `nav` element: restrictions](#sec-nav-def-model);

- *MUST* include exactly one [`toc nav` element](#sec-nav-toc).

- *MAY* include exactly one [`page-list nav` element](#sec-nav-pagelist).

- *MAY* include exactly one [`landmarks nav` element](#sec-nav-landmarks).

- *MAY* contain one or more additional [`nav` elements](#sec-nav-def-types-other).

### 8.3 The `nav` element: restrictions

[](#sec-nav-def-model)

When a `nav` element carries the [`epub:type`](#dfn-epub-type) attribute in an [EPUB navigation document](#dfn-epub-navigation-document), this specification restricts the content model of the element and its descendants as follows:

Content Model:  
[`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element)  
In this order:

- [`h1-h6`](https://html.spec.whatwg.org/multipage/#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) `[0 or 1]`

- [`ol`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element) `[exactly 1]`

[`ol`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element)  
In this order:

- [`li`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element) `[1 or more]`

[`li`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)  
In this order:

- ([`span`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element) or [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)) `[exactly 1]`

- [`ol`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element) `[conditionally required]`

[`span`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element) and [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)  
In any order:

- [HTML Phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2) `[1 or more]`

Note that there are no restrictions on the attributes allowed on these elements.

Refer the definition below for additional requirements.

The following elaboration of the content model of the `nav` element explains the purpose and restrictions of the various elements:

- The `ol` child of the `nav` element represents the primary level of content navigation.

- Each list item of the ordered list represents a heading, structure, or other item of interest. A child `a` element describes the target that the link points to, while a `span` element serves as a heading for breaking down lists into distinct groups. For example, a large list of illustrations could be split into several lists, one for each chapter.

- The child `a` or `span` element *MUST* provide a non-zero-length text label after concatenation of all child content and application of whitespace normalization rules. When determining compliance with this requirement, the concatenated label *MUST* include text content contained in `title` or `alt` attributes for non-textual descendant elements.

- If an `a` or `span` element contains instances of [HTML embedded content](https://html.spec.whatwg.org/multipage/dom.html#embedded-content-category) \[[html](#bib-html "HTML Standard")\] that do not provide intrinsic text alternatives, the element *MUST* also contain a `title` attribute with an alternate text rendering of the link label.

- The URL \[[url](#bib-url "URL Standard")\] reference provided in the `href` attribute of the `a` element:

  - *MUST*, in the case of the [`toc nav`](#sec-nav-toc), [`landmarks nav`](#sec-nav-landmarks) and [`page-list nav`](#sec-nav-pagelist), resolve to a [top-level content document](#dfn-top-level-content-document) or fragment therein.

  - *MAY*, for all other `nav` types, also reference content outside the [EPUB container](#dfn-epub-container) (e.g., web-hosted resources).

- An `ol` (ordered list) element representing a subsidiary content level (e.g., all the subsection headings of a section) *MAY* follow an `a` element.

- An `ol` (ordered list) element *MUST* follow a `span` element (`span` elements cannot occur in "leaf" `li` elements).

- Regardless of whether an `a` or `span` element precedes it, every sublist *MUST* adhere to the content requirements defined in this section for constructing the primary navigation list.

[Example 67](#example-basic-patterns-of-a-navigation-element): Basic patterns of a navigation element

``` xml
<nav epub:type="…">
   <h1>…</h1>
   <ol>
      <li>
         <a href="chap1.xhtml">
            A basic leaf node
         </a>
      </li>
      <li>
         <a href="chap2.xhtml">
            A linked heading
         </a>
         <ol>
            …
         </ol>
      </li>
      <li>
         <span>An unlinked heading</span>
         <ol>
            …
         </ol>
      </li>
      <li>
         <a href="appendix.xhtml">
            <img src="app1.jpg" alt="An image-based heading"/>
         </a>
      </li>
   </ol>
</nav>
```

Caution

Although the headings and links in `nav` elements allow any \[[html](#bib-html "HTML Standard")\] [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2), app-based reading systems often only support simple text labels. Because these apps create their own navigation widgets that are not based on HTML rendering, they often cannot retain embedded images and multimedia, MathML, inline styling and other element- and attribute-based rendering instructions. It is advised to avoid using this type of content where its absence will lead to usability issues.

### 8.4 The `nav` element: types

[](#sec-nav-def-types)

#### 8.4.1 Introduction

[](#sec-nav-def-types-intro)

*This section is non-normative.*

The `nav` elements defined in an [EPUB navigation document](#dfn-epub-navigation-document) are distinguished semantically by the value of their [`epub:type`](#dfn-epub-type) attribute.

This specification defines three types of navigation aid:

[`toc`](#sec-nav-toc)  
Identifies the `nav` element that contains the table of contents. The `toc nav` is the only navigation aid that has to be included in the EPUB navigation document.

[`page-list`](#sec-nav-pagelist)  
Identifies the `nav` element that contains a list of pages for a print or other statically paginated source.

[`landmarks`](#sec-nav-landmarks)  
Identifies the `nav` element that contains a list of points of interest.

An EPUB navigation document can contain at most one navigation aid for each of these types. It can also include additional navigation types. See [8.4.5 Other `nav` elements](#sec-nav-def-types-other) for more information.

#### 8.4.2 The `toc nav` element

[](#sec-nav-toc)

The primary navigational hierarchy of an [EPUB publication](#dfn-epub-publication) is defined in a [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) element \[[html](#bib-html "HTML Standard")\] whose [`epub:type`](#dfn-epub-type) attribute set to the value "[toc](https://www.w3.org/TR/epub-ssv-11/#toc-1)" \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] (i.e., the `toc nav` element). This element conceptually corresponds to a table of contents in a printed work — it provides navigation to the major structural sections of the publication.

The references in the `toc nav` element *SHOULD* be ordered such that they reflect both:

- the order of the [referenced EPUB content documents](#confreq-nav-a-href) in the [spine](#dfn-epub-spine); and

- the order of the targeted elements within their respective [EPUB content documents](#dfn-epub-content-document).

[Example 68](#example-simple-table-of-contents): Simple table of contents

``` xml
<nav epub:type="toc">
   <h2>Table of contents</h2>
   <ol>
      <li><a href="preface.html#p01">Preface</a></li>
      <li><a href="chapter01.html#h01">Chapter 1</a></li>
      <li><a href="chapter02.html#h02">Chapter 2</a></li>
      …
   </ol>
</nav>
```

[Example 69](#example-structured-table-of-contents): Structured table of contents

``` xml
<nav epub:type="toc">
   <h2>Table of contents</h2>
   <ol>
      <li>
         <a href="part01.html#p01">Part I</a>
         <ol>
            <li>
               <a href="section01.html#s01">Section 1</a>
               <ol>
                  <li><a href="section01.html#s01-01">Section 1.1</a></li>
                  <li><a href="section01.html#s01-02">Section 1.2</a></li>
                  …
               </ol>
            </li>
            …
         </ol>
      </li>
      …
   </ol>
</nav>
```

#### 8.4.3 The `page-list nav` element

[](#sec-nav-pagelist)

The page list provides navigation to static page boundaries in the content. These boundaries either correspond to a statically paginated source such as print or are exclusively for the [EPUB publication](#dfn-epub-publication).

The page list is defined in a [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) element \[[html](#bib-html "HTML Standard")\] whose [`epub:type`](#dfn-epub-type) attribute is set to the value "[page-list](https://www.w3.org/TR/epub-ssv-11/#page-list)" \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] (i.e., the `page-list nav` element).

The `page-list nav` element *SHOULD* contain only a single `ol` descendant (i.e., no nested sublists).

[Example 70](#example-page-list-with-destination): Page list with destination

Page list markup in the EPUB navigation document:

``` xml
<nav epub:type="page-list">
   <h2>Page list</h2>
   <ol>
      <li><a href="chapter01.html#p001">1</a></li>
      …
   </ol>
</nav>
```

The destination for the first page in `chapter01.html` identified by \[[html](#bib-html "HTML Standard")\] [`role`](https://html.spec.whatwg.org/multipage/infrastructure.html#attr-aria-role) attribute value [`doc-pagebreak`](https://www.w3.org/TR/dpub-aria/#doc-pagebreak) \[[dpub-aria](#bib-dpub-aria "Digital Publishing WAI-ARIA Module")\] and the [`epub:type`](#dfn-epub-type) value [`pagebreak`](https://www.w3.org/TR/epub-ssv-11/#pagebreak) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]:

``` xml
<html …>
   …
   <body>
      <div epub:type="pagebreak" role="doc-pagebreak">1</div>
      …
   </body>
</html>
```

Refer to the [`epub:type` attribute syntax](#type-attr-syntax) for more information about the use of these attributes.

#### 8.4.4 The `landmarks nav` element

[](#sec-nav-landmarks)

Landmarks identify fundamental structural components of the content to enable [reading systems](#dfn-epub-reading-system) to provide the user efficient access to them (e.g., through a dedicated button in the user interface).

Landmarks are defined in a [`nav`](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element) element \[[html](#bib-html "HTML Standard")\] whose [`epub:type`](#dfn-epub-type) attribute is set to the value "[landmarks](https://www.w3.org/TR/epub-ssv-11/#landmarks)" \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] (i.e., the `landmarks nav` element).

The `landmarks nav` element *SHOULD* contain only a single `ol` descendant (i.e., no nested sublists).

The [`epub:type`](#dfn-epub-type) attribute is *REQUIRED* on `a` element descendants of the `landmarks nav` element. The structural semantics of each link target within the `landmarks nav` element is determined by the value of this attribute.

[Example 71](#example-a-basic-landmarks-nav): A basic landmarks nav

In this example, the `epub:type` attribute value are drawn from structural semantics drawn from \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\].

``` xml
<nav epub:type="landmarks">
   <h2>Guide</h2>
   <ol>
       <li>
          <a epub:type="toc"
             href="#toc">
            Table of Contents
          </a>
       </li>
       <li>
          <a epub:type="loi"
             href="content.html#loi">
            List of Illustrations
          </a>
       </li>
       <li>
          <a epub:type="bodymatter"
             href="content.html#bodymatter">
            Start of Content
          </a>
       </li>
   </ol>
</nav>
```

The `landmarks nav` *MUST NOT* include multiple entries with the same `epub:type` value that reference the same resource, or fragment thereof.

It is advised to limit the number of items defined in the `landmarks nav` to only items that a reading system is likely to use in its user interface. The element is not meant to repeat the table of contents.

It is advised to include the following landmarks when available:

- [`bodymatter`](https://www.w3.org/TR/epub-ssv-11/#bodymatter) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] — Reading systems often use this landmark to automatically jump users past the front matter when they begin reading.
- [`toc`](https://www.w3.org/TR/epub-ssv-11/#toc-1) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] — If the table of contents is available in the spine, reading systems can use this landmark to take users to the document containing it.

Other possibilities for inclusion in the `landmarks nav` are key reference sections such as indexes and glossaries.

Although the `landmarks nav` is intended for reading system use, it is still advised to ensure that the labels for the `landmarks nav` are human readable. Reading systems might expose the links directly to users.

#### 8.4.5 Other `nav` elements

[](#sec-nav-def-types-other)

If additional `nav` elements are needed in the EPUB navigation document for [reading system](#dfn-epub-reading-system) processing, they:

- *MUST* specify an [`epub:type`](#dfn-epub-type) attribute;
- *MUST* adhere to the content model restrictions in [8.3 The `nav` element: restrictions](#sec-nav-def-model).

This specification imposes no restrictions on the semantics of any additional `nav` elements: they *MAY* represent navigational semantics for any information domain, and they *MAY* contain link targets with homogeneous or heterogeneous semantics.

[Example 72](#example-adding-a-custom-navigation-element): Adding a custom navigation element

In this example, the `lot` semantic indicates that `nav` element contains a list of tables.

``` xml
<nav
    epub:type="lot"
    aria-labelledby="lot">
   <h2 id="lot">List of tables</h2>
   <ol>
      <li>
         <span>Tables in Chapter 1</span>
         <ol>
            <li>
               <a href="chap1.xhtml#table-1.1">
                  Table 1.1
               </a>
            </li>
            <li>
               <a href="chap1.xhtml#table-1.2">
                  Table 1.2
               </a>
            </li>
         </ol>
      </li>
      …
   </ol>
</nav>
```

### 8.5 Using in the spine

[](#sec-nav-doc-use-spine)

*This section is non-normative.*

As a conforming [XHTML content document](#dfn-xhtml-content-document), the EPUB navigation document can be included in the [spine](#dfn-epub-spine).

When adding the navigation document to the spine, consider that any [reading system](#dfn-epub-reading-system) processing of the document will not apply. In particular, although [EPUB reading systems](#dfn-epub-reading-system) [have to suppress list item numbering](https://www.w3.org/TR/epub-rs-34/#confreq-nav-ol-style) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] when presenting the EPUB navigation document outside of the spine (such as in dedicated navigation user interfaces provided by reading systems), this requirement does not apply to in-spine use. Consequently, if HTML's default list item numbering is not wanted when presenting the navigation document in the spine, alternative list styling has to be provided using CSS.

Similarly, it is often the case that not all of the navigation structures, or branches within them, are needed when the EPUB navigation document is presented in the spine. It is often preferred to hide the [page list](#sec-nav-pagelist) and [landmarks](#sec-nav-landmarks) navigation elements, for example, or to trim of the table of contents for books that have many levels of subsections.

In these cases, it is advised to use the \[[html](#bib-html "HTML Standard")\] [`hidden`](https://html.spec.whatwg.org/multipage/interaction.html#attr-hidden) attribute to indicate which (if any) portions of the navigation data are excluded from rendering in the content flow. The [attribute has no effect](https://www.w3.org/TR/epub-rs-34/#confreq-nav-hidden) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] on how reading systems render the navigation document outside of the spine.

Note

While the [`display` property](https://www.w3.org/TR/CSS2/visuren.html#propdef-display) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\] controls the visual rendering of EPUB navigation documents in [reading systems](#dfn-epub-reading-system) with [viewports](#dfn-viewport), reading systems without viewports might not support CSS. The `hidden` attribute can be used together with the `display` property to maximize interoperability across all reading systems.

[Example 73](#example-hiding-a-nav-element-in-spine): Hiding a nav element in spine

In this example, the presence of the `hidden` attribute on the `nav` element indicates the page list will be excluded from rendering in the content flow when the document is rendered in the spine.

``` xml
<nav
    epub:type="page-list"
    hidden="hidden">
   <h2>Pagebreaks of the print version, third edition</h2>
   <ol>
      <li>
         <a href="frontmatter.xhtml#pi">
            I
         </a>
      </li>
      …
   </ol>
</nav>
```

[Example 74](#example-hiding-branches-of-a-nav-element): Hiding branches of a nav element

In this example, the branch (`ol` element) not wanted for rendering in the spine has the `hidden` attribute on it. When rendered, this limits the table of content to the two top-most hierarchical levels.

``` xml
<nav
    epub:type="toc"
    id="toc">
   <h1>Table of contents</h1>
   <ol>
      <li>
         <a href="chap1.xhtml">
            Chapter 1
         </a>
         <ol>
            <li>
               <a href="chap1.xhtml#sec-1.1">
                  Chapter 1.1
               </a>
               <ol hidden="">
                  <li>
                     <a href="chap1.xhtml#sec-1.1.1">
                        Section 1.1.1
                     </a>
                  </li>
                  …
               </ol>
            </li>
            …
         </ol>
      </li>
      …
   </ol>
</nav>
```

## 9. Aural rendering

[](#sec-aural-rendering)

### 9.1 Introduction

[](#sec-aural-intro)

*This section is non-normative.*

Although EPUB 3 is primarily considered a visual reading format, [EPUB publications](#dfn-epub-publication) are designed to enable their aural rendering. There are two primary ways this is done:

- through the [text-to-speech rendering](#sec-tts) of an EPUB publication's text content; and
- through the provision of prerecorded audio whose playback is synchronized with the text, referred to as [media overlays](#sec-media-overlays) in this specification.

The experience of reading an EPUB publication via text-to-speech rendering is controlled by a user's [reading system](#dfn-epub-reading-system) using built-in synthetic speech voices. This feature is commonly referred to as "read aloud" capability, although the exact naming can differ from reading system to reading system.

Although the read aloud functionality provided by EPUB 3 reading systems improves the accessibility for users with disabilities that require voice assistance, it is not the same as the text-to-speech rendering provided by dedicated assistive technologies (what are generally referred to as screen readers). Read aloud functionality is designed for use by all users as it exists within the reading system, not as a separate application. For example, someone travelling might switch from visual to auditory reading to avoid motion sickness. Although both types of text-to-speech renders could exist on a user's system, and could both be used to read EPUB publications, this specification is only focused on the built-in functionality provided by reading systems.

Media overlays, on the other hand, rely on the producer of the EPUB publication to provide the audio and synchronize it with the text. Media overlays allow an EPUB publication to double as a more traditional audiobook, but with the benefit that users can also read along with the text as the audio is being played.

While media overlays are typically used to provide professional narration, this is only a convention. Text-to-speech playback of the content can also be recorded and synchronized using media overlays, and human and synthetic voicings are often mixed (e.g., human narration for the body and synthetic narration of the backmatter as it is more tedious and time-consuming for a human to read). It is also possible to use a media overlay to specify that a reading system use its [text-to-speech capabilities](#sec-mo-tts) to read the associated text, but in practice this feature is not well supported.

Media overlay playback and text-to-speech playback are not mutually exclusive features. An EPUB publication that includes prerecorded narration via a media overlay could still be read by a user using their reading system's read aloud feature.

### 9.2 Text-to-speech

[](#sec-tts)

*This section is non-normative.*

There are currently no broadly supported technologies for improving the quality of text-to-speech playback. The original design for EPUB 3 was to make use of three technologies:

- SSML \[[ssml](#bib-ssml "Speech Synthesis Markup Language (SSML) Version 1.1")\] — two attributes based on SSML were added to inline word pronunciation.
- Pronunciation lexicons \[[pronunciation-lexicon](#bib-pronunciation-lexicon "Pronunciation Lexicon Specification (PLS) Version 1.0")\] — allow a dictionary of pronunciations to be included with an EPUB publication.
- CSS Speech \[[css-speech](#bib-css-speech "CSS Speech Module Level 1")\] — provides aural playback control through CSS classes and stylesheets.

The future of these technologies is uncertain although all are valid to use in EPUB publications. The EPUB SSML attributes are the least likely to become supported as the goal of EPUB 3 now is to use web-supported technologies whenever possible. Work on a web-friendly method of [adding SSML support](https://www.w3.org/WAI/about/groups/task-forces/spoken-presentation/) is likely to succeed these attributes if it can get traction. Pronunciation lexicons have only achieved limited, regional support. And there is the possibility that future work could revive CSS Speech in a more limited form, but this is also a work in progress.

Note

For more information about these technologies and how they can be used in EPUB 3, refer to [EPUB 3 Text-to-Speech Enhancements 1.0](https://www.w3.org/TR/epub-tts-10/) \[[epub-tts-10](#bib-epub-tts-10 "EPUB 3 Text-to-Speech Enhancements 1.0")\].

This section will be updated whenever these or other technologies become broadly usable in EPUB publications.

At this time, the best advice for improving text-to-speech playback in reading systems is to ensure that EPUB publications are accessible per \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\]. This will ensure that structure and semantics are available to aid reading systems in playback and that text alternatives are available for users who cannot perceive visual content.

### 9.3 Media overlays

[](#sec-media-overlays)

#### 9.3.1 Introduction

[](#sec-overlays-introduction)

*This section is non-normative.*

Mainstream ebooks, educational tools and ebooks formatted for persons with print disabilities are some examples of works that contain synchronized audio narration. In EPUB 3, these types of books can be created using media overlay documents to describe the timing for the pre-recorded audio narration and how it relates to the [EPUB content document](#dfn-epub-content-document) markup. The specification defines the file format for media overlays as a subset of \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\], a W3C Recommendation for representing synchronized multimedia information in XML.

The text and audio synchronization enabled by media overlays provides enhanced accessibility for any user who has difficulty following the text of a traditional book. Media overlays also provide a continuous listening experience for readers who are unable to read the text for any reason, something that traditional audio embedding techniques cannot offer. They are even useful for purposes not traditionally considered accessibility concerns (e.g., for language learning).

The media overlays feature is transparent to [EPUB reading systems](#dfn-epub-reading-system) that do not support the feature. The inclusion of media overlays in an [EPUB publication](#dfn-epub-publication) has no impact on the ability of media overlay-unaware reading systems to render the EPUB publication as though the media overlays are not present.

Media overlays in EPUB are not an equivalent to audiobooks, as audiobooks are primarily audio-based with text occasionally provided as an alternate format. The W3C \[[audiobooks](#bib-audiobooks "Audiobooks")\] recommendation is for building audio publications.

Although future versions of this specification might incorporate support for video media (e.g., synchronized text/sign-language books), this version supports only synchronizing audio media with the EPUB content document.

#### 9.3.2 Media overlay documents

[](#sec-overlay-docs)

##### 9.3.2.1 Media overlay document requirements

[](#sec-overlay-req)

A [media overlay document](#dfn-media-overlay-document):

- *MUST* be valid to the media overlays schema as defined in [F.3 Media overlays schema](#app-schema-overlays) and conform to all content conformance constraints expressed in [9.3.2.2 Media overlay document definition](#sec-overlays-def).

- *MAY* refer to more than one [EPUB content document](#dfn-epub-content-document), but more than one media overlay document *MUST NOT* reference the same EPUB content document.

##### 9.3.2.2 Media overlay document definition

[](#sec-overlays-def)

All elements \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] defined in this section are in the `http://www.w3.org/ns/SMIL` namespace \[[xml-names](#bib-xml-names "Namespaces in XML 1.0 (Third Edition)")\] unless otherwise specified.

###### 9.3.2.2.1 The `smil` element

[](#sec-smil-smil-elem)

The `smil` element encapsulates all the information in an [media overlay document](#dfn-media-overlay-document).

Element Name:  
`smil`

Usage:  
*REQUIRED* [root element](https://www.w3.org/TR/xml/#dt-root) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the media overlay document.

Attributes:  
`version` `[required]`  
Specifies the version number of the \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\] specification to which the media overlay document adheres.

This attribute *MUST* have the value "`3.0`".

`id` `[optional]`  
The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

`epub:prefix` `[optional]`  
Declares additional metadata vocabulary prefixes.

Refer to [9.3.3.3 Structural semantics in overlays](#sec-docs-structural-semantic) for more information.

Content Model:  
In this order:

- [`head`](#dfn-head) `[0 or 1]`

- [`body`](#dfn-body) `[exactly 1]`

###### 9.3.2.2.2 The `head` element

[](#sec-smil-head-elem)

The `head` element is the container for metadata in the [media overlay document](#dfn-media-overlay-document).

Element Name:  
`head`

Usage:  
The `head` element is the *OPTIONAL* first child of the [`smil`](#dfn-smil) element.

Attributes:  
None

Content Model:  
[`metadata`](#dfn-metadata) `[0 or 1]`

As this specification does not define any metadata properties that has to occur in the media overlay document, the `head` element is *OPTIONAL*.

###### 9.3.2.2.3 The `metadata` element

[](#sec-smil-metadata-elem)

The `metadata` element represents metadata for the [media overlay document](#dfn-media-overlay-document). The `metadata` element is an extension point that allows the inclusion of metadata from any metainformation structuring language.

Element Name:  
`metadata`

Usage:  
As a child of the [`head`](#dfn-head) element.

Attributes:  
None

Content Model:  
`[0 or more]` elements from any namespace

This specification does not require any metadata properties in the media overlay document; the `metadata` element is provided for custom metadata requirements.

###### 9.3.2.2.4 The `body` element

[](#sec-smil-body-elem)

The `body` element is the starting point for the presentation contained in the [media overlay document](#dfn-media-overlay-document). It contains the main sequence of [`par`](#dfn-par) and [`seq`](#dfn-seq) elements.

Element Name:  
`body`

Usage:  
The `body` element is a *REQUIRED* child of the [`smil`](#dfn-smil) element. It follows the [`head`](#dfn-head) element, when that element is present.

Attributes:  
`epub:type` `[optional]`  
An expression of the structural semantics of the corresponding element in the [EPUB content document](#dfn-epub-content-document).

The value is a whitespace-separated list of [compact URLs](#dfn-compact-url). Refer to [9.3.3.3 Structural semantics in overlays](#sec-docs-structural-semantic) for more information.

`id` `[optional]`  
The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

`epub:textref` `[optional]`  
Refers to the associated EPUB content document and, optionally, identifies a specific part of it.

The value *MUST* be a [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string), optionally followed by `U+0023 (#)` and a [URL-fragment string](https://url.spec.whatwg.org/#url-fragment-string).

Content Model:  
In any order:

- [`seq`](#dfn-seq) `[0 or more]`

- [`par`](#dfn-par) `[0 or more]`

*MUST* include at least one `par` or `seq`.

###### 9.3.2.2.5 The `seq` element

[](#sec-smil-seq-elem)

The `seq` element is a sequential time container for media objects and/or child time containers.

Element Name:  
`seq`

Usage:  
One or more `seq` elements *MAY* occur as children of the [`body`](#dfn-body) element and of the [`seq`](#dfn-seq) element.

Attributes:  
`epub:type` `[optional]`  
An expression of the structural semantics of the corresponding element in the [EPUB content document](#dfn-epub-content-document).

The value is a whitespace-separated list of [compact URLs](#dfn-compact-url). Refer to [9.3.3.3 Structural semantics in overlays](#sec-docs-structural-semantic) for more information.

`id` `[optional]`  
The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

`epub:textref` `[required]`  
Refers to the associated [EPUB content document](#dfn-epub-content-document) and, optionally, identifies a specific part of it.

The value *MUST* be a [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string), optionally followed by `U+0023 (#)` and a [URL-fragment string](https://url.spec.whatwg.org/#url-fragment-string).

Refer to [9.3.3.2.1 Overlay structure](#sec-media-overlays-structure) for more information.

Content Model:  
In any order:

- [`seq`](#dfn-seq) `[0 or more]`

- [`par`](#dfn-par) `[0 or more]`

*MUST* include at least one `par` or `seq`.

###### 9.3.2.2.6 The `par` element

[](#sec-smil-par-elem)

The `par` element is a parallel time container for media objects.

Element Name:  
`par`

Usage:  
One or more `par` elements *MAY* occur as children of the [`body`](#dfn-body) and [`seq`](#dfn-seq) elements.

Attributes:  
`epub:type` `[optional]`  
An expression of the structural semantics of the corresponding element in the [EPUB content document](#dfn-epub-content-document).

The value is a whitespace-separated list of [compact URLs](#dfn-compact-url). Refer to [9.3.3.3 Structural semantics in overlays](#sec-docs-structural-semantic) for more information.

`id` `[optional]`  
The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

Content Model:  
In any order:

- [`text`](#dfn-text) `[exactly 1]`

- [`audio`](#dfn-audio) `[0 or 1]`

###### 9.3.2.2.7 The `text` element

[](#sec-smil-text-elem)

The `text` element references an element in an [EPUB content document](#dfn-epub-content-document). A `text` element typically refers to a textual element but can also refer to other [EPUB content document](#dfn-epub-content-document) media elements. In the absence of a sibling [`audio`](#dfn-audio) element, a [reading system](#dfn-epub-reading-system) is expected to render the textual content referred to by this element via [text-to-speech](#sec-mo-tts).

Element Name:  
`text`

Usage:  
As a *REQUIRED* child of the [`par`](#dfn-par) element.

Attributes:  
`src` `[required]`  
Refers to the associated EPUB content document and, optionally, identifies a specific part of it.

The value *MUST* be a [path-relative-scheme-less-URL string](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string), optionally followed by `U+0023 (#)` and a [URL-fragment string](https://url.spec.whatwg.org/#url-fragment-string).

`id` `[optional]`  
The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

Content Model:  
Empty

Note

This specification places no restriction on the `src` attribute of a `text` element, but it is advised that the attribute reference content that can be styled with CSS to make the [association with style information](#sec-docs-assoc-style) effective. For XHTML, this means referencing [palpable content](https://html.spec.whatwg.org/multipage/dom.html#palpable-content-2). For SVG, it means referencing [paths](https://www.w3.org/TR/SVG11/paths.html), [basic shapes](https://www.w3.org/TR/SVG11/shapes.html), or [text](https://www.w3.org/TR/SVG11/text.html) elements.

Note

\[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] no longer provides guidance for reading systems on the playback of timed media (i.e., the automatic starting of the referenced media). Although the `src` attribute of a `text` element can refer to embedded timed media (e.g., via an \[[html](#bib-html "HTML Standard")\] [`video`](https://html.spec.whatwg.org/multipage/media.html#video) element), referencing such media can have unpredictable results.

###### 9.3.2.2.8 The `audio` element

[](#sec-smil-audio-elem)

The `audio` element represents a clip of audio media.

Element Name:  
`audio`

Usage:  
An *OPTIONAL* child of the [`par`](#dfn-par) element.

Attributes:  
`id` `[optional]`  
The [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the element, which *MUST* be unique within the document scope.

`src` `[required]`  
The [relative-](https://url.spec.whatwg.org/#relative-url-string) or [absolute-URL string](https://url.spec.whatwg.org/#absolute-url-string) \[[url](#bib-url "URL Standard")\] reference to an audio file. The audio file *MUST* be one of the audio formats listed in the [core media type resources](#sec-core-media-types) table.

MP3 (`audio/mpeg`) audio files \[[mp3](#bib-mp3 "Information technology — Coding of moving pictures and associated audio for digital storage media at up to about 1,5 Mbit/s — Part 3: Audio")\] encoded with variable bitrate are not well suited for precise seeking because seeking accuracy is generally inversely correlated with audio track length. Consequently, variable bitrate MP3 audio *SHOULD NOT* be used for media overlays.

`clipBegin` `[optional]`  
A clock value that specifies the offset into the physical media corresponding to the start point of an audio clip.

*MUST* be a \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\] [clock value](https://www.w3.org/TR/SMIL3/smil-timing.html#q22).

See [A.4 Clock values](#clock-examples).

`clipEnd` `[optional]`  
A clock value that specifies the offset into the physical media corresponding to the end point of an audio clip.

*MUST* be a \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\] [clock value](https://www.w3.org/TR/SMIL3/smil-timing.html#q22).

See [A.4 Clock values](#clock-examples).

The chronological offset of the terminating position *MUST* be after the starting offset specified in the `clipBegin` attribute.

Content Model:  
Empty

#### 9.3.3 Creating media overlays

[](#sec-overlay-doc-create)

##### 9.3.3.1 Introduction

[](#sec-docs-intro)

*This section is non-normative.*

A pre-recorded narration of a publication can be represented as a series of audio clips, each corresponding to part of an [EPUB content document](#dfn-epub-content-document). A single audio clip, for example, typically represents a single phrase or paragraph, but infers no order relative to the other clips or to the text of a document. Media overlays solve this problem of synchronization by tying the structured audio narration to its corresponding text (or other media) in the EPUB content document using \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\] markup. Media overlays are, in fact, a simplified subset of SMIL 3.0 that define the playback sequence of these clips.

The SMIL elements primarily used for structuring media overlays are [`body`](#dfn-body) (used for the main sequence), [`seq`](#dfn-seq) (sequence) and [`par`](#dfn-par) (parallel). (Refer to [9.3.2.2 Media overlay document definition](#sec-overlays-def) for more information on these and other SMIL elements.)

The `par` element is the basic building block of a media overlay and corresponds to a phrase in the EPUB content document. The element provides two key pieces of information for synchronizing content: 1) the audio clip containing the narration for the phrase; and 2) a pointer to the associated EPUB content document fragment. The `par` element uses two media element children to represent this information: an [`audio`](#dfn-audio) element and a [`text`](#dfn-text) element. Because `par` elements' media object children are timed in parallel, reading systems render the audio clip and EPUB content document fragment at the same time, resulting in a synchronized presentation.

The `text` element `src` attribute references the associated phrase, sentence, or other segment of the EPUB content document by its URL \[[url](#bib-url "URL Standard")\] reference. The `audio` element `src` attribute similarly references the location of the corresponding audio clip and adds the [`clipBegin`](#attrdef-smil-clipBegin) and [`clipEnd`](#attrdef-smil-clipEnd) attributes to indicate a specific offset within the clip.

[Example 75](#example-media-overlays-markup-for-a-single-phrase-or-sentence): Media overlays markup for a single phrase or sentence

``` abnf
<par>
   <text
       src="chapter1.xhtml#sentence1"/>
   <audio
       src="chapter1_audio.mp3"
       clipBegin="23s"
       clipEnd="30s"/>
</par>
```

`par` elements are placed together sequentially to form series of phrases or sentences. Not every element of the EPUB content document will have a corresponding `par` element in a media overlay document, only those relevant to the audio narration.

[Example 76](#example-a-basic-media-overlay-document-containing-a-sequence-of-phrases): A basic media overlay document containing a sequence of phrases

In this example, the `body` element acts as the main sequence for the whole document.

``` abnf
<smil
    xmlns="http://www.w3.org/ns/SMIL"
    version="3.0">
   <body>
      <par id="par1">
         <text
             src="chapter1.xhtml#sentence1"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="0s"
             clipEnd="10s"/>
      </par>
      <par id="par2">
         <text
             src="chapter1.xhtml#sentence2"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="10s"
             clipEnd="20s"/>
      </par>
      <par id="par3">
         <text
             src="chapter1.xhtml#sentence3"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="20s"
             clipEnd="30s"/>
      </par>
   </body>
</smil>
```

`par` elements can also be added to `seq` elements to define more complex structures such as parts and chapters (see [9.3.3.2.1 Overlay structure](#sec-media-overlays-structure)).

##### 9.3.3.2 Relationship to the EPUB content document

[](#sec-docs-relations)

Note

In this section, the [EPUB content document](#dfn-epub-content-document) is assumed to be an [XHTML content document](#dfn-xhtml-content-document). While media overlays can be used with [SVG content documents](#dfn-svg-content-document), playback behavior might not be consistent and therefore interoperability is not guaranteed.

[Reading system](#dfn-epub-reading-system) support for playback of both reflowable and fixed-layout EPUB content documents is not guaranteed. Differences in reading system pagination strategies mean that some reading systems will only support media overlays in one or the other layout format.

###### 9.3.3.2.1 Overlay structure

[](#sec-media-overlays-structure)

The [`body`](#dfn-body) of a [media overlay document](#dfn-media-overlay-document) consists of two elements: the [`par`](#dfn-par) element and the [`seq`](#dfn-seq) element. The ordering of these elements represents how [reading systems](#dfn-epub-reading-system) render the content in the corresponding [EPUB content documents](#dfn-epub-content-document) during playback.

The `par` element represents a segment of content, such as a word, phrase, sentence, table cell, list item, image, or other identifiable piece of content in the markup. Each element identifies both the content to display (in the [`text`](#dfn-text) element) and audio to synchronize (in the [`audio`](#dfn-audio) element) during playback.

The `seq` element represents sequences — sets of `seq` and/or `par` elements that together represent a logical component of the content. The element is used to represent nested containers such as sections, asides, headers, tables, lists, and footnotes. It allows the structure inherent in these containers to be retained in the media overlay document.

The `seq` element *MUST* contain an [`epub:textref` attribute](#attrdef-body-textref). As `seq` elements do not provide synchronization instructions, this attribute allows a [reading system](#dfn-epub-reading-system) to match the fragment to a location in the text.

Note

The reason for grouping structures like sections, figures, tables, and footnotes in a `seq` element is so that reading systems can identify their start and end positions during playback. Reading systems can then offer playback options tailored to the layout of the content, such as jumping past a long figure, turning off rendering of page break announcements (see [9.3.4 Skippability and escapability](#sec-behaviors-skip-escape)), or customizing the reading mode to suit structures such as tables.

[Example 77](#example-mo-nesting): A media overlay document with nested seq elements

This example shows a chapter with both a section header and a figure.

Media overlay document:

``` xml
<smil
    xmlns="http://www.w3.org/ns/SMIL"
    xmlns:epub="http://www.idpf.org/2007/ops"
    version="3.0">
   <body>

      <!-- a chapter -->

      <seq
          id="id1"
          epub:textref="chapter1.xhtml#sectionstart"
          epub:type="chapter">

         <!-- the section title -->

         <par id="id2">
            <text
                src="chapter1.xhtml#section1_title"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:23:23.84"
                clipEnd="0:23:34.221"/>
         </par>

         <!-- some sentences in the chapter -->

         <par id="id3">
            <text
                src="chapter1.xhtml#text1"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:23:34.221"
                clipEnd="0:23:59.003"/>
         </par>
         <par id="id4">
            <text
                src="chapter1.xhtml#text2"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:23:59.003"
                clipEnd="0:24:15.000"/>
         </par>

         <!-- a figure -->

         <seq
             id="id7"
             epub:textref="chapter1.xhtml#figure">
            <par id="id8">
               <text
                   src="chapter1.xhtml#photo"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:24:18.123"
                   clipEnd="0:24:28.764"/>
            </par>
            <par id="id9">
               <text
                   src="chapter1.xhtml#caption"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:24:28.764"
                   clipEnd="0:24:50.010"/>
            </par>
         </seq>

         <!-- more sentences in the chapter (outside the figure) -->

         <par id="id12">
            <text
                src="chapter1.xhtml#text3"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:25:45.515"
                clipEnd="0:26:30.203"/>
         </par>
         <par id="id13">
            <text
                src="chapter1.xhtml#text4"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:26:30.203"
                clipEnd="0:27:15.000"/>
         </par>
      </seq>
   </body>
</smil>
```

XHTML content document:

``` xml
<html …>
   <head>
      <title>
         Media Overlays Example of
         EPUB content document
      </title>
   </head>
   <body id="sec1">
      <section
          id="sectionstart"
          epub:type="chapter">

         <h1 id="section1_title">
            The Section Title
         </h1>

         <p id="text1">
            The first phrase of the main text body.
         </p>

         <p id="text2">
            The second phrase of the main text body.
         </p>

         <figure id="figure">
            <img id="photo"
                src="photo.png"
                alt="a photograph for which there is a caption" />

            <figcaption id="caption">
               The photo caption
            </figcaption>
         </figure>

         <p id="text3">
            The third phrase of the main text body.
         </p>

         <p id="text4">
            The fourth phrase of the main text body.
         </p>
      </section>
   </body>
</html>
```

###### 9.3.3.2.2 Referencing document fragments

[](#sec-media-overlays-fragids)

Both the `epub:textref` attribute and the [`text`](#dfn-text) element's `src` attribute can contain a [URL-fragment string](https://url.spec.whatwg.org/#url-fragment-string) that references a specific part (e.g., an element via its ID) of the associated [EPUB content document](#dfn-epub-content-document).

For [XHTML](#dfn-xhtml-content-document) and [SVG content documents](#dfn-svg-content-document), the URL-fragment string *SHOULD* be a reference to a specific element via its ID, or an [SVG Fragment Identifier](https://www.w3.org/TR/SVG/linking.html#SVGFragmentIdentifiers) \[[svg](#bib-svg "SVG")\], respectively.

Other fragment identifier schemes *MAY* be used but [reading systems](#dfn-epub-reading-system) might not support such identifiers.

###### 9.3.3.2.3 Overlay granularity

[](#sec-media-overlays-granularity)

*This section is non-normative.*

The granularity level of the media overlay depends on how the [EPUB content document](#dfn-epub-content-document) is marked up and the type of fragment identifier used in the [`text`](#dfn-text) elements' `src` attributes and the [`seq`](#dfn-seq) elements' `epub:textref` attributes. For example, when referencing \[[html](#bib-html "HTML Standard")\] elements, if the finest level of markup is at the paragraph level, then that is the finest possible level for media overlay synchronization. Likewise, if sub-paragraph markup is available, such as \[[html](#bib-html "HTML Standard")\] [`span`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element) element representing phrases or sentences, then finer granularity is possible in the media overlay. Finer granularity gives users more precise results for synchronized playback when navigating by word or phrase and when searching the text but increases the file size of the [media overlay documents](#dfn-media-overlay-document). Fragment identifier schemes that do not rely on the presence of elements could provide even finer granularity, where supported.

###### 9.3.3.2.4 Text-to-speech rendering

[](#sec-mo-tts)

This specification allows the use of text-to-speech (TTS) — the rendering of the textual content of an [EPUB publication](#dfn-epub-publication) as artificial human speech using a synthesized voice — in addition to pre-recorded audio clips.

When a media overlay [`par`](#dfn-par) element omits its [`audio`](#dfn-audio) element, its [`text`](#dfn-text) element can be rendered in reading systems via TTS. If the text fragment is not appropriate for TTS rendering (e.g., is not a text element and/or has no text fallback), this can produce unexpected results.

Note

See [EPUB 3 Text-to-Speech Support](https://www.w3.org/TR/epub-tts-10/#) \[[epub-tts-10](#bib-epub-tts-10 "EPUB 3 Text-to-Speech Enhancements 1.0")\] for more information about using TTS technologies in EPUB publications.

##### 9.3.3.3 Structural semantics in overlays

[](#sec-docs-structural-semantic)

To express [structural semantics](#sec-structural-semantics) in [media overlay documents](#dfn-media-overlay-document), the [`epub:type`](#dfn-epub-type) attribute *MAY* be specified on [`par`](#dfn-par), [`seq`](#dfn-seq), and [`body`](#dfn-body) elements.

The `epub:type` attribute facilitates [reading system](#dfn-epub-reading-system) behavior appropriate for the semantic type(s) indicated. Examples of these behaviors are [skippability and escapability](#sec-behaviors-skip-escape) and [table reading mode](https://www.w3.org/TR/epub-rs-34/#note-table-reading-mode) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\].

[Media overlay documents](#dfn-media-overlay-document) *MAY* use the applicable [vocabulary association mechanisms](#sec-vocab-assoc) for the `epub:type` attribute to define additional semantics.

[Example 78](#example-semantic-markup-for-a-media-overlay-document-containing-a-figure): Semantic markup for a media overlay document containing a figure

``` xml
<smil
    xmlns="http://www.w3.org/ns/SMIL"
    xmlns:epub="http://www.idpf.org/2007/ops"
    version="3.0">
   <body>
      <seq
          id="id1"
          epub:textref="chapter1.xhtml#figure"
          epub:type="figure">
         <par id="id2">
            <text
                src="chapter1.xhtml#figuretitle"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:24:15.000"
                clipEnd="0:24:18.123"/>
         </par>
         <par id="id3">
            <text
                src="chapter1.xhtml#figurecaption"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:24:18.123"
                clipEnd="0:24:38.530"/>
         </par>
         <par id="id4">
            <text
                src="chapter1.xhtml#figuretext1"/>
            <audio
                src="chapter1_audio.mp3"
                clipBegin="0:24:38.530"
                clipEnd="0:25:00.515"/>
         </par>
      </seq>
   </body>
</smil>
```

##### 9.3.3.4 Associating style information

[](#sec-docs-assoc-style)

Visual rendering information for the currently playing [EPUB content document](#dfn-epub-content-document) element *MAY* be expressed in a CSS Style Sheet using author-defined classes.

When used, the class names *MUST* be declared in the [package document](#dfn-package-document) using the [`active-class`](#active-class) and [`playback-active-class`](#playback-active-class) properties.

Exactly one CSS class name *MUST* be defined in each property they define. Each property *MUST* define a [valid CSS class name](https://www.w3.org/TR/CSS2/syndata.html#characters) not including any [selectors](https://www.w3.org/TR/CSS2/selector.html) \[[css2](#bib-css2 "Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification")\]. This specification **does not** reserve names for use with these properties.

Any CSS properties *MAY* be defined for the specified CSS classes. Each EPUB content document with an associated [media overlay document](#dfn-media-overlay-document) has to include a CSS stylesheet (either embedded or linked) containing the class definitions. In the absence of such definitions [reading systems](#dfn-epub-reading-system) might provide their own styling, or no styling at all.

The `active-class` and `playback-active-class` properties *MUST NOT* be used in conjunction with a [`refines` attribute](#attrdef-refines) as they always apply to the entire [EPUB publication](#dfn-epub-publication).

[Example 79](#example-associating-style-information-with-the-currently-playing-epub-content-document): Associating style information with the currently playing EPUB content document

The author-defined CSS class names are declared using the metadata properties [`active-class`](#active-class) and [`playback-active-class`](#playback-active-class) in the package document:

``` xml
<package …>
   <metadata …>
      …
      <meta
          property="media:active-class">
         my-active-item
      </meta>
      <meta
          property="media:playback-active-class">
         my-document-playing
      </meta>
      …
   </metadata>
   …
</package>
```

The CSS Style Sheet containing the author-defined class names:

``` css
/* emphasize the active element */
.my-active-item {
    background-color: yellow;
    color: black !important;
}

/* fade out the inactive text */
html.my-document-playing * {
    color: gray;
}
```

The relevant EPUB content document excerpt:

``` xml
<html>
   …
   <body>
      …
      <span id="txt1">
         This is the first phrase.
      </span>
      <span id="txt2">
         This is the second phrase.
      </span>
      <span id="txt3">
         This is the third phrase.
      </span>
      …
   </body>
</html>
```

In this example, the reading system would apply the author-defined `my-active-item` class to each text element in the EPUB content document as it became active during playback. Conversely, reading systems would remove the class name when the element is no longer active. The user would see each EPUB content document element styled with a yellow background for the duration of that element's playback.

The reading system would also apply the author-defined `my-document-playing` class to the document element of the EPUB content document when media overlays playback begins. The reading system would remove the class name when playback stops. In the case of an [XHTML content document](#dfn-xhtml-content-document), the reading system would apply the class name to the [`html`](https://html.spec.whatwg.org/multipage/semantics.html#the-html-element) element \[[html](#bib-html "HTML Standard")\]. In the case of an [SVG content document](#dfn-svg-content-document), the reading system would apply the class name to the [`svg`](https://www.w3.org/TR/SVG/struct.html#elementdef-svg) element \[[svg](#bib-svg "SVG")\]. The user would see all the inactive text elements turn gray during media overlays playback. When playback stopped, the elements' colors would return to their defaults.

##### 9.3.3.5 Media overlays packaging

[](#sec-docs-package)

###### 9.3.3.5.1 Including media overlays

[](#sec-package-including)

If an [EPUB content document](#dfn-epub-content-document) is wholly or partially referenced by a [media overlay document](#dfn-media-overlay-document), then its [manifest](#dfn-epub-manifest) [`item`](#dfn-item) element *MUST* specify a `media-overlay` attribute. The attribute *MUST* reference the [ID](https://www.w3.org/TR/xml/#id) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] of the manifest `item` for the corresponding media overlay document.

The `media-overlay` attribute *MUST* only be specified on manifest `item` elements for EPUB content documents.

Manifest items for media overlay documents *MUST* have the media type `application/smil+xml`.

[Example 80](#example-entries-for-an-epub-content-document-and-its-associated-media-overlay-document-in-the-package-document-manifest): Entries for an EPUB content document and its associated media overlay document in the package document manifest

``` abnf
<package …>
   …
   <manifest>
      <item
          id="ch1"
          href="chapter1.xhtml"
          media-type="application/xhtml+xml"
          media-overlay="ch1_audio"/>

      <item
          id="ch1_audio"
          href="chapter1_audio.smil"
          media-type="application/smil+xml"/>
      …
   </manifest>
</package>
```

###### 9.3.3.5.2 Overlays package metadata

[](#sec-mo-package-metadata)

The duration of the entire [EPUB publication](#dfn-epub-publication) *MUST* be specified in the [package document](#dfn-package-document) using a [`meta`](#dfn-meta) element with the [`duration` property](#duration).

In addition, the duration of each [media overlay document](#dfn-media-overlay-document) *MUST* be provided using the [`refines` attribute](#attrdef-refines) to associate each duration declaration to its corresponding [manifest](#dfn-epub-manifest) [`item`](#dfn-item).

The sum of the durations for each media overlay document *SHOULD* equal the [total duration](#total-duration) plus or minus one second.

Note

Although the sum of individual durations might not exactly match the total due to rounding the times to nearest fraction of a second, a difference of greater than one second indicates a mismatch arising from other issues.

Narrator information *MAY* also be specified in the package document using the [`narrator` property](#narrator). [Author-defined CSS class names](#sec-docs-assoc-style) to apply to the currently playing [EPUB content document](#dfn-epub-content-document) element can also be specified.

Note

The `media:` prefix is [reserved](#sec-metadata-reserved-prefixes) for inclusion of these properties in package metadata.

[Example 81](#example-media-overlays-metadata-in-the-package-document): Media overlays metadata in the package document

``` xml
<package …>
   <metadata …>
      …
      <meta
          property="media:duration"
          refines="#ch1_audio">
         0:32:29
      </meta>

      <meta
          property="media:duration"
          refines="#ch2_audio">
         0:34:02
      </meta>

      <meta
          property="media:duration"
          refines="#ch3_audio">
         0:29:49
      </meta>

      <meta
          property="media:duration">
         1:36:20
      </meta>

      <meta
          property="media:narrator">
         Joe Speaker
      </meta>

      <meta
          property="media:active-class">
         my-active-item
      </meta>

      <meta
          property="media:playback-active-class">
         my-document-playing
      </meta>
      …
   </metadata>
</package>
```

#### 9.3.4 Skippability and escapability

[](#sec-behaviors-skip-escape)

##### 9.3.4.1 Skippability

[](#sec-skippability)

While reading, users might want to turn on or off certain features of the content, such as footnotes, page numbers, or other types of secondary content. This feature is called skippability. [Reading systems](#dfn-epub-reading-system) use the semantic information provided by media overlay elements' [`epub:type`](#sec-docs-structural-semantic) attribute to determine when to offer users the option of skippable features.

The following semantics *MAY* be used to enable skippability:

- [`footnote`](https://www.w3.org/TR/epub-ssv-11/#footnote) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

- [`endnote`](https://www.w3.org/TR/epub-ssv-11/#endnote) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

- [`pagebreak`](https://www.w3.org/TR/epub-ssv-11/#pagebreak) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

This list is non-exhaustive, however. It represents terms from the Structural Semantics Vocabulary \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] for which reading systems are most likely to offer the option of skippability.

[Example 82](#example-media-overlay-document-with-a-page-break): Media overlay document with a page break

In this example, a reading system could offer the user the option of turning on and off the page break/page number announcements, which are often cumbersome to listen to.

Media overlay document:

``` xml
<smil
    xmlns="http://www.w3.org/ns/SMIL"
    xmlns:epub="http://www.idpf.org/2007/ops"
    version="3.0">
   <body>
      <!-- a paragraph -->
      <par id="id1">
         <text
             src="chapter1.xhtml#para1"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="0:23:22.000"
             clipEnd="0:24:15.000"/>
      </par>

      <!-- a page number -->
      <par
          id="id2"
          epub:type="pagebreak">
         <text
             src="chapter1.xhtml#pgbreak1"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="0:24:15.000"
             clipEnd="0:24:18.123"/>
      </par>

      <!-- another paragraph -->
      <par id="id3">
         <text
             src="chapter1.xhtml#para2"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="0:24:18.123"
             clipEnd="0:25:28.530"/>
      </par>
   </body>
</smil>
```

EPUB content document:

``` xml
<html … >
   …
   <body>
      <p id="para1">
         This is the paragraph before the page break …
      </p>

      <span
          id="pgbreak1"
          role="doc-pagebreak"
          aria-label="14"/>

      <p id="para2">
         This is the paragraph after the page break …
      </p>
   </body>
</html>
```

##### 9.3.4.2 Escapability

[](#sec-escapability)

Escapable items are nested structures, such as tables and lists, that users might wish to skip over, continuing to read from the point immediately after the nested structure. The escapability feature differs from the skippability feature in that it does not enable or disable entire types of items, but provides an exit from them (e.g., a user can listen to some of the content before choosing to escape).

The following semantics *MAY* be used to enable escapability:

- [`table`](https://www.w3.org/TR/epub-ssv-11/#table) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

- [`list`](https://www.w3.org/TR/epub-ssv-11/#list) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

- [`figure`](https://www.w3.org/TR/epub-ssv-11/#figure) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

- [`aside`](https://www.w3.org/TR/epub-ssv-11/#aside) \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\]

This list is non-exhaustive list, however. It represents terms from the Structural Semantics Vocabulary \[[epub-ssv-11](#bib-epub-ssv-11 "EPUB 3 Structural Semantics Vocabulary 1.1")\] for which [reading systems](#dfn-epub-reading-system) are most likely to offer the option of escapability.

Note

Sometimes escapable structures can contain escapable structures. For example, tables are composed of many rows and cells that users might want to separately escape from. Reading system support for escaping from such structures is complex and not well supported at this time. It is advised to avoid identifying nested escapable structures until better support is available.

[Example 83](#example-escapable-structures): Escapable structures

In this example, the [media overlay document](#dfn-media-overlay-document) for an [EPUB content document](#dfn-epub-content-document) contains a paragraph, a table, and another paragraph. A reading system that supported escapability would give the user the option to interrupt playback of the table to continue playing the next paragraph.

``` xml
<smil
    xmlns="http://www.w3.org/ns/SMIL"
    xmlns:epub="http://www.idpf.org/2007/ops"
    version="3.0">
   <body>
      <!-- a paragraph, part of the regular document text -->
      <par id="id1">
         <text
             src="c01.xhtml#para1"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="0:23:22.000"
             clipEnd="0:24:15.000"/>
      </par>

      <!-- a table with two nested rows -->
      <seq
          id="id2"
          epub:textref="c01.xhtml#t1"
          epub:type="table">

         <seq
             id="id3"
             epub:textref="c01.xhtml#tr1"
             epub:type="table-row">

            <par
                id="id4"
                epub:type="table-cell">
               <text
                   src="c01.xhtml#td1"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:24:15.000"
                   clipEnd="0:24:18.123"/>
            </par>

            <par
                id="id5"
                epub:type="table-cell">
               <text
                   src="c01.xhtml#td2"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:24:18.123"
                   clipEnd="0:25:28.530"/>
            </par>

            <par
                id="id6"
                epub:type="table-cell">
               <text
                   src="c01.xhtml#td3"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:25:28.530"
                   clipEnd="0:25:45.515"/>
            </par>
         </seq>

         <seq
             id="id7"
             epub:textref="c01.xhtml#tr2"
             epub:type="table-row">

            <par
                id="id8"
                epub:type="table-cell">
               <text
                   src="c01.xhtml#td4"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:25:45.515"
                   clipEnd="0:26:45.700"/>
            </par>

            <par
                id="id9"
                epub:type="table-cell">
               <text
                   src="chapter1.xhtml#td5"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:26:45.700"
                   clipEnd="0:28:02.033"/>
            </par>

            <par
                id="id10"
                epub:type="table-cell">
               <text
                   src="chapter1.xhtml#td6"/>
               <audio
                   src="chapter1_audio.mp3"
                   clipBegin="0:28:02.033"
                   clipEnd="0:28:52.207"/>
            </par>
         </seq>
      </seq>

      <!-- another paragraph -->
      <par id="id11">
         <text
             src="c01.xhtml#para2"/>
         <audio
             src="chapter1_audio.mp3"
             clipBegin="0:28:52.207"
             clipEnd="0:30:01.000"/>
      </par>
   </body>
</smil>
```

#### 9.3.5 Navigation document overlays

[](#sec-mo-nav-doc)

*This section is non-normative.*

As the [EPUB navigation document](#dfn-epub-navigation-document) is an [XHTML content document](#dfn-xhtml-content-document), a [media overlay document](#dfn-media-overlay-document) can be associated with it. Unlike traditional XHTML content documents, however, [reading systems](#dfn-epub-reading-system) have to present the EPUB navigation document to users even when it is not included in the [spine](#dfn-epub-spine) (see [Navigation document processing](https://www.w3.org/TR/epub-rs-34/#sec-nav) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\]). As a result, the method in which an associated media overlay behaves can change depending on the context:

- When included in the spine, playback of the EPUB navigation document's media overlay document obeys the same conformance requirements as with any other XHTML content document.

- When exposed in a presentation context that allows users to access and activate the links, reading systems can implement additional presentation behaviors to expose audio feedback when user access navigation links.

Note

Specific implementation details are beyond the scope of this specification. The [DAISY Media Overlays Playback Requirements](https://daisy.org/info-help/document-archive/archived-publications/media-overlays-playback-requirements/) document describes best practices for authoring and provides recommendations for reading system developers.

## 10. Accessibility

[](#sec-accessibility)

*This section is non-normative.*

EPUB 3 builds upon the Open Web Platform expressly so that it can leverage the structure, semantics and, by extension, accessibility built into its underlying technologies.

Some of the key standards for authoring accessible web content include:

[Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/TR/WCAG2/)  
The requirements and practices for creating accessible web content are documented in the \[[wcag2](#bib-wcag2 "Web Content Accessibility Guidelines (WCAG) 2")\].

[Accessible Rich Internet Applications (ARIA)](https://www.w3.org/TR/wai-aria/)  
The \[[wai-aria](#bib-wai-aria "Accessible Rich Internet Applications (WAI-ARIA)")\] specification defines roles, states, and properties for making dynamic content that does not use native HTML elements and attributes accessible. It also provides a set of landmarks for navigating web pages.

[Digital Publishing WAI-ARIA Module (DPUB-ARIA)](https://www.w3.org/TR/dpub-aria/)  
The \[[dpub-aria](#bib-dpub-aria "Digital Publishing WAI-ARIA Module")\] specification is an extension of \[[wai-aria](#bib-wai-aria "Accessible Rich Internet Applications (WAI-ARIA)")\] that provides additional roles specific to identifying common publishing structures.

[ARIA in HTML](https://www.w3.org/TR/html-aria/)  
\[[html-aria](#bib-html-aria "ARIA in HTML")\] specifies how the roles, states, and properties defined ARIA and DPUB-ARIA can be used in HTML documents.

These standards also form the basis for making [EPUB publications](#dfn-epub-publication) accessible. As the current WCAG guidelines (version 2) are heavily focused on web pages, however, the [EPUB Accessibility](https://www.w3.org/TR/epub-a11y-12/#) standard \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\] defines how to apply these standards to EPUB publications and adds EPUB-specific requirements and recommendations for metadata, pagination, and media overlays.

This specification recommends that EPUB publications [conform to the accessibility requirements](#confreq-a11y) defined in \[[epub-a11y-12](#bib-epub-a11y-12 "EPUB Accessibility 1.2")\]. A benefit of following this recommendation is that it helps to ensure that EPUB publications meet the accessibility requirements legislated in jurisdictions around the world.

It is strongly advised to look beyond legal imperatives and treat accessibility as a requirement for all EPUB publications. The more accessible that EPUB publications are, the greater the potential audience for them.

Note

This specification does not integrate the accessibility requirements to allow them to adapt and evolve independent of the EPUB specification — accessibility practices often need more frequent updating. The accessibility specification is also intended for use with past, present, and future versions of EPUB. The approach of a separate specification ensures that the evolution of EPUB does not lock accessibility in time (i.e., it allows producers of older versions of EPUB to reference the latest accessibility requirements).

## 11. Security and privacy

[](#sec-security-privacy)

### 11.1 Overview

[](#security-privacy-overview)

*This section is non-normative.*

The particularity of an [EPUB publication](#dfn-epub-publication) is its structure. The EPUB format provides a means of representing, packaging, and encoding structured and semantically enhanced web content — including HTML, CSS, SVG, JavaScript, and other resources — for distribution in a single-file container.

This means that EPUB 3's security and privacy issues are primarily linked to the features of those formats, and closely mirror the threats presented by web content.

Although content risks are often equated with deliberately malicious authoring intent, be aware that many practices followed with the best of intentions can expose users to privacy and security issues. The rest of this section explores the risk model of EPUB 3 to help recognize and mitigate these risks.

Note

For the risks associated with [reading systems](#dfn-epub-reading-system), refer to the [security and privacy section](https://www.w3.org/TR/epub-rs-34/#sec-security-privacy) of \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\].

### 11.2 Threat model

[](#epub-threat-model)

*This section is non-normative.*

[EPUB publications](#dfn-epub-publication) pose a variety of privacy and security threats to unsuspecting users. Many of these threats intersect with web content, but EPUB also introduces its own unique methods of attack that can be used to trick users into accessing malicious content or into providing sensitive information. Some of the more important attack vectors to be aware of include:

Embedding of remote resources  
EPUB 3 allows some [publication resources](#dfn-publication-resource) to be [remotely hosted](#sec-resource-locations), specifically resources whose sizes can negatively affect the downloading and opening of the EPUB publication (e.g., audio, video, and fonts). Although helpful for users when used as intended, these exemptions can also be used to inject malicious content into a publication.

This threat is not limited to accessing content created by a malicious actor. If content from untrustworthy sources (e.g., third party audio and video) is embedded in an EPUB publication, there is always the possibility that users could receive compromised resources.

Checking for malware and exploits at distribution time is not always reliable, either, as the malicious content can be swapped in any time after publication, unlike resources that come embedded in the [EPUB container](#dfn-epub-container).

The [origin](#sec-container-iri) of an EPUB is specific to each reading system implementation and not knowable outside of the reading system. Consequently, even if [remote resources](#dfn-remote-resource) are hosted on a secure web server, it is not possible to use security features that require specifying allowable origins, such as headers for [CORS](https://fetch.spec.whatwg.org/#cors-protocol), [`Content-Security-Policy`](https://www.w3.org/TR/CSP2/#content-security-policy-header-field), or [`X-Frame-Options`](https://www.rfc-editor.org/rfc/rfc7034).

Linking to external resources  
Whether intentional or not, links to external web sites and resources expose users to potential exploits that can compromise their reading system or operating system. Although external links will typically open in a web browser, and be subject to the browser security model, this does not protect users from all exploits.

Even if the intent is not malicious, adding tracking information to external links is problematic for user privacy as it can allow a user's activity to be tracked without their consent.

Broken-link hijacking — when a domain expires and is bought by another party to exploit the links to it — can also lead to users being taken to unintended resources.

Including malicious content  
Resources embedded in the EPUB container are not immune to malicious actors, especially when EPUB publications are obtained from untrusted sources. Resources could contain exploits or forms that submit sensitive information to unintended parties. Such actors might also try to gain access to [remote resources](#dfn-remote-resource) using file indirection techniques, such as symbolic links or file aliases.

The use of third-party content, such as games and quizzes, can also lead to security and privacy issues if the content cannot be fully vetted.

Allowing scripts network access  
When scripts can access a device's network, it provides a variety channels to exploit the user:

- collecting information about the user and their activities, whether malicious or not;
- attempting to access the file system and local storage to harvest information;
- phishing attempts (e.g., making an [EPUB content document](#dfn-epub-content-document) appear like a trusted web site to get the user to submit login information); and
- injecting malicious content from external sites into the EPUB publication.

Network access can also allow third-party content to exploit the user.

Securing content with digital rights management and watermarks  
The encryption and decryption of EPUB publications using digital rights management schemes could allow personally identifiable information about the user, what vendors they use, and their reading choices to be relayed to third parties. The same is true of watermarks.

The effectiveness of these attacks also often depends on tricking users into believing that the publication they are interacting with is from a trustworthy source. These deceptions can take the following forms:

Falsified publication information  
An EPUB publication can include false information about itself to trick users into believing that it comes from a legitimate source. A malicious actor might, for example, fake the title, authors, identifiers, and publisher for the work.

Although this misinformation itself does not present an immediate harm, it could lead users to trust malicious forms, links, and other content within the EPUB publication believing it comes from a reliable source.

Spoofed platforms  
Malicious actors can also design their content to imitate or replicate a platform's experience to trick users into trusting their content.

#### 11.2.1 EPUB-specific features

[](#privacy-security-epub-features)

EPUB 3 tries to avoid extending the underlying technologies it builds on, but it has introduced some new features. The restricted scope of these features limits the threats they might pose, however:

- [Content switching](#sec-xhtml-content-switch) and [multimedia control elements](#sec-xhtml-epub-trigger) only allow hiding of content and script-less control of playback in HTML. Moreover, these features, introduced in the first release of EPUB 3.0, are [deprecated](#deprecated) and no longer advised for use.

- The [expression of structural semantics](#sec-epub-type-attribute) in HTML and SVG only allows the annotation of elements.

The one potential exception is the [`epubReadingSystem` object](https://www.w3.org/TR/epub-rs-34/#app-epubReadingSystem) \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] that allows information about the current [reading system](#dfn-epub-reading-system) to be queried. It is advised to only use the information exposed by this object to improve the rendering of an EPUB publication (i.e., avoid using the information to profile the user and their environment).

### 11.3 Recommendations

[](#security-privacy-recommendations)

Although it is not possible to prevent every method of exploiting users, responsibility for the secure construction of the content lies with its creator. That requires taking precautions to limit the exposure of [EPUB publications](#dfn-epub-publication) to the types of [malicious exploits](#epub-threat-model) described in the previous section.

Some practical steps include:

- Ensuring the use of stable links to [remote resources](#dfn-remote-resource).
- Avoiding third-party resources, especially those hosted on third-party servers.
- Avoiding links to untrustworthy web sites (e.g., that browsers do not recognize as safe).
- Using secure connections to external sites and resources (i.e., using the HTTPS protocol).
- Not using scripts to send or receive data over the network without the consent of the user.
- Obtaining user consent for the use of Web APIs with privacy implications, such as [Geolocation](https://www.w3.org/TR/geolocation/) \[[geolocation](#bib-geolocation "Geolocation")\] and [Push Notifications](https://www.w3.org/TR/push-api/) \[[push-api](#bib-push-api "Push API")\].
- Avoiding embedding content not provided by reputable organizations or individuals.
- Avoiding deprecated features of EPUB due to the potential for undiscovered bugs in implementations.

Also consider the privacy rights of users and avoid intentionally collecting data. Ideally, users *SHOULD NOT* be tracked, but this is not realistic for all types of publishing.

When users have to be tracked (e.g., in educational course work), the approval of the user to collect information *SHOULD* be obtained prior to opening the EPUB publication. If this is not possible, permission *SHOULD* be obtained when users access the EPUB publication for the first time. Users *SHOULD* be allowed to opt out of tracking and provided the ability to manage and delete any data that is collected about them.

The inadvertent collection of information about users also needs to be considered. Linking to content on a publisher's web site, or remotely hosting resources on their servers, can lead to profiling users, especially if unique tracking identifiers are added to the URLs.

When collecting and storing user information within an EPUB publication (e.g., through the use of [cookies](https://html.spec.whatwg.org/multipage/#dom-document-cookie) and [web storage](https://html.spec.whatwg.org/multipage/#webstorage) \[[html](#bib-html "HTML Standard")\]), the potential for data theft by other EPUB publications on a [reading system](#dfn-epub-reading-system) needs to be considered. Although \[[epub-rs-34](#bib-epub-rs-34 "EPUB Reading Systems 3.4")\] introduces a [unique origin requirement](https://www.w3.org/TR/epub-rs-34/#sec-container-iri) for EPUB publications, which limits the potential for attacks, there is still a risk that reading systems will allow EPUB publications access to shared persistent storage (e.g., older reading systems that have not been updated and non-conforming newer reading systems). Consequently, sensitive user data *SHOULD NOT* be stored in persistent storage. If sensitive data has to be stored, it *SHOULD* be encrypted to prevent trivial access to it in the case of an exploit.

When digital rights management schemes have to be used, prefer schemes that do not utilize or transmit information about the user or their content to external parties to perform encryption or decryption.

When watermarking has to be used, follow industry best practices for privacy such as those defined in [Privacy Principles for Digital Watermarking](https://cdt.org/wp-content/uploads/copyright/20080529watermarking.pdf) \[[watermark-privacy](#bib-watermark-privacy "Privacy Principles for Digital Watermarking Version 1.0")\].

To maximally reduce security and privacy risks, EPUB publications *SHOULD* be produced with the goal of long-term preservation. EPUB publications created this way are normally self-contained, not dependent on network access, and not encrypted with digital rights management, removing many of the possible attack vectors. \[[iso22424](#bib-iso22424 "ISO/IEC TS 22424-1:2020 — Digital publishing — EPUB3 preservation")\] is an example of such a preservation format for EPUB publications. While it is understood that not all EPUB publications can meet these levels of self-containment, following as many of these practices as possible will still benefit overall user privacy and security.

## A. Detailed examples

[](#app-examples)

*This section is non-normative.*

### A.1 Resources

[](#publication-resources-example)

Consider the following extracts of a [package document](#dfn-package-document) and an [XHTML content document](#dfn-xhtml-content-document):

``` abnf
<package …>
    <metadata …>
        …
        <link rel="record"
            href="meta/data.xml"
            media-type="application/marc"/>
        <link rel="record"
            href="https://www.example.org/meta/data2.xml"
            media-type="application/marc"/>
        …
    </metadata>
    <manifest>
        …
        <item id="page"
            href="page.xhtml"
            media-type="application/xhtml+xml"/>
        <item id="nav"
            href="nav.xhtml"
            media-type="application/xhtml+xml"
            properties="nav"/>
        <item id="style"
            href="style.css"
            media-type="text/css"/>
        <item id="font_otf"
            href="fonts/font-file.otf"
            media-type="font/otf"/>
        <item id="font_otf_remote"
            href="https://www.example.org/fonts/font-file2.otf"
            media-type="font/otf"/>
        <item id="font_cff"
            href="fonts/font-file.cff"
            media-type="font/sfnt"/>
        <item id="pls"
            href="speech/cmn.pls"
            media-type="application/pls+xml"/>
        <item id="image_1"
            href="media/image_1.png"
            media-type="image/png"/>
        <item id="image_2"
            href="media/image_2.png"
            media-type="image/png"
            fallback="image_desc"/>
        <item id="image_desc"
            href="image_desc.xhtml"
            media-type="application/xhtml+xml"/>
        <item id="image_3_heic"
            href="media/image_3.heic"
            media-type="image/heic"/>
        <item id="image_3_png"
            href="media/image_3.png"
            media-type="image/png"/>
        <item id="widget"
            href="widget.xhtml"
            media-type="application/xhtml+xml"/>
        …
    </manifest>
    <spine>
        …
        <itemref idref="page_001"/>
        <itemref idref="image_2"/>
        …
    </spine>
</package>

<html …>
    <head …>
        …
        <link rel="stylesheet" type="text/css" href="style.css"/>
        <link rel="pronunciation" type="application/pls+xml" href="speech/cmn.pls"/>
        …
    </head>
    <body>
        <img src="media/image1_png"/>
        …
        <a href="media/image_2.png">…</a>
        …
        <picture>
            <source srcset="media/image_3.heic" type="image/heic"/>
            <img src="media/image_3.png"/>
        </picture>
        …
        <iframe src="widget.xhtml"></iframe>
        …
        <a href="https://www.example.org/some_content">…</a>
    </body>
</html>
```

The various resources in the [EPUB publication](#dfn-epub-publication) can be categorized as follows. (Refer to [3. Publication resources](#sec-publication-resources) for more information about these categories.)

`meta/data.xml`  
The resource is a metadata record, stored in the [EPUB container](#dfn-epub-container). It is linked via a [`link`](#dfn-link) element in the package document metadata. It is therefore a [linked resource](#dfn-linked-resource) on the [manifest plane](#dfn-manifest-plane) (i.e., is not listed in the [manifest](#dfn-epub-manifest)). It is not part on any other planes.

`https://www.example.org/meta/data2.xml`  
The resource is a metadata record, stored remotely. It is linked via a [`link`](#dfn-link) element in the package document metadata. It is therefore a linked resource on the manifest plane, (i.e., it is not listed in the manifest). It is not part on any other planes.

`page.xhtml`  
The resource is an XHTML document. It is listed in the [spine](#dfn-epub-spine). It is a [publication resource](#dfn-publication-resource) on the manifest plane, a [container resource](#dfn-container-resource), an [EPUB content document](#dfn-epub-content-document) on the [spine plane](#dfn-spine-plane), and is not present on the [content plane](#dfn-content-plane). No fallback is necessary.

`nav.xhtml`  
The resource is the [EPUB navigation document](#dfn-epub-navigation-document). It is not listed in the spine. It is a publication resource on the manifest plane, a container resource, and is not present on either the spine plane or the content plane. No fallback is necessary.

`style.css`  
The resource is a CSS file. It is not listed in the spine but is referenced from an \[[html](#bib-html "HTML Standard")\] [`link`](https://html.spec.whatwg.org/multipage/#the-link-element) element. It is a publication resource on the manifest plane, a container resource, is not present on the spine plane, and is a [core media type resource](#dfn-core-media-type-resource) on the content plane. No fallback is necessary.

`font/font-file.otf`  
The resource is a TrueType font file. It is not listed in the spine but is referenced from a CSS file. It is a publication resource on the manifest plane, is a container resource, is not present on the spine plane, and is a core media type resource on the content plane. No fallback is necessary.

`https://www.example.org/fonts/font-file2.otf`  
The resource is a TrueType font file. It is not listed in the spine but is referenced from a CSS file. It is a publication resource on the manifest plane, is a [remote resource](#dfn-remote-resource), is not present on the spine plane, and is a core media type resource on the content plane. No fallback is necessary.

`font/font-file.cff`  
The resource is a font file in Compact Font Format. It is not listed in the spine but is referenced from a CSS file. Its media type is not listed as a [core media type](#sec-core-media-types). It is a publication resource on the manifest plane, a container resource, is not present on the spine plane, and is an [exempt resource](#dfn-exempt-resource) on the content plane. No fallback is necessary.

`speech/cmn.pls`  
The resource is a Pronunciation Lexicon file. It is not listed in the spine but is referenced from an \[[html](#bib-html "HTML Standard")\] [`link`](https://html.spec.whatwg.org/multipage/#the-link-element) element. It is a publication resource on the manifest plane, a container resource, not present on the spine plane, and is an exempt resource on the content plane. No fallback is necessary.

`image/image_1.png`  
The resource is a PNG image file. It is not listed in the spine but is referenced from an \[[html](#bib-html "HTML Standard")\] [`img`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element) element. It is a publication resource on the manifest plane, a container resource, is not present on the spine plane, and is a core media type resource on the content plane. No fallback is necessary.

`image/image_2.png`  
The resource is a PNG image file. It is referenced via an \[[html](#bib-html "HTML Standard")\] [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element) element. Because it is referenced from a hyperlink, it *has to* be listed in the spine. It is a publication resource on the manifest plane, a container resource, a [foreign content document](#dfn-foreign-content-document) on the spine plane, and a core media type resource on the content plane. As a foreign content document, a fallback is mandatory and is provided via a [manifest fallback](#sec-manifest-fallbacks).

`image_desc.xhtml`  
The resource is an XHTML document. It is the "target" of a manifest fallback so is not explicitly listed in the spine (but it "replaces" the existing spine item when needed). It is a publication resource on the manifest plane, a container resource, an EPUB content document on spine plane, and, because it is not "used" when rendering another EPUB content document, it is not present on the content plane. No fallback is necessary.

`image/image_3.heic`  
The resource is a High Efficiency (HEIC) image file. It is not listed in the spine but is referenced from an \[[html](#bib-html "HTML Standard")\] [`source`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element) element. Its media type is not listed as a [core media type](#sec-core-media-types). It is a publication resource on the manifest plane, a container resource, is not present on the spine plane, and is a foreign resource on the content plane. As a foreign resource, a fallback is mandatory and is provided via the sibling \[[html](#bib-html "HTML Standard")\] [`img`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element) element in an \[[html](#bib-html "HTML Standard")\] [`picture`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-picture-element) element.

`image/image_3.png`  
The resource is a PNG image file. It is not listed in the spine but is referenced from an \[[html](#bib-html "HTML Standard")\] [`img`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element) element that is used as an intrinsic fallback of the \[[html](#bib-html "HTML Standard")\] [`picture`](https://html.spec.whatwg.org/multipage/embedded-content.html#the-picture-element) element. It is a publication resource on the manifest plane, a container resource, is not present on the spine plane, and is a core media type resource on the content plane. No fallback is necessary.

`widget.xhtml`  
The resource is an XHTML document. It is not listed in the spine but is referenced from an \[[html](#bib-html "HTML Standard")\] [`iframe`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element) element. It is a publication resource on the manifest plane, a container resource, is not present on spine plane, and, because it is "used" when rendering another EPUB content document, a core media type resource on the content plane. No fallback is necessary.

`https://www.example.org/some_content`  
The resource is referenced via an \[[html](#bib-html "HTML Standard")\] [`a`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element) element and is not stored in the EPUB container. Reading systems will normally open this link via a separate browser instance. It is not on any planes defined by this specification.

Additional examples on the usage of different types of resources can be found in [5.7.2.2 Examples](#sec-item-elem-examples).

### A.2 Scripting contexts

[](#scripted-contexts-example)

Consider the following example [package document](#dfn-package-document):

``` abnf
<package …>
    …
    <manifest>
        …
        <item id="chap01"
            href="scripted01.xhtml"
            media-type="application/xhtml+xml"
            properties="scripted"/>
        <item id="inset01"
            href="scripted02.xhtml"
            media-type="application/xhtml+xml"
            properties="scripted"/>
        <item id="slideshowjs"
            href="slideshow.js"
            media-type="text/javascript"/>
    </manifest>

    <spine …>
        <itemref idref="chap01"/>
        …
    </spine>
    …
</package>
```

and the following file `scripted01.xhtml`:

``` xml
<html …>
    <head>
        …
        <script type="text/javascript">
            const te = navigator.epubReadingSystem.hasFeature("touch-events");
            const te_message = te ? "passes" : "does not pass";
            alert(`The reading system ${te_message} touch events to the content.`);
        </script>
    </head>
    <body>
        …
        <iframe src="scripted02.xhtml" … />
        …
    </body>
</html>
```

and the following file `scripted02.xhtml`:

``` xml
<html …>
    <head>
        …
        <script type="text/javascript" href="slideshow.js"></script>
    </head>
    <body>
        …
    </body>
</html>
```

From these examples, it is true that:

- the code in the `script` element in the `head` in `scripted01.xhtml` is a [spine-level script](#sec-scripted-spine) because the document is referenced from the spine; and

- the code in the `script` element in `scripted02.xhtml` is a [container-constrained script](#sec-scripted-container-constrained) because the XHTML document it occurs in is included in `scripted01.xhtml` via the `iframe` element.

### A.3 Packaged EPUB

[](#ocf-example)

This example demonstrates the use of the OCF format to contain a signed and encrypted [EPUB publication](#dfn-epub-publication) within an [OCF ZIP container](#dfn-ocf-zip-container).

Ordered list of files in the OCF ZIP container:

``` css
mimetype
META-INF/container.xml
META-INF/signatures.xml
META-INF/encryption.xml
EPUB/As_You_Like_It.opf
EPUB/book.html
EPUB/nav.html
EPUB/images/cover.png
```

The contents of the `mimetype` file

```
application/epub+zip
```

The contents of the `META-INF/container.xml` file

``` xml
<?xml version="1.0"?>
<container
    version="1.0"
    xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
   <rootfiles>
      <rootfile
          full-path="EPUB/As_You_Like_It.opf"
          media-type="application/oebps-package+xml"/>
   </rootfiles>
</container>
```

The contents of the `META-INF/signatures.xml` file

``` xml
<signatures
    xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
   <Signature
       Id="AsYouLikeItSignature"
       xmlns="http://www.w3.org/2000/09/xmldsig#">

      <!--
           SignedInfo is the information that is actually signed.
           In this case, the SHA-1 algorithm is used to sign the
           canonical form of the XML documents enumerated in the
           Object element below.
      -->

      <SignedInfo>
         <CanonicalizationMethod
             Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
         <SignatureMethod
             Algorithm="http://www.w3.org/2000/09/xmldsig#dsa-sha1"/>
         <Reference
             URI="#AsYouLikeIt">
            <DigestMethod
                Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
            <DigestValue>
               …
            </DigestValue>
         </Reference>
      </SignedInfo>

      <!--
           The signed value of the digest above, using the DSA
           algorithm
      -->
      <SignatureValue>
         …
      </SignatureValue>

      <!--
           The key used to validate the signature
      -->
      <KeyInfo>
         <KeyValue>
            <DSAKeyValue>
               <P>…</P>
               <Q>…</Q>
               <G>…</G>
               <Y>…</Y>
            </DSAKeyValue>
         </KeyValue>
      </KeyInfo>

      <!--
           The list of resources to sign (note that the canonical
           form of XML documents is signed, while the binary form
           of all other resources is used)
      -->
      <Object>
         <Manifest
             Id="AsYouLikeIt">
            <Reference
                URI="EPUB/As_You_Like_It.opf">
               <Transforms>
                  <Transform
                      Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
               </Transforms>
               <DigestMethod
                   Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
               <DigestValue>
               </DigestValue>
            </Reference>

            <Reference URI="EPUB/book.html">
               <Transforms>
                  <Transform
                      Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
               </Transforms>
               <DigestMethod
                   Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
               <DigestValue>
               </DigestValue>
            </Reference>

            <Reference
                URI="EPUB/images/cover.png">
               <DigestMethod
                   Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
               <DigestValue>
               </DigestValue>
            </Reference>
         </Manifest>
      </Object>
   </Signature>
</signatures>
```

The contents of the `META-INF/encryption.xml` file

``` xml
<?xml version="1.0"?>
<encryption
    xmlns="urn:oasis:names:tc:opendocument:xmlns:container"
    xmlns:enc="http://www.w3.org/2001/04/xmlenc#"
    xmlns:ds="http://www.w3.org/2000/09/xmldsig#">

   <!--
        The RSA-encrypted AES-128 symmetric key used to encrypt
        data enumerated in EncryptedData blocks below
   -->
   <enc:EncryptedKey
       Id="EK">
      <enc:EncryptionMethod
          Algorithm="http://www.w3.org/2001/04/xmlenc#rsa-1_5"/>
      <ds:KeyInfo>
         <ds:KeyName>
            John Smith
         </ds:KeyName>
      </ds:KeyInfo>
      <enc:CipherData>
         <enc:CipherValue>
            xyzabc…
         </enc:CipherValue>
      </enc:CipherData>
   </enc:EncryptedKey>

   <!--
        Each EncryptedData block identifies a single resource
        that has been encrypted using the AES-128 algorithm.
        The data remains stored, in its encrypted form, in the
        original file within the container.
   -->
   <enc:EncryptedData Id="ED1">
      <enc:EncryptionMethod
          Algorithm="http://www.w3.org/2001/04/xmlenc#kw-aes128"/>
      <ds:KeyInfo>
         <ds:RetrievalMethod
             URI="#EK"
             Type="http://www.w3.org/2001/04/xmlenc#EncryptedKey"/>
      </ds:KeyInfo>
      <enc:CipherData>
         <enc:CipherReference
             URI="EPUB/book.html"/>
      </enc:CipherData>
   </enc:EncryptedData>

   <enc:EncryptedData Id="ED2">
      <enc:EncryptionMethod
          Algorithm="http://www.w3.org/2001/04/xmlenc#kw-aes128"/>
      <ds:KeyInfo>
         <ds:RetrievalMethod
             URI="#EK" Type="http://www.w3.org/2001/04/xmlenc#EncryptedKey"/>
      </ds:KeyInfo>
      <enc:CipherData>
         <enc:CipherReference
             URI="EPUB/images/cover.png"/>
      </enc:CipherData>
   </enc:EncryptedData>
</encryption>
```

The contents of the `EPUB/As_You_Like_It.opf` file

``` xml
<?xml version="1.0"?>
<package
    version="3.0"
    xml:lang="en"
    xmlns="http://www.idpf.org/2007/opf"
    unique-identifier="pub-id">

   <metadata
       xmlns:dc="http://purl.org/dc/elements/1.1/">

      <dc:identifier
          id="pub-id">
         urn:uuid:B9B412F2-CAAD-4A44-B91F-A375068478A0
      </dc:identifier>

      <dc:language>
         en
      </dc:language>

      <dc:title>
         As You Like It
      </dc:title>

      <dc:creator
          id="creator">
         William Shakespeare
      </dc:creator>

      <meta
          property="dcterms:modified">
         2000-03-24T00:00:00Z
      </meta>

      <dc:publisher>
         Project Gutenberg
      </dc:publisher>

      <dc:date>
         2000-03-24
      </dc:date>

      <meta
          property="dcterms:dateCopyrighted">
         9999-01-01
      </meta>

      <dc:identifier
          id="isbn13">
         urn:isbn:9780741014559
      </dc:identifier>

      <dc:identifier
          id="isbn10">
         0-7410-1455-6
      </dc:identifier>

      <link
          rel="xml-signature"
          href="../META-INF/signatures.xml#AsYouLikeItSignature"/>
   </metadata>

   <manifest>
      <item id="r4915"
          href="book.html"
          media-type="application/xhtml+xml"/>
      <item id="r7184"
          href="images/cover.png"
          media-type="image/png"/>
      <item id="nav"
          href="nav.html"
          media-type="application/xhtml+xml"
          properties="nav"/>
   </manifest>

   <spine>
      <itemref
          idref="r4915"/>
   </spine>
</package>
```

### A.4 Clock values

[](#clock-examples)

The following are examples of allowed clock values:

- `5:34:31.396` = 5 hours, 34 minutes, 31 seconds, and 396 milliseconds

- `124:59:36` = 124 hours, 59 minutes, and 36 seconds

- `0:05:01.2` = 5 minutes, 1 second, and 200 milliseconds

- `0:00:04` = 4 seconds

- `09:58` = 9 minutes and 58 seconds

- `00:56.78` = 56 seconds and 780 milliseconds

- `76.2s` = 76.2 seconds = 76 seconds and 200 milliseconds

- `7.75h` = 7.75 hours = 7 hours and 45 minutes

- `13min` = 13 minutes

- `2345ms` = 2345 milliseconds

- `12.345` = 12 seconds and 345 milliseconds

## B. Allowed external identifiers

[](#app-identifiers-allowed)

The following table lists the [public](https://www.w3.org/TR/xml/#dt-pubid) and [system identifiers](https://www.w3.org/TR/xml/#dt-sysid) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] allowed in [document type declarations](https://www.w3.org/TR/xml/#dt-doctype). \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\]

These external identifiers *MAY* be used only in [publication resources](#dfn-publication-resource) with the listed media types \[[rfc2046](#bib-rfc2046 "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types")\] specified in their [manifest](#dfn-epub-manifest) declarations. (Refer to [3.9 XML conformance](#sec-xml-constraints) for more information.)

[TABLE]

## C. The `viewport meta` tag

[](#app-viewport-meta)

### C.1 Introduction

[](#app-viewport-meta-intro)

*This section is non-normative.*

As the [Safari HTML definition](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html#//apple_ref/doc/uid/TP40008193-SW6) of the `viewport meta` tag, that was used in earlier versions of EPUB 3, is not an officially recognized standard, this specification defines a basic syntax to allow [width and height dimensions](#sec-fxl-icb-html) to be expressed for [XHTML fixed-layout documents](#sec-fxl-icb-html).

The syntax of this grammar is also influenced by the parsing algorithm for the `viewport meta` tag, as defined in \[[css-viewport-1](#bib-css-viewport-1 "CSS Viewport Module Level 1")\].

The syntax is intentionally left as generic as possible as it is not in this specification's scope to define all the possible properties and values. It only defines the basic requirements for defining a property and value pair as well as the possible separators between expressions.

### C.2 Syntax

[](#app-viewport-meta-syntax)

For [XHTML fixed-layout documents](#sec-fxl-icb-html), a `viewport` [`meta`](https://html.spec.whatwg.org/multipage/#the-meta-element) tag \[[html](#bib-html "HTML Standard")\] *MUST* have `name` and `content` attributes that conform to the following definition:

name  
The value of the [`name`](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-name) attribute \[[html](#bib-html "HTML Standard")\] after [whitespace normalization](https://www.w3.org/TR/xml/#AVNormalize) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] *MUST* be `viewport`.

content  
The value of the [`content`](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-content) attribute \[[html](#bib-html "HTML Standard")\] after [whitespace normalization](https://www.w3.org/TR/xml/#AVNormalize) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] *MUST* be of the following form:

|  |  |  |
|----|----|----|
| [viewport](#viewport.ebnf.def) | = | [property](#viewport.ebnf.property), { [sep](#viewport.ebnf.sep), [property](#viewport.ebnf.property) } ; |
| [property](#viewport.ebnf.property) | = | [name](#viewport.ebnf.name), \[ [assign](#viewport.ebnf.assign), [value](#viewport.ebnf.value) \] ; |
| [name](#viewport.ebnf.name) | = | ? character data ? ; |
| [value](#viewport.ebnf.value) | = | ? character data ? ; |
| [sep](#viewport.ebnf.sep) | = | [sep-char](#viewport.ebnf.sep-char), { [sep-char](#viewport.ebnf.sep-char) } ; |
| [sep-char](#viewport.ebnf.sep-char) | = | ( ";" \| "," \| [space](#viewport.ebnf.space) ) ; |
| [assign](#viewport.ebnf.assign) | = | \[ [space](#viewport.ebnf.space) \], "=", \[ [space](#viewport.ebnf.space) \] ; |
| [space](#viewport.ebnf.space) | = | \#x20 ; |

(EBNF productions \[[iso14977](#bib-iso14977 "ISO/IEC 14977:1996 — Information technology — Syntactic metalanguage — Extended BNF")\])\
All terminal symbols are in the Unicode Block 'Basic Latin' (U+0000 to U+007F). {.productionset}

The only restriction on property [names](#viewport.ebnf.name) and [values](#viewport.ebnf.value) is that they *MUST NOT* contain [separator characters](#viewport.ebnf.sep-char) or the [assignment character](#viewport.ebnf.assign).

The authoring requirements in this section apply *after* [whitespace normalization](https://www.w3.org/TR/xml/#AVNormalize) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] (i.e., after a reading system strips leading and trailing whitespace and compacts all instances of multiple whitespace within the attribute to single spaces). Any [whitespace characters](https://www.w3.org/TR/xml/#NT-S) \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] *MAY* be included in the authored tag so long as the result is valid to this definition.

Note

Although \[[html](#bib-html "HTML Standard")\] [depends on](https://html.spec.whatwg.org/multipage/#dependencies) the \[[infra](#bib-infra "Infra Standard")\] [definition of whitespace](https://infra.spec.whatwg.org/#ascii-whitespace), the Form Feed (U+000C) character is not valid whitespace per the \[[xml](#bib-xml "Extensible Markup Language (XML) 1.0 (Fifth Edition)")\] definition. It cannot be used in the XML syntax (i.e., in XHTML content documents).

There are no restrictions on any other attributes allowed on the [`meta`](https://html.spec.whatwg.org/multipage/#the-meta-element) element by the \[[html](#bib-html "HTML Standard")\] grammar.

Note

For more information about specifying the `height` and `width` properties and their expected values, refer to [7.3.2 Fixed-layout document dimensions](#sec-fxl-content-dimensions).

Although the `viewport meta` tag allows the use of properties other than `height` and `width`, as well as to omit values for the `height` and `width`, such use is strongly discouraged. Setting other properties could have unintended consequences on the rendering of fixed-layout documents.

## D. Vocabularies

[](#app-vocabs)

This appendix defines a general set of mechanisms by which attributes in this specification can reference terms from vocabularies. It also defines EPUB-specific vocabularies for use with the attributes.

### D.1 Property field definitions

[](#sec-property-field-definitions)

The fields in the vocabulary definition tables have the following implicit requirements:

Allowed Values  
Specifies the *REQUIRED* type of value using \[[xmlschema-2](#bib-xmlschema-2 "XML Schema Part 2: Datatypes Second Edition")\] datatypes. Datatypes are declared using the `xsd:` prefix.

Applies To  
Specifies which publication resource type(s) that the property *MAY* be specified on.

This field appears for properties used in the [`properties` attribute](#attrdef-properties).

Cardinality  
Specifies the number of times the property *MAY* be specified, whether globally or attached to another element or property.

Properties with a minimum cardinality of one *MUST* be specified.

Description  
Describes the purpose of the property and specifies any additional usage requirements that have to be followed.

Example  
Provides non-normative usage examples.

Extends  
Identifies what metadata the property *MAY* be associated with.

This field appears for properties that define [primary expressions and subexpressions](#meta-expr-types) and [relationships](#attrdef-link-rel).

Name  
Specifies the name of the property as it *MUST* appear in the metadata.

### D.2 Meta properties vocabulary

[](#app-meta-property-vocab)

The properties in this vocabulary are usable in the [`meta`](#dfn-meta) element's `property` attribute.

Unless indicated otherwise in its "Extends" field, the properties defined in this section are used to define [subexpressions](#subexpression): in other words, a [`meta`](#dfn-meta) element carrying a property defined in this section *MUST* have a [`refines`](#attrdef-refines) attribute referencing a resource or expression being augmented.

The prefix URL for [referencing these properties](#sec-default-vocab) is `http://idpf.org/epub/vocab/package/meta/#`.

#### D.2.1 alternate-script

[](#sec-alternate-script)

[TABLE]

[Example 84](#example-author-name-expressed-in-english-and-japanese): Author name expressed in English and Japanese

``` xml
<metadata …>
   …
   <dc:creator id="creator">
      Haruki Murakami
   </dc:creator>
   <meta
       refines="#creator"
       property="alternate-script"
       xml:lang="ja">
      村上春樹
   </meta>
   …
</metadata>
```

#### D.2.2 authority

[](#sec-authority)

[TABLE]

[Example 85](#example-expressing-a-bisac-subject-heading): Expressing A BISAC subject heading

``` xml
<metadata …>
   …
   <dc:subject
      id="subject01">
     FICTION / Occult &amp; Supernatural
   </dc:subject>
   <meta
       refines="#subject01"
       property="authority">
      BISAC
   </meta>
   …
</metadata>
```

#### D.2.3 belongs-to-collection

[](#sec-belongs-to-collection)

[TABLE]

[Example 86](#example-indicating-a-publication-belongs-to-a-set): Indicating a publication belongs to a set

In this example, the publication belongs to the Harry Potter set of books.

``` xml
<metadata>
   …
   <meta
       property="belongs-to-collection"
       id="c02">
      Harry Potter
   </meta>
   <meta
       refines="#c02"
       property="collection-type">
      set
   </meta>
   …
</metadata>
```

#### D.2.4 collection-type

[](#sec-collection-type)

[TABLE]

[Example 87](#example-identifying-a-publication-belongs-to-a-series): Identifying a publication belongs to a series

In this example, the publication belongs to the series The New French Cuisine Masters.

``` xml
<metadata …>
   …
   <meta
       property="belongs-to-collection"
       id="c01">
      The New French Cuisine Masters
   </meta>
   <meta
       refines="#c01"
       property="collection-type">
      series
   </meta>
   …
</metadata>
```

#### D.2.5 display-seq

[](#sec-display-seq)

[TABLE]

#### D.2.6 file-as

[](#sec-file-as)

|  |  |
|----|----|
| Name: | `file-as` |
| Description: | The `file-as` property provides the normalized form of the associated property for sorting. |
| Allowed value(s): | `xsd:string` |
| Cardinality: | `zero or one` |
| Extends: | All properties. |

[Example 88](#example-expressing-an-author-name-for-sorting): Expressing an author name for sorting

``` xml
<metadata …>
   …
   <dc:creator
       id="creator01">
      Lewis Carroll
   </dc:creator>
   <meta
       refines="#creator01"
       property="file-as">
      Carroll, Lewis
   </meta>
   …
</metadata>
```

#### D.2.7 group-position

[](#sec-group-position)

[TABLE]

[Example 89](#example-identifying-a-publication-s-position-in-a-set): Identifying a publication's position in a set

In this example, the publication is the second in the Lord of the Rings set of books.

``` xml
<metadata …>
   …
   <meta property="belongs-to-collection" id="c01">
      The Lord of the Rings
   </meta>
   <meta
       refines="#c01"
       property="collection-type">
      set
   </meta>
   <meta
       refines="#c01"
       property="group-position">
      2
   </meta>
   …
</metadata>
```

[Example 90](#example-expressing-a-decimal-separated-value-for-position): Expressing a decimal-separated value for position

In this example, the decimal-separated value in the `group-position` attribute indicates this publication is volume 98, issue 4 of a periodical.

``` xml
<metadata …>
   …
   <meta
       property="belongs-to-collection"
       id="cygnus-x-1">
      Physical Review D
   </meta>
   <meta
       refines="#cygnus-x-1"
       property="collection-type">
      series
   </meta>
   <meta
       refines="#cygnus-x-1"
       property="group-position">
      98.4
   </meta>
   …
</metadata>
```

#### D.2.8 identifier-type

[](#sec-identifier-type)

[TABLE]

[Example 91](#example-indicating-an-identifier-is-an-isbn): Indicating an identifier is an ISBN

In this example, the ONIX code list 5 scheme defines the meaning of the numeric value `15`.

``` xml
<metadata …>
   …
   <dc:identifier
       id="isbn-id">
      urn:isbn:9780101010101
   </dc:identifier>
   <meta
      refines="#isbn-id"
      property="identifier-type"
      scheme="onix:codelist5">
     15
   </meta>
   …
</metadata>
```

#### D.2.9 pageBreakSource

[](#sec-pageBreakSource)

[TABLE]

Note

The `pageBreakSource` property replaces the [`source-of` property](#sec-source-of) for identifying the source of static pagination for an EPUB publication.

Refer to \[[epub-a11y-tech-11](#bib-epub-a11y-tech-11 "EPUB Accessibility Techniques 1.1")\] for information on how to provide accessible page navigation.

[Example 92](#example-pagination-from-a-source-with-a-unique-identifier): Pagination from a source with a unique identifier

In this example, the pagination corresponds to a print edition with an ISBN number. A URN is used to identify the scheme the number conforms to.

``` xml
<meta
property="pageBreakSource">
urn:isbn:9780010010001
</meta>
```

[Example 93](#example-pagination-without-a-source): Pagination without a source

In this example, the publisher has added the page break markers and page list for a digital-only edition. The value `none` indicates that the pagination is not drawn from another source.

``` abnf
<meta
property="pageBreakSource">
none
</meta>
```

[Example 94](#example-pagination-from-a-source-without-a-unique-identifier): Pagination from a source without a unique identifier

In this example, the name of the document and its format are used to identify the source of the pagination.

``` xml
<meta
property="pageBreakSource">
Hobo eReader User Manual. PDF: https://example.org/manuals/hobo/
</meta>
```

#### D.2.10 role

[](#sec-role)

[TABLE]

[Example 95](#example-differentiating-creator-roles): Differentiating creator roles

In this example, MARC Relators vocabulary values differentiate the author from the illustrator of a work.

``` xml
<metadata …>
   …
   <dc:creator
      id="creator01">
     Lewis Carroll
   </dc:creator>
   <meta
       refines="#creator01"
       property="role"
       scheme="marc:relators">
      aut
   </meta>

   <dc:creator
       id="creator02">
      John Tenniel
   </dc:creator>
   <meta
       refines="#creator02"
       property="role"
       scheme="marc:relators">
      ill
   </meta>
   …
</metadata>
```

[Example 96](#example-identifying-a-creator-who-has-multiple-roles): Identifying a creator who has multiple roles

In this example, the creator is both the author and illustrator of the work.

``` xml
<metadata …>
   …
   <dc:creator
       id="creator01">
      Maurice Sendak
   </dc:creator>
   <meta
       refines="#creator01"
       property="role"
       scheme="marc:relators">
      aut
   </meta>
   <meta
       refines="#creator01"
       property="role"
       scheme="marc:relators">
      ill
   </meta>
   …
</metadata>
```

#### D.2.11 term

[](#sec-term)

|                   |                                              |
|-------------------|----------------------------------------------|
| Name:             | `term`                                       |
| Description:      | The `term` property provides a subject code. |
| Allowed value(s): | `xsd:string`                                 |
| Cardinality:      | `zero or one`                                |
| Extends:          | [`dc:subject`](#dfn-dc-subject)              |

[Example 97](#example-expressing-a-bisac-code-for-a-subject-heading): Expressing a BISAC code for a subject heading

The following example shows a BISAC code for a subject heading.

``` xml
<metadata …>
   …
   <dc:subject
       id="subject01">
      FICTION / Occult &amp; Supernatural
   </dc:subject>
   <meta
       refines="#subject01"
       property="authority">
      BISAC
   </meta>
   <meta
       refines="#subject01"
       property="term">
      FIC024000
   </meta>
   …
</metadata>
```

#### D.2.12 title-type

[](#sec-title-type)

[TABLE]

[Example 98](#example-expressing-different-title-types): Expressing different title types

``` xml
<metadata …>
   …
   <dc:title id="t1">
      A Dictionary of Modern English Usage
   </dc:title>
   <meta
       refines="#t1"
       property="title-type">
      main
   </meta>

   <dc:title id="t2">
      First Edition
   </dc:title>
   <meta
       refines="#t2"
       property="title-type">
      edition
   </meta>

   <dc:title id="t3">
      Fowler's
   </dc:title>
   <meta
       refines="#t3"
       property="title-type">
      short
   </meta>
   …
</metadata>
```

[Example 99](#example-expressing-complex-titles): Expressing complex titles

This example shows how to classify the title "The Great Cookbooks of the World: Mon premier guide de cuisson, un Mémoire. The New French Cuisine Masters, Volume Two. Special Anniversary Edition".

``` xml
<metadata …>
   …
   <dc:title
       id="t1"
       xml:lang="fr">
      Mon premier guide de cuisson, un Mémoire
   </dc:title>
   <meta
       refines="#t1"
       property="title-type">
      main
   </meta>
   <meta
       refines="#t1"
       property="display-seq">
      2
   </meta>

   <dc:title id="t2">
      The Great Cookbooks of the World
   </dc:title>
   <meta
       refines="#t2"
       property="title-type">
      collection
   </meta>
   <meta
       refines="#t2"
       property="display-seq">
      1
   </meta>

   <dc:title id="t3">
      The New French Cuisine Masters
   </dc:title>
   <meta
       refines="#t3"
       property="title-type">
      collection
   </meta>
   <meta
       refines="#t3"
       property="display-seq">
      3
   </meta>

   <dc:title id="t4">
      Special Anniversary Edition
   </dc:title>
   <meta
       refines="#t4"
       property="title-type">
      edition
   </meta>
   <meta
       refines="#t4"
       property="display-seq">
      4
   </meta>

   <dc:title id="t5">
      The Great Cookbooks of the World: 
      Mon premier guide de cuisson, un Mémoire. 
      The New French Cuisine Masters, Volume Two. 
      Special Anniversary Edition
   </dc:title>
   <meta
       refines="#t5"
       property="title-type">
      expanded
   </meta>
   …
</metadata>
```

#### D.2.13 Examples

[](#sec-property-examples)

[Example 100](#example-a-typical-set-of-refines-metadata-in-an-epub-publication): A typical set of refines metadata in an EPUB publication

``` xml
<metadata …>

   <dc:identifier id="pub-id">
      urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809
   </dc:identifier>

   <dc:identifier id="isbn-id">
      urn:isbn:9780101010101
   </dc:identifier>
   <meta
       refines="#isbn-id"
       property="identifier-type"
       scheme="onix:codelist5">
      15
   </meta>

   <dc:source id="src-id">
      urn:isbn:9780375704024
   </dc:source>
   <meta
       refines="#src-id"
       property="identifier-type"
       scheme="onix:codelist5">
      15
   </meta>

   <dc:title id="title">
      Norwegian Wood
   </dc:title>
   <meta
       refines="#title"
       property="title-type">
      main
   </meta>

   <dc:language>
      en
   </dc:language>

   <dc:creator
       id="creator">
      Haruki Murakami
   </dc:creator>
   <meta
       refines="#creator"
       property="role"
       scheme="marc:relators"
       id="role">
      aut
   </meta>
   <meta
       refines="#creator"
       property="alternate-script"
       xml:lang="ja">
      村上 春樹
   </meta>
   <meta
       refines="#creator"
       property="file-as">
      Murakami, Haruki
   </meta>

   <meta
       property="dcterms:modified">
      2011-01-01T12:00:00Z
   </meta>

</metadata>
```

### D.3 Metadata link vocabulary

[](#app-link-vocab)

The properties in this vocabulary are usable in the metadata [`link`](#dfn-link) element's `rel` and `properties` attributes.

The prefix URL for [referencing these properties](#sec-default-vocab) is `http://idpf.org/epub/vocab/package/link/#`.

#### D.3.1 Link relationships

[](#sec-link-rel)

The following values can be used in the `link` element [`rel` attribute](#attrdef-link-rel) to establish the relationship of the resource referenced in the [`href` attribute](#attrdef-href).

##### D.3.1.1 alternate

[](#sec-alternate)

[TABLE]

##### D.3.1.2 record

[](#sec-record)

[TABLE]

##### D.3.1.3 voicing

[](#sec-voicing)

[TABLE]

#### D.3.2 Link properties

[](#sec-link-properties)

The following values can be used in the [`link`](#dfn-link) element's `properties` attribute to establish the type of record a referenced resource represents. These values are provided for record formats that cannot be uniquely identified by their media type.

##### D.3.2.1 onix

[](#sec-onix)

|  |  |
|----|----|
| Name: | `onix` |
| Description: | The `onix` property indicates the referenced resource is an ONIX record \[[onix](#bib-onix "ONIX for Books 3.0")\]. |
| Example: | `<link rel="record" href="pub/meta/nor-wood-onix.xml" media-type="application/xml" properties="onix"/>` |

### D.4 Package rendering vocabulary

[](#app-rendering-vocab)

The prefix URL for [referencing these properties](#sec-default-vocab) is `http://www.idpf.org/vocab/rendition/#`.

The "`rendition:`" prefix is [reserved for use](#sec-metadata-reserved-prefixes) with the package rendering properties and does not have to be declared in the [package document](#dfn-package-document).

#### D.4.1 Layout control

[](#sec-layout-specify)

##### D.4.1.1 rendition:layout

[](#layout-def)

[TABLE]

##### D.4.1.2 Layout overrides

[](#layout-overrides)

###### D.4.1.2.1 rendition:layout-pre-paginated

[](#sec-layout-pre-paginated)

[TABLE]

###### D.4.1.2.2 rendition:layout-reflowable

[](#sec-layout-reflowable)

[TABLE]

#### D.4.2 Synthetic spread placement

[](#spread-placement)

##### D.4.2.1 rendition:page-spread-center

[](#sec-rendition-page-spread-center)

[TABLE]

##### D.4.2.2 rendition:page-spread-left

[](#sec-rendition-page-spread-left)

[TABLE]

##### D.4.2.3 rendition:page-spread-right

[](#sec-rendition-page-spread-right)

[TABLE]

### D.5 Custom rendering properties

[](#sec-rendering-custom-properties)

Custom properties and [spine](#dfn-epub-spine) overrides can be included in the [package document](#dfn-package-document) to address rendering issues specific to particular [reading systems](#dfn-epub-reading-system), as defined by the developers of those reading systems.

The only restrictions are that such properties *MUST NOT* be defined with a `rendition:` prefix and *MUST NOT* conflict behaviorally with properties in the [package rendering vocabulary](#app-rendering-vocab).

If extensions are needed for use by multiple independent reading systems, the preferred method is to extend the package rendering vocabulary through a revision to this standard.

### D.6 Manifest properties vocabulary

[](#app-item-properties-vocab)

The properties in this vocabulary are usable in the manifest [`item`](#dfn-item) element's [`properties` attribute](#attrdef-item-properties).

The prefix URL for [referencing these properties](#sec-default-vocab) is `http://idpf.org/epub/vocab/package/item/#`.

#### D.6.1 cover-image

[](#sec-cover-image)

|  |  |
|----|----|
| Name: | `cover-image` |
| Description: | The `cover-image` property identifies the described [publication resource](#dfn-publication-resource) as the cover image for the [EPUB publication](#dfn-epub-publication). |
| Applies to: | All [raster and vector image types](#tbl-core-media-types) |
| Cardinality: | `Zero or one` |

#### D.6.2 mathml

[](#sec-mathml)

|  |  |
|----|----|
| Name: | `mathml` |
| Description: | The `mathml` property indicates that the described [publication resource](#dfn-publication-resource) contains one or more instances of MathML markup. |
| Applies to: | [EPUB content documents](#dfn-epub-content-document) |
| Cardinality: | `Zero or more` |

#### D.6.3 nav

[](#sec-nav-prop)

|  |  |
|----|----|
| Name: | `nav` |
| Description: | The `nav` property indicates that the described publication resource constitutes the [EPUB navigation document](#dfn-epub-navigation-document) of the [EPUB publication](#dfn-epub-publication). |
| Applies to: | The EPUB navigation document |
| Cardinality: | `Exactly one` |

#### D.6.4 remote-resources

[](#sec-remote-resources)

[TABLE]

#### D.6.5 scripted

[](#sec-scripted)

|  |  |
|----|----|
| Name: | `scripted` |
| Description: | The `scripted` property indicates that the described [publication resource](#dfn-publication-resource) is a [scripted content document](#dfn-scripted-content-document) (i.e., contains scripting and/or \[[html](#bib-html "HTML Standard")\] [`form`](https://html.spec.whatwg.org/multipage/forms.html#the-form-element) elements). |
| Applies to: | [EPUB content documents](#dfn-epub-content-document) |
| Cardinality: | `Zero or more` |

#### D.6.6 svg

[](#sec-svg-prop)

[TABLE]

#### D.6.7 switch

[](#sec-switch)

|  |  |
|----|----|
| Name: | `switch` |
| Description: | The `switch` property indicates that the described [publication resource](#dfn-publication-resource) contains one or more instances of the [deprecated `epub:switch` element](#sec-xhtml-content-switch). |
| Applies to: | [XHTML content documents](#dfn-xhtml-content-document). |
| Cardinality: | `Zero or more` |

### D.7 Spine properties vocabulary

[](#app-itemref-properties-vocab)

The properties in this vocabulary are usable in the spine [`itemref`](#dfn-itemref) element's [`properties` attribute](#attrdef-itemref-properties).

The prefix URL for [referencing these properties](#sec-default-vocab) is `http://idpf.org/epub/vocab/package/itemref/#`.

#### D.7.1 page-spread-left

[](#sec-page-spread-left)

[TABLE]

#### D.7.2 page-spread-right

[](#sec-page-spread-right)

[TABLE]

#### D.7.3 Examples

[](#examples-itemref-properties)

[Example 101](#example-itemref-multicol): Identifying a two-page spread in the spine

```
<spine>
<itemref
    idref="title"/>
<itemref
    idref="ps-1-l"
    properties="page-spread-left"/>
<itemref
    idref="ps-1-r"
    properties="page-spread-right"/>
<itemref
    idref="toc"/>
…
</spine>
```

### D.8 Media overlays vocabulary

[](#app-overlays-vocab)

The properties in this vocabulary are usable in the [`meta`](#dfn-meta) element's `property` attribute.

The prefix URL for [referencing these properties](#sec-default-vocab) is `http://idpf.org/epub/vocab/overlays/#`.

The prefix "`media:`" is [reserved for use](#sec-metadata-reserved-prefixes) with properties in this vocabulary and does not have to be declared in the [package document](#dfn-package-document).

#### D.8.1 active-class

[](#sec-active-class)

|  |  |
|----|----|
| Name: | `active-class` |
| Description: | The CSS class name to apply to the currently playing [EPUB content document](#dfn-epub-content-document) element. |
| Allowed value(s): | `xsd:string` |
| Cardinality: | `Zero or one` |
| Example: | `<meta property="media:active-class">-epub-media-overlay-active</meta>` |

#### D.8.2 duration

[](#sec-duration)

|  |  |
|----|----|
| Name: | `duration` |
| Description: | The duration of the entire presentation or of a specific [media overlay document](#dfn-media-overlay-document). The specified durations account for the audio clips known at authoring time, and so exclude live streaming from external resources and speech synthesis. |
| Allowed value(s): | *MUST* be a \[[smil3](#bib-smil3 "Synchronized Multimedia Integration Language (SMIL 3.0)")\] [clock value](https://www.w3.org/TR/SMIL3/smil-timing.html#q22). |
| Cardinality: | Exactly one for the [EPUB publication](#dfn-epub-publication) and for each [media overlay document](#dfn-media-overlay-document). |
| Example: | `<meta property="media:duration">1:36:20</meta>` |

#### D.8.3 narrator

[](#sec-narrator)

|                   |                                                      |
|-------------------|------------------------------------------------------|
| Name:             | `narrator`                                           |
| Description:      | Name of the narrator.                                |
| Allowed value(s): | `xsd:string`                                         |
| Cardinality:      | `Zero or more`                                       |
| Example:          | `<meta property="media:narrator">Joe Speaker</meta>` |

#### D.8.4 playback-active-class

[](#sec-playback-active-class)

|  |  |
|----|----|
| Name: | `playback-active-class` |
| Description: | Author-defined CSS class name to apply to the [EPUB content document's](#dfn-epub-content-document) document element when playback is active. |
| Allowed value(s): | `xsd:string` |
| Cardinality: | `Zero or one` |
| Example: | `<meta property="media:playback-active-class">-epub-media-overlay-playing</meta>` |

## E. Obsolete features

[](#app-obsolete)

### E.1 Outdated features

[](#sec-obs-conform)

An outdated feature is one that is not deprecated but that is also either not designed for use in EPUB 3 [reading systems](#dfn-epub-reading-system) or that would ideally be [deprecated](#deprecated) except that it would invalidate a significant base of existing [EPUB publications](#dfn-epub-publication).

[EPUB publications](#dfn-epub-publication) *MAY* include outdated features defined in this section, but their usage *MUST* conform to their referenced definitions.

Publication resources  
- [Content fallbacks](https://www.w3.org/TR/epub-33/#content-fallbacks) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

Open Container Format (OCF)  
- [Font obfuscation](https://www.w3.org/TR/epub-33/#sec-font-obfuscation) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

  Caution

  NIST is advising that use of the SHA-1 algorithm \[[fips-180-4](#bib-fips-180-4 "FIPS PUB 180-4: Secure Hash Standard (SHS)")\] be phased out by the end of 2030. The Publishing Maintenance Working Group does not intend to support font obfuscation in EPUB publications past that date due to its reliance on SHA-1, although reading systems will have to continue to support deobfuscation for existing EPUB publications.

  Better methods of protecting fonts exist. Both \[[woff](#bib-woff "WOFF File Format 1.0")\] and \[[woff2](#bib-woff2 "WOFF File Format 2.0")\] fonts, for example, allow the embedding of licensing information and provide some protection through font table compression. The use of remotely hosted fonts also allows for font subsetting.

Collections  
- [`collection` element](https://www.w3.org/TR/epub-33/#sec-collection-elem) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

Caution

When EPUB 3 was maintained by IDPF, a number of specifications were developed that relied on the `collection` element. Due to a lack of adoption and implementation in reading systems, these specifications are no longer maintained and use of the element is no longer advised.

Legacy features  
- [OPF 2 `meta` element](https://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2) \[[opf-201](#bib-opf-201 "Open Packaging Format 2.0.1")\]

- [OPF 2 `guide` element](https://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.6) \[[opf-201](#bib-opf-201 "Open Packaging Format 2.0.1")\]

- [OPF 2 NCX](https://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.4.1) \[[opf-201](#bib-opf-201 "Open Packaging Format 2.0.1")\]

Note

EPUB 3 reading systems ignore these features. They are replaced by the [`meta`](#dfn-meta) element, the [landmarks nav](#sec-nav-landmarks), and the [toc nav](#sec-nav-toc), respectively.

The features are retained only to provide a measure of backwards compatibility with reading systems that only support EPUB 2. As such reading systems are now rare, including these features has limited value.

Meta properties vocabulary  
- [`source-of` property](https://www.w3.org/TR/epub-33/#source-of) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

Package rendering vocabulary  
- [`rendition:flow` property](https://www.w3.org/TR/epub-33/#flow) and its [spine overrides](https://www.w3.org/TR/epub-33/#flow-overrides) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

- [`rendition:orientation` property](https://www.w3.org/TR/epub-33/#orientation) and its [spine overrides](https://www.w3.org/TR/epub-33/#orientation-overrides) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

- [`rendition:spread` property](https://www.w3.org/TR/epub-33/#spread) and its [spine overrides](https://www.w3.org/TR/epub-33/#spread-overrides) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

Prefixed CSS properties  
- [`-epub-text-orientation`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-text-orientation) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-writing-mode`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-writing-mode) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-text-combine-horizontal`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-text-combine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-hyphens`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-hyphens) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-line-break`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-line-break) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-text-align-last`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-align-last) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-word-break`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-word-break) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- `text-transform` value [`-epub-fullwidth`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-text-transform) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-text-emphasis-color`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-emphasis-color) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-text-emphasis-position`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-emphasis-position) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-text-emphasis-style`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-emphasis-style) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]
- [`-epub-text-underline-position`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-underline-position) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

Caution

EPUB 3 originally included these prefixed properties as many CSS features related to world languages were not yet mature. They are only retained now to ensure backwards compatibility for content authored using these prefixes. The Working Group recommends switching to the unprefixed versions as soon as CSS support allows as these prefixed properties are not expected to be maintained in the next major version of EPUB.

Note

The Working Group advises that [EPUB conformance checkers](#dfn-epub-conformance-checker) not issue alerts about the presence of outdated features in [EPUB publications](#dfn-epub-publication). Only issue alerts if a feature does not conform to its definition or otherwise breaks a usage requirement.

### E.2 Deprecated features

[](#sec-obs-deprecated)

A deprecated feature is one that has limited or no support in [reading systems](#dfn-epub-reading-system) and/or usage in [EPUB publications](#dfn-epub-publication).

The following deprecated features *SHOULD NOT* be used. When used, their usage *MUST* conform to their referenced definitions.

Package document  
- [`bindings` element](https://idpf.org/epub/301/spec/epub-publications-20140626.html#sec-bindings-elem) \[[epubpublications-301](#bib-epubpublications-301 "EPUB Publications 3.0.1")\]

- [new collection types](https://www.w3.org/publishing/epub32/epub-packages.html#sec-collection-elem) \[[epubpackages-32](#bib-epubpackages-32 "EPUB Packages 3.2")\]

XHTML content documents  
- [`switch` element](https://idpf.org/epub/301/spec/epub-contentdocs-20140626.html#sec-xhtml-epub-switch) \[[epubcontentdocs-301](#bib-epubcontentdocs-301 "EPUB Content Documents 3.0.1")\]

- [`epub:trigger` element](https://idpf.org/epub/301/spec/epub-contentdocs-20140626.html#sec-xhtml-epub-trigger) \[[epubcontentdocs-301](#bib-epubcontentdocs-301 "EPUB Content Documents 3.0.1")\]

Vocabulary association mechanisms  
- [`xsd` reserved prefix](https://www.w3.org/TR/epub-33/#tbl-pkg-reserved-prefixes) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for package metadata.

- [`msv` and `prism` reserved prefixes](https://www.w3.org/TR/epub-33/#tbl-reserved-prefixes) \[[epub-33](#bib-epub-33 "EPUB 3.3")\] for structural semantics.

Meta properties vocabulary  
- [`meta-auth` property](https://idpf.org/epub/30/spec/epub30-publications-20111011.html#meta-auth) \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\]

Link relationships vocabulary  
- [`marc21xml-record` property](https://idpf.org/epub/30/spec/epub30-publications-20111011.html#marc21xml-record) \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\] — It is replaced by the [`record`](#record) keyword with the [`media-type` attribute](#attrdef-link-media-type) value "`application/marcxml+xml`".

- [`mods-record` property](https://idpf.org/epub/30/spec/epub30-publications-20111011.html#mods-record) \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\] — It is replaced by the [`record`](#record) keyword with the [`media-type` attribute](#attrdef-link-media-type) value "`application/mods+xml`".

- [`onix-record` property](https://idpf.org/epub/30/spec/epub30-publications-20111011.html#onix-record) \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\] — It is replaced by the [`record`](#record) keyword with the [properties attribute](#attrdef-properties) value [`onix`](#onix).

- [`xml-signature` property](https://idpf.org/epub/30/spec/epub30-publications-20111011.html#xml-signature) \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\]

- [`xmp-record` property](https://idpf.org/epub/30/spec/epub30-publications-20111011.html#xmp-record) \[[epubpublications-30](#bib-epubpublications-30 "EPUB Publications 3.0")\]

Package rendering vocabulary  
- [`rendition:align-x-center` property](https://www.w3.org/TR/epub-33/#align-x-center) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

- [`rendition:viewport` property](https://idpf.org/epub/301/spec/epub-publications-20140626.html#fxl-property-viewport) \[[epubpublications-301](#bib-epubpublications-301 "EPUB Publications 3.0.1")\]

Prefixed CSS properties  
- [`-epub-text-combine`](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-text-combine) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

Note

The Working Group recommends that [EPUB conformance checkers](#dfn-epub-conformance-checker) alert about the presence of deprecated features when encountered in EPUB publications.

## F. Schemas

[](#app-schemas)

*This section is non-normative.*

### F.1 Package document schema

[](#app-package-schema)

A schema for [package documents](#dfn-package-document) is available at <https://github.com/w3c/epubcheck/tree/master/src/main/resources/com/adobe/epubcheck/schema/30/package-30.nvdl>.

Validation using this schema requires a processor that supports \[[nvdl](#bib-nvdl "ISO/IEC 19757-4: NVDL (Namespace-based Validation Dispatching Language)")\], \[[relaxng-schema](#bib-relaxng-schema "Information technology -- Document Schema Definition Language (DSDL) -- Part 2: Regular-grammar-based validation -- RELAX NG")\], \[[isoschematron](#bib-isoschematron "ISO/IEC 19757-3: Rule-based validation — Schematron")\] and \[[xmlschema-2](#bib-xmlschema-2 "XML Schema Part 2: Datatypes Second Edition")\].

Note

The NVDL schema layer can be substituted by a multi-pass validation using the embedded RELAX NG and ISO Schematron schemas alone.

Note

Updates and corrections to these schemas can occur outside of formal revisions of this specification. As a result, they are subject to change at any time.

### F.2 OCF schemas

[](#app-ocf-schema)

#### F.2.1 Schema for `container.xml`

[](#app-schema-container)

A schema for [`container.xml` files](#sec-container-metainf-container.xml) is available at [`https://github.com/w3c/epubcheck/tree/master/src/main/resources/com/adobe/epubcheck/schema/30/ocf-container-30.nvdl`](https://github.com/w3c/epubcheck/tree/master/src/main/resources/com/adobe/epubcheck/schema/30/ocf-container-30.nvdl).

Validation using this schema requires a processor that supports \[[relaxng-schema](#bib-relaxng-schema "Information technology -- Document Schema Definition Language (DSDL) -- Part 2: Regular-grammar-based validation -- RELAX NG")\] and \[[xmlschema-2](#bib-xmlschema-2 "XML Schema Part 2: Datatypes Second Edition")\].

#### F.2.2 Schema for `encryption.xml`

[](#app-schema-encryption)

The schema for [`encryption.xml` files](#sec-container-metainf-encryption.xml) is included in \[[xmlsec-rngschema-20130411](#bib-xmlsec-rngschema-20130411 "XML Security RELAX NG Schemas")\].

#### F.2.3 Schema for `signatures.xml`

[](#app-schema-signatures)

The schema for [`signatures.xml` files](#sec-container-metainf-signatures.xml) is included in \[[xmlsec-rngschema-20130411](#bib-xmlsec-rngschema-20130411 "XML Security RELAX NG Schemas")\].

### F.3 Media overlays schema

[](#app-schema-overlays)

A schema for [media overlay documents](#dfn-media-overlay-document) is available at [https://github.com/w3c/epubcheck/tree/main/src/master/resources/com/adobe/epubcheck/schema/30/media-overlay-30.nvdl](https://github.com/w3c/epubcheck/tree/master/src/main/resources/com/adobe/epubcheck/schema/30/media-overlay-30.nvdl).

Validation using this schema requires a processor that supports \[[nvdl](#bib-nvdl "ISO/IEC 19757-4: NVDL (Namespace-based Validation Dispatching Language)")\], \[[relaxng-schema](#bib-relaxng-schema "Information technology -- Document Schema Definition Language (DSDL) -- Part 2: Regular-grammar-based validation -- RELAX NG")\], \[[isoschematron](#bib-isoschematron "ISO/IEC 19757-3: Rule-based validation — Schematron")\] and \[[xmlschema-2](#bib-xmlschema-2 "XML Schema Part 2: Datatypes Second Edition")\].

Note

The NVDL schema layer can be substituted by a multi-pass validation using the embedded RELAX NG and ISO Schematron schemas alone.

## G. Media type registrations

[](#app-media-types)

### G.1 The `application/oebps-package+xml` media type

[](#app-media-type-app-oebps-package)

This appendix registers the media type `application/oebps-package+xml` for the EPUB package document. This registration supersedes RFC4839 (see <https://www.rfc-editor.org/rfc/rfc4839>).

The package document is an XML file that describes an EPUB publication. It identifies the resources in the EPUB publication and provides metadata information. The package document and its related specifications are maintained and defined by the [World Wide Web Consortium](https://www.w3.org) (W3C).

MIME media type name:  
`application`

MIME subtype name:  
`oebps-package+xml`

Required parameters:  
None.

Optional parameters:  
None.

Encoding considerations:  
8bit if UTF-8; binary if UTF-16.

Package documents are in XML, represented either in UTF-8 or UTF-16. When the package document is written in UTF-8, the file is 8bit compatible. When it is written in UTF-16, the binary content-transfer-encoding must be used. For further details, see \[[rfc7303](#bib-rfc7303 "XML Media Types")\].

Security considerations:  
Package documents contain well-formed XML conforming to the XML 1.0 specification.

Clearly, it is possible to author malicious files which, for example, contain malformed data. Most XML parsers protect themselves from such attacks by rigorously enforcing conformance.

All processors that read package documents need to rigorously check the size and validity of data retrieved.

There is no current provision in the EPUB 3 specification for encryption, signing, or authentication within the package document format.

Interoperability considerations:  
None.

Published specification:  
This media type registration is for the EPUB package document, as described by the EPUB 3 specification located at <https://www.w3.org/TR/epub/>.

The EPUB 3 specification supersedes the Open Packaging Format 2.0.1 specification, which is located at <https://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm> and which also uses the `application/oepbs-package+xml` media type.

Applications which use this media type:  
This media type is in wide use for the distribution of ebooks in the EPUB format.

Additional information:  
Magic number(s):  
none

File extension(s):  
`.opf`

Macintosh File Type Code(s):  
TEXT

Fragment identifiers:  
EPUB Canonical Fragment Identifiers are custom fragment identifiers defined for [EPUB Publications](#dfn-epub-publication). They may be used to refer to an arbitrary content within any [publication resource](#dfn-publication-resource) defined for the publication. These identifiers are defined at <https://idpf.org/epub/linking/cfi/>.

Person & email address to contact for further information:  
Publishing Maintenance Working Group (epub-maintenance@w3.org)

Intended usage:  
COMMON

Author/Change controller:  
World Wide Web Consortium (W3C)

### G.2 The `application/epub+zip` media type

[](#app-media-type)

This appendix registers the media type `application/epub+zip` for the EPUB Open Container Format (OCF).

An OCF ZIP container, or EPUB container, file is a container technology based on the zip archive format (see <https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT>). It is used to encapsulate the EPUB publication. OCF and its related standards are maintained and defined by the [World Wide Web Consortium](https://www.w3.org) (W3C).

MIME media type name:  
`application`

MIME subtype name:  
`epub+zip`

Required parameters:  
None.

Optional parameters:  
None.

Encoding considerations:  
OCF ZIP container files are binary files encoded in the [`application/zip`](https://www.iana.org/assignments/media-types/application/zip) media type.

Security considerations:  
All processors that read OCF ZIP container files should rigorously check the size and validity of data retrieved.

In addition, because of the various content types that can be embedded in OCF ZIP container files, `application/epub+zip` may describe content that poses security implications beyond those noted here. However, only in cases where the processor recognizes and processes the additional content, or where further processing of that content is dispatched to other processors, would security issues potentially arise. In such cases, matters of security would fall outside the domain of this registration document.

Security considerations that apply to `application/zip` also apply to OCF ZIP container files.

Interoperability considerations:  
None.

Published specification:  
This media type registration is for the EPUB Open Container Format (OCF), as described by the EPUB 3 specification located at [`https://www.w3.org/TR/epub/`](https://www.w3.org/TR/epub/).

The EPUB 3 specification supersedes both [RFC 4839](https://datatracker.ietf.org/doc/html/rfc4839) and the Open Container Format 2.0.1 specification, which is located at [`https://idpf.org/epub/20/spec/OCF_2.0.1_draft.doc`](https://idpf.org/epub/20/spec/OCF_2.0.1_draft.doc), and which also uses the `application/epub+zip` media type.

Applications that use this media type:  
This media type is in wide use for the distribution of ebooks in the EPUB format.

Additional information:  
Magic number(s):  
0: `PK 0x03 0x04`, 30: `mimetype`, 38: `application/epub+zip`

File extension(s):  
OCF ZIP container files are most often identified with the extension `.epub`.

Macintosh file type code(s):  
ZIP

Fragment identifiers:  
EPUB Canonical Fragment Identifiers are custom fragment identifiers defined for [EPUB Publications](#dfn-epub-publication). They may be used to refer to an arbitrary content within any [publication resource](#dfn-publication-resource) defined for the publication. These identifiers are defined at <https://idpf.org/epub/linking/cfi/>.

Person & email address to contact for further information:  
Publishing Maintenance Working Group (epub-maintenance@w3.org)

Intended usage:  
COMMON

Author/change controller:  
World Wide Web Consortium (W3C)

## H. Index

[](#index)

### H.1 Terms defined by this specification

[](#index-defined-here)

- [`audio`](#dfn-audio) §9.3.2.2.8
- [`body`](#dfn-body) §9.3.2.2.4
- [codec](#dfn-codec) §1.4
- [compact URL](#dfn-compact-url) §5.3.2
- [`Compression`](#dfn-compression) §4.2.6.3.2.2
- [`container`](#dfn-container) §4.2.6.3.1.1
- [container resource](#dfn-container-resource) §1.4
- [container root URL](#dfn-container-root-url) §1.4
- [content plane](#dfn-content-plane) §3.1.3
- [content URL](#dfn-content-url) §1.4
- [core media type resource](#dfn-core-media-type-resource) §1.4
- [`dc:contributor`](#dfn-dc-contributor) §5.6.3.2.2
- [`dc:creator`](#dfn-dc-creator) §5.6.3.2.3
- [`dc:date`](#dfn-dc-date) §5.6.3.2.4
- [`dc:identifier`](#dfn-dc-identifier) §5.6.3.1.1
- [`dc:language`](#dfn-dc-language) §5.6.3.1.3
- [`dc:subject`](#dfn-dc-subject) §5.6.3.2.5
- [`dc:title`](#dfn-dc-title) §5.6.3.1.2
- [`dc:type`](#dfn-dc-type) §5.6.3.2.6
- [dcterms:modified](#dfn-dcterms-modified) §5.6.5
- [default vocabulary](#dfn-default-vocabulary) §5.3.3
- [deprecated](#deprecated) §E.2
- [`EncryptedData`](#dfn-encrypteddata) §4.2.6.3.2.1
- [`EncryptedKey`](#dfn-encryptedkey) §4.2.6.3.2.1
- [`encryption`](#dfn-encryption) §4.2.6.3.2.1
- [EPUB conformance checker](#dfn-epub-conformance-checker) §1.4
- [EPUB container](#dfn-epub-container) §1.4
- [EPUB content document](#dfn-epub-content-document) §1.4
- [EPUB manifest](#dfn-epub-manifest) §1.4
- [EPUB navigation document](#dfn-epub-navigation-document) §1.4
- [EPUB publication](#dfn-epub-publication) §1.4
- [EPUB reading system](#dfn-epub-reading-system) §1.4
- [EPUB spine](#dfn-epub-spine) §1.4
- [`epub:type`](#dfn-epub-type) §7.4.3.2
- [exempt resource](#dfn-exempt-resource) §1.4
- [file name](#dfn-file-name) §1.4
- [file path](#dfn-file-path) §1.4
- [fixed-layout document](#dfn-fixed-layout-document) §1.4
- [foreign content document](#dfn-foreign-content-document) §1.4
- [foreign resource](#dfn-foreign-resource) §1.4
- [`head`](#dfn-head) §9.3.2.2.2
- [`item`](#dfn-item) §5.7.2
- [`itemref`](#dfn-itemref) §5.8.2
- [`link`](#dfn-link) §5.6.6
- [linked resource](#dfn-linked-resource) §1.4
- [`links`](#dfn-links) §4.2.6.3.1.4
- [`manifest`](#dfn-manifest) §5.7.1
- [manifest fallback chain](#dfn-manifest-fallback-chain) §3.5.1
- [manifest plane](#dfn-manifest-plane) §3.1.1
- [media overlay document](#dfn-media-overlay-document) §1.4
- [`meta`](#dfn-meta) §5.6.4
- [`metadata`](#dfn-metadata) §5.6.1
- [non-codec](#dfn-non-codec) §1.4
- [OCF abstract container](#dfn-ocf-abstract-container) §1.4
- [OCF ZIP container](#dfn-ocf-zip-container) §1.4
- [outdated](#outdated) §E.1
- [`package`](#dfn-package) §5.5
- [package document](#dfn-package-document) §1.4
- [`par`](#dfn-par) §9.3.2.2.6
- [pre-paginated](#def-layout-pre-paginated) §6.3.1
- [publication resource](#dfn-publication-resource) §1.4
- [reflowable](#def-layout-reflowable) §6.2
- [remote resource](#dfn-remote-resource) §1.4
- [roll](#def-layout-roll) §6.3.2
- [root directory](#dfn-root-directory) §1.4
- [`rootfile`](#dfn-rootfile) §4.2.6.3.1.3
- [`rootfiles`](#dfn-rootfiles) §4.2.6.3.1.2
- [scripted content document](#dfn-scripted-content-document) §1.4
- [`seq`](#dfn-seq) §9.3.2.2.5
- [`signatures`](#dfn-signatures) §4.2.6.3.6.1
- [`smil`](#dfn-smil) §9.3.2.2.1
- [`spine`](#dfn-spine) §5.8.1
- [spine plane](#dfn-spine-plane) §3.1.2
- [SVG content document](#dfn-svg-content-document) §1.4
- [synthetic spread](#dfn-synthetic-spread) §1.4
- [`text`](#dfn-text) §9.3.2.2.7
- [top-level content document](#dfn-top-level-content-document) §1.4
- [unique identifier](#dfn-unique-identifier) §1.4
- [valid-relative-ocf-URL-with-fragment string](#dfn-valid-relative-container-url-with-fragment-string) §4.2.5
- [value](#dfn-value) §5.6.2
- [viewport](#dfn-viewport) §1.4
- [XHTML content document](#dfn-xhtml-content-document) §1.4

### H.2 Terms defined by reference

[](#index-defined-elsewhere)

- \[[BCP47](#bib-bcp47)\] defines the following:
  - well-formed language tag
- \[[BIDI](#bib-bidi)\] defines the following:
  - base direction
- \[[CHARMOD-NORM](#bib-charmod-norm)\] defines the following:
  - Unicode Canonical Case Fold Normalization Step
- \[[CSS-VALUES](#bib-css-values)\] defines the following:
  - url function
- \[[CSS-WRITING-MODES-3](#bib-css-writing-modes-3)\] defines the following:
  - direction property
  - unicode-bidi property
- \[[CSS2](#bib-css2)\] defines the following:
  - number
- \[[DCTERMS](#bib-dcterms)\] defines the following:
  - Dublin Core /terms/ namespace
- \[[DOM](#bib-dom)\] defines the following:
  - child text content
- \[[DPUB-ARIA](#bib-dpub-aria)\] defines the following:
  - doc-pagebreak
- \[[EPUB-33](#bib-epub-33)\] defines the following:
  - -epub-fullwidth
  - -epub-hyphens
  - -epub-line-break
  - -epub-text-align-last
  - -epub-text-combine-horizontal
  - -epub-text-emphasis-color
  - -epub-text-emphasis-position
  - -epub-text-emphasis-style
  - -epub-text-orientation
  - -epub-text-underline-position
  - -epub-word-break
  - -epub-writing-mode
  - collection element
  - Content fallbacks
  - Font obfuscation
  - msv and prism reserved prefixes
  - rendition:align-x-center property
  - rendition:flow property
  - rendition:orientation property
  - rendition:spread property
  - source-of property
  - spine overrides
  - spine overrides
  - spine overrides
  - xsd reserved prefix
- \[[EPUB-A11Y-12](#bib-epub-a11y-12)\] defines the following:
  - EPUB Accessibility
  - EPUB Accessibility 1.2
- \[[EPUB-OVERVIEW-34](#bib-epub-overview-34)\] defines the following:
  - EPUB 3 Overview
  - Rendering and CSS
- \[[EPUB-RS-34](#bib-epub-rs-34)\] defines the following:
  - attribute has no effect
  - Core media types
  - CSS as defined in the CSS snapshot
  - EPUB 3 Reading Systems
  - epubReadingSystem object
  - fixed-layout documents
  - have to suppress list item numbering
  - Navigation document processing
  - processing
  - reading system support requirements for fonts
  - reflowable documents set to scroll
  - Scripting
  - security and privacy section
  - table reading mode
  - unique origin requirement
  - virtual in nature
- \[[EPUB-SSV-11](#bib-epub-ssv-11)\] defines the following:
  - aside
  - bodymatter
  - endnote
  - figure
  - footnote
  - landmarks
  - list
  - page-list
  - pagebreak
  - table
  - toc
- \[[EPUB-TTS-10](#bib-epub-tts-10)\] defines the following:
  - EPUB 3 Text-to-Speech Support
- \[[HTML](#bib-html)\] defines the following:
  - `a` element
  - `area` element
  - audio
  - `base` element
  - `bdo` element
  - body
  - `canvas` element
  - `content` attribute (for `meta` element)
  - cookies
  - data blocks
  - depends on
  - `dir` attribute (for `html-global` element)
  - `div` element
  - document base URL
  - `embed` element
  - embedded content
  - flow content
  - `form` element
  - h1-h6
  - head
  - `hidden` attribute (for `html-global` element)
  - `href` attribute (for `a` element)
  - `html` element
  - HTML alternate keyword
  - HTML standard
  - HTML syntax
  - `iframe` element
  - `img` element
  - `li` element
  - link
  - meta
  - metadata content
  - Microdata attributes
  - `name` attribute (for `meta` element)
  - `nav` element
  - `object` type
  - `ol` element
  - origin
  - palpable content
  - phrasing content
  - `picture` element
  - restrictions on SVG
  - `role` attribute
  - `rp` element
  - `script` element
  - `source` element
  - `span` element
  - `src` attribute (for `source` element)
  - `srcset` attribute (for `source` element)
  - `style` attribute (for `html-global` element)
  - `template` element
  - top-level browsing context
  - `track` element
  - `type` attribute (for `source` element)
  - vendor-neutral extensions
  - `video` element
  - video
  - web storage
  - XML syntax
  - XML syntax
- \[[INFRA](#bib-infra)\] defines the following:
  - concatenation
  - definition of whitespace
  - HTML namespace
  - list
  - prepend (for `list`)
  - scalar value strings
  - strip and collapse ascii whitespace
  - strip leading and trailing ascii whitespace
- \[[INTERNATIONAL-SPECS](#bib-international-specs)\] defines the following:
  - "Truncating or limiting the length of strings"
- \[[ITS20](#bib-its20)\] defines the following:
  - Global approach in HTML5
  - Using ITS markup in HTML
- \[[JSON-LD11](#bib-json-ld11)\] defines the following:
  - linked data
- \[[MATHML3](#bib-mathml3)\] defines the following:
  - Content MathML
  - Presentation MathML
- \[[RFC2397](#bib-rfc2397)\] defines the following:
  - data: URL scheme
- \[[RFC8089](#bib-rfc8089)\] defines the following:
  - file: URL scheme
- \[[SMIL3](#bib-smil3)\] defines the following:
  - clock value
- \[[SVG](#bib-svg)\] defines the following:
  - renderable elements
  - `svg` element
  - `title` element
- \[[UAAG20](#bib-uaag20)\] defines the following:
  - Guideline 1.4 - Provide text configuration
- \[[URL](#bib-url)\] defines the following:
  - absolute-url string
  - absolute-url-with-fragment string
  - base
  - domain
  - double-dot URL path segments
  - path-relative-scheme-less-url string
  - percent encoded
  - relative-url string
  - relative-URL-with-fragment strings
  - URL
  - url parser
  - URL Serializer
  - url-fragment string
  - valid URL string
- \[[XML](#bib-xml)\] defines the following:
  - 2.12 Language Identification
  - document type declaration
  - external entity
  - external identifier
  - ID
  - IDREF
  - public
  - root element
  - system identifiers
  - whitespace normalization
  - whitespace-separated
- \[[XML-NAMES](#bib-xml-names)\] defines the following:
  - Conformance of Documents
  - prefixed
- \[[XMLDSIG-CORE](#bib-xmldsig-core)\] defines the following:
  - Section 6.6.4
- \[[XMLDSIG-CORE1](#bib-xmldsig-core1)\] defines the following:
  - Section 2
- \[[XMLENC-CORE1](#bib-xmlenc-core1)\] defines the following:
  - Section 2.2.1

## I. Change log

[](#change-log)

*This section is non-normative.*

Note that this change log only identifies substantive changes since [EPUB 3.3](https://www.w3.org/TR/epub-33/) — those that could affect the conformance of [EPUB publications](#dfn-epub-publication).

For a list of all issues addressed, refer to the [Working Group's issue tracker](https://github.com/w3c/epub-specs/issues?q=is%3Aissue%20is%3Aclosed%20label%3ASpec-EPUB3%20closed%3A2025-02-11..2027-02-11%20-label%3AErrata).

Substantive changes since [Candidate Recommendation](https://www.w3.org/TR/epub-33/) of 2026-07-21

- 01-Oct-2026: Moved the `source-of` property to the outdated features list as it was already identified as conforming but no longer recommended for use. See [issue 3067](https://github.com/w3c/epub-specs/issues/3067).
- 22-July-2026: Added missing normative references identified during the CR transition. See [pull request 3040](https://github.com/w3c/epub-specs/pull/3040).

Substantive changes since [EPUB 3.3](https://www.w3.org/TR/epub-33/)

- 18-June-2026: Added watermarking to privacy considerations. See [issue 3021](https://github.com/w3c/epub-specs/issues/3021).
- 04-May-2026: Fixed outdated section number reference to ZIP64 extensions in the ZIP application note. See [issue 2993](https://github.com/w3c/epub-specs/issues/2993).
- 15-Apr-2026: Added recommendation against using variable bitrate MP3 files with media overlays. See [issue 2978](https://github.com/w3c/epub-specs/issues/2978).
- 14-Apr-2026: Added Opus in MP4 container as a core media type and added additional media type with codec for AAC LC. See [issue 2979](https://github.com/w3c/epub-specs/issues/2979).
- 29-Jan-2026: Moved manifest fallbacks for content to the outdated features. See [issue 2900](https://github.com/w3c/epub-specs/issues/2900).
- 23-January-2026: Added JPEG XL as a core media type for images. See [issue 2896](https://github.com/w3c/epub-specs/issues/2896).
- 18-Dec-2025: Renamed "obsolete but conforming features" to "outdated features". As discussed in the [2025-12-11 WG meeting](https://w3c.github.io/pm-wg/minutes/2025-12-11.html#59bf).
- 18-Dec-2025: Deprecated the `rendition:align-x-center` property. See [issue 2847](https://github.com/w3c/epub-specs/issues/2847).
- 18-Dec-2025: Added the `rendition:flow`, `rendition:orientation`, `rendition:spread`, as well as their override equivalents, to the outdated features list. See [issue 2841](https://github.com/w3c/epub-specs/issues/2841), and the related [Working Group resolution](https://w3c.github.io/pm-wg/minutes/2025-12-11.html#2fea).
- 18-Dec-2025: Removed references to reflowable documents being allowed in spreads and clarified that spread placement properties only apply to pre-paginated documents. See [pull request 2844](https://github.com/w3c/epub-specs/pull/2844#issuecomment-3632673767).
- 18-Dec-2025: Added support for roll layouts in the new fixed layout section. See [issue 2791](https://github.com/w3c/epub-specs/issues/2791).
- 18-Dec-2025: Added a new section to explain layout options and classified the pre-paginated layouts under fixed layouts. The remaining property definitions under the old "Layout rendering control" were moved to the "Package rendering vocabulary" and the section on fixed-layout documents was moved under "EPUB content documents" allowing the old section to be deleted. See [pull request 2844](https://github.com/w3c/epub-specs/pull/2844).
- 11-Nov-2025: Removed support for the HTML syntax. See the [TPAC resolution](https://w3c.github.io/pm-wg/minutes/2025-11-11-f2f.html#0d10).
- 10-Oct-2025: Added caution that SHA-1 is being phased out so other methods of protecting fonts than the font obfuscation are advised. See [issue 2807](https://github.com/w3c/epub-specs/issues/2807).
- 10-Oct-2025: Created an obsolete but conforming classification for features and moved font obfuscation, the `collection` element, the legacy package document features, and the prefixed CSS properties to it. See [issue 2807](https://github.com/w3c/epub-specs/issues/2807).
- 06-October-2025: Added AVIF as a core media type for images. See [issue 2794](https://github.com/w3c/epub-specs/issues/2794).
- 26-June-2025: Moved the `xsd`, `msv`, and `prism` reserved prefixes to the deprecated features section. See [issue 2739](https://github.com/w3c/epub-specs/issues/2739).
- 05-June-2025: Consolidated all deprecated features under the deprecated features section to remove the appearance that they should still be authored. See the comments in [pull request 2735](https://github.com/w3c/epub-specs/pull/2735#issuecomment-2944066035).
- 04-June-2025: Added support for Internationalization Tag Set. See [issue 2732](https://github.com/w3c/epub-specs/issues/2732).
- 04-June-2025: Added the prefix URL for expanding terms from the EPUB Structural Semantics Vocabulary to remove any ambiguity about what it should be. See [issue 2733](https://github.com/w3c/epub-specs/issues/2733).
- 02-June-2025: Added the `pageBreakSource` property to the meta properties vocabulary to replace `source-of`. See [issue 2714](https://github.com/w3c/epub-specs/issues/2714).
- 26-May-2025: Added `application/x-font-ttf` to the list of core media types for identifying TTF fonts. See [issue 667](https://github.com/w3c/epub-specs/issues/667).
- 08-Apr-2025: Added early support for HTML syntax. See [issue 2715](https://github.com/w3c/epub-specs/issues/2715).
- 08-Apr-2025: Moved the paragraphs on authoring the navigation document in the spine from the general restrictions to the existing section on this use and clarified that reading systems do not suppress list styling in the spine. See [issue 2687](https://github.com/w3c/epub-specs/issues/2687).
- 08-Apr-2025: Replaced the redundant requirements on the last modified date with a note about the date and time always being in UTC. See [issue 2662](https://github.com/w3c/epub-specs/issues/2662).
- 19-Feb-2025: Clarified that resources referenced from `script` elements are exempt. See [issue 2649](https://github.com/w3c/epub-specs/issues/2649).
- 19-Feb-2025: Clarified that script modules, such as WebAssembly, fall under the existing exemption for resources not used by reading systems. See [issue 2649](https://github.com/w3c/epub-specs/issues/2649).
- 19-Feb-2025: Clarified that embedded resources only refers to the HTML and SVG definitions. See [issue 2656](https://github.com/w3c/epub-specs/issues/2656).

## J. Acknowledgements

[](#ack)

*This section is non-normative.*

The Publishing Maintenance Working Group would like to make a special acknowledgment to notable contributors, and friends, we have lost along the way. In particular, EPUB, not just EPUB 3, would not be what is today without the vision, knowledge, and preternatural good nature of Garth Conboy. Similarly, Ben Schroeter will always be remembered for his tireless work to help EPUB reach its potential as a universally accessible format. We are forever in their debt.

The following members of the Publishing Maintenance Working Group contributed to the development of this specification:

- Laura Brady (W3C Invited Expert)
- David Campbell (VitalSource Technologies)
- Gautier Chomel (EDRLab)
- Seth Delackner (Apple Inc.)
- Romain Deltour (DAISY Consortium)
- Marisa DeMeglio (DAISY Consortium)
- Laura Driussi (Google LLC)
- Brady Duga (W3C Invited Expert)
- Elika Etemad (Apple Inc.)
- Jackie Fei (Taiwan Digital Publishing Forum)
- Symon Flaming (Rakuten Group, Inc.)
- Hadrien Gardeur (EDRLab)
- Matt Garrish (DAISY Consortium)
- Eloisa Guerrero (Rakuten Group, Inc.)
- David Hall (Apple Inc.)
- Eric Hellman (Free Ebook Foundation)
- Ivan Herman (W3C, staff contact)
- Tetsu Hoshino (Kodansha, Publishers, Ltd.)
- Wen-Yen Huang (Taiwan Digital Publishing Forum)
- Yuki ICHIHARA (Kadokawa Corporation)
- Norikazu Ishizu (Kadokawa Corporation)
- Masato Ito (Kadokawa Corporation)
- Rick Johnson (VitalSource Technologies)
- Seong-Wook Joo (Google LLC)
- George Kerscher (DAISY Consortium)
- Masakazu Kitahara (Voyager Japan, Inc.)
- Toshiaki Koike (Voyager Japan, Inc.)
- Elizabeth Kraler (eBOUND Canada)
- Takashi Kuramoto (MEDIA DO Co., Ltd.)
- Ryo Kuroda (ACCESS CO., LTD.)
- Charles LaPierre (Benetech)
- Dan Lazin (Google LLC)
- Laurent Le Meur (EDRLab)
- Cristina Mussinelli (Fondazione LIA)
- Yoichiro Nagao (Kodansha, Publishers, Ltd.)
- Susan Neuhaus (W3C Invited Expert, chair)
- Sophie Pang (Taiwan Digital Publishing Forum)
- Gregorio Pellegrino (Fondazione LIA)
- David Pham (The Washington Post)
- Stacy Ray (VitalSource Technologies)
- Wendy Reid (W3C Invited Expert, chair)
- Milena Risi (W3C Invited Expert)
- Dale Rogers (W3C Invited Expert)
- John Roque (Apple Inc.)
- Leonard Rosenthol (Adobe)
- Madeleine Rothberg (National Center for Accessible Media at WGBH)
- Daihei Shiohama (MEDIA DO Co., Ltd.)
- Tzviya Siegman (W3C)
- Avneesh Singh (DAISY Consortium)
- Yutaka Suzuki (Kadokawa Corporation)
- Shinya Takami (Kadokawa Corporation, chair)
- Yukio Tomikura (Kodansha, Publishers, Ltd.)
- Daniel Weck (DAISY Consortium)
- Ivan Wong (Google LLC)
- Willy Yeh (Taiwan Digital Publishing Forum)
- Osamu Yoshiba (Kodansha, Publishers, Ltd.)
- Junichi Yoshii (Kodansha, Publishers, Ltd.)
- Naomi Yoshizawa (W3C)

## K. References

[](#references)

### K.1 Normative references

[](#normative-references)

\[av1-avif\]  
[AV1 Image File Format (AVIF)](https://aomediacodec.github.io/av1-avif/). Alliance for Open Media. Final Deliverable. URL: <https://aomediacodec.github.io/av1-avif/>

\[bcp47\]  
[Tags for Identifying Languages](https://www.rfc-editor.org/info/bcp47). Addison Phillips; Mark Davis. IETF. September 2009. Best Current Practice. URL: <https://www.rfc-editor.org/info/bcp47>

\[bidi\]  
[Unicode Bidirectional Algorithm](https://www.unicode.org/reports/tr9/tr9-52.html). Manish Goregaokar मनीष गोरेगांवकर; Robin Leroy. Unicode Consortium. 1 September 2026. Unicode Standard Annex \#9. URL: <https://www.unicode.org/reports/tr9/tr9-52.html>

\[css-values\]  
[CSS Values and Units Module Level 4](https://www.w3.org/TR/css-values-4/). Tab Atkins Jr.; Elika Etemad. W3C. 12 March 2024. W3C Working Draft. URL: <https://www.w3.org/TR/css-values-4/>

\[css-writing-modes-3\]  
[CSS Writing Modes Level 3](https://www.w3.org/TR/css-writing-modes-3/). Elika Etemad; Koji Ishii. W3C. 10 December 2019. W3C Recommendation. URL: <https://www.w3.org/TR/css-writing-modes-3/>

\[css2\]  
[Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification](https://www.w3.org/TR/CSS2/). Bert Bos; Tantek Çelik; Ian Hickson; Håkon Wium Lie. W3C. 7 June 2011. W3C Recommendation. URL: <https://www.w3.org/TR/CSS2/>

\[datetime\]  
[Date and Time Formats](https://www.w3.org/TR/NOTE-datetime). Misha Wolf. W3C. 27 August 1998. W3C Working Group Note. URL: <https://www.w3.org/TR/NOTE-datetime>

\[dcterms\]  
[DCMI Metadata Terms](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/). DCMI Usage Board. DCMI. 20 January 2020. DCMI Recommendation. URL: <https://www.dublincore.org/specifications/dublin-core/dcmi-terms/>

\[dom\]  
[DOM Standard](https://dom.spec.whatwg.org/). Anne van Kesteren. WHATWG. Living Standard. URL: <https://dom.spec.whatwg.org/>

\[ecmascript\]  
[ECMAScript Language Specification](https://tc39.es/ecma262/multipage/). Ecma International. URL: <https://tc39.es/ecma262/multipage/>

\[epub-33\]  
[EPUB 3.3](https://www.w3.org/TR/epub-33/). Ivan Herman; Matt Garrish; Dave Cramer. W3C. 13 January 2026. W3C Recommendation. URL: <https://www.w3.org/TR/epub-33/>

\[epub-a11y-12\]  
[EPUB Accessibility 1.2](https://www.w3.org/TR/epub-a11y-12/). Matt Garrish; George Kerscher; Charles LaPierre; Gregorio Pellegrino; Avneesh Singh. W3C. 12 September 2026. CRD. URL: <https://www.w3.org/TR/epub-a11y-12/>

\[epub-rs-34\]  
[EPUB Reading Systems 3.4](https://www.w3.org/TR/epub-rs-34/). Ivan Herman; Matt Garrish. W3C. 21 July 2026. W3C Candidate Recommendation. URL: <https://www.w3.org/TR/epub-rs-34/>

\[epub-ssv-11\]  
[EPUB 3 Structural Semantics Vocabulary 1.1](https://www.w3.org/TR/epub-ssv-11/). Ivan Herman; Matt Garrish. W3C. 28 May 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-ssv-11/>

\[epubcontentdocs-301\]  
[EPUB Content Documents 3.0.1](https://idpf.org/epub/301/spec/epub-contentdocs-20140626.html). Markus Gylling; William McCoy; Elika J. Etimad; Matt Garrish. IDPF. 26 June 2014. URL: <https://idpf.org/epub/301/spec/epub-contentdocs-20140626.html>

\[epubpackages-32\]  
[EPUB Packages 3.2](https://www.w3.org/publishing/epub32/epub-packages.html). Matt Garrish; Dave Cramer. EPUB 3 Community Group. 08 May 2019. URL: <https://www.w3.org/publishing/epub32/epub-packages.html>

\[epubpublications-30\]  
[EPUB Publications 3.0](https://idpf.org/epub/30/spec/epub30-publications-20111011.html). Markus Gylling; William McCoy; Matt Garrish. IDPF. 11 October 2011. URL: <https://idpf.org/epub/30/spec/epub30-publications-20111011.html>

\[epubpublications-301\]  
[EPUB Publications 3.0.1](https://idpf.org/epub/301/spec/epub-publications-20140626.html). Markus Gylling; William McCoy; Matt Garrish. IDPF. 26 June 2014. URL: <https://idpf.org/epub/301/spec/epub-publications-20140626.html>

\[gif\]  
[Graphics Interchange Format](https://www.w3.org/Graphics/GIF/spec-gif89a.txt). CompuServe Incorporated. 31 July 1990. URL: <https://www.w3.org/Graphics/GIF/spec-gif89a.txt>

\[html\]  
[HTML Standard](https://html.spec.whatwg.org/multipage/). Anne van Kesteren; Domenic Denicola; Dominic Farolino; Ian Hickson; Philip Jägenstedt; Simon Pieters. WHATWG. Living Standard. URL: <https://html.spec.whatwg.org/multipage/>

\[html-rdfa\]  
[HTML+RDFa 1.1 - Second Edition](https://www.w3.org/TR/html-rdfa/). Manu Sporny. W3C. 17 March 2015. W3C Recommendation. URL: <https://www.w3.org/TR/html-rdfa/>

\[infra\]  
[Infra Standard](https://infra.spec.whatwg.org/). Anne van Kesteren; Domenic Denicola. WHATWG. Living Standard. URL: <https://infra.spec.whatwg.org/>

\[iso14977\]  
[ISO/IEC 14977:1996 — Information technology — Syntactic metalanguage — Extended BNF](https://www.iso.org/standard/26153.html). 1996-12. URL: <https://www.iso.org/standard/26153.html>

\[iso18181-1\]  
[Information technology — JPEG XL image coding system — Part 1: Core coding system](https://www.iso.org/standard/85066.html). ISO/IEC. July 2024. Published. URL: <https://www.iso.org/standard/85066.html>

\[iso8601-1\]  
[Date and time — Representations for information interchange — Part 1: Basic rules. ISO 8601-1:2019.](https://www.iso.org/standard/70907.html). International Organization for Standardization (ISO). 2019. ISO 8601-1:2019. URL: <https://www.iso.org/standard/70907.html>

\[its20\]  
[Internationalization Tag Set (ITS) Version 2.0](https://www.w3.org/TR/its20/). David Filip; Shaun McCance; David Lewis; Christian Lieske; Arle Lommel; Jirka Kosek; Felix Sasaki; Yves Savourel. W3C. 29 October 2013. W3C Recommendation. URL: <https://www.w3.org/TR/its20/>

\[jpeg\]  
[JPEG File Interchange Format](https://www.w3.org/Graphics/JPEG/jfif3.pdf). Eric Hamilton. C-Cube Microsystems. Milpitas, CA, USA. September 1992. URL: <https://www.w3.org/Graphics/JPEG/jfif3.pdf>

\[marc-relators\]  
[MARC Code List for Relators](https://www.loc.gov/marc/relators/relaterm.html). URL: <https://www.loc.gov/marc/relators/relaterm.html>

\[mathml3\]  
[Mathematical Markup Language (MathML) Version 3.0 2nd Edition](https://www.w3.org/TR/MathML3/). David Carlisle; Patrick D F Ion; Robert R Miner. W3C. 10 April 2014. W3C Recommendation. URL: <https://www.w3.org/TR/MathML3/>

\[mp3\]  
[Information technology — Coding of moving pictures and associated audio for digital storage media at up to about 1,5 Mbit/s — Part 3: Audio](https://www.iso.org/standard/22412.html). ISO/IEC. August 1993. Published. URL: <https://www.iso.org/standard/22412.html>

\[mp4\]  
[Information technology — Coding of audio-visual objects — Part 14: MP4 file format](https://www.iso.org/standard/79110.html). ISO/IEC. January 2020. Published. URL: <https://www.iso.org/standard/79110.html>

\[mpeg4-audio\]  
[Information technology — Coding of audio-visual objects — Part 3: Audio](https://www.iso.org/standard/76383.html). ISO/IEC. December 2019. Published. URL: <https://www.iso.org/standard/76383.html>

\[onix\]  
[ONIX for Books 3.0](https://www.editeur.org/8/ONIX/). URL: <https://www.editeur.org/8/ONIX/>

\[opentype\]  
[OpenType specification](http://www.microsoft.com/typography/otspec/default.htm). Microsoft. URL: <http://www.microsoft.com/typography/otspec/default.htm>

\[opf-201\]  
[Open Packaging Format 2.0.1](https://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm). IDPF. 04 September 2010. URL: <https://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm>

\[png\]  
[Portable Network Graphics (PNG) Specification (Third Edition)](https://www.w3.org/TR/png-3/). Chris Lilley; Leonard Rosenthol; Pierre-Anthony Lemieux; Chris Needham; Simon Thompson; Chris Seeger; Chris Blume; Cosmin Truta. W3C. 24 June 2025. W3C Recommendation. URL: <https://www.w3.org/TR/png-3/>

\[rdfa-core\]  
[RDFa Core 1.1 - Third Edition](https://www.w3.org/TR/rdfa-core/). Ben Adida; Mark Birbeck; Shane McCarron; Ivan Herman et al. W3C. 17 March 2015. W3C Recommendation. URL: <https://www.w3.org/TR/rdfa-core/>

\[rfc2046\]  
[Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types](https://www.rfc-editor.org/info/rfc2046/). N. Freed; N. Borenstein. IETF. November 1996. Draft Standard. URL: <https://www.rfc-editor.org/info/rfc2046/>

\[RFC2119\]  
[Key words for use in RFCs to Indicate Requirement Levels](https://www.rfc-editor.org/info/rfc2119/). S. Bradner. IETF. March 1997. Best Current Practice. URL: <https://www.rfc-editor.org/info/rfc2119/>

\[rfc2397\]  
[The "data" URL scheme](https://www.rfc-editor.org/info/rfc2397/). L. Masinter. IETF. August 1998. Proposed Standard. URL: <https://www.rfc-editor.org/info/rfc2397/>

\[rfc4329\]  
[Scripting Media Types](https://www.rfc-editor.org/info/rfc4329/). B. Hoehrmann. IETF. April 2006. Informational. URL: <https://www.rfc-editor.org/info/rfc4329/>

\[rfc7303\]  
[XML Media Types](https://www.rfc-editor.org/info/rfc7303/). H. Thompson; C. Lilley. IETF. July 2014. Proposed Standard. URL: <https://www.rfc-editor.org/info/rfc7303/>

\[rfc7845\]  
[Ogg Encapsulation for the Opus Audio Codec](https://www.rfc-editor.org/info/rfc7845/). T. Terriberry; R. Lee; R. Giles. IETF. April 2016. Proposed Standard. URL: <https://www.rfc-editor.org/info/rfc7845/>

\[rfc8089\]  
[The "file" URI Scheme](https://www.rfc-editor.org/info/rfc8089/). M. Kerwin. IETF. February 2017. Proposed Standard. URL: <https://www.rfc-editor.org/info/rfc8089/>

\[RFC8174\]  
[Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words](https://www.rfc-editor.org/info/rfc8174/). B. Leiba. IETF. May 2017. Best Current Practice. URL: <https://www.rfc-editor.org/info/rfc8174/>

\[rfc8251\]  
[Updates to the Opus Audio Codec](https://www.rfc-editor.org/info/rfc8251/). JM. Valin; K. Vos. IETF. October 2017. Proposed Standard. URL: <https://www.rfc-editor.org/info/rfc8251/>

\[rfc9110\]  
[HTTP Semantics](https://httpwg.org/specs/rfc9110.html). R. Fielding, Ed.; M. Nottingham, Ed.; J. Reschke, Ed. IETF. June 2022. Internet Standard. URL: <https://httpwg.org/specs/rfc9110.html>

\[rfc9649\]  
[WebP Image Format](https://www.rfc-editor.org/info/rfc9649/). J. Zern; P. Massimino; J. Alakuijala. IETF. November 2024. Informational. URL: <https://www.rfc-editor.org/info/rfc9649/>

\[schema-org\]  
[Schema.org](https://schema.org/). W3C Schema.org Community Group. W3C. 6.0. URL: <https://schema.org/>

\[smil3\]  
[Synchronized Multimedia Integration Language (SMIL 3.0)](https://www.w3.org/TR/SMIL3/). Dick Bulterman. W3C. 1 December 2008. W3C Recommendation. URL: <https://www.w3.org/TR/SMIL3/>

\[svg\]  
[SVG](https://www.w3.org/TR/SVG/). W3C. URL: <https://www.w3.org/TR/SVG/>

\[truetype\]  
[TrueType™ Reference Manual](https://developer.apple.com/fonts/TrueType-Reference-Manual/). Apple, Inc. URL: <https://developer.apple.com/fonts/TrueType-Reference-Manual/>

\[uax15\]  
[Unicode Normalization Forms](https://www.unicode.org/reports/tr15/tr15-58.html). Ken Whistler. Unicode Consortium. 12 August 2026. Unicode Standard Annex \#15. URL: <https://www.unicode.org/reports/tr15/tr15-58.html>

\[unicode\]  
[The Unicode Standard](https://www.unicode.org/versions/latest/). Unicode Consortium. URL: <https://www.unicode.org/versions/latest/>

\[url\]  
[URL Standard](https://url.spec.whatwg.org/). Anne van Kesteren. WHATWG. Living Standard. URL: <https://url.spec.whatwg.org/>

\[us-ascii\]  
"Coded Character Set - 7-bit American Standard Code for Information Interchange", ANSI X3.4, 1986..

\[wai-aria\]  
[Accessible Rich Internet Applications (WAI-ARIA)](https://www.w3.org/TR/wai-aria/). W3C. URL: <https://www.w3.org/TR/wai-aria/>

\[watermark-privacy\]  
[Privacy Principles for Digital Watermarking Version 1.0](https://cdt.org/wp-content/uploads/copyright/20080529watermarking.pdf). Center for Democracy & Technology. May 2008. URL: <https://cdt.org/wp-content/uploads/copyright/20080529watermarking.pdf>

\[woff\]  
[WOFF File Format 1.0](https://www.w3.org/TR/WOFF/). Jonathan Kew; Tal Leming; Erik van Blokland. W3C. 13 December 2012. W3C Recommendation. URL: <https://www.w3.org/TR/WOFF/>

\[woff2\]  
[WOFF File Format 2.0](https://www.w3.org/TR/WOFF2/). Vladimir Levantovsky. W3C. 8 August 2024. W3C Recommendation. URL: <https://www.w3.org/TR/WOFF2/>

\[xinclude\]  
[XML Inclusions (XInclude) Version 1.0 (Second Edition)](https://www.w3.org/TR/xinclude/). Jonathan Marsh; David Orchard; Daniel Veillard. W3C. 15 November 2006. W3C Recommendation. URL: <https://www.w3.org/TR/xinclude/>

\[xml\]  
[Extensible Markup Language (XML) 1.0 (Fifth Edition)](https://www.w3.org/TR/xml/). Tim Bray; Jean Paoli; Michael Sperberg-McQueen; Eve Maler; François Yergeau et al. W3C. 26 November 2008. W3C Recommendation. URL: <https://www.w3.org/TR/xml/>

\[xml-names\]  
[Namespaces in XML 1.0 (Third Edition)](https://www.w3.org/TR/xml-names/). Tim Bray; Dave Hollander; Andrew Layman; Richard Tobin; Henry Thompson et al. W3C. 8 December 2009. W3C Recommendation. URL: <https://www.w3.org/TR/xml-names/>

\[xmldsig-core\]  
[XML Signature Syntax and Processing (Second Edition)](https://www.w3.org/TR/xmldsig-core/). Donald Eastlake; Joseph Reagle; David Solo; Frederick Hirsch; Thomas Roessler et al. W3C. 10 June 2008. W3C Recommendation. URL: <https://www.w3.org/TR/xmldsig-core/>

\[xmldsig-core1\]  
[XML Signature Syntax and Processing Version 1.1](https://www.w3.org/TR/xmldsig-core1/). Donald Eastlake; Joseph Reagle; David Solo; Frederick Hirsch; Magnus Nyström; Thomas Roessler; Kelvin Yiu. W3C. 11 April 2013. W3C Recommendation. URL: <https://www.w3.org/TR/xmldsig-core1/>

\[xmlenc-core1\]  
[XML Encryption Syntax and Processing Version 1.1](https://www.w3.org/TR/xmlenc-core1/). Donald Eastlake; Joseph Reagle; Frederick Hirsch; Thomas Roessler. W3C. 11 April 2013. W3C Recommendation. URL: <https://www.w3.org/TR/xmlenc-core1/>

\[xmlenc-decrypt\]  
[Decryption Transform for XML Signature](https://www.w3.org/TR/xmlenc-decrypt/). Merlin Hughes; Takeshi Imamura; Hiroshi Maruyama. W3C. 10 December 2002. W3C Recommendation. URL: <https://www.w3.org/TR/xmlenc-decrypt/>

\[xmlschema-2\]  
[XML Schema Part 2: Datatypes Second Edition](https://www.w3.org/TR/xmlschema-2/). Paul V. Biron; Ashok Malhotra. W3C. 28 October 2004. W3C Recommendation. URL: <https://www.w3.org/TR/xmlschema-2/>

\[zip\]  
[.ZIP File Format Specification](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT). 15 July 2020. Final. URL: <https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT>

### K.2 Informative references

[](#informative-references)

\[audiobooks\]  
[Audiobooks](https://www.w3.org/TR/audiobooks/). Wendy Reid; Matt Garrish. W3C. 10 November 2020. W3C Recommendation. URL: <https://www.w3.org/TR/audiobooks/>

\[charmod-norm\]  
[Character Model for the World Wide Web: String Matching](https://www.w3.org/TR/charmod-norm/). Addison Phillips et al. W3C. 16 July 2026. FPWD. URL: <https://www.w3.org/TR/charmod-norm/>

\[css-speech\]  
[CSS Speech Module Level 1](https://www.w3.org/TR/css-speech-1/). Léonie Watson; Elika Etemad. W3C. 14 February 2023. CRD. URL: <https://www.w3.org/TR/css-speech-1/>

\[css-viewport-1\]  
[CSS Viewport Module Level 1](https://drafts.csswg.org/css-viewport/). W3C. URL: <https://drafts.csswg.org/css-viewport/>

\[csssnapshot\]  
[CSS Snapshot](https://www.w3.org/TR/CSS/). URL: <https://www.w3.org/TR/CSS/>

\[dpub-aria\]  
[Digital Publishing WAI-ARIA Module](https://www.w3.org/TR/dpub-aria/). W3C. URL: <https://www.w3.org/TR/dpub-aria/>

\[epub-a11y-tech-11\]  
[EPUB Accessibility Techniques 1.1](https://www.w3.org/TR/epub-a11y-tech-11/). Matt Garrish; George Kerscher; Charles LaPierre; Gregorio Pellegrino; Avneesh Singh. W3C. 13 March 2025. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-a11y-tech-11/>

\[epub-multi-rend-11\]  
[EPUB 3 Multiple-Rendition Publications 1.1](https://www.w3.org/TR/epub-multi-rend-11/). Matt Garrish. W3C. 20 January 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-multi-rend-11/>

\[epub-overview-34\]  
[EPUB 3 Overview](https://www.w3.org/TR/epub-overview-34/). Matt Garrish; Ivan Herman. W3C. 9 March 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-overview-34/>

\[epub-tts-10\]  
[EPUB 3 Text-to-Speech Enhancements 1.0](https://www.w3.org/TR/epub-tts-10/). Matt Garrish. W3C. 28 August 2025. W3C Working Group Note. URL: <https://www.w3.org/TR/epub-tts-10/>

\[fetch\]  
[Fetch Standard](https://fetch.spec.whatwg.org/). Anne van Kesteren. WHATWG. Living Standard. URL: <https://fetch.spec.whatwg.org/>

\[fips-180-4\]  
[FIPS PUB 180-4: Secure Hash Standard (SHS)](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf). U.S. Department of Commerce/National Institute of Standards and Technology. August 2015. National Standard. URL: <https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.180-4.pdf>

\[geolocation\]  
[Geolocation](https://www.w3.org/TR/geolocation/). Marcos Caceres; Reilly Grant. W3C. 26 March 2026. W3C Candidate Recommendation. URL: <https://www.w3.org/TR/geolocation/>

\[h264\]  
[H.264 : Advanced video coding for generic audiovisual services](https://www.itu.int/ITU-T/recommendations/rec.aspx?rec=13189). 2017-04-13. URL: <https://www.itu.int/ITU-T/recommendations/rec.aspx?rec=13189>

\[html-aria\]  
[ARIA in HTML](https://www.w3.org/TR/html-aria/). Patrick Lauke; Scott O'Hara. W3C. 11 August 2026. W3C Recommendation. URL: <https://www.w3.org/TR/html-aria/>

\[international-specs\]  
[Internationalization Best Practices for Spec Developers](https://www.w3.org/TR/international-specs/). Richard Ishida; Addison Phillips. W3C. 7 August 2026. W3C Working Group Note. URL: <https://www.w3.org/TR/international-specs/>

\[iso22424\]  
[ISO/IEC TS 22424-1:2020 — Digital publishing — EPUB3 preservation](https://www.iso.org/standard/73163.html). 2020-01. URL: <https://www.iso.org/standard/73163.html>

\[isoschematron\]  
[ISO/IEC 19757-3: Rule-based validation — Schematron](http://standards.iso.org/ittf/PubliclyAvailableStandards/c040833_ISO_IEC_19757-3_2006(E).zip). 2006-06-01. URL: <http://standards.iso.org/ittf/PubliclyAvailableStandards/c040833_ISO_IEC_19757-3_2006(E).zip>

\[json-ld11\]  
[JSON-LD 1.1](https://www.w3.org/TR/json-ld11/). Gregg Kellogg; Pierre-Antoine Champin; Dave Longley. W3C. 16 July 2020. W3C Recommendation. URL: <https://www.w3.org/TR/json-ld11/>

\[mediaqueries-3\]  
[Media Queries Level 3](https://www.w3.org/TR/mediaqueries-3/). Florian Rivoal. W3C. 21 May 2024. W3C Recommendation. URL: <https://www.w3.org/TR/mediaqueries-3/>

\[nvdl\]  
[ISO/IEC 19757-4: NVDL (Namespace-based Validation Dispatching Language)](http://standards.iso.org/ittf/PubliclyAvailableStandards/c038615_ISO_IEC_19757-4_2006(E).zip). 2006-06-01. URL: <http://standards.iso.org/ittf/PubliclyAvailableStandards/c038615_ISO_IEC_19757-4_2006(E).zip>

\[odf\]  
[Open Document Format for Office Applications (OpenDocument) v1.0](https://www.oasis-open.org/committees/download.php/12572/OpenDocument-v1.0-os.pdf). 1 May 2005. URL: <https://www.oasis-open.org/committees/download.php/12572/OpenDocument-v1.0-os.pdf>

\[pronunciation-lexicon\]  
[Pronunciation Lexicon Specification (PLS) Version 1.0](https://www.w3.org/TR/pronunciation-lexicon/). Paolo Baggia. W3C. 14 October 2008. W3C Recommendation. URL: <https://www.w3.org/TR/pronunciation-lexicon/>

\[push-api\]  
[Push API](https://www.w3.org/TR/push-api/). Marcos Caceres; Kagami Rosylight. W3C. 1 December 2025. W3C Working Draft. URL: <https://www.w3.org/TR/push-api/>

\[relaxng-schema\]  
[Information technology -- Document Schema Definition Language (DSDL) -- Part 2: Regular-grammar-based validation -- RELAX NG](http://standards.iso.org/ittf/PubliclyAvailableStandards/c052348_ISO_IEC_19757-2_2008(E).zip). ISO/IEC. 2008. URL: <http://standards.iso.org/ittf/PubliclyAvailableStandards/c052348_ISO_IEC_19757-2_2008(E).zip>

\[rfc3986\]  
[Uniform Resource Identifier (URI): Generic Syntax](https://www.rfc-editor.org/info/rfc3986/). T. Berners-Lee; R. Fielding; L. Masinter. IETF. January 2005. Internet Standard. URL: <https://www.rfc-editor.org/info/rfc3986/>

\[rfc4839\]  
[Media Type Registrations for the Open eBook Publication Structure (OEBPS) Package File (OPF)](https://www.rfc-editor.org/info/rfc4839/). G. Conboy; J. Rivlin; J. Ferraiolo. IETF. April 2007. Informational. URL: <https://www.rfc-editor.org/info/rfc4839/>

\[rfc6386\]  
[VP8 Data Format and Decoding Guide](https://www.rfc-editor.org/info/rfc6386/). J. Bankoski; J. Koleszar; L. Quillio; J. Salonen; P. Wilkins; Y. Xu. IETF. November 2011. Informational. URL: <https://www.rfc-editor.org/info/rfc6386/>

\[rfc8141\]  
[Uniform Resource Names (URNs)](https://www.rfc-editor.org/info/rfc8141/). P. Saint-Andre; J. Klensin. IETF. April 2017. Proposed Standard. URL: <https://www.rfc-editor.org/info/rfc8141/>

\[ssml\]  
[Speech Synthesis Markup Language (SSML) Version 1.1](https://www.w3.org/TR/speech-synthesis11/). Daniel Burnett; Zhi Wei Shuang. W3C. 7 September 2010. W3C Recommendation. URL: <https://www.w3.org/TR/speech-synthesis11/>

\[uaag20\]  
[User Agent Accessibility Guidelines (UAAG) 2.0](https://www.w3.org/TR/UAAG20/). James Allan; Greg Lowney; Kimberly Patch; Jeanne F Spellman. W3C. 15 December 2015. W3C Working Group Note. URL: <https://www.w3.org/TR/UAAG20/>

\[uax44\]  
[Unicode Character Database](https://www.unicode.org/reports/tr44/tr44-38.html). Ken Whistler. Unicode Consortium. 2 September 2026. Unicode Standard Annex \#44. URL: <https://www.unicode.org/reports/tr44/tr44-38.html>

\[wasm-core-2\]  
[WebAssembly Core Specification](https://www.w3.org/TR/wasm-core-2/). Andreas Rossberg. W3C. 1 October 2026. CRD. URL: <https://www.w3.org/TR/wasm-core-2/>

\[wcag2\]  
[Web Content Accessibility Guidelines (WCAG) 2](https://www.w3.org/TR/WCAG2/). W3C. URL: <https://www.w3.org/TR/WCAG2/>

\[webvtt\]  
[WebVTT: The Web Video Text Tracks Format](https://www.w3.org/TR/webvtt1/). Gary Katsevman. W3C. 20 May 2026. CRD. URL: <https://www.w3.org/TR/webvtt1/>

\[xhr\]  
[XMLHttpRequest Standard](https://xhr.spec.whatwg.org/). Anne van Kesteren. WHATWG. Living Standard. URL: <https://xhr.spec.whatwg.org/>

\[xhtml11\]  
[XHTML™ 1.1 - Module-based XHTML - Second Edition](https://www.w3.org/TR/xhtml11/). Masayasu Ishikawa; Shane McCarron. W3C. 27 March 2018. W3C Recommendation. URL: <https://www.w3.org/TR/xhtml11/>

\[xmlbase\]  
[XML Base (Second Edition)](https://www.w3.org/TR/xmlbase/). Jonathan Marsh; Richard Tobin. W3C. 28 January 2009. W3C Recommendation. URL: <https://www.w3.org/TR/xmlbase/>

\[xmlsec-rngschema-20130411\]  
[XML Security RELAX NG Schemas](https://www.w3.org/TR/2013/NOTE-xmlsec-rngschema-20130411/). Murata Makoto; Frederick Hirsch. W3C. 11 April 2013. W3C Working Group Note. URL: <https://www.w3.org/TR/2013/NOTE-xmlsec-rngschema-20130411/>

[↑](#title)

[Permalink](#dfn-codec) exported

**Referenced in:**

- [§ 4.2.6.3.2.2 Order of compression and encryption](#ref-for-dfn-codec-1 "§ 4.2.6.3.2.2 Order of compression and encryption")

[Permalink](#dfn-container-resource) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-container-resource-1 "§ 1.4 Terminology")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-container-resource-2 "§ 3.1.1 The manifest plane")
- [§ 4.2.1 Introduction](#ref-for-dfn-container-resource-3 "§ 4.2.1 Introduction")
- [§ 5.7.1 The manifest element](#ref-for-dfn-container-resource-4 "§ 5.7.1 The manifest element")
- [§ A.1 Resources](#ref-for-dfn-container-resource-5 "§ A.1 Resources")

[Permalink](#dfn-container-root-url) exported

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-container-root-url-1 "§ 4.2.5 URLs in the OCF abstract container") [(2)](#ref-for-dfn-container-root-url-2 "Reference 2") [(3)](#ref-for-dfn-container-root-url-3 "Reference 3") [(4)](#ref-for-dfn-container-root-url-4 "Reference 4") [(5)](#ref-for-dfn-container-root-url-5 "Reference 5") [(6)](#ref-for-dfn-container-root-url-6 "Reference 6") [(7)](#ref-for-dfn-container-root-url-7 "Reference 7")
- [§ 4.2.6.2 Parsing URLs in the META-INF directory](#ref-for-dfn-container-root-url-8 "§ 4.2.6.2 Parsing URLs in the META-INF directory")

[Permalink](#dfn-content-url) exported

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-content-url-1 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 5.2 Parsing URLs in the package document](#ref-for-dfn-content-url-2 "§ 5.2 Parsing URLs in the package document")

[Permalink](#dfn-core-media-type-resource) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-core-media-type-resource-1 "§ 1.4 Terminology")
- [§ 3.1 Introduction](#ref-for-dfn-core-media-type-resource-2 "§ 3.1 Introduction")
- [§ 3.1.2 The spine plane](#ref-for-dfn-core-media-type-resource-3 "§ 3.1.2 The spine plane")
- [§ 3.1.3 The content plane](#ref-for-dfn-core-media-type-resource-4 "§ 3.1.3 The content plane")
- [§ 3.2 Core media types](#ref-for-dfn-core-media-type-resource-5 "§ 3.2 Core media types")
- [§ 3.4 Exempt resources](#ref-for-dfn-core-media-type-resource-6 "§ 3.4 Exempt resources")
- [§ 3.5.2.2 HTML img fallbacks](#ref-for-dfn-core-media-type-resource-7 "§ 3.5.2.2 HTML img fallbacks")
- [§ 3.6 Resource locations](#ref-for-dfn-core-media-type-resource-8 "§ 3.6 Resource locations")
- [§ 3.7 Data URLs](#ref-for-dfn-core-media-type-resource-9 "§ 3.7 Data URLs")
- [§ 3.9 XML conformance](#ref-for-dfn-core-media-type-resource-10 "§ 3.9 XML conformance")
- [§ 5.7.2 The item element](#ref-for-dfn-core-media-type-resource-11 "§ 5.7.2 The item element")
- [§ 7.1.1 Introduction](#ref-for-dfn-core-media-type-resource-12 "§ 7.1.1 Introduction")
- [§ 7.2.1 Introduction](#ref-for-dfn-core-media-type-resource-13 "§ 7.2.1 Introduction")
- [§ A.1 Resources](#ref-for-dfn-core-media-type-resource-14 "§ A.1 Resources")

[Permalink](#dfn-epub-conformance-checker) exported

**Referenced in:**

- [§ 1.3 Relationship to other specifications](#ref-for-dfn-epub-conformance-checker-1 "§ 1.3 Relationship to other specifications")
- [§ 2.1 Conformance checking](#ref-for-dfn-epub-conformance-checker-2 "§ 2.1 Conformance checking")
- [§ 3.4 Exempt resources](#ref-for-dfn-epub-conformance-checker-3 "§ 3.4 Exempt resources")
- [§ 4.2.3 File paths and file names](#ref-for-dfn-epub-conformance-checker-4 "§ 4.2.3 File paths and file names")
- [§ 5.3.5 Reserved prefixes](#ref-for-dfn-epub-conformance-checker-5 "§ 5.3.5 Reserved prefixes")
- [§ 5.4.1 The dir attribute](#ref-for-dfn-epub-conformance-checker-6 "§ 5.4.1 The dir attribute")
- [§ E.1 Outdated features](#ref-for-dfn-epub-conformance-checker-7 "§ E.1 Outdated features")
- [§ E.2 Deprecated features](#ref-for-dfn-epub-conformance-checker-8 "§ E.2 Deprecated features")

[Permalink](#dfn-epub-container) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-epub-container-1 "§ 1.4 Terminology") [(2)](#ref-for-dfn-epub-container-2 "Reference 2") [(3)](#ref-for-dfn-epub-container-3 "Reference 3") [(4)](#ref-for-dfn-epub-container-4 "Reference 4") [(5)](#ref-for-dfn-epub-container-5 "Reference 5")
- [§ 2. EPUB publication conformance](#ref-for-dfn-epub-container-6 "§ 2. EPUB publication conformance")
- [§ 3.1.2 The spine plane](#ref-for-dfn-epub-container-7 "§ 3.1.2 The spine plane")
- [§ 3.4 Exempt resources](#ref-for-dfn-epub-container-8 "§ 3.4 Exempt resources")
- [§ 3.6 Resource locations](#ref-for-dfn-epub-container-9 "§ 3.6 Resource locations")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-epub-container-10 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 4.2.6.3.1.2 The rootfiles element](#ref-for-dfn-epub-container-11 "§ 4.2.6.3.1.2 The rootfiles element")
- [§ 4.2.6.3.1.3 The rootfile element](#ref-for-dfn-epub-container-12 "§ 4.2.6.3.1.3 The rootfile element")
- [§ 5.6.6 The link element](#ref-for-dfn-epub-container-13 "§ 5.6.6 The link element")
- [§ 5.7.2.2 Examples](#ref-for-dfn-epub-container-14 "§ 5.7.2.2 Examples")
- [§ 8.3 The nav element: restrictions](#ref-for-dfn-epub-container-15 "§ 8.3 The nav element: restrictions")
- [§ 11.2 Threat model](#ref-for-dfn-epub-container-16 "§ 11.2 Threat model")
- [§ A.1 Resources](#ref-for-dfn-epub-container-17 "§ A.1 Resources")
- [§ D.6.4 remote-resources](#ref-for-dfn-epub-container-18 "§ D.6.4 remote-resources")

[Permalink](#dfn-ocf-zip-container) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-ocf-zip-container-1 "§ 1.4 Terminology")
- [§ 4.2.1 Introduction](#ref-for-dfn-ocf-zip-container-2 "§ 4.2.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-ocf-zip-container-3 "§ 4.2.2 File and directory structure")
- [§ 4.2.6.3.1.4 The links element](#ref-for-dfn-ocf-zip-container-4 "§ 4.2.6.3.1.4 The links element")
- [§ 4.2.6.3.2.2 Order of compression and encryption](#ref-for-dfn-ocf-zip-container-5 "§ 4.2.6.3.2.2 Order of compression and encryption")
- [§ 4.3.1 Introduction](#ref-for-dfn-ocf-zip-container-6 "§ 4.3.1 Introduction")
- [§ 4.3.2 ZIP file requirements](#ref-for-dfn-ocf-zip-container-7 "§ 4.3.2 ZIP file requirements")
- [§ 4.3.3 OCF ZIP container media type identification](#ref-for-dfn-ocf-zip-container-8 "§ 4.3.3 OCF ZIP container media type identification")
- [§ A.3 Packaged EPUB](#ref-for-dfn-ocf-zip-container-9 "§ A.3 Packaged EPUB")

[Permalink](#dfn-epub-content-document) exported

**Referenced in:**

- [§ 1.2 Organization](#ref-for-dfn-epub-content-document-1 "§ 1.2 Organization")
- [§ 1.4 Terminology](#ref-for-dfn-epub-content-document-2 "§ 1.4 Terminology") [(2)](#ref-for-dfn-epub-content-document-3 "Reference 2") [(3)](#ref-for-dfn-epub-content-document-4 "Reference 3") [(4)](#ref-for-dfn-epub-content-document-5 "Reference 4") [(5)](#ref-for-dfn-epub-content-document-6 "Reference 5") [(6)](#ref-for-dfn-epub-content-document-7 "Reference 6") [(7)](#ref-for-dfn-epub-content-document-8 "Reference 7") [(8)](#ref-for-dfn-epub-content-document-9 "Reference 8") [(9)](#ref-for-dfn-epub-content-document-10 "Reference 9") [(10)](#ref-for-dfn-epub-content-document-11 "Reference 10")
- [§ 3.1 Introduction](#ref-for-dfn-epub-content-document-12 "§ 3.1 Introduction")
- [§ 3.1.2 The spine plane](#ref-for-dfn-epub-content-document-13 "§ 3.1.2 The spine plane")
- [§ 3.1.3 The content plane](#ref-for-dfn-epub-content-document-14 "§ 3.1.3 The content plane")
- [§ 3.2 Core media types](#ref-for-dfn-epub-content-document-15 "§ 3.2 Core media types")
- [§ 3.3 Foreign resources](#ref-for-dfn-epub-content-document-16 "§ 3.3 Foreign resources")
- [§ 3.4 Exempt resources](#ref-for-dfn-epub-content-document-17 "§ 3.4 Exempt resources")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-epub-content-document-18 "§ 3.5.1 Manifest fallbacks")
- [§ 5.3.1 Introduction](#ref-for-dfn-epub-content-document-19 "§ 5.3.1 Introduction")
- [§ 5.3.4 The prefix attribute](#ref-for-dfn-epub-content-document-20 "§ 5.3.4 The prefix attribute")
- [§ 5.6.6 The link element](#ref-for-dfn-epub-content-document-21 "§ 5.6.6 The link element")
- [§ 5.7.2.2 Examples](#ref-for-dfn-epub-content-document-22 "§ 5.7.2.2 Examples") [(2)](#ref-for-dfn-epub-content-document-23 "Reference 2") [(3)](#ref-for-dfn-epub-content-document-24 "Reference 3")
- [§ 5.8.1 The spine element](#ref-for-dfn-epub-content-document-25 "§ 5.8.1 The spine element")
- [§ 5.8.2 The itemref element](#ref-for-dfn-epub-content-document-26 "§ 5.8.2 The itemref element") [(2)](#ref-for-dfn-epub-content-document-27 "Reference 2")
- [§ 6.1 Introduction](#ref-for-dfn-epub-content-document-28 "§ 6.1 Introduction")
- [§ 6.2 Reflowable layouts](#ref-for-dfn-epub-content-document-29 "§ 6.2 Reflowable layouts")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-dfn-epub-content-document-30 "§ 6.3.1.1 Synthetic spreads") [(2)](#ref-for-dfn-epub-content-document-31 "Reference 2")
- [§ 7.1.1 Introduction](#ref-for-dfn-epub-content-document-32 "§ 7.1.1 Introduction")
- [§ 7.3.1 Introduction](#ref-for-dfn-epub-content-document-33 "§ 7.3.1 Introduction")
- [§ 7.4.2.1 Script inclusion](#ref-for-dfn-epub-content-document-34 "§ 7.4.2.1 Script inclusion")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-dfn-epub-content-document-35 "§ 7.4.2.2.1 Container-constrained scripts")
- [§ 7.4.2.4 Scripting accessibility](#ref-for-dfn-epub-content-document-36 "§ 7.4.2.4 Scripting accessibility")
- [§ 7.4.2.5 Scripting fallbacks](#ref-for-dfn-epub-content-document-37 "§ 7.4.2.5 Scripting fallbacks")
- [§ 7.4.3.1 Structural semantics](#ref-for-dfn-epub-content-document-38 "§ 7.4.3.1 Structural semantics")
- [§ 8.4.2 The toc nav element](#ref-for-dfn-epub-content-document-39 "§ 8.4.2 The toc nav element")
- [§ 9.3.1 Introduction](#ref-for-dfn-epub-content-document-40 "§ 9.3.1 Introduction")
- [§ 9.3.2.1 Media overlay document requirements](#ref-for-dfn-epub-content-document-41 "§ 9.3.2.1 Media overlay document requirements")
- [§ 9.3.2.2.4 The body element](#ref-for-dfn-epub-content-document-42 "§ 9.3.2.2.4 The body element")
- [§ 9.3.2.2.5 The seq element](#ref-for-dfn-epub-content-document-43 "§ 9.3.2.2.5 The seq element") [(2)](#ref-for-dfn-epub-content-document-44 "Reference 2")
- [§ 9.3.2.2.6 The par element](#ref-for-dfn-epub-content-document-45 "§ 9.3.2.2.6 The par element")
- [§ 9.3.2.2.7 The text element](#ref-for-dfn-epub-content-document-46 "§ 9.3.2.2.7 The text element") [(2)](#ref-for-dfn-epub-content-document-47 "Reference 2")
- [§ 9.3.3.1 Introduction](#ref-for-dfn-epub-content-document-48 "§ 9.3.3.1 Introduction")
- [§ 9.3.3.2 Relationship to the EPUB content document](#ref-for-dfn-epub-content-document-49 "§ 9.3.3.2 Relationship to the EPUB content document")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-epub-content-document-50 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.2.2 Referencing document fragments](#ref-for-dfn-epub-content-document-51 "§ 9.3.3.2.2 Referencing document fragments")
- [§ 9.3.3.2.3 Overlay granularity](#ref-for-dfn-epub-content-document-52 "§ 9.3.3.2.3 Overlay granularity")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-epub-content-document-53 "§ 9.3.3.4 Associating style information")
- [§ 9.3.3.5.1 Including media overlays](#ref-for-dfn-epub-content-document-54 "§ 9.3.3.5.1 Including media overlays")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-epub-content-document-55 "§ 9.3.3.5.2 Overlays package metadata")
- [§ 9.3.4.2 Escapability](#ref-for-dfn-epub-content-document-56 "§ 9.3.4.2 Escapability")
- [§ 11.2 Threat model](#ref-for-dfn-epub-content-document-57 "§ 11.2 Threat model")
- [§ A.1 Resources](#ref-for-dfn-epub-content-document-58 "§ A.1 Resources")
- [§ D.4.1.1 rendition:layout](#ref-for-dfn-epub-content-document-59 "§ D.4.1.1 rendition:layout")
- [§ D.6.2 mathml](#ref-for-dfn-epub-content-document-60 "§ D.6.2 mathml")
- [§ D.6.5 scripted](#ref-for-dfn-epub-content-document-61 "§ D.6.5 scripted")
- [§ D.7.1 page-spread-left](#ref-for-dfn-epub-content-document-62 "§ D.7.1 page-spread-left")
- [§ D.7.2 page-spread-right](#ref-for-dfn-epub-content-document-63 "§ D.7.2 page-spread-right")
- [§ D.8.1 active-class](#ref-for-dfn-epub-content-document-64 "§ D.8.1 active-class")
- [§ D.8.4 playback-active-class](#ref-for-dfn-epub-content-document-65 "§ D.8.4 playback-active-class")

[Permalink](#dfn-epub-manifest) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-epub-manifest-1 "§ 1.4 Terminology")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-epub-manifest-2 "§ 3.1.1 The manifest plane")
- [§ 3.1.2 The spine plane](#ref-for-dfn-epub-manifest-3 "§ 3.1.2 The spine plane")
- [§ 3.2 Core media types](#ref-for-dfn-epub-manifest-4 "§ 3.2 Core media types")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-epub-manifest-5 "§ 3.5.1 Manifest fallbacks")
- [§ 3.6 Resource locations](#ref-for-dfn-epub-manifest-6 "§ 3.6 Resource locations")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-epub-manifest-7 "§ 4.2.2 File and directory structure")
- [§ 5.8.2 The itemref element](#ref-for-dfn-epub-manifest-8 "§ 5.8.2 The itemref element")
- [§ 7.1.4.1 Embedded MathML](#ref-for-dfn-epub-manifest-9 "§ 7.1.4.1 Embedded MathML")
- [§ 7.1.4.2 Embedded SVG](#ref-for-dfn-epub-manifest-10 "§ 7.1.4.2 Embedded SVG")
- [§ 7.4.2.1 Script inclusion](#ref-for-dfn-epub-manifest-11 "§ 7.4.2.1 Script inclusion")
- [§ 9.3.3.5.1 Including media overlays](#ref-for-dfn-epub-manifest-12 "§ 9.3.3.5.1 Including media overlays")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-epub-manifest-13 "§ 9.3.3.5.2 Overlays package metadata")
- [§ A.1 Resources](#ref-for-dfn-epub-manifest-14 "§ A.1 Resources")
- [§ B. Allowed external identifiers](#ref-for-dfn-epub-manifest-15 "§ B. Allowed external identifiers")

[Permalink](#dfn-epub-navigation-document) exported

**Referenced in:**

- [§ 1.2 Organization](#ref-for-dfn-epub-navigation-document-1 "§ 1.2 Organization")
- [§ 2. EPUB publication conformance](#ref-for-dfn-epub-navigation-document-2 "§ 2. EPUB publication conformance")
- [§ 5.7.2.1 Resource properties](#ref-for-dfn-epub-navigation-document-3 "§ 5.7.2.1 Resource properties")
- [§ 5.8.1 The spine element](#ref-for-dfn-epub-navigation-document-4 "§ 5.8.1 The spine element")
- [§ 8.1 Introduction](#ref-for-dfn-epub-navigation-document-5 "§ 8.1 Introduction")
- [§ 8.3 The nav element: restrictions](#ref-for-dfn-epub-navigation-document-6 "§ 8.3 The nav element: restrictions")
- [§ 8.4.1 Introduction](#ref-for-dfn-epub-navigation-document-7 "§ 8.4.1 Introduction")
- [§ 9.3.5 Navigation document overlays](#ref-for-dfn-epub-navigation-document-8 "§ 9.3.5 Navigation document overlays")
- [§ A.1 Resources](#ref-for-dfn-epub-navigation-document-9 "§ A.1 Resources")
- [§ D.6.3 nav](#ref-for-dfn-epub-navigation-document-10 "§ D.6.3 nav")

[Permalink](#dfn-epub-publication) exported

**Referenced in:**

- [§ Abstract](#ref-for-dfn-epub-publication-1 "§ Abstract")
- [§ 1.1 Overview](#ref-for-dfn-epub-publication-2 "§ 1.1 Overview")
- [§ 1.2 Organization](#ref-for-dfn-epub-publication-3 "§ 1.2 Organization")
- [§ 1.3 Relationship to other specifications](#ref-for-dfn-epub-publication-4 "§ 1.3 Relationship to other specifications")
- [§ 1.3.6 Relationship to URL](#ref-for-dfn-epub-publication-5 "§ 1.3.6 Relationship to URL")
- [§ 1.4 Terminology](#ref-for-dfn-epub-publication-6 "§ 1.4 Terminology") [(2)](#ref-for-dfn-epub-publication-7 "Reference 2") [(3)](#ref-for-dfn-epub-publication-8 "Reference 3") [(4)](#ref-for-dfn-epub-publication-9 "Reference 4") [(5)](#ref-for-dfn-epub-publication-10 "Reference 5") [(6)](#ref-for-dfn-epub-publication-11 "Reference 6") [(7)](#ref-for-dfn-epub-publication-12 "Reference 7") [(8)](#ref-for-dfn-epub-publication-13 "Reference 8") [(9)](#ref-for-dfn-epub-publication-14 "Reference 9") [(10)](#ref-for-dfn-epub-publication-15 "Reference 10")
- [§ 2. EPUB publication conformance](#ref-for-dfn-epub-publication-16 "§ 2. EPUB publication conformance")
- [§ 2.1 Conformance checking](#ref-for-dfn-epub-publication-17 "§ 2.1 Conformance checking")
- [§ 3.1 Introduction](#ref-for-dfn-epub-publication-18 "§ 3.1 Introduction")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-epub-publication-19 "§ 3.1.1 The manifest plane")
- [§ 3.1.2 The spine plane](#ref-for-dfn-epub-publication-20 "§ 3.1.2 The spine plane")
- [§ 3.2 Core media types](#ref-for-dfn-epub-publication-21 "§ 3.2 Core media types")
- [§ 3.8 File URLs](#ref-for-dfn-epub-publication-22 "§ 3.8 File URLs")
- [§ 4.1 Introduction](#ref-for-dfn-epub-publication-23 "§ 4.1 Introduction")
- [§ 4.2.1 Introduction](#ref-for-dfn-epub-publication-24 "§ 4.2.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-epub-publication-25 "§ 4.2.2 File and directory structure")
- [§ 4.2.3 File paths and file names](#ref-for-dfn-epub-publication-26 "§ 4.2.3 File paths and file names")
- [§ 4.2.6.3.1.3 The rootfile element](#ref-for-dfn-epub-publication-27 "§ 4.2.6.3.1.3 The rootfile element")
- [§ 4.2.6.3.2.1 The encryption element](#ref-for-dfn-epub-publication-28 "§ 4.2.6.3.2.1 The encryption element")
- [§ 4.2.6.3.3 Manifest file (manifest.xml)](#ref-for-dfn-epub-publication-29 "§ 4.2.6.3.3 Manifest file (manifest.xml)")
- [§ 4.2.6.3.5 Rights management file (rights.xml)](#ref-for-dfn-epub-publication-30 "§ 4.2.6.3.5 Rights management file (rights.xml)")
- [§ 4.2.6.3.6 Digital signatures file (signatures.xml)](#ref-for-dfn-epub-publication-31 "§ 4.2.6.3.6 Digital signatures file (signatures.xml)")
- [§ 4.3.1 Introduction](#ref-for-dfn-epub-publication-32 "§ 4.3.1 Introduction")
- [§ 5.1 Introduction](#ref-for-dfn-epub-publication-33 "§ 5.1 Introduction")
- [§ 5.5 The package element](#ref-for-dfn-epub-publication-34 "§ 5.5 The package element")
- [§ 5.6.1 The metadata element](#ref-for-dfn-epub-publication-35 "§ 5.6.1 The metadata element")
- [§ 5.6.3.1.1 The dc:identifier element](#ref-for-dfn-epub-publication-36 "§ 5.6.3.1.1 The dc:identifier element")
- [§ 5.6.3.1.2 The dc:title element](#ref-for-dfn-epub-publication-37 "§ 5.6.3.1.2 The dc:title element")
- [§ 5.6.3.1.3 The dc:language element](#ref-for-dfn-epub-publication-38 "§ 5.6.3.1.3 The dc:language element") [(2)](#ref-for-dfn-epub-publication-39 "Reference 2")
- [§ 5.6.3.2.3 The dc:creator element](#ref-for-dfn-epub-publication-40 "§ 5.6.3.2.3 The dc:creator element")
- [§ 5.6.3.2.4 The dc:date element](#ref-for-dfn-epub-publication-41 "§ 5.6.3.2.4 The dc:date element")
- [§ 5.6.3.2.5 The dc:subject element](#ref-for-dfn-epub-publication-42 "§ 5.6.3.2.5 The dc:subject element")
- [§ 5.6.3.2.6 The dc:type element](#ref-for-dfn-epub-publication-43 "§ 5.6.3.2.6 The dc:type element")
- [§ 5.6.4 The meta element](#ref-for-dfn-epub-publication-44 "§ 5.6.4 The meta element")
- [§ 5.6.5 Last modified date](#ref-for-dfn-epub-publication-45 "§ 5.6.5 Last modified date")
- [§ 5.6.6 The link element](#ref-for-dfn-epub-publication-46 "§ 5.6.6 The link element")
- [§ 5.8.2 The itemref element](#ref-for-dfn-epub-publication-47 "§ 5.8.2 The itemref element")
- [§ 6.2 Reflowable layouts](#ref-for-dfn-epub-publication-48 "§ 6.2 Reflowable layouts")
- [§ 7.1.2 XHTML requirements](#ref-for-dfn-epub-publication-49 "§ 7.1.2 XHTML requirements")
- [§ 7.1.4.3.1 The base element](#ref-for-dfn-epub-publication-50 "§ 7.1.4.3.1 The base element")
- [§ 7.2.2 SVG requirements](#ref-for-dfn-epub-publication-51 "§ 7.2.2 SVG requirements")
- [§ 7.3.1 Introduction](#ref-for-dfn-epub-publication-52 "§ 7.3.1 Introduction")
- [§ 7.4.1.3 Reading system support considerations](#ref-for-dfn-epub-publication-53 "§ 7.4.1.3 Reading system support considerations")
- [§ 7.4.2.1 Script inclusion](#ref-for-dfn-epub-publication-54 "§ 7.4.2.1 Script inclusion")
- [§ 7.4.2.2.2 Spine-level scripts](#ref-for-dfn-epub-publication-55 "§ 7.4.2.2.2 Spine-level scripts")
- [§ 7.4.2.3 Event model](#ref-for-dfn-epub-publication-56 "§ 7.4.2.3 Event model")
- [§ 8.1 Introduction](#ref-for-dfn-epub-publication-57 "§ 8.1 Introduction")
- [§ 8.4.2 The toc nav element](#ref-for-dfn-epub-publication-58 "§ 8.4.2 The toc nav element")
- [§ 8.4.3 The page-list nav element](#ref-for-dfn-epub-publication-59 "§ 8.4.3 The page-list nav element")
- [§ 9.1 Introduction](#ref-for-dfn-epub-publication-60 "§ 9.1 Introduction")
- [§ 9.3.1 Introduction](#ref-for-dfn-epub-publication-61 "§ 9.3.1 Introduction")
- [§ 9.3.3.2.4 Text-to-speech rendering](#ref-for-dfn-epub-publication-62 "§ 9.3.3.2.4 Text-to-speech rendering")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-epub-publication-63 "§ 9.3.3.4 Associating style information")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-epub-publication-64 "§ 9.3.3.5.2 Overlays package metadata")
- [§ 10. Accessibility](#ref-for-dfn-epub-publication-65 "§ 10. Accessibility")
- [§ 11.1 Overview](#ref-for-dfn-epub-publication-66 "§ 11.1 Overview")
- [§ 11.2 Threat model](#ref-for-dfn-epub-publication-67 "§ 11.2 Threat model")
- [§ 11.3 Recommendations](#ref-for-dfn-epub-publication-68 "§ 11.3 Recommendations")
- [§ A.1 Resources](#ref-for-dfn-epub-publication-69 "§ A.1 Resources")
- [§ A.3 Packaged EPUB](#ref-for-dfn-epub-publication-70 "§ A.3 Packaged EPUB")
- [§ D.2.3 belongs-to-collection](#ref-for-dfn-epub-publication-71 "§ D.2.3 belongs-to-collection")
- [§ D.2.4 collection-type](#ref-for-dfn-epub-publication-72 "§ D.2.4 collection-type")
- [§ D.2.7 group-position](#ref-for-dfn-epub-publication-73 "§ D.2.7 group-position")
- [§ D.3.1.2 record](#ref-for-dfn-epub-publication-74 "§ D.3.1.2 record")
- [§ D.6.1 cover-image](#ref-for-dfn-epub-publication-75 "§ D.6.1 cover-image")
- [§ D.6.3 nav](#ref-for-dfn-epub-publication-76 "§ D.6.3 nav")
- [§ D.8.2 duration](#ref-for-dfn-epub-publication-77 "§ D.8.2 duration")
- [§ E.1 Outdated features](#ref-for-dfn-epub-publication-78 "§ E.1 Outdated features") [(2)](#ref-for-dfn-epub-publication-79 "Reference 2") [(3)](#ref-for-dfn-epub-publication-80 "Reference 3")
- [§ E.2 Deprecated features](#ref-for-dfn-epub-publication-81 "§ E.2 Deprecated features")
- [§ G.1 The application/oebps-package+xml media type](#ref-for-dfn-epub-publication-82 "§ G.1 The application/oebps-package+xml media type")
- [§ G.2 The application/epub+zip media type](#ref-for-dfn-epub-publication-83 "§ G.2 The application/epub+zip media type")
- [§ I. Change log](#ref-for-dfn-epub-publication-84 "§ I. Change log")

[Permalink](#dfn-epub-reading-system) exported

**Referenced in:**

- [§ 1.1 Overview](#ref-for-dfn-epub-reading-system-1 "§ 1.1 Overview")
- [§ 1.2 Organization](#ref-for-dfn-epub-reading-system-2 "§ 1.2 Organization") [(2)](#ref-for-dfn-epub-reading-system-3 "Reference 2")
- [§ 1.3 Relationship to other specifications](#ref-for-dfn-epub-reading-system-4 "§ 1.3 Relationship to other specifications")
- [§ 1.4 Terminology](#ref-for-dfn-epub-reading-system-5 "§ 1.4 Terminology") [(2)](#ref-for-dfn-epub-reading-system-6 "Reference 2")
- [§ 3.1.2 The spine plane](#ref-for-dfn-epub-reading-system-7 "§ 3.1.2 The spine plane")
- [§ 3.1.3 The content plane](#ref-for-dfn-epub-reading-system-8 "§ 3.1.3 The content plane")
- [§ 3.2 Core media types](#ref-for-dfn-epub-reading-system-9 "§ 3.2 Core media types")
- [§ 3.3 Foreign resources](#ref-for-dfn-epub-reading-system-10 "§ 3.3 Foreign resources")
- [§ 3.4 Exempt resources](#ref-for-dfn-epub-reading-system-11 "§ 3.4 Exempt resources")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-epub-reading-system-12 "§ 3.5.1 Manifest fallbacks")
- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-dfn-epub-reading-system-13 "§ 3.5.2.1 HTML audio and video fallbacks")
- [§ 3.6 Resource locations](#ref-for-dfn-epub-reading-system-14 "§ 3.6 Resource locations")
- [§ 3.7 Data URLs](#ref-for-dfn-epub-reading-system-15 "§ 3.7 Data URLs")
- [§ 4.1 Introduction](#ref-for-dfn-epub-reading-system-16 "§ 4.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-epub-reading-system-17 "§ 4.2.2 File and directory structure")
- [§ 4.2.3 File paths and file names](#ref-for-dfn-epub-reading-system-18 "§ 4.2.3 File paths and file names")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-epub-reading-system-19 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 4.2.6.3.2.1 The encryption element](#ref-for-dfn-epub-reading-system-20 "§ 4.2.6.3.2.1 The encryption element")
- [§ 4.2.6.3.2.2 Order of compression and encryption](#ref-for-dfn-epub-reading-system-21 "§ 4.2.6.3.2.2 Order of compression and encryption")
- [§ 4.2.6.3.6 Digital signatures file (signatures.xml)](#ref-for-dfn-epub-reading-system-22 "§ 4.2.6.3.6 Digital signatures file (signatures.xml)")
- [§ 4.3.1 Introduction](#ref-for-dfn-epub-reading-system-23 "§ 4.3.1 Introduction")
- [§ 5.1 Introduction](#ref-for-dfn-epub-reading-system-24 "§ 5.1 Introduction")
- [§ 5.3.1 Introduction](#ref-for-dfn-epub-reading-system-25 "§ 5.3.1 Introduction")
- [§ 5.4.1 The dir attribute](#ref-for-dfn-epub-reading-system-26 "§ 5.4.1 The dir attribute")
- [§ 5.6.1 The metadata element](#ref-for-dfn-epub-reading-system-27 "§ 5.6.1 The metadata element")
- [§ 5.6.3.1.2 The dc:title element](#ref-for-dfn-epub-reading-system-28 "§ 5.6.3.1.2 The dc:title element")
- [§ 5.6.3.1.3 The dc:language element](#ref-for-dfn-epub-reading-system-29 "§ 5.6.3.1.3 The dc:language element")
- [§ 5.6.3.2.3 The dc:creator element](#ref-for-dfn-epub-reading-system-30 "§ 5.6.3.2.3 The dc:creator element")
- [§ 5.6.6 The link element](#ref-for-dfn-epub-reading-system-31 "§ 5.6.6 The link element")
- [§ 5.7.1 The manifest element](#ref-for-dfn-epub-reading-system-32 "§ 5.7.1 The manifest element")
- [§ 5.7.2.1 Resource properties](#ref-for-dfn-epub-reading-system-33 "§ 5.7.2.1 Resource properties")
- [§ 5.7.2.2 Examples](#ref-for-dfn-epub-reading-system-34 "§ 5.7.2.2 Examples") [(2)](#ref-for-dfn-epub-reading-system-35 "Reference 2")
- [§ 5.8.1 The spine element](#ref-for-dfn-epub-reading-system-36 "§ 5.8.1 The spine element")
- [§ 5.8.2 The itemref element](#ref-for-dfn-epub-reading-system-37 "§ 5.8.2 The itemref element")
- [§ 6.1 Introduction](#ref-for-dfn-epub-reading-system-38 "§ 6.1 Introduction")
- [§ 6.2 Reflowable layouts](#ref-for-dfn-epub-reading-system-39 "§ 6.2 Reflowable layouts")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-dfn-epub-reading-system-40 "§ 6.3.1.1 Synthetic spreads")
- [§ 7.1.3.4 Custom attributes](#ref-for-dfn-epub-reading-system-41 "§ 7.1.3.4 Custom attributes")
- [§ 7.1.4.1 Embedded MathML](#ref-for-dfn-epub-reading-system-42 "§ 7.1.4.1 Embedded MathML")
- [§ 7.1.4.3.1 The base element](#ref-for-dfn-epub-reading-system-43 "§ 7.1.4.3.1 The base element")
- [§ 7.1.4.3.2 The rp element](#ref-for-dfn-epub-reading-system-44 "§ 7.1.4.3.2 The rp element")
- [§ 7.1.4.3.3 The embed element](#ref-for-dfn-epub-reading-system-45 "§ 7.1.4.3.3 The embed element")
- [§ 7.4.1.1 Introduction](#ref-for-dfn-epub-reading-system-46 "§ 7.4.1.1 Introduction")
- [§ 7.4.1.2 CSS requirements](#ref-for-dfn-epub-reading-system-47 "§ 7.4.1.2 CSS requirements")
- [§ 7.4.1.3 Reading system support considerations](#ref-for-dfn-epub-reading-system-48 "§ 7.4.1.3 Reading system support considerations")
- [§ 7.4.2.1 Script inclusion](#ref-for-dfn-epub-reading-system-49 "§ 7.4.2.1 Script inclusion")
- [§ 7.4.2.2 Scripting contexts](#ref-for-dfn-epub-reading-system-50 "§ 7.4.2.2 Scripting contexts")
- [§ 7.4.2.2.2 Spine-level scripts](#ref-for-dfn-epub-reading-system-51 "§ 7.4.2.2.2 Spine-level scripts")
- [§ 7.4.2.3 Event model](#ref-for-dfn-epub-reading-system-52 "§ 7.4.2.3 Event model")
- [§ 7.4.3.1 Structural semantics](#ref-for-dfn-epub-reading-system-53 "§ 7.4.3.1 Structural semantics")
- [§ 7.4.3.2 Syntax](#ref-for-dfn-epub-reading-system-54 "§ 7.4.3.2 Syntax")
- [§ 8.1 Introduction](#ref-for-dfn-epub-reading-system-55 "§ 8.1 Introduction")
- [§ 8.4.4 The landmarks nav element](#ref-for-dfn-epub-reading-system-56 "§ 8.4.4 The landmarks nav element")
- [§ 8.4.5 Other nav elements](#ref-for-dfn-epub-reading-system-57 "§ 8.4.5 Other nav elements")
- [§ 8.5 Using in the spine](#ref-for-dfn-epub-reading-system-58 "§ 8.5 Using in the spine") [(2)](#ref-for-dfn-epub-reading-system-59 "Reference 2") [(3)](#ref-for-dfn-epub-reading-system-60 "Reference 3")
- [§ 9.1 Introduction](#ref-for-dfn-epub-reading-system-61 "§ 9.1 Introduction")
- [§ 9.3.1 Introduction](#ref-for-dfn-epub-reading-system-62 "§ 9.3.1 Introduction")
- [§ 9.3.2.2.7 The text element](#ref-for-dfn-epub-reading-system-63 "§ 9.3.2.2.7 The text element")
- [§ 9.3.3.2 Relationship to the EPUB content document](#ref-for-dfn-epub-reading-system-64 "§ 9.3.3.2 Relationship to the EPUB content document")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-epub-reading-system-65 "§ 9.3.3.2.1 Overlay structure") [(2)](#ref-for-dfn-epub-reading-system-66 "Reference 2")
- [§ 9.3.3.2.2 Referencing document fragments](#ref-for-dfn-epub-reading-system-67 "§ 9.3.3.2.2 Referencing document fragments")
- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-dfn-epub-reading-system-68 "§ 9.3.3.3 Structural semantics in overlays")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-epub-reading-system-69 "§ 9.3.3.4 Associating style information")
- [§ 9.3.4.1 Skippability](#ref-for-dfn-epub-reading-system-70 "§ 9.3.4.1 Skippability")
- [§ 9.3.4.2 Escapability](#ref-for-dfn-epub-reading-system-71 "§ 9.3.4.2 Escapability")
- [§ 9.3.5 Navigation document overlays](#ref-for-dfn-epub-reading-system-72 "§ 9.3.5 Navigation document overlays")
- [§ 11.1 Overview](#ref-for-dfn-epub-reading-system-73 "§ 11.1 Overview")
- [§ 11.2.1 EPUB-specific features](#ref-for-dfn-epub-reading-system-74 "§ 11.2.1 EPUB-specific features")
- [§ 11.3 Recommendations](#ref-for-dfn-epub-reading-system-75 "§ 11.3 Recommendations")
- [§ D.2.3 belongs-to-collection](#ref-for-dfn-epub-reading-system-76 "§ D.2.3 belongs-to-collection")
- [§ D.2.4 collection-type](#ref-for-dfn-epub-reading-system-77 "§ D.2.4 collection-type")
- [§ D.2.12 title-type](#ref-for-dfn-epub-reading-system-78 "§ D.2.12 title-type")
- [§ D.3.1.1 alternate](#ref-for-dfn-epub-reading-system-79 "§ D.3.1.1 alternate")
- [§ D.4.1.1 rendition:layout](#ref-for-dfn-epub-reading-system-80 "§ D.4.1.1 rendition:layout")
- [§ D.5 Custom rendering properties](#ref-for-dfn-epub-reading-system-81 "§ D.5 Custom rendering properties")
- [§ E.1 Outdated features](#ref-for-dfn-epub-reading-system-82 "§ E.1 Outdated features")
- [§ E.2 Deprecated features](#ref-for-dfn-epub-reading-system-83 "§ E.2 Deprecated features")

[Permalink](#dfn-epub-spine) exported

**Referenced in:**

- [§ 1.2 Organization](#ref-for-dfn-epub-spine-1 "§ 1.2 Organization")
- [§ 1.4 Terminology](#ref-for-dfn-epub-spine-2 "§ 1.4 Terminology") [(2)](#ref-for-dfn-epub-spine-3 "Reference 2") [(3)](#ref-for-dfn-epub-spine-4 "Reference 3") [(4)](#ref-for-dfn-epub-spine-5 "Reference 4") [(5)](#ref-for-dfn-epub-spine-6 "Reference 5")
- [§ 3.1 Introduction](#ref-for-dfn-epub-spine-7 "§ 3.1 Introduction")
- [§ 3.1.2 The spine plane](#ref-for-dfn-epub-spine-8 "§ 3.1.2 The spine plane")
- [§ 3.2 Core media types](#ref-for-dfn-epub-spine-9 "§ 3.2 Core media types")
- [§ 3.4 Exempt resources](#ref-for-dfn-epub-spine-10 "§ 3.4 Exempt resources")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-epub-spine-11 "§ 3.5.1 Manifest fallbacks") [(2)](#ref-for-dfn-epub-spine-12 "Reference 2")
- [§ 3.7 Data URLs](#ref-for-dfn-epub-spine-13 "§ 3.7 Data URLs")
- [§ 5.6.6 The link element](#ref-for-dfn-epub-spine-14 "§ 5.6.6 The link element")
- [§ 5.7.2.2 Examples](#ref-for-dfn-epub-spine-15 "§ 5.7.2.2 Examples")
- [§ 5.8.2 The itemref element](#ref-for-dfn-epub-spine-16 "§ 5.8.2 The itemref element")
- [§ 6.1 Introduction](#ref-for-dfn-epub-spine-17 "§ 6.1 Introduction")
- [§ 6.3.1 Pre-paginated](#ref-for-dfn-epub-spine-18 "§ 6.3.1 Pre-paginated")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-dfn-epub-spine-19 "§ 6.3.1.1 Synthetic spreads")
- [§ 6.3.2 Roll](#ref-for-dfn-epub-spine-20 "§ 6.3.2 Roll")
- [§ 8.1 Introduction](#ref-for-dfn-epub-spine-21 "§ 8.1 Introduction")
- [§ 8.4.2 The toc nav element](#ref-for-dfn-epub-spine-22 "§ 8.4.2 The toc nav element")
- [§ 8.5 Using in the spine](#ref-for-dfn-epub-spine-23 "§ 8.5 Using in the spine")
- [§ 9.3.5 Navigation document overlays](#ref-for-dfn-epub-spine-24 "§ 9.3.5 Navigation document overlays")
- [§ A.1 Resources](#ref-for-dfn-epub-spine-25 "§ A.1 Resources")
- [§ D.4.1.1 rendition:layout](#ref-for-dfn-epub-spine-26 "§ D.4.1.1 rendition:layout") [(2)](#ref-for-dfn-epub-spine-27 "Reference 2")
- [§ D.5 Custom rendering properties](#ref-for-dfn-epub-spine-28 "§ D.5 Custom rendering properties")

[Permalink](#dfn-exempt-resource) exported

**Referenced in:**

- [§ 3.1 Introduction](#ref-for-dfn-exempt-resource-1 "§ 3.1 Introduction")
- [§ 3.1.3 The content plane](#ref-for-dfn-exempt-resource-2 "§ 3.1.3 The content plane")
- [§ 3.4 Exempt resources](#ref-for-dfn-exempt-resource-3 "§ 3.4 Exempt resources")
- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-dfn-exempt-resource-4 "§ 3.5.2.1 HTML audio and video fallbacks")
- [§ 7.1.3.3 Internationalization tag set (ITS)](#ref-for-dfn-exempt-resource-5 "§ 7.1.3.3 Internationalization tag set (ITS)")
- [§ A.1 Resources](#ref-for-dfn-exempt-resource-6 "§ A.1 Resources")

[Permalink](#dfn-file-name) exported

**Referenced in:**

- [§ 4.2.3 File paths and file names](#ref-for-dfn-file-name-1 "§ 4.2.3 File paths and file names")
- [§ 4.2.4 Deriving file paths](#ref-for-dfn-file-name-2 "§ 4.2.4 Deriving file paths")

[Permalink](#dfn-file-path) exported

**Referenced in:**

- [§ 4.2.3 File paths and file names](#ref-for-dfn-file-path-1 "§ 4.2.3 File paths and file names")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-file-path-2 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](#dfn-fixed-layout-document) exported

**Referenced in:**

- [§ 6.1 Introduction](#ref-for-dfn-fixed-layout-document-1 "§ 6.1 Introduction")
- [§ 6.3 Fixed layouts](#ref-for-dfn-fixed-layout-document-2 "§ 6.3 Fixed layouts")
- [§ 6.3.1 Pre-paginated](#ref-for-dfn-fixed-layout-document-3 "§ 6.3.1 Pre-paginated")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-dfn-fixed-layout-document-4 "§ 6.3.1.1 Synthetic spreads")
- [§ 6.3.2 Roll](#ref-for-dfn-fixed-layout-document-5 "§ 6.3.2 Roll")
- [§ 7.3.1 Introduction](#ref-for-dfn-fixed-layout-document-6 "§ 7.3.1 Introduction")
- [§ 7.3.2 Fixed-layout document dimensions](#ref-for-dfn-fixed-layout-document-7 "§ 7.3.2 Fixed-layout document dimensions") [(2)](#ref-for-dfn-fixed-layout-document-8 "Reference 2") [(3)](#ref-for-dfn-fixed-layout-document-9 "Reference 3")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-dfn-fixed-layout-document-10 "§ 7.4.2.2.1 Container-constrained scripts")

[Permalink](#dfn-foreign-content-document) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-foreign-content-document-1 "§ 1.4 Terminology") [(2)](#ref-for-dfn-foreign-content-document-2 "Reference 2") [(3)](#ref-for-dfn-foreign-content-document-3 "Reference 3") [(4)](#ref-for-dfn-foreign-content-document-4 "Reference 4")
- [§ 3.1 Introduction](#ref-for-dfn-foreign-content-document-5 "§ 3.1 Introduction")
- [§ 3.1.2 The spine plane](#ref-for-dfn-foreign-content-document-6 "§ 3.1.2 The spine plane")
- [§ 3.1.3 The content plane](#ref-for-dfn-foreign-content-document-7 "§ 3.1.3 The content plane")
- [§ 3.2 Core media types](#ref-for-dfn-foreign-content-document-8 "§ 3.2 Core media types") [(2)](#ref-for-dfn-foreign-content-document-9 "Reference 2")
- [§ 3.3 Foreign resources](#ref-for-dfn-foreign-content-document-10 "§ 3.3 Foreign resources")
- [§ 3.4 Exempt resources](#ref-for-dfn-foreign-content-document-11 "§ 3.4 Exempt resources")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-foreign-content-document-12 "§ 3.5.1 Manifest fallbacks")
- [§ 5.7.2.2 Examples](#ref-for-dfn-foreign-content-document-13 "§ 5.7.2.2 Examples") [(2)](#ref-for-dfn-foreign-content-document-14 "Reference 2") [(3)](#ref-for-dfn-foreign-content-document-15 "Reference 3")
- [§ 5.8.1 The spine element](#ref-for-dfn-foreign-content-document-16 "§ 5.8.1 The spine element")
- [§ 5.8.2 The itemref element](#ref-for-dfn-foreign-content-document-17 "§ 5.8.2 The itemref element") [(2)](#ref-for-dfn-foreign-content-document-18 "Reference 2")
- [§ A.1 Resources](#ref-for-dfn-foreign-content-document-19 "§ A.1 Resources")

[Permalink](#dfn-foreign-resource) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-foreign-resource-1 "§ 1.4 Terminology")
- [§ 3.1 Introduction](#ref-for-dfn-foreign-resource-2 "§ 3.1 Introduction")
- [§ 3.1.3 The content plane](#ref-for-dfn-foreign-resource-3 "§ 3.1.3 The content plane")
- [§ 3.3 Foreign resources](#ref-for-dfn-foreign-resource-4 "§ 3.3 Foreign resources")
- [§ 3.4 Exempt resources](#ref-for-dfn-foreign-resource-5 "§ 3.4 Exempt resources") [(2)](#ref-for-dfn-foreign-resource-6 "Reference 2") [(3)](#ref-for-dfn-foreign-resource-7 "Reference 3")
- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-dfn-foreign-resource-8 "§ 3.5.2.1 HTML audio and video fallbacks")
- [§ 3.5.2.2 HTML img fallbacks](#ref-for-dfn-foreign-resource-9 "§ 3.5.2.2 HTML img fallbacks")
- [§ 3.6 Resource locations](#ref-for-dfn-foreign-resource-10 "§ 3.6 Resource locations")
- [§ 3.9 XML conformance](#ref-for-dfn-foreign-resource-11 "§ 3.9 XML conformance")
- [§ 7.3.1 Introduction](#ref-for-dfn-foreign-resource-12 "§ 7.3.1 Introduction")
- [§ 7.3.2 Fixed-layout document dimensions](#ref-for-dfn-foreign-resource-13 "§ 7.3.2 Fixed-layout document dimensions")

[Permalink](#dfn-linked-resource) exported

**Referenced in:**

- [§ 3.1 Introduction](#ref-for-dfn-linked-resource-1 "§ 3.1 Introduction")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-linked-resource-2 "§ 3.1.1 The manifest plane")
- [§ 5.6.6 The link element](#ref-for-dfn-linked-resource-3 "§ 5.6.6 The link element")
- [§ 5.7.1 The manifest element](#ref-for-dfn-linked-resource-4 "§ 5.7.1 The manifest element")
- [§ A.1 Resources](#ref-for-dfn-linked-resource-5 "§ A.1 Resources")

[Permalink](#dfn-media-overlay-document) exported

**Referenced in:**

- [§ 1.2 Organization](#ref-for-dfn-media-overlay-document-1 "§ 1.2 Organization")
- [§ 5.3.4 The prefix attribute](#ref-for-dfn-media-overlay-document-2 "§ 5.3.4 The prefix attribute")
- [§ 5.7.2 The item element](#ref-for-dfn-media-overlay-document-3 "§ 5.7.2 The item element")
- [§ 7.4.3.1 Structural semantics](#ref-for-dfn-media-overlay-document-4 "§ 7.4.3.1 Structural semantics")
- [§ 9.3.2.1 Media overlay document requirements](#ref-for-dfn-media-overlay-document-5 "§ 9.3.2.1 Media overlay document requirements")
- [§ 9.3.2.2.1 The smil element](#ref-for-dfn-media-overlay-document-6 "§ 9.3.2.2.1 The smil element")
- [§ 9.3.2.2.2 The head element](#ref-for-dfn-media-overlay-document-7 "§ 9.3.2.2.2 The head element")
- [§ 9.3.2.2.3 The metadata element](#ref-for-dfn-media-overlay-document-8 "§ 9.3.2.2.3 The metadata element")
- [§ 9.3.2.2.4 The body element](#ref-for-dfn-media-overlay-document-9 "§ 9.3.2.2.4 The body element")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-media-overlay-document-10 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.2.3 Overlay granularity](#ref-for-dfn-media-overlay-document-11 "§ 9.3.3.2.3 Overlay granularity")
- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-dfn-media-overlay-document-12 "§ 9.3.3.3 Structural semantics in overlays") [(2)](#ref-for-dfn-media-overlay-document-13 "Reference 2")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-media-overlay-document-14 "§ 9.3.3.4 Associating style information")
- [§ 9.3.3.5.1 Including media overlays](#ref-for-dfn-media-overlay-document-15 "§ 9.3.3.5.1 Including media overlays")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-media-overlay-document-16 "§ 9.3.3.5.2 Overlays package metadata")
- [§ 9.3.4.2 Escapability](#ref-for-dfn-media-overlay-document-17 "§ 9.3.4.2 Escapability")
- [§ 9.3.5 Navigation document overlays](#ref-for-dfn-media-overlay-document-18 "§ 9.3.5 Navigation document overlays")
- [§ D.6.4 remote-resources](#ref-for-dfn-media-overlay-document-19 "§ D.6.4 remote-resources")
- [§ D.8.2 duration](#ref-for-dfn-media-overlay-document-20 "§ D.8.2 duration") [(2)](#ref-for-dfn-media-overlay-document-21 "Reference 2")
- [§ F.3 Media overlays schema](#ref-for-dfn-media-overlay-document-22 "§ F.3 Media overlays schema")

[Permalink](#dfn-non-codec) exported

**Referenced in:**

- [§ 4.2.6.3.2.2 Order of compression and encryption](#ref-for-dfn-non-codec-1 "§ 4.2.6.3.2.2 Order of compression and encryption")

[Permalink](#dfn-ocf-abstract-container) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-ocf-abstract-container-1 "§ 1.4 Terminology") [(2)](#ref-for-dfn-ocf-abstract-container-2 "Reference 2") [(3)](#ref-for-dfn-ocf-abstract-container-3 "Reference 3") [(4)](#ref-for-dfn-ocf-abstract-container-4 "Reference 4")
- [§ 4.2.1 Introduction](#ref-for-dfn-ocf-abstract-container-5 "§ 4.2.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-ocf-abstract-container-6 "§ 4.2.2 File and directory structure")
- [§ 4.2.3 File paths and file names](#ref-for-dfn-ocf-abstract-container-7 "§ 4.2.3 File paths and file names")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-ocf-abstract-container-8 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 4.2.6.1 Inclusion in OCF abstract container](#ref-for-dfn-ocf-abstract-container-9 "§ 4.2.6.1 Inclusion in OCF abstract container")
- [§ 4.2.6.2 Parsing URLs in the META-INF directory](#ref-for-dfn-ocf-abstract-container-10 "§ 4.2.6.2 Parsing URLs in the META-INF directory")
- [§ 4.2.6.3.1 Container file (container.xml)](#ref-for-dfn-ocf-abstract-container-11 "§ 4.2.6.3.1 Container file (container.xml)")
- [§ 4.2.6.3.2.1 The encryption element](#ref-for-dfn-ocf-abstract-container-12 "§ 4.2.6.3.2.1 The encryption element")
- [§ 4.2.6.3.5 Rights management file (rights.xml)](#ref-for-dfn-ocf-abstract-container-13 "§ 4.2.6.3.5 Rights management file (rights.xml)")
- [§ 4.2.6.3.6.1 The signatures element](#ref-for-dfn-ocf-abstract-container-14 "§ 4.2.6.3.6.1 The signatures element")
- [§ 4.3.1 Introduction](#ref-for-dfn-ocf-abstract-container-15 "§ 4.3.1 Introduction")

[Permalink](#dfn-package-document) exported

**Referenced in:**

- [§ 1.2 Organization](#ref-for-dfn-package-document-1 "§ 1.2 Organization")
- [§ 1.4 Terminology](#ref-for-dfn-package-document-2 "§ 1.4 Terminology") [(2)](#ref-for-dfn-package-document-3 "Reference 2") [(3)](#ref-for-dfn-package-document-4 "Reference 3") [(4)](#ref-for-dfn-package-document-5 "Reference 4") [(5)](#ref-for-dfn-package-document-6 "Reference 5")
- [§ 1.6 Authoring shorthands](#ref-for-dfn-package-document-7 "§ 1.6 Authoring shorthands") [(2)](#ref-for-dfn-package-document-8 "Reference 2")
- [§ 2. EPUB publication conformance](#ref-for-dfn-package-document-9 "§ 2. EPUB publication conformance")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-package-document-10 "§ 3.1.1 The manifest plane")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-package-document-11 "§ 3.5.1 Manifest fallbacks")
- [§ 4.2.1 Introduction](#ref-for-dfn-package-document-12 "§ 4.2.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-package-document-13 "§ 4.2.2 File and directory structure")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-package-document-14 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 4.2.6.3.1 Container file (container.xml)](#ref-for-dfn-package-document-15 "§ 4.2.6.3.1 Container file (container.xml)")
- [§ 4.2.6.3.1.2 The rootfiles element](#ref-for-dfn-package-document-16 "§ 4.2.6.3.1.2 The rootfiles element")
- [§ 4.2.6.3.1.3 The rootfile element](#ref-for-dfn-package-document-17 "§ 4.2.6.3.1.3 The rootfile element")
- [§ 4.2.6.3.2.1 The encryption element](#ref-for-dfn-package-document-18 "§ 4.2.6.3.2.1 The encryption element")
- [§ 4.2.6.3.3 Manifest file (manifest.xml)](#ref-for-dfn-package-document-19 "§ 4.2.6.3.3 Manifest file (manifest.xml)")
- [§ 5.1 Introduction](#ref-for-dfn-package-document-20 "§ 5.1 Introduction")
- [§ 5.2 Parsing URLs in the package document](#ref-for-dfn-package-document-21 "§ 5.2 Parsing URLs in the package document")
- [§ 5.3.4 The prefix attribute](#ref-for-dfn-package-document-22 "§ 5.3.4 The prefix attribute")
- [§ 5.3.5 Reserved prefixes](#ref-for-dfn-package-document-23 "§ 5.3.5 Reserved prefixes")
- [§ 5.4.1 The dir attribute](#ref-for-dfn-package-document-24 "§ 5.4.1 The dir attribute")
- [§ 5.5 The package element](#ref-for-dfn-package-document-25 "§ 5.5 The package element")
- [§ 5.6.1 The metadata element](#ref-for-dfn-package-document-26 "§ 5.6.1 The metadata element")
- [§ 5.6.5 Last modified date](#ref-for-dfn-package-document-27 "§ 5.6.5 Last modified date")
- [§ 5.7.1 The manifest element](#ref-for-dfn-package-document-28 "§ 5.7.1 The manifest element")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-package-document-29 "§ 9.3.3.4 Associating style information")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-package-document-30 "§ 9.3.3.5.2 Overlays package metadata")
- [§ A.1 Resources](#ref-for-dfn-package-document-31 "§ A.1 Resources")
- [§ A.2 Scripting contexts](#ref-for-dfn-package-document-32 "§ A.2 Scripting contexts")
- [§ D.3.1.1 alternate](#ref-for-dfn-package-document-33 "§ D.3.1.1 alternate")
- [§ D.4 Package rendering vocabulary](#ref-for-dfn-package-document-34 "§ D.4 Package rendering vocabulary")
- [§ D.5 Custom rendering properties](#ref-for-dfn-package-document-35 "§ D.5 Custom rendering properties")
- [§ D.8 Media overlays vocabulary](#ref-for-dfn-package-document-36 "§ D.8 Media overlays vocabulary")
- [§ F.1 Package document schema](#ref-for-dfn-package-document-37 "§ F.1 Package document schema")

[Permalink](#dfn-publication-resource) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-publication-resource-1 "§ 1.4 Terminology") [(2)](#ref-for-dfn-publication-resource-2 "Reference 2") [(3)](#ref-for-dfn-publication-resource-3 "Reference 3") [(4)](#ref-for-dfn-publication-resource-4 "Reference 4") [(5)](#ref-for-dfn-publication-resource-5 "Reference 5") [(6)](#ref-for-dfn-publication-resource-6 "Reference 6") [(7)](#ref-for-dfn-publication-resource-7 "Reference 7") [(8)](#ref-for-dfn-publication-resource-8 "Reference 8") [(9)](#ref-for-dfn-publication-resource-9 "Reference 9") [(10)](#ref-for-dfn-publication-resource-10 "Reference 10") [(11)](#ref-for-dfn-publication-resource-11 "Reference 11")
- [§ 2. EPUB publication conformance](#ref-for-dfn-publication-resource-12 "§ 2. EPUB publication conformance")
- [§ 3.1 Introduction](#ref-for-dfn-publication-resource-13 "§ 3.1 Introduction")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-publication-resource-14 "§ 3.1.1 The manifest plane")
- [§ 3.2 Core media types](#ref-for-dfn-publication-resource-15 "§ 3.2 Core media types")
- [§ 3.6 Resource locations](#ref-for-dfn-publication-resource-16 "§ 3.6 Resource locations")
- [§ 3.7 Data URLs](#ref-for-dfn-publication-resource-17 "§ 3.7 Data URLs")
- [§ 3.9 XML conformance](#ref-for-dfn-publication-resource-18 "§ 3.9 XML conformance")
- [§ 4.2.1 Introduction](#ref-for-dfn-publication-resource-19 "§ 4.2.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-publication-resource-20 "§ 4.2.2 File and directory structure")
- [§ 5.1 Introduction](#ref-for-dfn-publication-resource-21 "§ 5.1 Introduction")
- [§ 5.4.6 The refines attribute](#ref-for-dfn-publication-resource-22 "§ 5.4.6 The refines attribute")
- [§ 5.6.3.1.3 The dc:language element](#ref-for-dfn-publication-resource-23 "§ 5.6.3.1.3 The dc:language element")
- [§ 5.6.6 The link element](#ref-for-dfn-publication-resource-24 "§ 5.6.6 The link element") [(2)](#ref-for-dfn-publication-resource-25 "Reference 2") [(3)](#ref-for-dfn-publication-resource-26 "Reference 3")
- [§ 5.7.1 The manifest element](#ref-for-dfn-publication-resource-27 "§ 5.7.1 The manifest element")
- [§ 5.7.2 The item element](#ref-for-dfn-publication-resource-28 "§ 5.7.2 The item element")
- [§ 5.7.2.2 Examples](#ref-for-dfn-publication-resource-29 "§ 5.7.2.2 Examples") [(2)](#ref-for-dfn-publication-resource-30 "Reference 2")
- [§ 5.8.1 The spine element](#ref-for-dfn-publication-resource-31 "§ 5.8.1 The spine element")
- [§ 11.2 Threat model](#ref-for-dfn-publication-resource-32 "§ 11.2 Threat model")
- [§ A.1 Resources](#ref-for-dfn-publication-resource-33 "§ A.1 Resources")
- [§ B. Allowed external identifiers](#ref-for-dfn-publication-resource-34 "§ B. Allowed external identifiers")
- [§ D.6.1 cover-image](#ref-for-dfn-publication-resource-35 "§ D.6.1 cover-image")
- [§ D.6.2 mathml](#ref-for-dfn-publication-resource-36 "§ D.6.2 mathml")
- [§ D.6.4 remote-resources](#ref-for-dfn-publication-resource-37 "§ D.6.4 remote-resources")
- [§ D.6.5 scripted](#ref-for-dfn-publication-resource-38 "§ D.6.5 scripted")
- [§ D.6.6 svg](#ref-for-dfn-publication-resource-39 "§ D.6.6 svg")
- [§ D.6.7 switch](#ref-for-dfn-publication-resource-40 "§ D.6.7 switch")
- [§ G.1 The application/oebps-package+xml media type](#ref-for-dfn-publication-resource-41 "§ G.1 The application/oebps-package+xml media type")
- [§ G.2 The application/epub+zip media type](#ref-for-dfn-publication-resource-42 "§ G.2 The application/epub+zip media type")

[Permalink](#dfn-remote-resource) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-remote-resource-1 "§ 1.4 Terminology")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-remote-resource-2 "§ 3.1.1 The manifest plane")
- [§ 3.6 Resource locations](#ref-for-dfn-remote-resource-3 "§ 3.6 Resource locations") [(2)](#ref-for-dfn-remote-resource-4 "Reference 2")
- [§ 5.6.6 The link element](#ref-for-dfn-remote-resource-5 "§ 5.6.6 The link element")
- [§ 5.7.1 The manifest element](#ref-for-dfn-remote-resource-6 "§ 5.7.1 The manifest element")
- [§ 5.7.2.2 Examples](#ref-for-dfn-remote-resource-7 "§ 5.7.2.2 Examples")
- [§ 7.1.4.3.1 The base element](#ref-for-dfn-remote-resource-8 "§ 7.1.4.3.1 The base element")
- [§ 11.2 Threat model](#ref-for-dfn-remote-resource-9 "§ 11.2 Threat model") [(2)](#ref-for-dfn-remote-resource-10 "Reference 2")
- [§ 11.3 Recommendations](#ref-for-dfn-remote-resource-11 "§ 11.3 Recommendations")
- [§ A.1 Resources](#ref-for-dfn-remote-resource-12 "§ A.1 Resources")

[Permalink](#dfn-root-directory) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-root-directory-1 "§ 1.4 Terminology") [(2)](#ref-for-dfn-root-directory-2 "Reference 2")
- [§ 4.2.1 Introduction](#ref-for-dfn-root-directory-3 "§ 4.2.1 Introduction")
- [§ 4.2.2 File and directory structure](#ref-for-dfn-root-directory-4 "§ 4.2.2 File and directory structure")
- [§ 4.2.4 Deriving file paths](#ref-for-dfn-root-directory-5 "§ 4.2.4 Deriving file paths")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-root-directory-6 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 4.2.6.1 Inclusion in OCF abstract container](#ref-for-dfn-root-directory-7 "§ 4.2.6.1 Inclusion in OCF abstract container")
- [§ 4.2.6.2 Parsing URLs in the META-INF directory](#ref-for-dfn-root-directory-8 "§ 4.2.6.2 Parsing URLs in the META-INF directory")
- [§ 4.2.6.3.1.3 The rootfile element](#ref-for-dfn-root-directory-9 "§ 4.2.6.3.1.3 The rootfile element")
- [§ 4.2.6.3.1.5 The link element](#ref-for-dfn-root-directory-10 "§ 4.2.6.3.1.5 The link element")

[Permalink](#dfn-scripted-content-document) exported

**Referenced in:**

- [§ 3.1.2 The spine plane](#ref-for-dfn-scripted-content-document-1 "§ 3.1.2 The spine plane")
- [§ 5.7.2.1 Resource properties](#ref-for-dfn-scripted-content-document-2 "§ 5.7.2.1 Resource properties")
- [§ 7.4.2.1 Script inclusion](#ref-for-dfn-scripted-content-document-3 "§ 7.4.2.1 Script inclusion")
- [§ D.6.5 scripted](#ref-for-dfn-scripted-content-document-4 "§ D.6.5 scripted")

[Permalink](#dfn-svg-content-document) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-svg-content-document-1 "§ 1.4 Terminology")
- [§ 3.1.2 The spine plane](#ref-for-dfn-svg-content-document-2 "§ 3.1.2 The spine plane")
- [§ 3.2 Core media types](#ref-for-dfn-svg-content-document-3 "§ 3.2 Core media types")
- [§ 7.1.4.2 Embedded SVG](#ref-for-dfn-svg-content-document-4 "§ 7.1.4.2 Embedded SVG")
- [§ 7.2.1 Introduction](#ref-for-dfn-svg-content-document-5 "§ 7.2.1 Introduction") [(2)](#ref-for-dfn-svg-content-document-6 "Reference 2")
- [§ 7.2.2 SVG requirements](#ref-for-dfn-svg-content-document-7 "§ 7.2.2 SVG requirements")
- [§ 7.2.3 Restrictions on SVG](#ref-for-dfn-svg-content-document-8 "§ 7.2.3 Restrictions on SVG")
- [§ 7.4 Common resource requirements](#ref-for-dfn-svg-content-document-9 "§ 7.4 Common resource requirements")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-dfn-svg-content-document-10 "§ 7.4.2.2.1 Container-constrained scripts")
- [§ 9.3.3.2 Relationship to the EPUB content document](#ref-for-dfn-svg-content-document-11 "§ 9.3.3.2 Relationship to the EPUB content document")
- [§ 9.3.3.2.2 Referencing document fragments](#ref-for-dfn-svg-content-document-12 "§ 9.3.3.2.2 Referencing document fragments")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-svg-content-document-13 "§ 9.3.3.4 Associating style information")
- [§ D.6.4 remote-resources](#ref-for-dfn-svg-content-document-14 "§ D.6.4 remote-resources")
- [§ D.6.6 svg](#ref-for-dfn-svg-content-document-15 "§ D.6.6 svg")

[Permalink](#dfn-synthetic-spread) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-top-level-content-document) exported

**Referenced in:**

- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-top-level-content-document-1 "§ 3.5.1 Manifest fallbacks")
- [§ 3.7 Data URLs](#ref-for-dfn-top-level-content-document-2 "§ 3.7 Data URLs")
- [§ 5.7.2.2 Examples](#ref-for-dfn-top-level-content-document-3 "§ 5.7.2.2 Examples") [(2)](#ref-for-dfn-top-level-content-document-4 "Reference 2")
- [§ 7.2.1 Introduction](#ref-for-dfn-top-level-content-document-5 "§ 7.2.1 Introduction")
- [§ 7.4.2.2 Scripting contexts](#ref-for-dfn-top-level-content-document-6 "§ 7.4.2.2 Scripting contexts")
- [§ 7.4.2.2.2 Spine-level scripts](#ref-for-dfn-top-level-content-document-7 "§ 7.4.2.2.2 Spine-level scripts") [(2)](#ref-for-dfn-top-level-content-document-8 "Reference 2")
- [§ 8.3 The nav element: restrictions](#ref-for-dfn-top-level-content-document-9 "§ 8.3 The nav element: restrictions")

[Permalink](#dfn-xhtml-content-document) exported

**Referenced in:**

- [§ 1.2 Organization](#ref-for-dfn-xhtml-content-document-1 "§ 1.2 Organization")
- [§ 1.3.1 Relationship to HTML](#ref-for-dfn-xhtml-content-document-2 "§ 1.3.1 Relationship to HTML")
- [§ 1.4 Terminology](#ref-for-dfn-xhtml-content-document-3 "§ 1.4 Terminology") [(2)](#ref-for-dfn-xhtml-content-document-4 "Reference 2") [(3)](#ref-for-dfn-xhtml-content-document-5 "Reference 3") [(4)](#ref-for-dfn-xhtml-content-document-6 "Reference 4")
- [§ 3.1.2 The spine plane](#ref-for-dfn-xhtml-content-document-7 "§ 3.1.2 The spine plane")
- [§ 3.2 Core media types](#ref-for-dfn-xhtml-content-document-8 "§ 3.2 Core media types")
- [§ 3.5.2.3 HTML script element](#ref-for-dfn-xhtml-content-document-9 "§ 3.5.2.3 HTML script element")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-xhtml-content-document-10 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 5.7.2.1 Resource properties](#ref-for-dfn-xhtml-content-document-11 "§ 5.7.2.1 Resource properties")
- [§ 7.1.1 Introduction](#ref-for-dfn-xhtml-content-document-12 "§ 7.1.1 Introduction")
- [§ 7.1.3 HTML extensions](#ref-for-dfn-xhtml-content-document-13 "§ 7.1.3 HTML extensions")
- [§ 7.1.3.1 Structural semantics](#ref-for-dfn-xhtml-content-document-14 "§ 7.1.3.1 Structural semantics")
- [§ 7.1.3.2 RDFa](#ref-for-dfn-xhtml-content-document-15 "§ 7.1.3.2 RDFa")
- [§ 7.1.3.3 Internationalization tag set (ITS)](#ref-for-dfn-xhtml-content-document-16 "§ 7.1.3.3 Internationalization tag set (ITS)")
- [§ 7.1.3.4 Custom attributes](#ref-for-dfn-xhtml-content-document-17 "§ 7.1.3.4 Custom attributes")
- [§ 7.1.4 HTML deviations and constraints](#ref-for-dfn-xhtml-content-document-18 "§ 7.1.4 HTML deviations and constraints")
- [§ 7.1.4.1 Embedded MathML](#ref-for-dfn-xhtml-content-document-19 "§ 7.1.4.1 Embedded MathML")
- [§ 7.1.4.2 Embedded SVG](#ref-for-dfn-xhtml-content-document-20 "§ 7.1.4.2 Embedded SVG")
- [§ 7.4 Common resource requirements](#ref-for-dfn-xhtml-content-document-21 "§ 7.4 Common resource requirements")
- [§ 7.4.2.1 Script inclusion](#ref-for-dfn-xhtml-content-document-22 "§ 7.4.2.1 Script inclusion")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-dfn-xhtml-content-document-23 "§ 7.4.2.2.1 Container-constrained scripts")
- [§ 8.1 Introduction](#ref-for-dfn-xhtml-content-document-24 "§ 8.1 Introduction")
- [§ 8.2 Navigation document requirements](#ref-for-dfn-xhtml-content-document-25 "§ 8.2 Navigation document requirements")
- [§ 8.5 Using in the spine](#ref-for-dfn-xhtml-content-document-26 "§ 8.5 Using in the spine")
- [§ 9.3.3.2 Relationship to the EPUB content document](#ref-for-dfn-xhtml-content-document-27 "§ 9.3.3.2 Relationship to the EPUB content document")
- [§ 9.3.3.2.2 Referencing document fragments](#ref-for-dfn-xhtml-content-document-28 "§ 9.3.3.2.2 Referencing document fragments")
- [§ 9.3.3.4 Associating style information](#ref-for-dfn-xhtml-content-document-29 "§ 9.3.3.4 Associating style information")
- [§ 9.3.5 Navigation document overlays](#ref-for-dfn-xhtml-content-document-30 "§ 9.3.5 Navigation document overlays")
- [§ A.1 Resources](#ref-for-dfn-xhtml-content-document-31 "§ A.1 Resources")
- [§ D.6.4 remote-resources](#ref-for-dfn-xhtml-content-document-32 "§ D.6.4 remote-resources")
- [§ D.6.6 svg](#ref-for-dfn-xhtml-content-document-33 "§ D.6.6 svg")
- [§ D.6.7 switch](#ref-for-dfn-xhtml-content-document-34 "§ D.6.7 switch")

[Permalink](#dfn-unique-identifier) exported

**Referenced in:**

- [§ 5.6.3.1.1 The dc:identifier element](#ref-for-dfn-unique-identifier-1 "§ 5.6.3.1.1 The dc:identifier element")

[Permalink](#dfn-viewport) exported

**Referenced in:**

- [§ 3.1.3 The content plane](#ref-for-dfn-viewport-1 "§ 3.1.3 The content plane")
- [§ 3.2 Core media types](#ref-for-dfn-viewport-2 "§ 3.2 Core media types")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-dfn-viewport-3 "§ 6.3.1.1 Synthetic spreads")
- [§ 7.3.2 Fixed-layout document dimensions](#ref-for-dfn-viewport-4 "§ 7.3.2 Fixed-layout document dimensions")
- [§ 8.5 Using in the spine](#ref-for-dfn-viewport-5 "§ 8.5 Using in the spine")

[Permalink](#dfn-manifest-plane) exported

**Referenced in:**

- [§ 3.1 Introduction](#ref-for-dfn-manifest-plane-1 "§ 3.1 Introduction")
- [§ A.1 Resources](#ref-for-dfn-manifest-plane-2 "§ A.1 Resources")

[Permalink](#dfn-spine-plane) exported

**Referenced in:**

- [§ 3.1 Introduction](#ref-for-dfn-spine-plane-1 "§ 3.1 Introduction")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-spine-plane-2 "§ 3.1.1 The manifest plane")
- [§ A.1 Resources](#ref-for-dfn-spine-plane-3 "§ A.1 Resources")

[Permalink](#dfn-content-plane) exported

**Referenced in:**

- [§ 3.1 Introduction](#ref-for-dfn-content-plane-1 "§ 3.1 Introduction")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-content-plane-2 "§ 3.1.1 The manifest plane")
- [§ A.1 Resources](#ref-for-dfn-content-plane-3 "§ A.1 Resources")

[Permalink](#dfn-manifest-fallback-chain) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-manifest-fallback-chain-1 "§ 1.4 Terminology") [(2)](#ref-for-dfn-manifest-fallback-chain-2 "Reference 2")
- [§ 3.1.2 The spine plane](#ref-for-dfn-manifest-fallback-chain-3 "§ 3.1.2 The spine plane")
- [§ 5.1 Introduction](#ref-for-dfn-manifest-fallback-chain-4 "§ 5.1 Introduction")
- [§ 5.7.2.2 Examples](#ref-for-dfn-manifest-fallback-chain-5 "§ 5.7.2.2 Examples")
- [§ 5.8.2 The itemref element](#ref-for-dfn-manifest-fallback-chain-6 "§ 5.8.2 The itemref element")
- [§ 6.3.1 Pre-paginated](#ref-for-dfn-manifest-fallback-chain-7 "§ 6.3.1 Pre-paginated")

[Permalink](#dfn-valid-relative-container-url-with-fragment-string) exported

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-dfn-valid-relative-container-url-with-fragment-string-1 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](#dfn-container) exported

**Referenced in:**

- [§ 4.2.6.3.1.2 The rootfiles element](#ref-for-dfn-container-1 "§ 4.2.6.3.1.2 The rootfiles element")
- [§ 4.2.6.3.1.4 The links element](#ref-for-dfn-container-2 "§ 4.2.6.3.1.4 The links element")

[Permalink](#dfn-rootfiles) exported

**Referenced in:**

- [§ 4.2.6.3.1.1 The container element](#ref-for-dfn-rootfiles-1 "§ 4.2.6.3.1.1 The container element")
- [§ 4.2.6.3.1.3 The rootfile element](#ref-for-dfn-rootfiles-2 "§ 4.2.6.3.1.3 The rootfile element")

[Permalink](#dfn-rootfile) exported

**Referenced in:**

- [§ 4.2.6.3.1.2 The rootfiles element](#ref-for-dfn-rootfile-1 "§ 4.2.6.3.1.2 The rootfiles element")

[Permalink](#dfn-links) exported

**Referenced in:**

- [§ 4.2.6.3.1.1 The container element](#ref-for-dfn-links-1 "§ 4.2.6.3.1.1 The container element")
- [§ 4.2.6.3.1.5 The link element](#ref-for-dfn-links-2 "§ 4.2.6.3.1.5 The link element")

[Permalink](#dfn-encryption) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-encryptedkey) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-encrypteddata) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-compression) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-signatures) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-compact-url)

**Referenced in:**

- [§ 5.3.1 Introduction](#ref-for-dfn-compact-url-1 "§ 5.3.1 Introduction")
- [§ 5.3.3 Default vocabularies](#ref-for-dfn-compact-url-2 "§ 5.3.3 Default vocabularies")
- [§ 5.3.4 The prefix attribute](#ref-for-dfn-compact-url-3 "§ 5.3.4 The prefix attribute")
- [§ 5.3.5 Reserved prefixes](#ref-for-dfn-compact-url-4 "§ 5.3.5 Reserved prefixes")
- [§ 5.4.5 The properties attribute](#ref-for-dfn-compact-url-5 "§ 5.4.5 The properties attribute")
- [§ 5.6.4 The meta element](#ref-for-dfn-compact-url-6 "§ 5.6.4 The meta element") [(2)](#ref-for-dfn-compact-url-7 "Reference 2")
- [§ 5.6.6 The link element](#ref-for-dfn-compact-url-8 "§ 5.6.6 The link element")
- [§ 7.4.3.2 Syntax](#ref-for-dfn-compact-url-9 "§ 7.4.3.2 Syntax")
- [§ 9.3.2.2.4 The body element](#ref-for-dfn-compact-url-10 "§ 9.3.2.2.4 The body element")
- [§ 9.3.2.2.5 The seq element](#ref-for-dfn-compact-url-11 "§ 9.3.2.2.5 The seq element")
- [§ 9.3.2.2.6 The par element](#ref-for-dfn-compact-url-12 "§ 9.3.2.2.6 The par element")

[Permalink](#dfn-default-vocabulary)

**Referenced in:**

- [§ 5.3.1 Introduction](#ref-for-dfn-default-vocabulary-1 "§ 5.3.1 Introduction")
- [§ 5.3.2 The compact URL data type](#ref-for-dfn-default-vocabulary-2 "§ 5.3.2 The compact URL data type")
- [§ 5.3.4 The prefix attribute](#ref-for-dfn-default-vocabulary-3 "§ 5.3.4 The prefix attribute")
- [§ 5.4.5 The properties attribute](#ref-for-dfn-default-vocabulary-4 "§ 5.4.5 The properties attribute")
- [§ 5.6.4 The meta element](#ref-for-dfn-default-vocabulary-5 "§ 5.6.4 The meta element") [(2)](#ref-for-dfn-default-vocabulary-6 "Reference 2")
- [§ 5.6.6 The link element](#ref-for-dfn-default-vocabulary-7 "§ 5.6.6 The link element")
- [§ 5.7.2.1 Resource properties](#ref-for-dfn-default-vocabulary-8 "§ 5.7.2.1 Resource properties")
- [§ 5.8.2 The itemref element](#ref-for-dfn-default-vocabulary-9 "§ 5.8.2 The itemref element")
- [§ 7.4.3.2 Syntax](#ref-for-dfn-default-vocabulary-10 "§ 7.4.3.2 Syntax")

[Permalink](#dfn-package) exported

**Referenced in:**

- [§ 5.4.1 The dir attribute](#ref-for-dfn-package-1 "§ 5.4.1 The dir attribute")
- [§ 5.4.3 The id attribute](#ref-for-dfn-package-2 "§ 5.4.3 The id attribute")
- [§ 5.4.7 The xml:lang attribute](#ref-for-dfn-package-3 "§ 5.4.7 The xml:lang attribute")
- [§ 5.6.1 The metadata element](#ref-for-dfn-package-4 "§ 5.6.1 The metadata element")
- [§ 5.6.3.1.1 The dc:identifier element](#ref-for-dfn-package-5 "§ 5.6.3.1.1 The dc:identifier element")
- [§ 5.7.1 The manifest element](#ref-for-dfn-package-6 "§ 5.7.1 The manifest element")
- [§ 5.8.1 The spine element](#ref-for-dfn-package-7 "§ 5.8.1 The spine element")

[Permalink](#dfn-metadata) exported

**Referenced in:**

- [§ 5.5 The package element](#ref-for-dfn-metadata-1 "§ 5.5 The package element")
- [§ 5.6.3.1.1 The dc:identifier element](#ref-for-dfn-metadata-2 "§ 5.6.3.1.1 The dc:identifier element")
- [§ 5.6.3.1.2 The dc:title element](#ref-for-dfn-metadata-3 "§ 5.6.3.1.2 The dc:title element")
- [§ 5.6.3.1.3 The dc:language element](#ref-for-dfn-metadata-4 "§ 5.6.3.1.3 The dc:language element")
- [§ 5.6.3.2.1 General definition](#ref-for-dfn-metadata-5 "§ 5.6.3.2.1 General definition")
- [§ 5.6.4 The meta element](#ref-for-dfn-metadata-6 "§ 5.6.4 The meta element")
- [§ 5.6.6 The link element](#ref-for-dfn-metadata-7 "§ 5.6.6 The link element") [(2)](#ref-for-dfn-metadata-8 "Reference 2")
- [§ 5.7.1 The manifest element](#ref-for-dfn-metadata-9 "§ 5.7.1 The manifest element")
- [§ 9.3.2.2.2 The head element](#ref-for-dfn-metadata-10 "§ 9.3.2.2.2 The head element")

[Permalink](#dfn-value)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-value-1 "§ 1.4 Terminology")
- [§ 5.6.3.1.3 The dc:language element](#ref-for-dfn-value-2 "§ 5.6.3.1.3 The dc:language element")
- [§ 5.6.3.2.5 The dc:subject element](#ref-for-dfn-value-3 "§ 5.6.3.2.5 The dc:subject element") [(2)](#ref-for-dfn-value-4 "Reference 2") [(3)](#ref-for-dfn-value-5 "Reference 3")
- [§ 5.6.3.2.6 The dc:type element](#ref-for-dfn-value-6 "§ 5.6.3.2.6 The dc:type element")
- [§ 5.6.4 The meta element](#ref-for-dfn-value-7 "§ 5.6.4 The meta element") [(2)](#ref-for-dfn-value-8 "Reference 2")
- [§ 5.6.5 Last modified date](#ref-for-dfn-value-9 "§ 5.6.5 Last modified date")

[Permalink](#dfn-dc-identifier) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-dc-identifier-1 "§ 1.4 Terminology")
- [§ 5.5 The package element](#ref-for-dfn-dc-identifier-2 "§ 5.5 The package element")
- [§ 5.6.1 The metadata element](#ref-for-dfn-dc-identifier-3 "§ 5.6.1 The metadata element") [(2)](#ref-for-dfn-dc-identifier-4 "Reference 2")
- [§ 5.6.3.2.1 General definition](#ref-for-dfn-dc-identifier-5 "§ 5.6.3.2.1 General definition")
- [§ D.2.8 identifier-type](#ref-for-dfn-dc-identifier-6 "§ D.2.8 identifier-type")

[Permalink](#dfn-dc-title) exported

**Referenced in:**

- [§ 5.6.1 The metadata element](#ref-for-dfn-dc-title-1 "§ 5.6.1 The metadata element") [(2)](#ref-for-dfn-dc-title-2 "Reference 2")
- [§ 5.6.3.2.1 General definition](#ref-for-dfn-dc-title-3 "§ 5.6.3.2.1 General definition")
- [§ D.2.12 title-type](#ref-for-dfn-dc-title-4 "§ D.2.12 title-type")

[Permalink](#dfn-dc-language) exported

**Referenced in:**

- [§ 5.6.1 The metadata element](#ref-for-dfn-dc-language-1 "§ 5.6.1 The metadata element") [(2)](#ref-for-dfn-dc-language-2 "Reference 2")
- [§ 5.6.3.2.1 General definition](#ref-for-dfn-dc-language-3 "§ 5.6.3.2.1 General definition")

[Permalink](#dfn-dc-contributor) exported

**Referenced in:**

- [§ 5.6.3.2.3 The dc:creator element](#ref-for-dfn-dc-contributor-1 "§ 5.6.3.2.3 The dc:creator element")
- [§ D.2.10 role](#ref-for-dfn-dc-contributor-2 "§ D.2.10 role")

[Permalink](#dfn-dc-creator) exported

**Referenced in:**

- [§ 5.6.3.2.2 The dc:contributor element](#ref-for-dfn-dc-creator-1 "§ 5.6.3.2.2 The dc:contributor element")
- [§ D.2.10 role](#ref-for-dfn-dc-creator-2 "§ D.2.10 role")

[Permalink](#dfn-dc-date) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-dc-subject) exported

**Referenced in:**

- [§ D.2.2 authority](#ref-for-dfn-dc-subject-1 "§ D.2.2 authority")
- [§ D.2.11 term](#ref-for-dfn-dc-subject-2 "§ D.2.11 term")

[Permalink](#dfn-dc-type) exported

**Referenced in:**

- Not referenced in this document.

[Permalink](#dfn-meta) exported

**Referenced in:**

- [§ 5.3.1 Introduction](#ref-for-dfn-meta-1 "§ 5.3.1 Introduction")
- [§ 5.4.1 The dir attribute](#ref-for-dfn-meta-2 "§ 5.4.1 The dir attribute")
- [§ 5.4.3 The id attribute](#ref-for-dfn-meta-3 "§ 5.4.3 The id attribute")
- [§ 5.4.6 The refines attribute](#ref-for-dfn-meta-4 "§ 5.4.6 The refines attribute")
- [§ 5.4.7 The xml:lang attribute](#ref-for-dfn-meta-5 "§ 5.4.7 The xml:lang attribute")
- [§ 5.6.1 The metadata element](#ref-for-dfn-meta-6 "§ 5.6.1 The metadata element") [(2)](#ref-for-dfn-meta-7 "Reference 2")
- [§ 5.6.2 Metadata values](#ref-for-dfn-meta-8 "§ 5.6.2 Metadata values")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-meta-9 "§ 9.3.3.5.2 Overlays package metadata")
- [§ D.2 Meta properties vocabulary](#ref-for-dfn-meta-10 "§ D.2 Meta properties vocabulary") [(2)](#ref-for-dfn-meta-11 "Reference 2")
- [§ D.8 Media overlays vocabulary](#ref-for-dfn-meta-12 "§ D.8 Media overlays vocabulary")
- [§ E.1 Outdated features](#ref-for-dfn-meta-13 "§ E.1 Outdated features")

[Permalink](#dfn-dcterms-modified) exported

**Referenced in:**

- [§ 5.6.1 The metadata element](#ref-for-dfn-dcterms-modified-1 "§ 5.6.1 The metadata element")

[Permalink](#dfn-link) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-link-1 "§ 1.4 Terminology")
- [§ 3.1.1 The manifest plane](#ref-for-dfn-link-2 "§ 3.1.1 The manifest plane")
- [§ 3.7 Data URLs](#ref-for-dfn-link-3 "§ 3.7 Data URLs")
- [§ 5.3.1 Introduction](#ref-for-dfn-link-4 "§ 5.3.1 Introduction")
- [§ 5.4.2 The href attribute](#ref-for-dfn-link-5 "§ 5.4.2 The href attribute")
- [§ 5.4.3 The id attribute](#ref-for-dfn-link-6 "§ 5.4.3 The id attribute")
- [§ 5.4.4 The media-type attribute](#ref-for-dfn-link-7 "§ 5.4.4 The media-type attribute")
- [§ 5.4.5 The properties attribute](#ref-for-dfn-link-8 "§ 5.4.5 The properties attribute")
- [§ 5.4.6 The refines attribute](#ref-for-dfn-link-9 "§ 5.4.6 The refines attribute")
- [§ 5.6.1 The metadata element](#ref-for-dfn-link-10 "§ 5.6.1 The metadata element") [(2)](#ref-for-dfn-link-11 "Reference 2")
- [§ 7.1.3.3 Internationalization tag set (ITS)](#ref-for-dfn-link-12 "§ 7.1.3.3 Internationalization tag set (ITS)")
- [§ A.1 Resources](#ref-for-dfn-link-13 "§ A.1 Resources") [(2)](#ref-for-dfn-link-14 "Reference 2")
- [§ D.3 Metadata link vocabulary](#ref-for-dfn-link-15 "§ D.3 Metadata link vocabulary")
- [§ D.3.2 Link properties](#ref-for-dfn-link-16 "§ D.3.2 Link properties")

[Permalink](#dfn-manifest) exported

**Referenced in:**

- [§ 3.1.1 The manifest plane](#ref-for-dfn-manifest-1 "§ 3.1.1 The manifest plane")
- [§ 5.4.3 The id attribute](#ref-for-dfn-manifest-2 "§ 5.4.3 The id attribute")
- [§ 5.5 The package element](#ref-for-dfn-manifest-3 "§ 5.5 The package element")
- [§ 5.7.2 The item element](#ref-for-dfn-manifest-4 "§ 5.7.2 The item element")
- [§ 5.8.1 The spine element](#ref-for-dfn-manifest-5 "§ 5.8.1 The spine element")

[Permalink](#dfn-item) exported

**Referenced in:**

- [§ 3.1.1 The manifest plane](#ref-for-dfn-item-1 "§ 3.1.1 The manifest plane")
- [§ 3.5.1 Manifest fallbacks](#ref-for-dfn-item-2 "§ 3.5.1 Manifest fallbacks")
- [§ 3.6 Resource locations](#ref-for-dfn-item-3 "§ 3.6 Resource locations")
- [§ 3.7 Data URLs](#ref-for-dfn-item-4 "§ 3.7 Data URLs")
- [§ 5.3.1 Introduction](#ref-for-dfn-item-5 "§ 5.3.1 Introduction")
- [§ 5.3.2 The compact URL data type](#ref-for-dfn-item-6 "§ 5.3.2 The compact URL data type")
- [§ 5.4.2 The href attribute](#ref-for-dfn-item-7 "§ 5.4.2 The href attribute") [(2)](#ref-for-dfn-item-8 "Reference 2")
- [§ 5.4.3 The id attribute](#ref-for-dfn-item-9 "§ 5.4.3 The id attribute")
- [§ 5.4.4 The media-type attribute](#ref-for-dfn-item-10 "§ 5.4.4 The media-type attribute")
- [§ 5.4.5 The properties attribute](#ref-for-dfn-item-11 "§ 5.4.5 The properties attribute")
- [§ 5.7.1 The manifest element](#ref-for-dfn-item-12 "§ 5.7.1 The manifest element")
- [§ 5.8.2 The itemref element](#ref-for-dfn-item-13 "§ 5.8.2 The itemref element")
- [§ 7.1.4.2 Embedded SVG](#ref-for-dfn-item-14 "§ 7.1.4.2 Embedded SVG")
- [§ 9.3.3.5.1 Including media overlays](#ref-for-dfn-item-15 "§ 9.3.3.5.1 Including media overlays")
- [§ 9.3.3.5.2 Overlays package metadata](#ref-for-dfn-item-16 "§ 9.3.3.5.2 Overlays package metadata")
- [§ D.6 Manifest properties vocabulary](#ref-for-dfn-item-17 "§ D.6 Manifest properties vocabulary")

[Permalink](#dfn-spine) exported

**Referenced in:**

- [§ 5.4.3 The id attribute](#ref-for-dfn-spine-1 "§ 5.4.3 The id attribute")
- [§ 5.5 The package element](#ref-for-dfn-spine-2 "§ 5.5 The package element")
- [§ 5.7.2 The item element](#ref-for-dfn-spine-3 "§ 5.7.2 The item element")
- [§ 5.8.2 The itemref element](#ref-for-dfn-spine-4 "§ 5.8.2 The itemref element")
- [§ 7.1.1 Introduction](#ref-for-dfn-spine-5 "§ 7.1.1 Introduction")

[Permalink](#dfn-itemref) exported

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-dfn-itemref-1 "§ 1.4 Terminology")
- [§ 3.4 Exempt resources](#ref-for-dfn-itemref-2 "§ 3.4 Exempt resources")
- [§ 5.4.2 The href attribute](#ref-for-dfn-itemref-3 "§ 5.4.2 The href attribute")
- [§ 5.4.3 The id attribute](#ref-for-dfn-itemref-4 "§ 5.4.3 The id attribute")
- [§ 5.4.5 The properties attribute](#ref-for-dfn-itemref-5 "§ 5.4.5 The properties attribute")
- [§ 5.8.1 The spine element](#ref-for-dfn-itemref-6 "§ 5.8.1 The spine element")
- [§ 6.3.1 Pre-paginated](#ref-for-dfn-itemref-7 "§ 6.3.1 Pre-paginated") [(2)](#ref-for-dfn-itemref-8 "Reference 2")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-dfn-itemref-9 "§ 6.3.1.1 Synthetic spreads")
- [§ 6.3.2 Roll](#ref-for-dfn-itemref-10 "§ 6.3.2 Roll")
- [§ D.4.1.1 rendition:layout](#ref-for-dfn-itemref-11 "§ D.4.1.1 rendition:layout") [(2)](#ref-for-dfn-itemref-12 "Reference 2")
- [§ D.4.1.2.1 rendition:layout-pre-paginated](#ref-for-dfn-itemref-13 "§ D.4.1.2.1 rendition:layout-pre-paginated")
- [§ D.4.1.2.2 rendition:layout-reflowable](#ref-for-dfn-itemref-14 "§ D.4.1.2.2 rendition:layout-reflowable")
- [§ D.4.2.1 rendition:page-spread-center](#ref-for-dfn-itemref-15 "§ D.4.2.1 rendition:page-spread-center")
- [§ D.4.2.2 rendition:page-spread-left](#ref-for-dfn-itemref-16 "§ D.4.2.2 rendition:page-spread-left")
- [§ D.4.2.3 rendition:page-spread-right](#ref-for-dfn-itemref-17 "§ D.4.2.3 rendition:page-spread-right")
- [§ D.7 Spine properties vocabulary](#ref-for-dfn-itemref-18 "§ D.7 Spine properties vocabulary")

[Permalink](#def-layout-reflowable)

**Referenced in:**

- [§ 7.3.1 Introduction](#ref-for-def-layout-reflowable-1 "§ 7.3.1 Introduction")

[Permalink](#def-layout-pre-paginated)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-def-layout-pre-paginated-1 "§ 1.4 Terminology")
- [§ 6.3.1.1 Synthetic spreads](#ref-for-def-layout-pre-paginated-2 "§ 6.3.1.1 Synthetic spreads")
- [§ 7.3.1 Introduction](#ref-for-def-layout-pre-paginated-3 "§ 7.3.1 Introduction")

[Permalink](#def-layout-roll)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-def-layout-roll-1 "§ 1.4 Terminology")
- [§ 7.3.1 Introduction](#ref-for-def-layout-roll-2 "§ 7.3.1 Introduction")
- [§ D.4.1.2.1 rendition:layout-pre-paginated](#ref-for-def-layout-roll-3 "§ D.4.1.2.1 rendition:layout-pre-paginated")
- [§ D.4.1.2.2 rendition:layout-reflowable](#ref-for-def-layout-roll-4 "§ D.4.1.2.2 rendition:layout-reflowable")

[Permalink](#dfn-epub-type) exported

**Referenced in:**

- [§ 5.3.1 Introduction](#ref-for-dfn-epub-type-1 "§ 5.3.1 Introduction")
- [§ 7.1.3.1 Structural semantics](#ref-for-dfn-epub-type-2 "§ 7.1.3.1 Structural semantics")
- [§ 7.2.3 Restrictions on SVG](#ref-for-dfn-epub-type-3 "§ 7.2.3 Restrictions on SVG") [(2)](#ref-for-dfn-epub-type-4 "Reference 2")
- [§ 7.4.3.1 Structural semantics](#ref-for-dfn-epub-type-5 "§ 7.4.3.1 Structural semantics")
- [§ 8.3 The nav element: restrictions](#ref-for-dfn-epub-type-6 "§ 8.3 The nav element: restrictions")
- [§ 8.4.1 Introduction](#ref-for-dfn-epub-type-7 "§ 8.4.1 Introduction")
- [§ 8.4.2 The toc nav element](#ref-for-dfn-epub-type-8 "§ 8.4.2 The toc nav element")
- [§ 8.4.3 The page-list nav element](#ref-for-dfn-epub-type-9 "§ 8.4.3 The page-list nav element") [(2)](#ref-for-dfn-epub-type-10 "Reference 2")
- [§ 8.4.4 The landmarks nav element](#ref-for-dfn-epub-type-11 "§ 8.4.4 The landmarks nav element") [(2)](#ref-for-dfn-epub-type-12 "Reference 2")
- [§ 8.4.5 Other nav elements](#ref-for-dfn-epub-type-13 "§ 8.4.5 Other nav elements")
- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-dfn-epub-type-14 "§ 9.3.3.3 Structural semantics in overlays")

[Permalink](#dfn-smil) exported

**Referenced in:**

- [§ 9.3.2.2.2 The head element](#ref-for-dfn-smil-1 "§ 9.3.2.2.2 The head element")
- [§ 9.3.2.2.4 The body element](#ref-for-dfn-smil-2 "§ 9.3.2.2.4 The body element")

[Permalink](#dfn-head) exported

**Referenced in:**

- [§ 9.3.2.2.1 The smil element](#ref-for-dfn-head-1 "§ 9.3.2.2.1 The smil element")
- [§ 9.3.2.2.3 The metadata element](#ref-for-dfn-head-2 "§ 9.3.2.2.3 The metadata element")
- [§ 9.3.2.2.4 The body element](#ref-for-dfn-head-3 "§ 9.3.2.2.4 The body element")

[Permalink](#dfn-body) exported

**Referenced in:**

- [§ 9.3.2.2.1 The smil element](#ref-for-dfn-body-1 "§ 9.3.2.2.1 The smil element")
- [§ 9.3.2.2.5 The seq element](#ref-for-dfn-body-2 "§ 9.3.2.2.5 The seq element")
- [§ 9.3.2.2.6 The par element](#ref-for-dfn-body-3 "§ 9.3.2.2.6 The par element")
- [§ 9.3.3.1 Introduction](#ref-for-dfn-body-4 "§ 9.3.3.1 Introduction")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-body-5 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-dfn-body-6 "§ 9.3.3.3 Structural semantics in overlays")

[Permalink](#dfn-seq) exported

**Referenced in:**

- [§ 9.3.2.2.4 The body element](#ref-for-dfn-seq-1 "§ 9.3.2.2.4 The body element") [(2)](#ref-for-dfn-seq-2 "Reference 2")
- [§ 9.3.2.2.5 The seq element](#ref-for-dfn-seq-3 "§ 9.3.2.2.5 The seq element") [(2)](#ref-for-dfn-seq-4 "Reference 2")
- [§ 9.3.2.2.6 The par element](#ref-for-dfn-seq-5 "§ 9.3.2.2.6 The par element")
- [§ 9.3.3.1 Introduction](#ref-for-dfn-seq-6 "§ 9.3.3.1 Introduction")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-seq-7 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.2.3 Overlay granularity](#ref-for-dfn-seq-8 "§ 9.3.3.2.3 Overlay granularity")
- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-dfn-seq-9 "§ 9.3.3.3 Structural semantics in overlays")

[Permalink](#dfn-par) exported

**Referenced in:**

- [§ 9.3.2.2.4 The body element](#ref-for-dfn-par-1 "§ 9.3.2.2.4 The body element") [(2)](#ref-for-dfn-par-2 "Reference 2")
- [§ 9.3.2.2.5 The seq element](#ref-for-dfn-par-3 "§ 9.3.2.2.5 The seq element")
- [§ 9.3.2.2.7 The text element](#ref-for-dfn-par-4 "§ 9.3.2.2.7 The text element")
- [§ 9.3.2.2.8 The audio element](#ref-for-dfn-par-5 "§ 9.3.2.2.8 The audio element")
- [§ 9.3.3.1 Introduction](#ref-for-dfn-par-6 "§ 9.3.3.1 Introduction")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-par-7 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.2.4 Text-to-speech rendering](#ref-for-dfn-par-8 "§ 9.3.3.2.4 Text-to-speech rendering")
- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-dfn-par-9 "§ 9.3.3.3 Structural semantics in overlays")

[Permalink](#dfn-text) exported

**Referenced in:**

- [§ 9.3.2.2.6 The par element](#ref-for-dfn-text-1 "§ 9.3.2.2.6 The par element")
- [§ 9.3.3.1 Introduction](#ref-for-dfn-text-2 "§ 9.3.3.1 Introduction")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-text-3 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.2.2 Referencing document fragments](#ref-for-dfn-text-4 "§ 9.3.3.2.2 Referencing document fragments")
- [§ 9.3.3.2.3 Overlay granularity](#ref-for-dfn-text-5 "§ 9.3.3.2.3 Overlay granularity")
- [§ 9.3.3.2.4 Text-to-speech rendering](#ref-for-dfn-text-6 "§ 9.3.3.2.4 Text-to-speech rendering")

[Permalink](#dfn-audio) exported

**Referenced in:**

- [§ 9.3.2.2.6 The par element](#ref-for-dfn-audio-1 "§ 9.3.2.2.6 The par element")
- [§ 9.3.2.2.7 The text element](#ref-for-dfn-audio-2 "§ 9.3.2.2.7 The text element")
- [§ 9.3.3.1 Introduction](#ref-for-dfn-audio-3 "§ 9.3.3.1 Introduction")
- [§ 9.3.3.2.1 Overlay structure](#ref-for-dfn-audio-4 "§ 9.3.3.2.1 Overlay structure")
- [§ 9.3.3.2.4 Text-to-speech rendering](#ref-for-dfn-audio-5 "§ 9.3.3.2.4 Text-to-speech rendering")

[Permalink](#outdated)

**Referenced in:**

- [§ 3.2 Core media types](#ref-for-outdated-1 "§ 3.2 Core media types")
- [§ 3.3 Foreign resources](#ref-for-outdated-2 "§ 3.3 Foreign resources")
- [§ 4.1 Introduction](#ref-for-outdated-3 "§ 4.1 Introduction")
- [§ 4.2.1 Introduction](#ref-for-outdated-4 "§ 4.2.1 Introduction")
- [§ 4.2.6.3.2.1 The encryption element](#ref-for-outdated-5 "§ 4.2.6.3.2.1 The encryption element")
- [§ 5.5 The package element](#ref-for-outdated-6 "§ 5.5 The package element") [(2)](#ref-for-outdated-7 "Reference 2")
- [§ 5.6.1 The metadata element](#ref-for-outdated-8 "§ 5.6.1 The metadata element")
- [§ 5.8.1 The spine element](#ref-for-outdated-9 "§ 5.8.1 The spine element") [(2)](#ref-for-outdated-10 "Reference 2")
- [§ 7.4.1.2 CSS requirements](#ref-for-outdated-11 "§ 7.4.1.2 CSS requirements")

[Permalink](#deprecated)

**Referenced in:**

- [§ 11.2.1 EPUB-specific features](#ref-for-deprecated-1 "§ 11.2.1 EPUB-specific features")
- [§ E.1 Outdated features](#ref-for-deprecated-2 "§ E.1 Outdated features")

[Permalink](https://www.rfc-editor.org/info/bcp47#section-2.2.9)

**Referenced in:**

- [§ 5.4.7 The xml:lang attribute](#ref-for-index-term-well-formed-language-tag-1 "§ 5.4.7 The xml:lang attribute")
- [§ 5.6.3.1.3 The dc:language element](#ref-for-index-term-well-formed-language-tag-2 "§ 5.6.3.1.3 The dc:language element")
- [§ 5.6.6 The link element](#ref-for-index-term-well-formed-language-tag-3 "§ 5.6.6 The link element")

[Permalink](https://www.unicode.org/reports/tr9/tr9-52.html#BD5)

**Referenced in:**

- [§ 5.4.1 The dir attribute](#ref-for-index-term-base-direction-1 "§ 5.4.1 The dir attribute")

[Permalink](https://www.w3.org/TR/charmod-norm/#CanonicalFoldNormalizationStep)

**Referenced in:**

- [§ 4.2.3 File paths and file names](#ref-for-index-term-unicode-canonical-case-fold-normalization-step-1 "§ 4.2.3 File paths and file names")

[Permalink](https://www.w3.org/TR/css-values-4/#urls)

**Referenced in:**

- [§ 3.4 Exempt resources](#ref-for-index-term-url-function-1 "§ 3.4 Exempt resources")

[Permalink](https://www.w3.org/TR/css-writing-modes-3/#direction)

**Referenced in:**

- [§ 7.4.1.2 CSS requirements](#ref-for-index-term-direction-property-1 "§ 7.4.1.2 CSS requirements")

[Permalink](https://www.w3.org/TR/css-writing-modes-3/#unicode-bidi)

**Referenced in:**

- [§ 7.4.1.2 CSS requirements](#ref-for-index-term-unicode-bidi-property-1 "§ 7.4.1.2 CSS requirements")

[Permalink](https://www.w3.org/TR/CSS2/syndata.html#numbers)

**Referenced in:**

- [§ 7.3.2 Fixed-layout document dimensions](#ref-for-index-term-number-1 "§ 7.3.2 Fixed-layout document dimensions") [(2)](#ref-for-index-term-number-2 "Reference 2")

[Permalink](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/#section-2)

**Referenced in:**

- [§ 5.3.5 Reserved prefixes](#ref-for-index-term-dublin-core-terms-namespace-1 "§ 5.3.5 Reserved prefixes")

[Permalink](https://dom.spec.whatwg.org/#concept-child-text-content)

**Referenced in:**

- [§ 5.6.2 Metadata values](#ref-for-index-term-child-text-content-1 "§ 5.6.2 Metadata values")

[Permalink](https://www.w3.org/TR/dpub-aria/#doc-pagebreak)

**Referenced in:**

- [§ 8.4.3 The page-list nav element](#ref-for-index-term-doc-pagebreak-1 "§ 8.4.3 The page-list nav element")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-text-transform)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-fullwidth-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-hyphens)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-hyphens-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-line-break)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-line-break-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-align-last)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-align-last-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-text-combine)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-combine-horizontal-1 "§ E.1 Outdated features")
- [§ E.2 Deprecated features](#ref-for-index-term-epub-text-combine-horizontal-2 "§ E.2 Deprecated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-emphasis-color)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-emphasis-color-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-emphasis-position)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-emphasis-position-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-emphasis-style)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-emphasis-style-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-text-orientation)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-orientation-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-text-underline-position)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-text-underline-position-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-text-epub-word-break)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-word-break-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-css-prefixed-writing-modes-writing-mode)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-epub-writing-mode-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-collection-elem)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-collection-element-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#content-fallbacks)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-content-fallbacks-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#sec-font-obfuscation)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-font-obfuscation-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#tbl-reserved-prefixes)

**Referenced in:**

- [§ E.2 Deprecated features](#ref-for-index-term-msv-and-prism-reserved-prefixes-1 "§ E.2 Deprecated features")

[Permalink](https://www.w3.org/TR/epub-33/#align-x-center)

**Referenced in:**

- [§ E.2 Deprecated features](#ref-for-index-term-rendition-align-x-center-property-1 "§ E.2 Deprecated features")

[Permalink](https://www.w3.org/TR/epub-33/#flow)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-rendition-flow-property-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#orientation)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-rendition-orientation-property-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#spread)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-rendition-spread-property-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#source-of)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-source-of-property-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#flow-overrides)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-spine-overrides-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#orientation-overrides)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-spine-overrides-0-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#spread-overrides)

**Referenced in:**

- [§ E.1 Outdated features](#ref-for-index-term-spine-overrides-1-1 "§ E.1 Outdated features")

[Permalink](https://www.w3.org/TR/epub-33/#tbl-pkg-reserved-prefixes)

**Referenced in:**

- [§ E.2 Deprecated features](#ref-for-index-term-xsd-reserved-prefix-1 "§ E.2 Deprecated features")

[Permalink](https://www.w3.org/TR/epub-a11y-12/#)

**Referenced in:**

- [§ 1.1 Overview](#ref-for-index-term-epub-accessibility-1 "§ 1.1 Overview")
- [§ 10. Accessibility](#ref-for-index-term-epub-accessibility-2 "§ 10. Accessibility")

[Permalink](https://www.w3.org/TR/epub-a11y-12/#app-a11y-vocab)

**Referenced in:**

- [§ 5.3.5 Reserved prefixes](#ref-for-index-term-epub-accessibility-1-2-1 "§ 5.3.5 Reserved prefixes")

[Permalink](https://www.w3.org/TR/epub-overview-34/#)

**Referenced in:**

- [§ 1.1 Overview](#ref-for-index-term-epub-3-overview-1 "§ 1.1 Overview")

[Permalink](https://www.w3.org/TR/epub-overview-34/#sec-rendering)

**Referenced in:**

- [§ 7.3.1 Introduction](#ref-for-index-term-rendering-and-css-1 "§ 7.3.1 Introduction")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-nav-hidden)

**Referenced in:**

- [§ 8.5 Using in the spine](#ref-for-index-term-attribute-has-no-effect-1 "§ 8.5 Using in the spine")

[Permalink](https://www.w3.org/TR/epub-rs-34/#sec-epub-rs-conf-cmt)

**Referenced in:**

- [§ 3.2 Core media types](#ref-for-index-term-core-media-types-1 "§ 3.2 Core media types")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-css-rs-support)

**Referenced in:**

- [§ 7.4.1.1 Introduction](#ref-for-index-term-css-as-defined-in-the-css-snapshot-1 "§ 7.4.1.1 Introduction")

[Permalink](https://www.w3.org/TR/epub-rs-34/#)

**Referenced in:**

- [§ 1.1 Overview](#ref-for-index-term-epub-3-reading-systems-1 "§ 1.1 Overview")

[Permalink](https://www.w3.org/TR/epub-rs-34/#app-epubReadingSystem)

**Referenced in:**

- [§ 11.2.1 EPUB-specific features](#ref-for-index-term-epubreadingsystem-object-1 "§ 11.2.1 EPUB-specific features")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-rs-scripted-fxl-support)

**Referenced in:**

- [§ 7.4.2.2.2 Spine-level scripts](#ref-for-index-term-fixed-layout-documents-1 "§ 7.4.2.2.2 Spine-level scripts")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-nav-ol-style)

**Referenced in:**

- [§ 8.5 Using in the spine](#ref-for-index-term-have-to-suppress-list-item-numbering-1 "§ 8.5 Using in the spine")

[Permalink](https://www.w3.org/TR/epub-rs-34/#sec-nav)

**Referenced in:**

- [§ 9.3.5 Navigation document overlays](#ref-for-index-term-navigation-document-processing-1 "§ 9.3.5 Navigation document overlays")

[Permalink](https://www.w3.org/TR/epub-rs-34/#sec-compact-url-values)

**Referenced in:**

- [§ 5.3.2 The compact URL data type](#ref-for-index-term-processing-1 "§ 5.3.2 The compact URL data type")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-css-rs-fonts)

**Referenced in:**

- [§ 3.4 Exempt resources](#ref-for-index-term-reading-system-support-requirements-for-fonts-1 "§ 3.4 Exempt resources")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-rs-scripted-scrolled)

**Referenced in:**

- [§ 7.4.2.2.2 Spine-level scripts](#ref-for-index-term-reflowable-documents-set-to-scroll-1 "§ 7.4.2.2.2 Spine-level scripts")

[Permalink](https://www.w3.org/TR/epub-rs-34/#sec-scripted-content)

**Referenced in:**

- [§ 7.4.2.1 Script inclusion](#ref-for-index-term-scripting-1 "§ 7.4.2.1 Script inclusion")
- [§ 7.4.2.2 Scripting contexts](#ref-for-index-term-scripting-2 "§ 7.4.2.2 Scripting contexts")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-index-term-scripting-3 "§ 7.4.2.2.1 Container-constrained scripts")

[Permalink](https://www.w3.org/TR/epub-rs-34/#sec-security-privacy)

**Referenced in:**

- [§ 11.1 Overview](#ref-for-index-term-security-and-privacy-section-1 "§ 11.1 Overview")

[Permalink](https://www.w3.org/TR/epub-rs-34/#note-table-reading-mode)

**Referenced in:**

- [§ 9.3.3.3 Structural semantics in overlays](#ref-for-index-term-table-reading-mode-1 "§ 9.3.3.3 Structural semantics in overlays")

[Permalink](https://www.w3.org/TR/epub-rs-34/#sec-container-iri)

**Referenced in:**

- [§ 11.3 Recommendations](#ref-for-index-term-unique-origin-requirement-1 "§ 11.3 Recommendations")

[Permalink](https://www.w3.org/TR/epub-rs-34/#confreq-zip-rootdir)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-index-term-virtual-in-nature-1 "§ 1.4 Terminology")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#aside)

**Referenced in:**

- [§ 9.3.4.2 Escapability](#ref-for-index-term-aside-1 "§ 9.3.4.2 Escapability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#bodymatter)

**Referenced in:**

- [§ 8.4.4 The landmarks nav element](#ref-for-index-term-bodymatter-1 "§ 8.4.4 The landmarks nav element")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#endnote)

**Referenced in:**

- [§ 9.3.4.1 Skippability](#ref-for-index-term-endnote-1 "§ 9.3.4.1 Skippability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#figure)

**Referenced in:**

- [§ 9.3.4.2 Escapability](#ref-for-index-term-figure-1 "§ 9.3.4.2 Escapability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#footnote)

**Referenced in:**

- [§ 9.3.4.1 Skippability](#ref-for-index-term-footnote-1 "§ 9.3.4.1 Skippability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#landmarks)

**Referenced in:**

- [§ 8.4.4 The landmarks nav element](#ref-for-index-term-landmarks-1 "§ 8.4.4 The landmarks nav element")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#list)

**Referenced in:**

- [§ 9.3.4.2 Escapability](#ref-for-index-term-list-1 "§ 9.3.4.2 Escapability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#page-list)

**Referenced in:**

- [§ 8.4.3 The page-list nav element](#ref-for-index-term-page-list-1 "§ 8.4.3 The page-list nav element")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#pagebreak)

**Referenced in:**

- [§ 8.4.3 The page-list nav element](#ref-for-index-term-pagebreak-1 "§ 8.4.3 The page-list nav element")
- [§ 9.3.4.1 Skippability](#ref-for-index-term-pagebreak-2 "§ 9.3.4.1 Skippability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#table)

**Referenced in:**

- [§ 9.3.4.2 Escapability](#ref-for-index-term-table-1 "§ 9.3.4.2 Escapability")

[Permalink](https://www.w3.org/TR/epub-ssv-11/#toc-1)

**Referenced in:**

- [§ 8.4.2 The toc nav element](#ref-for-index-term-toc-1 "§ 8.4.2 The toc nav element")
- [§ 8.4.4 The landmarks nav element](#ref-for-index-term-toc-2 "§ 8.4.4 The landmarks nav element")

[Permalink](https://www.w3.org/TR/epub-tts-10/#)

**Referenced in:**

- [§ 9.3.3.2.4 Text-to-speech rendering](#ref-for-index-term-epub-3-text-to-speech-support-1 "§ 9.3.3.2.4 Text-to-speech rendering")

[Permalink](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-index-term-a-element-1 "§ 1.4 Terminology")
- [§ 5.8.1 The spine element](#ref-for-index-term-a-element-2 "§ 5.8.1 The spine element")
- [§ 8.3 The nav element: restrictions](#ref-for-index-term-a-element-3 "§ 8.3 The nav element: restrictions") [(2)](#ref-for-index-term-a-element-4 "Reference 2")
- [§ A.1 Resources](#ref-for-index-term-a-element-5 "§ A.1 Resources") [(2)](#ref-for-index-term-a-element-6 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/image-maps.html#the-area-element)

**Referenced in:**

- [§ 5.8.1 The spine element](#ref-for-index-term-area-element-1 "§ 5.8.1 The spine element")

[Permalink](https://html.spec.whatwg.org/multipage/#the-audio-element)

**Referenced in:**

- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-index-term-audio-1 "§ 3.5.2.1 HTML audio and video fallbacks")
- [§ 3.6 Resource locations](#ref-for-index-term-audio-2 "§ 3.6 Resource locations") [(2)](#ref-for-index-term-audio-3 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/semantics.html#the-base-element)

**Referenced in:**

- [§ 7.1.4.3.1 The base element](#ref-for-index-term-base-element-1 "§ 7.1.4.3.1 The base element")

[Permalink](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-bdo-element)

**Referenced in:**

- [§ 7.4.1.2 CSS requirements](#ref-for-index-term-bdo-element-1 "§ 7.4.1.2 CSS requirements")

[Permalink](https://html.spec.whatwg.org/multipage/#the-body-element)

**Referenced in:**

- [§ 6.2 Reflowable layouts](#ref-for-index-term-body-1 "§ 6.2 Reflowable layouts")
- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-body-2 "§ 7.2.3 Restrictions on SVG")

[Permalink](https://html.spec.whatwg.org/multipage/canvas.html#canvas)

**Referenced in:**

- [§ 7.4.2.5 Scripting fallbacks](#ref-for-index-term-canvas-element-1 "§ 7.4.2.5 Scripting fallbacks")

[Permalink](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-content)

**Referenced in:**

- [§ C.2 Syntax](#ref-for-index-term-content-attribute-for-meta-element-1 "§ C.2 Syntax")

[Permalink](https://html.spec.whatwg.org/multipage/#dom-document-cookie)

**Referenced in:**

- [§ 11.3 Recommendations](#ref-for-index-term-cookies-1 "§ 11.3 Recommendations")

[Permalink](https://html.spec.whatwg.org/multipage/#data-block)

**Referenced in:**

- [§ 3.5.2.3 HTML script element](#ref-for-index-term-data-blocks-1 "§ 3.5.2.3 HTML script element")
- [§ 7.4.2.1 Script inclusion](#ref-for-index-term-data-blocks-2 "§ 7.4.2.1 Script inclusion")

[Permalink](https://html.spec.whatwg.org/multipage/#dependencies)

**Referenced in:**

- [§ C.2 Syntax](#ref-for-index-term-depends-on-1 "§ C.2 Syntax")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#attr-dir)

**Referenced in:**

- [§ 7.4.1.2 CSS requirements](#ref-for-index-term-dir-attribute-for-html-global-element-1 "§ 7.4.1.2 CSS requirements") [(2)](#ref-for-index-term-dir-attribute-for-html-global-element-2 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/grouping-content.html#the-div-element)

**Referenced in:**

- [§ 7.4.3.2 Syntax](#ref-for-index-term-div-element-1 "§ 7.4.3.2 Syntax")

[Permalink](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#document-base-url)

**Referenced in:**

- [§ 7.1.4.3.1 The base element](#ref-for-index-term-document-base-url-1 "§ 7.1.4.3.1 The base element")

[Permalink](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-embed-element)

**Referenced in:**

- [§ 7.1.4.3.3 The embed element](#ref-for-index-term-embed-element-1 "§ 7.1.4.3.3 The embed element")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#embedded-content-category)

**Referenced in:**

- [§ 5.8.1 The spine element](#ref-for-index-term-embedded-content-1 "§ 5.8.1 The spine element")
- [§ 8.3 The nav element: restrictions](#ref-for-index-term-embedded-content-2 "§ 8.3 The nav element: restrictions")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

**Referenced in:**

- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-index-term-flow-content-1 "§ 3.5.2.1 HTML audio and video fallbacks")
- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-flow-content-2 "§ 7.2.3 Restrictions on SVG")

[Permalink](https://html.spec.whatwg.org/multipage/forms.html#the-form-element)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-index-term-form-element-1 "§ 1.4 Terminology")
- [§ 7.4.2.1 Script inclusion](#ref-for-index-term-form-element-2 "§ 7.4.2.1 Script inclusion")
- [§ D.6.5 scripted](#ref-for-index-term-form-element-3 "§ D.6.5 scripted")

[Permalink](https://html.spec.whatwg.org/multipage/#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements)

**Referenced in:**

- [§ 8.3 The nav element: restrictions](#ref-for-index-term-h1-h6-1 "§ 8.3 The nav element: restrictions")

[Permalink](https://html.spec.whatwg.org/multipage/#the-head-element)

**Referenced in:**

- [§ 7.1.3.1 Structural semantics](#ref-for-index-term-head-1 "§ 7.1.3.1 Structural semantics")
- [§ 7.3.2 Fixed-layout document dimensions](#ref-for-index-term-head-2 "§ 7.3.2 Fixed-layout document dimensions")

[Permalink](https://html.spec.whatwg.org/multipage/interaction.html#attr-hidden)

**Referenced in:**

- [§ 8.5 Using in the spine](#ref-for-index-term-hidden-attribute-for-html-global-element-1 "§ 8.5 Using in the spine")

[Permalink](https://html.spec.whatwg.org/multipage/links.html#attr-hyperlink-href)

**Referenced in:**

- [§ 5.8.1 The spine element](#ref-for-index-term-href-attribute-for-a-element-1 "§ 5.8.1 The spine element")

[Permalink](https://html.spec.whatwg.org/multipage/semantics.html#the-html-element)

**Referenced in:**

- [§ 5.3.4 The prefix attribute](#ref-for-index-term-html-element-1 "§ 5.3.4 The prefix attribute")
- [§ 9.3.3.4 Associating style information](#ref-for-index-term-html-element-2 "§ 9.3.3.4 Associating style information")

[Permalink](https://html.spec.whatwg.org/multipage/#link-type-alternate)

**Referenced in:**

- [§ D.3.1.1 alternate](#ref-for-index-term-html-alternate-keyword-1 "§ D.3.1.1 alternate")

[Permalink](https://html.spec.whatwg.org/multipage/#resolving-urls)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-html-standard-1 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](https://html.spec.whatwg.org/multipage/#syntax)

**Referenced in:**

- [§ 1.3.1 Relationship to HTML](#ref-for-index-term-html-syntax-1 "§ 1.3.1 Relationship to HTML")
- [§ 7.1.1 Introduction](#ref-for-index-term-html-syntax-2 "§ 7.1.1 Introduction")

[Permalink](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-iframe-element)

**Referenced in:**

- [§ 3.7 Data URLs](#ref-for-index-term-iframe-element-1 "§ 3.7 Data URLs")
- [§ 5.7.2.1 Resource properties](#ref-for-index-term-iframe-element-2 "§ 5.7.2.1 Resource properties")
- [§ 7.4.2.2 Scripting contexts](#ref-for-index-term-iframe-element-3 "§ 7.4.2.2 Scripting contexts")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-index-term-iframe-element-4 "§ 7.4.2.2.1 Container-constrained scripts") [(2)](#ref-for-index-term-iframe-element-5 "Reference 2")
- [§ A.1 Resources](#ref-for-index-term-iframe-element-6 "§ A.1 Resources")

[Permalink](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element)

**Referenced in:**

- [§ 3.5.2.2 HTML img fallbacks](#ref-for-index-term-img-element-1 "§ 3.5.2.2 HTML img fallbacks")
- [§ 7.1.4.2 Embedded SVG](#ref-for-index-term-img-element-2 "§ 7.1.4.2 Embedded SVG")
- [§ A.1 Resources](#ref-for-index-term-img-element-3 "§ A.1 Resources") [(2)](#ref-for-index-term-img-element-4 "Reference 2") [(3)](#ref-for-index-term-img-element-5 "Reference 3")

[Permalink](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)

**Referenced in:**

- [§ 8.3 The nav element: restrictions](#ref-for-index-term-li-element-1 "§ 8.3 The nav element: restrictions") [(2)](#ref-for-index-term-li-element-2 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/#the-link-element)

**Referenced in:**

- [§ 3.1.3 The content plane](#ref-for-index-term-link-1 "§ 3.1.3 The content plane")
- [§ 3.4 Exempt resources](#ref-for-index-term-link-2 "§ 3.4 Exempt resources") [(2)](#ref-for-index-term-link-3 "Reference 2")
- [§ A.1 Resources](#ref-for-index-term-link-4 "§ A.1 Resources") [(2)](#ref-for-index-term-link-5 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/#the-meta-element)

**Referenced in:**

- [§ C.2 Syntax](#ref-for-index-term-meta-1 "§ C.2 Syntax") [(2)](#ref-for-index-term-meta-2 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#metadata-content-2)

**Referenced in:**

- [§ 7.1.3.1 Structural semantics](#ref-for-index-term-metadata-content-1 "§ 7.1.3.1 Structural semantics")

[Permalink](https://html.spec.whatwg.org/multipage/#microdata)

**Referenced in:**

- [§ 7.1.3.2 RDFa](#ref-for-index-term-microdata-attributes-1 "§ 7.1.3.2 RDFa")

[Permalink](https://html.spec.whatwg.org/multipage/semantics.html#attr-meta-name)

**Referenced in:**

- [§ C.2 Syntax](#ref-for-index-term-name-attribute-for-meta-element-1 "§ C.2 Syntax")

[Permalink](https://html.spec.whatwg.org/multipage/sections.html#the-nav-element)

**Referenced in:**

- [§ 8.3 The nav element: restrictions](#ref-for-index-term-nav-element-1 "§ 8.3 The nav element: restrictions")
- [§ 8.4.2 The toc nav element](#ref-for-index-term-nav-element-2 "§ 8.4.2 The toc nav element")
- [§ 8.4.3 The page-list nav element](#ref-for-index-term-nav-element-3 "§ 8.4.3 The page-list nav element")
- [§ 8.4.4 The landmarks nav element](#ref-for-index-term-nav-element-4 "§ 8.4.4 The landmarks nav element")

[Permalink](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element)

**Referenced in:**

- [§ 7.1.4.2 Embedded SVG](#ref-for-index-term-object-type-1 "§ 7.1.4.2 Embedded SVG")
- [§ 7.1.4.3.3 The embed element](#ref-for-index-term-object-type-2 "§ 7.1.4.3.3 The embed element")
- [§ 7.4.2.2 Scripting contexts](#ref-for-index-term-object-type-3 "§ 7.4.2.2 Scripting contexts")
- [§ 7.4.2.5 Scripting fallbacks](#ref-for-index-term-object-type-4 "§ 7.4.2.5 Scripting fallbacks")

[Permalink](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element)

**Referenced in:**

- [§ 8.3 The nav element: restrictions](#ref-for-index-term-ol-element-1 "§ 8.3 The nav element: restrictions") [(2)](#ref-for-index-term-ol-element-2 "Reference 2") [(3)](#ref-for-index-term-ol-element-3 "Reference 3")

[Permalink](https://html.spec.whatwg.org/multipage/#origin)

**Referenced in:**

- [§ 7.4.2.1 Script inclusion](#ref-for-index-term-origin-1 "§ 7.4.2.1 Script inclusion")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#palpable-content-2)

**Referenced in:**

- [§ 9.3.2.2.7 The text element](#ref-for-index-term-palpable-content-1 "§ 9.3.2.2.7 The text element")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

**Referenced in:**

- [§ 8.3 The nav element: restrictions](#ref-for-index-term-phrasing-content-1 "§ 8.3 The nav element: restrictions") [(2)](#ref-for-index-term-phrasing-content-2 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/embedded-content.html#the-picture-element)

**Referenced in:**

- [§ 3.1.3 The content plane](#ref-for-index-term-picture-element-1 "§ 3.1.3 The content plane")
- [§ 3.5.2.2 HTML img fallbacks](#ref-for-index-term-picture-element-2 "§ 3.5.2.2 HTML img fallbacks")
- [§ A.1 Resources](#ref-for-index-term-picture-element-3 "§ A.1 Resources") [(2)](#ref-for-index-term-picture-element-4 "Reference 2")

[Permalink](https://html.spec.whatwg.org/multipage/#svg-0)

**Referenced in:**

- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-restrictions-on-svg-1 "§ 7.2.3 Restrictions on SVG")

[Permalink](https://html.spec.whatwg.org/multipage/infrastructure.html#attr-aria-role)

**Referenced in:**

- [§ 7.4.3.1 Structural semantics](#ref-for-index-term-role-attribute-1 "§ 7.4.3.1 Structural semantics")
- [§ 7.4.3.2 Syntax](#ref-for-index-term-role-attribute-2 "§ 7.4.3.2 Syntax")
- [§ 8.4.3 The page-list nav element](#ref-for-index-term-role-attribute-3 "§ 8.4.3 The page-list nav element")

[Permalink](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-rp-element)

**Referenced in:**

- [§ 7.1.4.3.2 The rp element](#ref-for-index-term-rp-element-1 "§ 7.1.4.3.2 The rp element")

[Permalink](https://html.spec.whatwg.org/multipage/scripting.html#script)

**Referenced in:**

- [§ 3.4 Exempt resources](#ref-for-index-term-script-element-1 "§ 3.4 Exempt resources") [(2)](#ref-for-index-term-script-element-2 "Reference 2")
- [§ 3.5.2.3 HTML script element](#ref-for-index-term-script-element-3 "§ 3.5.2.3 HTML script element")
- [§ 5.6.6 The link element](#ref-for-index-term-script-element-4 "§ 5.6.6 The link element")
- [§ 7.4.2.2.1 Container-constrained scripts](#ref-for-index-term-script-element-5 "§ 7.4.2.2.1 Container-constrained scripts")
- [§ 7.4.2.2.2 Spine-level scripts](#ref-for-index-term-script-element-6 "§ 7.4.2.2.2 Spine-level scripts")

[Permalink](https://html.spec.whatwg.org/multipage/embedded-content.html#the-source-element)

**Referenced in:**

- [§ 3.4 Exempt resources](#ref-for-index-term-source-element-1 "§ 3.4 Exempt resources")
- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-index-term-source-element-2 "§ 3.5.2.1 HTML audio and video fallbacks")
- [§ 3.5.2.2 HTML img fallbacks](#ref-for-index-term-source-element-3 "§ 3.5.2.2 HTML img fallbacks")
- [§ A.1 Resources](#ref-for-index-term-source-element-4 "§ A.1 Resources")

[Permalink](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element)

**Referenced in:**

- [§ 7.4.3.2 Syntax](#ref-for-index-term-span-element-1 "§ 7.4.3.2 Syntax")
- [§ 8.3 The nav element: restrictions](#ref-for-index-term-span-element-2 "§ 8.3 The nav element: restrictions") [(2)](#ref-for-index-term-span-element-3 "Reference 2")
- [§ 9.3.3.2.3 Overlay granularity](#ref-for-index-term-span-element-4 "§ 9.3.3.2.3 Overlay granularity")

[Permalink](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-source-src)

**Referenced in:**

- [§ 3.5.2.2 HTML img fallbacks](#ref-for-index-term-src-attribute-for-source-element-1 "§ 3.5.2.2 HTML img fallbacks")

[Permalink](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-source-srcset)

**Referenced in:**

- [§ 3.5.2.2 HTML img fallbacks](#ref-for-index-term-srcset-attribute-for-source-element-1 "§ 3.5.2.2 HTML img fallbacks")

[Permalink](https://html.spec.whatwg.org/multipage/dom.html#attr-style)

**Referenced in:**

- [§ 7.4.1.3 Reading system support considerations](#ref-for-index-term-style-attribute-for-html-global-element-1 "§ 7.4.1.3 Reading system support considerations")

[Permalink](https://html.spec.whatwg.org/multipage/scripting.html#the-template-element)

**Referenced in:**

- [§ 7.1.1 Introduction](#ref-for-index-term-template-element-1 "§ 7.1.1 Introduction")

[Permalink](https://html.spec.whatwg.org/multipage/document-sequences.html#top-level-browsing-context)

**Referenced in:**

- [§ 3.7 Data URLs](#ref-for-index-term-top-level-browsing-context-1 "§ 3.7 Data URLs")

[Permalink](https://html.spec.whatwg.org/multipage/media.html#the-track-element)

**Referenced in:**

- [§ 3.4 Exempt resources](#ref-for-index-term-track-element-1 "§ 3.4 Exempt resources")

[Permalink](https://html.spec.whatwg.org/multipage/embedded-content.html#attr-source-type)

**Referenced in:**

- [§ 3.5.2.2 HTML img fallbacks](#ref-for-index-term-type-attribute-for-source-element-1 "§ 3.5.2.2 HTML img fallbacks")

[Permalink](https://html.spec.whatwg.org/multipage/#extensibility-2)

**Referenced in:**

- [§ 7.1.3 HTML extensions](#ref-for-index-term-vendor-neutral-extensions-1 "§ 7.1.3 HTML extensions")

[Permalink](https://html.spec.whatwg.org/multipage/media.html#video)

**Referenced in:**

- [§ 3.4 Exempt resources](#ref-for-index-term-video-element-1 "§ 3.4 Exempt resources")
- [§ 9.3.2.2.7 The text element](#ref-for-index-term-video-element-2 "§ 9.3.2.2.7 The text element")

[Permalink](https://html.spec.whatwg.org/multipage/#the-video-element)

**Referenced in:**

- [§ 3.5.2.1 HTML audio and video fallbacks](#ref-for-index-term-video-1 "§ 3.5.2.1 HTML audio and video fallbacks")

[Permalink](https://html.spec.whatwg.org/multipage/#webstorage)

**Referenced in:**

- [§ 11.3 Recommendations](#ref-for-index-term-web-storage-1 "§ 11.3 Recommendations")

[Permalink](https://html.spec.whatwg.org/multipage/#the-xhtml-syntax)

**Referenced in:**

- [§ 1.3.1 Relationship to HTML](#ref-for-index-term-xml-syntax-1 "§ 1.3.1 Relationship to HTML")
- [§ 1.4 Terminology](#ref-for-index-term-xml-syntax-2 "§ 1.4 Terminology")
- [§ 3.2 Core media types](#ref-for-index-term-xml-syntax-3 "§ 3.2 Core media types")
- [§ 7.1.1 Introduction](#ref-for-index-term-xml-syntax-4 "§ 7.1.1 Introduction")

[Permalink](https://html.spec.whatwg.org/multipage/#writing-xhtml-documents)

**Referenced in:**

- [§ 7.1.2 XHTML requirements](#ref-for-index-term-xml-syntax-0-1 "§ 7.1.2 XHTML requirements")

[Permalink](https://infra.spec.whatwg.org/#string-concatenate)

**Referenced in:**

- [§ 4.2.4 Deriving file paths](#ref-for-index-term-concatenation-1 "§ 4.2.4 Deriving file paths")

[Permalink](https://infra.spec.whatwg.org/#ascii-whitespace)

**Referenced in:**

- [§ C.2 Syntax](#ref-for-index-term-definition-of-whitespace-1 "§ C.2 Syntax")

[Permalink](https://infra.spec.whatwg.org/#html-namespace)

**Referenced in:**

- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-html-namespace-1 "§ 7.2.3 Restrictions on SVG")

[Permalink](https://infra.spec.whatwg.org/#list)

**Referenced in:**

- [§ 4.2.4 Deriving file paths](#ref-for-index-term-list-0-1 "§ 4.2.4 Deriving file paths")

[Permalink](https://infra.spec.whatwg.org/#list-prepend)

**Referenced in:**

- [§ 4.2.4 Deriving file paths](#ref-for-index-term-prepend-for-list-1 "§ 4.2.4 Deriving file paths")

[Permalink](https://infra.spec.whatwg.org/#scalar-value-string)

**Referenced in:**

- [§ 4.2.3 File paths and file names](#ref-for-index-term-scalar-value-strings-1 "§ 4.2.3 File paths and file names")

[Permalink](https://infra.spec.whatwg.org/#strip-and-collapse-ascii-whitespace)

**Referenced in:**

- [§ 5.6.2 Metadata values](#ref-for-index-term-strip-and-collapse-ascii-whitespace-1 "§ 5.6.2 Metadata values")

[Permalink](https://infra.spec.whatwg.org/#strip-leading-and-trailing-ascii-whitespace)

**Referenced in:**

- [§ 5.6.2 Metadata values](#ref-for-index-term-strip-leading-and-trailing-ascii-whitespace-1 "§ 5.6.2 Metadata values")

[Permalink](https://www.w3.org/TR/international-specs/#char_truncation)

**Referenced in:**

- [§ 4.2.3 File paths and file names](#ref-for-index-term-truncating-or-limiting-the-length-of-strings-1 "§ 4.2.3 File paths and file names")

[Permalink](https://www.w3.org/TR/its20/#html5-global-approach)

**Referenced in:**

- [§ 7.1.3.3 Internationalization tag set (ITS)](#ref-for-index-term-global-approach-in-html5-1 "§ 7.1.3.3 Internationalization tag set (ITS)")

[Permalink](https://www.w3.org/TR/its20/#html5-markup)

**Referenced in:**

- [§ 7.1.3.3 Internationalization tag set (ITS)](#ref-for-index-term-using-its-markup-in-html-1 "§ 7.1.3.3 Internationalization tag set (ITS)")

[Permalink](https://www.w3.org/TR/json-ld11/#)

**Referenced in:**

- [§ 7.1.3.2 RDFa](#ref-for-index-term-linked-data-1 "§ 7.1.3.2 RDFa")

[Permalink](https://www.w3.org/TR/MathML3/chapter4.html#)

**Referenced in:**

- [§ 7.1.4.1 Embedded MathML](#ref-for-index-term-content-mathml-1 "§ 7.1.4.1 Embedded MathML")

[Permalink](https://www.w3.org/TR/MathML3/chapter3.html#)

**Referenced in:**

- [§ 7.1.4.1 Embedded MathML](#ref-for-index-term-presentation-mathml-1 "§ 7.1.4.1 Embedded MathML")

[Permalink](https://www.rfc-editor.org/info/rfc2397/#)

**Referenced in:**

- [§ 3.7 Data URLs](#ref-for-index-term-data-url-scheme-1 "§ 3.7 Data URLs")

[Permalink](https://www.rfc-editor.org/info/rfc8089/#)

**Referenced in:**

- [§ 3.8 File URLs](#ref-for-index-term-file-url-scheme-1 "§ 3.8 File URLs")

[Permalink](https://www.w3.org/TR/SMIL3/smil-timing.html#q22)

**Referenced in:**

- [§ 9.3.2.2.8 The audio element](#ref-for-index-term-clock-value-1 "§ 9.3.2.2.8 The audio element") [(2)](#ref-for-index-term-clock-value-2 "Reference 2")
- [§ D.8.2 duration](#ref-for-index-term-clock-value-3 "§ D.8.2 duration")

[Permalink](https://www.w3.org/TR/SVG/render.html#TermRenderableElement)

**Referenced in:**

- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-renderable-elements-1 "§ 7.2.3 Restrictions on SVG")

[Permalink](https://www.w3.org/TR/SVG/struct.html#elementdef-svg)

**Referenced in:**

- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-svg-element-1 "§ 7.2.3 Restrictions on SVG")
- [§ 9.3.3.4 Associating style information](#ref-for-index-term-svg-element-2 "§ 9.3.3.4 Associating style information")

[Permalink](https://www.w3.org/TR/SVG/struct.html#elementdef-title)

**Referenced in:**

- [§ 7.2.3 Restrictions on SVG](#ref-for-index-term-title-element-1 "§ 7.2.3 Restrictions on SVG")

[Permalink](https://www.w3.org/TR/UAAG20/#gl-text-config)

**Referenced in:**

- [§ 6.3.1 Pre-paginated](#ref-for-index-term-guideline-1-4-provide-text-configuration-1 "§ 6.3.1 Pre-paginated")
- [§ 6.3.2 Roll](#ref-for-index-term-guideline-1-4-provide-text-configuration-2 "§ 6.3.2 Roll")

[Permalink](https://url.spec.whatwg.org/#absolute-url-string)

**Referenced in:**

- [§ 5.6.3.1.1 The dc:identifier element](#ref-for-index-term-absolute-url-string-1 "§ 5.6.3.1.1 The dc:identifier element")
- [§ 5.7.2 The item element](#ref-for-index-term-absolute-url-string-2 "§ 5.7.2 The item element")
- [§ 9.3.2.2.8 The audio element](#ref-for-index-term-absolute-url-string-3 "§ 9.3.2.2.8 The audio element")

[Permalink](https://url.spec.whatwg.org/#absolute-url-with-fragment-string)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-absolute-url-with-fragment-string-1 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](https://url.spec.whatwg.org/#concept-base-url)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-base-1 "§ 4.2.5 URLs in the OCF abstract container") [(2)](#ref-for-index-term-base-2 "Reference 2") [(3)](#ref-for-index-term-base-3 "Reference 3") [(4)](#ref-for-index-term-base-4 "Reference 4") [(5)](#ref-for-index-term-base-5 "Reference 5")
- [§ 4.2.6.2 Parsing URLs in the META-INF directory](#ref-for-index-term-base-6 "§ 4.2.6.2 Parsing URLs in the META-INF directory")

[Permalink](https://url.spec.whatwg.org/#concept-domain)

**Referenced in:**

- [§ 7.1.3.4 Custom attributes](#ref-for-index-term-domain-1 "§ 7.1.3.4 Custom attributes")

[Permalink](https://url.spec.whatwg.org/#double-dot-path-segment)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-double-dot-url-path-segments-1 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](https://url.spec.whatwg.org/#path-relative-scheme-less-url-string)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-path-relative-scheme-less-url-string-1 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 4.2.6.3.1.3 The rootfile element](#ref-for-index-term-path-relative-scheme-less-url-string-2 "§ 4.2.6.3.1.3 The rootfile element")
- [§ 4.2.6.3.1.5 The link element](#ref-for-index-term-path-relative-scheme-less-url-string-3 "§ 4.2.6.3.1.5 The link element")
- [§ 5.3.2 The compact URL data type](#ref-for-index-term-path-relative-scheme-less-url-string-4 "§ 5.3.2 The compact URL data type")
- [§ 5.4.6 The refines attribute](#ref-for-index-term-path-relative-scheme-less-url-string-5 "§ 5.4.6 The refines attribute")
- [§ 5.7.2 The item element](#ref-for-index-term-path-relative-scheme-less-url-string-6 "§ 5.7.2 The item element")
- [§ 9.3.2.2.4 The body element](#ref-for-index-term-path-relative-scheme-less-url-string-7 "§ 9.3.2.2.4 The body element")
- [§ 9.3.2.2.5 The seq element](#ref-for-index-term-path-relative-scheme-less-url-string-8 "§ 9.3.2.2.5 The seq element")
- [§ 9.3.2.2.7 The text element](#ref-for-index-term-path-relative-scheme-less-url-string-9 "§ 9.3.2.2.7 The text element")

[Permalink](https://url.spec.whatwg.org/#percent-encode)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-percent-encoded-1 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](https://url.spec.whatwg.org/#relative-url-string)

**Referenced in:**

- [§ 9.3.2.2.8 The audio element](#ref-for-index-term-relative-url-string-1 "§ 9.3.2.2.8 The audio element")

[Permalink](https://url.spec.whatwg.org/#relative-url-with-fragment-string)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-relative-url-with-fragment-strings-1 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](https://url.spec.whatwg.org/#concept-url)

**Referenced in:**

- [§ 1.4 Terminology](#ref-for-index-term-url-1 "§ 1.4 Terminology") [(2)](#ref-for-index-term-url-2 "Reference 2")
- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-url-3 "§ 4.2.5 URLs in the OCF abstract container")

[Permalink](https://url.spec.whatwg.org/#concept-url-parser)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-url-parser-1 "§ 4.2.5 URLs in the OCF abstract container") [(2)](#ref-for-index-term-url-parser-2 "Reference 2") [(3)](#ref-for-index-term-url-parser-3 "Reference 3") [(4)](#ref-for-index-term-url-parser-4 "Reference 4") [(5)](#ref-for-index-term-url-parser-5 "Reference 5") [(6)](#ref-for-index-term-url-parser-6 "Reference 6") [(7)](#ref-for-index-term-url-parser-7 "Reference 7")
- [§ 4.2.6.2 Parsing URLs in the META-INF directory](#ref-for-index-term-url-parser-8 "§ 4.2.6.2 Parsing URLs in the META-INF directory")
- [§ 5.2 Parsing URLs in the package document](#ref-for-index-term-url-parser-9 "§ 5.2 Parsing URLs in the package document")

[Permalink](https://url.spec.whatwg.org/#concept-url-serializer)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-url-serializer-1 "§ 4.2.5 URLs in the OCF abstract container") [(2)](#ref-for-index-term-url-serializer-2 "Reference 2")

[Permalink](https://url.spec.whatwg.org/#url-fragment-string)

**Referenced in:**

- [§ 4.2.5 URLs in the OCF abstract container](#ref-for-index-term-url-fragment-string-1 "§ 4.2.5 URLs in the OCF abstract container")
- [§ 5.4.6 The refines attribute](#ref-for-index-term-url-fragment-string-2 "§ 5.4.6 The refines attribute")
- [§ 9.3.2.2.4 The body element](#ref-for-index-term-url-fragment-string-3 "§ 9.3.2.2.4 The body element")
- [§ 9.3.2.2.5 The seq element](#ref-for-index-term-url-fragment-string-4 "§ 9.3.2.2.5 The seq element")
- [§ 9.3.2.2.7 The text element](#ref-for-index-term-url-fragment-string-5 "§ 9.3.2.2.7 The text element")
- [§ 9.3.3.2.2 Referencing document fragments](#ref-for-index-term-url-fragment-string-6 "§ 9.3.3.2.2 Referencing document fragments")

[Permalink](https://url.spec.whatwg.org/#valid-url-string)

**Referenced in:**

- [§ 5.4.2 The href attribute](#ref-for-index-term-valid-url-string-1 "§ 5.4.2 The href attribute")

[Permalink](https://www.w3.org/TR/xml/#sec-lang-tag)

**Referenced in:**

- [§ 5.4.7 The xml:lang attribute](#ref-for-index-term-2-12-language-identification-1 "§ 5.4.7 The xml:lang attribute")

[Permalink](https://www.w3.org/TR/xml/#dt-doctype)

**Referenced in:**

- [§ 3.9 XML conformance](#ref-for-index-term-document-type-declaration-1 "§ 3.9 XML conformance")
- [§ B. Allowed external identifiers](#ref-for-index-term-document-type-declaration-2 "§ B. Allowed external identifiers")

[Permalink](https://www.w3.org/TR/xml/#dt-extent)

**Referenced in:**

- [§ 3.9 XML conformance](#ref-for-index-term-external-entity-1 "§ 3.9 XML conformance")

[Permalink](https://www.w3.org/TR/xml/#NT-ExternalID)

**Referenced in:**

- [§ 3.9 XML conformance](#ref-for-index-term-external-identifier-1 "§ 3.9 XML conformance")

[Permalink](https://www.w3.org/TR/xml/#id)

**Referenced in:**

- [§ 3.5.1 Manifest fallbacks](#ref-for-index-term-id-1 "§ 3.5.1 Manifest fallbacks")
- [§ 5.4.3 The id attribute](#ref-for-index-term-id-2 "§ 5.4.3 The id attribute")
- [§ 5.4.6 The refines attribute](#ref-for-index-term-id-3 "§ 5.4.6 The refines attribute")
- [§ 5.8.2 The itemref element](#ref-for-index-term-id-4 "§ 5.8.2 The itemref element")
- [§ 9.3.2.2.1 The smil element](#ref-for-index-term-id-5 "§ 9.3.2.2.1 The smil element")
- [§ 9.3.2.2.4 The body element](#ref-for-index-term-id-6 "§ 9.3.2.2.4 The body element")
- [§ 9.3.2.2.5 The seq element](#ref-for-index-term-id-7 "§ 9.3.2.2.5 The seq element")
- [§ 9.3.2.2.6 The par element](#ref-for-index-term-id-8 "§ 9.3.2.2.6 The par element")
- [§ 9.3.2.2.7 The text element](#ref-for-index-term-id-9 "§ 9.3.2.2.7 The text element")
- [§ 9.3.2.2.8 The audio element](#ref-for-index-term-id-10 "§ 9.3.2.2.8 The audio element")
- [§ 9.3.3.5.1 Including media overlays](#ref-for-index-term-id-11 "§ 9.3.3.5.1 Including media overlays")

[Permalink](https://www.w3.org/TR/xml/#idref)

**Referenced in:**

- [§ 5.7.2 The item element](#ref-for-index-term-idref-1 "§ 5.7.2 The item element")
- [§ 5.8.1 The spine element](#ref-for-index-term-idref-2 "§ 5.8.1 The spine element")
- [§ 5.8.2 The itemref element](#ref-for-index-term-idref-3 "§ 5.8.2 The itemref element")

[Permalink](https://www.w3.org/TR/xml/#dt-pubid)

**Referenced in:**

- [§ B. Allowed external identifiers](#ref-for-index-term-public-1 "§ B. Allowed external identifiers")

[Permalink](https://www.w3.org/TR/xml/#dt-root)

**Referenced in:**

- [§ 4.2.6.3.1.1 The container element](#ref-for-index-term-root-element-1 "§ 4.2.6.3.1.1 The container element")
- [§ 4.2.6.3.2.1 The encryption element](#ref-for-index-term-root-element-2 "§ 4.2.6.3.2.1 The encryption element")
- [§ 4.2.6.3.4 Metadata file (metadata.xml)](#ref-for-index-term-root-element-3 "§ 4.2.6.3.4 Metadata file (metadata.xml)")
- [§ 4.2.6.3.6.1 The signatures element](#ref-for-index-term-root-element-4 "§ 4.2.6.3.6.1 The signatures element")
- [§ 5.3.4 The prefix attribute](#ref-for-index-term-root-element-5 "§ 5.3.4 The prefix attribute")
- [§ 5.5 The package element](#ref-for-index-term-root-element-6 "§ 5.5 The package element")
- [§ 9.3.2.2.1 The smil element](#ref-for-index-term-root-element-7 "§ 9.3.2.2.1 The smil element")

[Permalink](https://www.w3.org/TR/xml/#dt-sysid)

**Referenced in:**

- [§ B. Allowed external identifiers](#ref-for-index-term-system-identifiers-1 "§ B. Allowed external identifiers")

[Permalink](https://www.w3.org/TR/xml/#AVNormalize)

**Referenced in:**

- [§ C.2 Syntax](#ref-for-index-term-whitespace-normalization-1 "§ C.2 Syntax") [(2)](#ref-for-index-term-whitespace-normalization-2 "Reference 2") [(3)](#ref-for-index-term-whitespace-normalization-3 "Reference 3")

[Permalink](https://www.w3.org/TR/xml/#NT-S)

**Referenced in:**

- [§ 7.4.3.2 Syntax](#ref-for-index-term-whitespace-separated-1 "§ 7.4.3.2 Syntax")
- [§ C.2 Syntax](#ref-for-index-term-whitespace-separated-2 "§ C.2 Syntax")

[Permalink](https://www.w3.org/TR/xml-names/#Conformance)

**Referenced in:**

- [§ 3.9 XML conformance](#ref-for-index-term-conformance-of-documents-1 "§ 3.9 XML conformance")

[Permalink](https://www.w3.org/TR/xml-names/#NT-Prefix)

**Referenced in:**

- [§ 7.1.3.4 Custom attributes](#ref-for-index-term-prefixed-1 "§ 7.1.3.4 Custom attributes")

[Permalink](https://www.w3.org/TR/xmldsig-core/#sec-EnvelopedSignature)

**Referenced in:**

- [§ 4.2.6.3.6.1 The signatures element](#ref-for-index-term-section-6-6-4-1 "§ 4.2.6.3.6.1 The signatures element")

[Permalink](https://www.w3.org/TR/xmldsig-core1/#sec-Overview)

**Referenced in:**

- [§ 4.2.6.3.6.1 The signatures element](#ref-for-index-term-section-2-1 "§ 4.2.6.3.6.1 The signatures element")

[Permalink](https://www.w3.org/TR/xmlenc-core1/#sec-eg-Symmetric-Key)

**Referenced in:**

- [§ 4.2.6.3.2.1 The encryption element](#ref-for-index-term-section-2-2-1-1 "§ 4.2.6.3.2.1 The encryption element")
