[![W3C](https://www.w3.org/StyleSheets/TR/2021/logos/W3C)](https://www.w3.org/)

# EPUB 3 Structural Semantics Vocabulary 1.1

[W3C Group Note](https://www.w3.org/standards/types#NOTE) 28 May 2026

More details about this document

This version:  
[https://www.w3.org/TR/2026/NOTE-epub-ssv-11-20260528/](https://www.w3.org/TR/2026/NOTE-epub-ssv-11-20260528/)

Latest published version:  
<https://www.w3.org/TR/epub-ssv-11/>

Latest editor's draft:  
<https://w3c.github.io/epub-specs/wg-notes/ssv/>

History:  
<https://www.w3.org/standards/history/epub-ssv-11/>

[Commit history](https://github.com/w3c/epub-specs/commits/main)

Editors:  
[Ivan Herman](https://www.w3.org/People/Ivan/)[![](data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld2JveD0iMCAwIDI1NiAyNTYiPgogICAgPHN0eWxlPgoKICAgICAgLnN0MSB7CiAgICAgICAgZmlsbDogI2ZmZjsKICAgICAgfQogICAgCjwvc3R5bGU+CiAgICA8cGF0aCBkPSJNMjU2IDEyOGMwIDcwLjctNTcuMyAxMjgtMTI4IDEyOFMwIDE5OC43IDAgMTI4IDU3LjMgMCAxMjggMHMxMjggNTcuMyAxMjggMTI4eiIgZmlsbD0iI2E2Y2UzOSIgLz4KICAgIDxwYXRoIGNsYXNzPSJzdDEiIGQ9Ik04Ni4zIDE4Ni4ySDcwLjlWNzkuMWgxNS40djEwNy4xek0xMDguOSA3OS4xaDQxLjZjMzkuNiAwIDU3IDI4LjMgNTcgNTMuNiAwIDI3LjUtMjEuNSA1My42LTU2LjggNTMuNmgtNDEuOFY3OS4xem0xNS40IDkzLjNoMjQuNWMzNC45IDAgNDIuOS0yNi41IDQyLjktMzkuN0MxOTEuNyAxMTEuMiAxNzggOTMgMTQ4IDkzaC0yMy43djc5LjR6TTg4LjcgNTYuOGMwIDUuNS00LjUgMTAuMS0xMC4xIDEwLjFzLTEwLjEtNC42LTEwLjEtMTAuMWMwLTUuNiA0LjUtMTAuMSAxMC4xLTEwLjFzMTAuMSA0LjYgMTAuMSAxMC4xeiIgLz4KICA8L3N2Zz4=)](https://orcid.org/0000-0003-0782-2704) ([W3C](https://www.w3.org))

Matt Garrish ([DAISY Consortium](https://daisy.org))

Former editors:  
Tzviya Siegman ([John Wiley & Sons](http://wiley.com))

Markus Gylling ([International Digital Publishing Forum (IDPF)](http://idpf.org))

Feedback:  
[GitHub w3c/epub-specs](https://github.com/w3c/epub-specs/) ([pull requests](https://github.com/w3c/epub-specs/pulls/), [new issue](https://github.com/w3c/epub-specs/issues/new/choose), [open issues](https://github.com/w3c/epub-specs/issues/))

[public-pm-wg@w3.org](mailto:public-pm-wg@w3.org?subject=%5Bepub-ssv-11%5D%20YOUR%20TOPIC%20HERE) with subject line \[epub-ssv-11\] *… message topic …* ([archives](https://lists.w3.org/Archives/Public/public-pm-wg))

[Copyright](https://www.w3.org/policies/#copyright) © 1999-2026 [International Digital Publishing Forum](https://www.idpf.org) and [World Wide Web Consortium](https://www.w3.org/). W3C^(®) [liability](https://www.w3.org/policies/#Legal_Disclaimer), [trademark](https://www.w3.org/policies/#W3C_Trademarks) and [permissive document license](https://www.w3.org/copyright/software-license-2023/ "W3C Software and Document Notice and License") rules apply.

------------------------------------------------------------------------

## Abstract

This vocabulary, a part of EPUB® 3, defines a set of properties relating to the description of structural semantics of written works.

## Status of This Document

*This section describes the status of this document at the time of its publication. A list of current W3C publications and the latest revision of this technical report can be found in the [W3C standards and drafts index](https://www.w3.org/TR/).*

This document was published by the [Publishing Maintenance Working Group](https://www.w3.org/groups/wg/pm) as a Group Note using the [Note track](https://www.w3.org/policies/process/20250818/#recs-and-notes).

This Group Note is endorsed by the [Publishing Maintenance Working Group](https://www.w3.org/groups/wg/pm), but is not endorsed by W3C itself nor its Members.

The [W3C Patent Policy](https://www.w3.org/policies/patent-policy/) does not carry any licensing requirements or commitments on this document.

This document is governed by the [18 August 2025 W3C Process Document](https://www.w3.org/policies/process/20250818/).

## Table of Contents

1.  [Abstract](#abstract)
2.  [Status of This Document](#sotd)
3.  [1. Introduction](#sec-introduction)
    1.  [1.1 About this vocabulary](#structure-vocab)
4.  [2. Document partitions](#sec-partitions)
5.  [3. Document divisions](#sec-divisions)
6.  [4. Document sections and components](#sec-sections)
7.  [5. Document navigation](#sec-navigation)
8.  [6. Document reference sections](#sec-document-references)
    1.  [6.1 Bibliographies](#h_bibliographies)
    2.  [6.2 Dictionaries](#dictionaries)
    3.  [6.3 Glossaries](#h_glossaries)
    4.  [6.4 Indexes](#h_indexes)
9.  [7. Preliminary sections and components](#sec-preliminary)
10. [8. Complementary content](#sec-complementary)
11. [9. Titles and headings](#sec-titles)
12. [10. Educational content](#sec-educational)
    1.  [10.1 Learning objectives](#h_learning-obj)
    2.  [10.2 Testing](#h_testing)
13. [11. Comics](#sec-comics)
14. [12. Notes and annotations](#notes)
15. [13. References](#links)
16. [14. Document text](#document-text)
17. [15. Pagination](#sec-pagination)
18. [16. Tables](#sec-tables)
19. [17. Lists](#sec-lists)
20. [18. Figures](#sec-figures)
21. [19. Asides](#sec-asides)
22. [A. Deprecated terms](#deprecated-terms)
23. [B. Change log](#change-log)
24. [C. References](#references)
    1.  [C.1 Informative references](#informative-references)

## 1. Introduction

[](#sec-introduction)

Structural semantics add additional meaning about the specific structural purpose an HTML (or SVG) element plays. The [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) attribute \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is used to express domain-specific semantics in [EPUB content documents](https://www.w3.org/TR/epub-33/#dfn-epub-content-document) and [media overlay documents](https://www.w3.org/TR/epub-33/#dfn-media-overlay-document) \[[epub-33](#bib-epub-33 "EPUB 3.3")\], with the structural information it carries complementing the underlying vocabulary.

The applied semantics refine the meaning of their containing elements without changing their nature for assistive technologies, as happens when using the similar [`role`](https://html.spec.whatwg.org/multipage/infrastructure.html#attr-aria-role) attribute \[[html](#bib-html "HTML Standard")\]. The attribute does not enhance the accessibility of the content, in other words, only provides hints about the purpose.

Semantic metadata enriches content for use in publishing workflows and for author-defined purposes. It also allows reading systems to learn more about the structure and content of a document (e.g., to enable [skippability and escapability](https://www.w3.org/TR/epub-33/#sec-behaviors-skip-escape) in [media overlay documents](https://www.w3.org/TR/epub-33/#dfn-media-overlay-document)).

The \[[epub-33](#bib-epub-33 "EPUB 3.3")\] specification defines a method for adding structural semantics using *the attribute axis*: instead of adding new elements, EPUB creators can append the `epub:type` attribute to existing elements to add the desired semantics. This document defines a set of property values, i.e., a vocabulary, that can be used for that purpose.

### 1.1 About this vocabulary

[](#structure-vocab)

While the EPUB Structural Semantics vocabulary is generally host language agnostic, it has been constructed primarily to enable semantic inflection of elements in the HTML vocabulary.

The *HTML usage context* fields indicate contexts in HTML documents where the given property is considered relevant. EPUB creators may use the properties on HTML markup elements not specifically listed, but must ensure that the semantics they express represent a subset of the carrying element's semantics and do not attach an existing element's meaning to a semantically neutral element.

The *DPUB-ARIA role* fields indicate the \[[dpub-aria-1.1](#bib-dpub-aria-1-1 "Digital Publishing WAI-ARIA Module 1.1")\] roles that can alternatively be used with the \[[html](#bib-html "HTML Standard")\] `role` attribute to improve accessibility. These roles may have more restrictive usage contexts, however, so may not be valid wherever the [`epub:type`](https://www.w3.org/TR/epub-33/#dfn-epub-type) attribute \[[epub-33](#bib-epub-33 "EPUB 3.3")\] is used (e.g., roles are not allowed on the \[[html](#bib-html "HTML Standard")\] [`body`](https://html.spec.whatwg.org/multipage/sections.html#the-body-element) element). Refer to \[[html-aria](#bib-html-aria "ARIA in HTML")\] for more information about where the roles are allowed.

When processing HTML documents, reading systems may ignore such non-compliant properties, unless their usage context is explicitly overridden or extended by the host specification.

The *Usage details* field, when present, identifies a specification that defines or utilizes the designated property. Authors are only required to follow these usage details if they are creating content that conforms to the specified specification, or if the rules apply to all EPUB publications. In all other cases, the properties may be used however needed.

Note

This vocabulary previously contained draft terms from the [EDUPUB structural semantics vocabulary](https://docs.google.com/document/d/1_Tzeq5xwdwLhSdaHStvAthhOFu9UuT8yFmK787yw420/edit?tab=t.0#heading=h.a39j7klhkr87). Although those terms will remain available for experimental use in [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication), [EPUB creators](https://www.w3.org/TR/epub-33/#dfn-epub-creator) should consider that the work on EDUPUB has been abandoned and the likelihood of adoption of any additional terms from that work is low.

## 2. Document partitions

[](#sec-partitions)

backmatter  
Ancillary material occurring after the main content of a publication, such as indices, appendices, etc.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

bodymatter  
The main content of a publication.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

cover  
A section that introduces the work, often consisting of a marketing image, the title, author, and publisher, and select quotes and reviews.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

DPUB-ARIA role: [doc-cover](https://www.w3.org/TR/dpub-aria-1.1/#doc-cover) (only allowed on cover image tag)

frontmatter  
Preliminary material to the main content of a publication, such as tables of contents, dedications, etc.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

## 3. Document divisions

[](#sec-divisions)

chapter  
A major thematic section of content in a work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

DPUB-ARIA role: [doc-chapter](https://www.w3.org/TR/dpub-aria-1.1/#doc-chapter)

division  
A major structural division that may also appear as a substructure of a part (esp. in legislation).

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

part  
A major structural division in a work that contains a set of related sections dealing with a particular subject, narrative arc, or similar encapsulated theme.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

DPUB-ARIA role: [doc-part](https://www.w3.org/TR/dpub-aria-1.1/#doc-part)

volume  
A component of a collection.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

## 4. Document sections and components

[](#sec-sections)

Sections and components that typically occur in the publication bodymatter.

abstract  
A short summary of the principle ideas, concepts, and conclusions of the work, or of a section or excerpt within it.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-abstract](https://www.w3.org/TR/dpub-aria-1.1/#doc-abstract)

afterword  
A closing statement from the author or a person of importance, typically providing insight into how the content came to be written, its significance, or related events that have transpired since its timeline.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-afterword](https://www.w3.org/TR/dpub-aria-1.1/#doc-afterword)

conclusion  
A concluding section or statement that summarizes the work or wraps up the narrative.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-conclusion](https://www.w3.org/TR/dpub-aria-1.1/#doc-conclusion)

epigraph  
A quotation set at the start of the work or a section that establishes the theme or sets the mood.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-epigraph](https://www.w3.org/TR/dpub-aria-1.1/#doc-epigraph)

epilogue  
A concluding section of narrative that wraps up or comments on the actions and events of the work, typically from a future perspective.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-epilogue](https://www.w3.org/TR/dpub-aria-1.1/#doc-epilogue)

foreword  
An introductory section that precedes the work, typically not written by the author of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-foreword](https://www.w3.org/TR/dpub-aria-1.1/#doc-foreword)

introduction  
A preliminary section that typically introduces the scope or nature of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-introduction](https://www.w3.org/TR/dpub-aria-1.1/#doc-introduction)

preamble  
A section in the beginning of the work, typically containing introductory and/or explanatory prose regarding the scope or nature of the work's content

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

preface  
An introductory section that precedes the work, typically written by the author of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-preface](https://www.w3.org/TR/dpub-aria-1.1/#doc-preface)

prologue  
An introductory section that sets the background to a work, typically part of the narrative.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-prologue](https://www.w3.org/TR/dpub-aria-1.1/#doc-prologue)

## 5. Document navigation

[](#sec-navigation)

landmarks  
A collection of references to well-known/recurring components within the publication

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

Usage details: [The `landmarks nav` Element](https://www.w3.org/TR/epub-33/#sec-nav-landmarks) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

loa  
A listing of audio clips included in the work.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

loi  
A listing of illustrations included in the work.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

lot  
A listing of tables included in the work.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

lov  
A listing of video clips included in the work.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

toc  
A navigational aid that provides an ordered list of links to the major sectional headings in the content. A table of contents may cover an entire work, or only a smaller section of it.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-toc](https://www.w3.org/TR/dpub-aria-1.1/#doc-toc)

Usage details: [The `toc nav` Element](https://www.w3.org/TR/epub-33/#sec-nav-toc) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

## 6. Document reference sections

[](#sec-document-references)

appendix  
A section of supplemental information located after the primary content that informs the content but is not central to it.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-appendix](https://www.w3.org/TR/dpub-aria-1.1/#doc-appendix)

colophon  
A short section of production notes particular to the edition (e.g., describing the typeface used), often located at the end of a work.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-colophon](https://www.w3.org/TR/dpub-aria-1.1/#doc-colophon)

credits  
A collection of [credits](#credit).

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-credits](https://www.w3.org/TR/dpub-aria-1.1/#doc-credits)

### 6.1 Bibliographies

[](#h_bibliographies)

bibliography  
A list of external references cited in the work, which may be to print or digital sources.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-bibliography](https://www.w3.org/TR/dpub-aria-1.1/#doc-bibliography)

### 6.2 Dictionaries

[](#dictionaries)

antonym-group  
A group of terms, each having an opposite or nearly opposite meaning from a headword or idiom.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Antonym Groups](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.9.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

condensed-entry  
A condensed dictionary entry designed for constrained lookup viewports.

Required parent context: [dictentry](#dictentry)

HTML usage context: [aside](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element)

Usage details: [The Condensed Entry](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.2.2.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

def  
The definition of a particular meaning of a headword or idiom.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Definitions](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.6) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

dictentry  
A dictionary entry.

Required parent context: [dictionary](#dictionary)

HTML usage context: [article](https://html.spec.whatwg.org/multipage/sections.html#the-article-element)

Usage details: [The Dictionary Entry](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.2.1) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

dictionary  
A collection of dictionary entries.

HTML usage context: [body](https://html.spec.whatwg.org/multipage/#the-body-element) or [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element)

Usage details: [The Dictionary Container](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.1) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

etymology  
An explanation of the historical origin of a headword.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Etymologies](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.6) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

example  
An illustration of the usage of a defined term or phrase.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Examples](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.8.3) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

gram-info  
Supplemental grammatical information related to the headword and modifying a part of speech or a particular meaning.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Related Grammatical Information](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.5.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

idiom  
A defining instance of a phrase.

Required parent context: [dictentry](#dictentry) or [phrase-group](#phrase-group)

HTML usage context: [dfn](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-dfn-element)

Usage details: [Idioms](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.8.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

part-of-speech  
The grammatical function of a headword.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [The Dictionary Container](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.1) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

part-of-speech-list  
A list of part of speech groups in a dictionary entry.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [ol](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element)

Usage details: [Part of Speech Lists](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

part-of-speech-group  
A unit that associates a part of speech with its related sense and phrase groups.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Part of Speech Groups](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.3) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

phonetic-transcription  
A phonetic transcription of the pronunciation of a headword or other component of a dictionary entry.

Required ancestor context: [dictentry](#dictentry) or [glossary](#glossary)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Phonetic Transcriptions](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.4) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

phrase-list  
A list of phrase groups in a dictionary entry.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [ol](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element) or [ul](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ul-element)

Usage details: [Phrase Lists](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.8.4) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

phrase-group  
A unit for organizing information pertaining to an idiom or example.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Phrase Groups](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.8.5) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

sense-list  
A list of sense groups in a dictionary entry.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [ol](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element)

Usage details: [Sense Lists](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.4) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

sense-group  
A unit for organizing information pertaining to a particular meaning of a headword or idiom.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Sense Groups](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.5) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

synonym-group  
A group of terms, each having identical or similar meaning to a headword or idiom.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Synonym Groups](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.9.1) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

tran  
The translation of a particular meaning of a source language headword, idiom, or example into a target language.

Required ancestor context: [dictentry](#dictentry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Translations](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.7) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

tran-info  
Grammatical or usage information related to a translation.

Required ancestor context: [tran](#tran)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [Translation-Related Information](http://idpf.org/epub/dict/epub-dict.html#sec-2.2.7.8) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

### 6.3 Glossaries

[](#h_glossaries)

glossary  
A brief dictionary of new, uncommon, or specialized terms used in the content.

HTML usage context: [dl](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element), [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-glossary](https://www.w3.org/TR/dpub-aria-1.1/#doc-glossary)

Usage details: [The Glossary Container](http://idpf.org/epub/dict/epub-dict.html#sec-2.3.1) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

glossdef  
The definition of a [term in a glossary](#glossterm).

Required parent context: [glossary](#glossary)

HTML usage context: The glossdef property is implied on [dd](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dd-element) elements within a [dl](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element) element marked with the [glossary](#glossary) property.

Usage details: [Glossary Terms and Definitions](http://idpf.org/epub/dict/epub-dict.html#sec-2.3.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

glossterm  
A glossary term.

Required parent context: [glossary](#glossary)

HTML usage context: The glossterm property is implied on [dt](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dt-element) elements within a [dl](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element) element marked with the [glossary](#glossary) property.

Usage details: [Glossary Terms and Definitions](http://idpf.org/epub/dict/epub-dict.html#sec-2.3.2) \[[epub-dict-10](#bib-epub-dict-10 "EPUB Dictionaries and Glossaries 1.0")\]

### 6.4 Indexes

[](#h_indexes)

index  
A navigational aid that provides a detailed list of links to key subjects, names and other important topics covered in the work.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2), [body](https://html.spec.whatwg.org/multipage/#the-body-element)

Usage details: [index property](http://idpf.org/epub/idx/epub-indexes.html#bb-index) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

DPUB-ARIA role: [doc-index](https://www.w3.org/TR/dpub-aria-1.1/#doc-index)

index-editor-note  
Editorial note pertaining to a single entry.

Required parent context: [index-entry](#index-entry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [index-editor-note property](http://idpf.org/epub/idx/epub-indexes.html#bb-editor-note) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-entry  
One term with any attendant subentries, locators, cross references, and/or editorial note.

Required parent context: [index-entry-list](#index-entry-list)

HTML usage context: [li](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element); this property is implied when parent ul is of type index-entry-list (implicit or explicit)

Usage details: [index-entry property](http://idpf.org/epub/idx/epub-indexes.html#bb-entry) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-entry-list  
Collection of consecutive main entries or subentries.

Required parent context: [index-entry](#index-entry) , [index-group](#index-group), and [index](#index)

HTML usage context: [ul](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ul-element); this property is implied when the ul has an ancestor of index except within index-headnotes

Usage details: [index-entry-list property](http://idpf.org/epub/idx/epub-indexes.html#bb-entry-list) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-group  
Collection of consecutive main entries that share a common characteristic, for example the starting letter of the main entries.

Required parent context: [index](#index)

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

Usage details: [index-group property](http://idpf.org/epub/idx/epub-indexes.html#bb-group) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-headnotes  
Narrative or other content to assist users in using the index.

Required parent context: [index](#index)

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2), [header](https://html.spec.whatwg.org/multipage/#the-header-element)

Usage details: [index-headnotes property](http://idpf.org/epub/idx/epub-indexes.html#bb-headnotes) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-legend  
List of symbols, abbreviations or special formatting used in the index, and their meanings.

Required parent context: [index-headnotes](#index-headnotes)

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2), [dl](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element)

Usage details: [index-legend property](http://idpf.org/epub/idx/epub-indexes.html#bb-legend) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-locator  
A reference to an occurrence of the indexed content in the publication.

Required parent context: [index-entry](#index-entry) , [index-locator-list](#index-locator-list) , and [index-locator-range](#index-locator-range)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element); this property is implied when parent context is index-locator-list or index-locator-range

Usage details: [index-locator property](http://idpf.org/epub/idx/epub-indexes.html#bb-locator) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-locator-list  
Collection of sequential locators or locator ranges.

Required parent context: [index-entry](#index-entry)

HTML usage context: [ul](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ul-element)

Usage details: [index-locator-list property](http://idpf.org/epub/idx/epub-indexes.html#bb-locator-list) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-locator-range  
A pair of locators that connects a term to a range of content rather than a single point.

Required parent context: [index-locator-list](#index-locator-list) and [index-entry](#index-entry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [index-locator-range property](http://idpf.org/epub/idx/epub-indexes.html#bb-locator-range) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-term  
Word, phrase, string, glyph, or image representing the indexable content.

Required parent context: [index-xref-related](#index-xref-related) , [index-entry](#index-entry) and [index-xref-preferred](#index-xref-preferred)

HTML usage context: [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2); typically [span](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-span-element)

Usage details: [index-term property](http://idpf.org/epub/idx/epub-indexes.html#bb-term) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-term-categories  
Wrapper for a list of the term categories belonging to an index.

Required parent context: [index-xref-related](#index-xref-related) and [index-xref-preferred](#index-xref-preferred)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

Usage details: [index-term-categories property](http://idpf.org/epub/idx/epub-indexes.html#bb-term-categories) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-term-category  
Word, phrase, string, glyph, or image representing a category of terms in the index.

Required parent context: [index-xref-related](#index-xref-related) and [index-xref-preferred](#index-xref-preferred)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

Usage details: [index-term-category property](http://idpf.org/epub/idx/epub-indexes.html#bb-term-category) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-xref-preferred  
Reference from one term to one or more preferred terms or term categories in an index (analogous to "See xxx").

Required parent context: [index-entry](#index-entry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [index-xref-preferred property](http://idpf.org/epub/idx/epub-indexes.html#bb-xref) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

index-xref-related  
Reference from one term to one or more related terms or term categories in an index (analogous to "See also xxx").

Required parent context: [index-entry](#index-entry)

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

Usage details: [index-xref-related property](http://idpf.org/epub/idx/epub-indexes.html#bb-xref) \[[epub-indexes-10](#bib-epub-indexes-10 "EPUB Indexes 1.0")\]

## 7. Preliminary sections and components

[](#sec-preliminary)

Preliminary sections and components, typically occurring in the publication frontmatter.

acknowledgments  
A section or statement that acknowledges significant contributions by persons, organizations, governments, and other entities to the realization of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-acknowledgments](https://www.w3.org/TR/dpub-aria-1.1/#doc-acknowledgments)

contributors  
A list of contributors to the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

copyright-page  
The copyright page of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

dedication  
An inscription at the front of the work, typically addressed in tribute to one or more persons close to the author.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-dedication](https://www.w3.org/TR/dpub-aria-1.1/#doc-dedication)

errata  
A set of corrections discovered after initial publication of the work, sometimes referred to as corrigenda.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [aside](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-errata](https://www.w3.org/TR/dpub-aria-1.1/#doc-errata)

halftitlepage  
The half title page of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

imprimatur  
A formal statement authorizing the publication of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

imprint  
Information relating to the publication or distribution of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

other-credits  
Acknowledgments of previously published parts of the work, illustration credits, and permission to quote from copyrighted material.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

revision-history  
A record of changes made to a work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

titlepage  
The title page of the work.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

## 8. Complementary content

[](#sec-complementary)

notice  
Notifies the user of consequences that might arise from an action or event. Examples include warnings, cautions and dangers.

HTML usage context: [section](https://html.spec.whatwg.org/multipage/sections.html#the-section-element), [grouping content](https://html.spec.whatwg.org/multipage/#grouping-content)

DPUB-ARIA role: [doc-notice](https://www.w3.org/TR/dpub-aria-1.1/#doc-notice)

pullquote  
A distinctively placed or highlighted quotation from the current content designed to draw attention to a topic or highlight a key point.

Inherits from: [xhv:complementary](https://www.w3.org/1999/xhtml/vocab/#complementary)

HTML usage context: [aside](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element)

DPUB-ARIA role: [doc-pullquote](https://www.w3.org/TR/dpub-aria-1.1/#doc-pullquote)

tip  
Helpful information that clarifies some aspect of the content or assists in its comprehension.

Inherits from: [xhv:complementary](https://www.w3.org/1999/xhtml/vocab/#complementary)

HTML usage context: [aside](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element), [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

DPUB-ARIA role: [doc-tip](https://www.w3.org/TR/dpub-aria-1.1/#doc-tip)

## 9. Titles and headings

[](#sec-titles)

covertitle  
The title of the work as displayed on the work's cover.

Inherits from: [title](#doc-title)

HTML usage context: [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2). This property should only appear once within the document scope.

fulltitle  
The full title of the work, either simple, in which case it is identical to [title](#doc-title), or compound, in which case it consists of a [title](#doc-title) and a [subtitle](#subtitle).

Inherits from: [title](#doc-title)

Same as: <http://purl.org/dc/terms/title>

HTML usage context: [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2). This property should only appear once within the document scope.

halftitle  
The title appearing on the first page of a work or immediately before the text.

Inherits from: [title](#doc-title)

HTML usage context: [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2). This property should only appear once within the document scope.

subtitle  
An explanatory or alternate title for the work, or a section or component within it.

Inherits from: [title](#doc-title)

HTML usage context: [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2), [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2) descendants of [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2), [paragraphs](https://html.spec.whatwg.org/multipage/grouping-content.html#the-p-element), [divs](https://html.spec.whatwg.org/multipage/grouping-content.html#the-div-element)

DPUB-ARIA role: [doc-subtitle](https://www.w3.org/TR/dpub-aria-1.1/#doc-subtitle)

title  
The primary name of a document component, such as a list, table, or figure.

HTML usage context: [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2), [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2) descendants of [heading content](https://html.spec.whatwg.org/multipage/dom.html#heading-content-2).

## 10. Educational content

[](#sec-educational)

### 10.1 Learning objectives

[](#h_learning-obj)

learning-objective  
An explicit designation or description of a learning objective or a reference to an explicit learning objective.

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2), [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

learning-resource  
A resource provided to enhance learning, or a reference to such a resource.

HTML usage context: [flow content](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2)

### 10.2 Testing

[](#h_testing)

assessment  
A test, quiz, or other activity that helps measure a student's understanding of what is being taught.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

qna  
A section of content structured as a series of questions and answers, such as an interview or list of frequently asked questions.

HTML usage context: lists or [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-qna](https://www.w3.org/TR/dpub-aria-1.1/#doc-qna)

## 11. Comics

[](#sec-comics)

balloon  
An area in a comic [panel](#panel) that contains the words, spoken or thought, of a character.

HTML usage context: [li](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)

Usage details: [EPUB Region-Based Navigation](http://idpf.org/epub/renditions/region-nav) \[[epub-region-nav-10](#bib-epub-region-nav-10 "EPUB Region-Based Navigation 1.0")\]

panel  
An individual frame, or drawing.

HTML usage context: [li](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)

Usage details: [EPUB Region-Based Navigation](http://idpf.org/epub/renditions/region-nav) \[[epub-region-nav-10](#bib-epub-region-nav-10 "EPUB Region-Based Navigation 1.0")\]

panel-group  
A group of [panels](#panel) (e.g., a strip).

HTML usage context: [li](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)

Usage details: [EPUB Region-Based Navigation](http://idpf.org/epub/renditions/region-nav) \[[epub-region-nav-10](#bib-epub-region-nav-10 "EPUB Region-Based Navigation 1.0")\]

sound-area  
An area of text in a comic [panel](#panel) that represents a sound.

HTML usage context: [li](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)

Usage details: [EPUB Region-Based Navigation](http://idpf.org/epub/renditions/region-nav) \[[epub-region-nav-10](#bib-epub-region-nav-10 "EPUB Region-Based Navigation 1.0")\]

text-area  
An area of text in a comic [panel](#panel). Used to represent titles, narrative text, character dialogue (inside a [balloon](#balloon) or not) and similar.

HTML usage context: [li](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element)

Usage details: [EPUB Region-Based Navigation](http://idpf.org/epub/renditions/region-nav) \[[epub-region-nav-10](#bib-epub-region-nav-10 "EPUB Region-Based Navigation 1.0")\]

## 12. Notes and annotations

[](#notes)

endnotes  
A collection of notes at the end of a work or a section within it.

See also: [endnote](#endnote)

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-endnotes](https://www.w3.org/TR/dpub-aria-1.1/#doc-endnotes)

footnote  
Ancillary information, such as a citation or commentary, that provides additional context to a referenced passage of text.

See also: [footnotes](#footnotes)

HTML usage context: On the [aside](https://html.spec.whatwg.org/multipage/#the-aside-element) element when identifying a single footnote, or on descendants of sectioning content when identifying individual footnotes in a group (refer to [footnotes](#footnotes) and [endnotes](#endnotes)).

DPUB-ARIA role: [doc-footnote](https://www.w3.org/TR/dpub-aria-1.1/#doc-footnote)

footnotes  
A collection of [footnotes](#footnote).

See also: [footnote](#footnote)

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

## 13. References

[](#links)

backlink  
A link that allows the user to return to a related location in the content (e.g., from a [footnote](#footnote) to its reference or from a [glossary definition](#glossdef) to where a [term](#glossterm) is used).

Inherits from: [xhv:link](https://www.w3.org/1999/xhtml/vocab/#link)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

DPUB-ARIA role: [doc-backlink](https://www.w3.org/TR/dpub-aria-1.1/#doc-backlink)

biblioref  
A reference to a [bibliography entry](#biblioentry).

Inherits from: [xhv:link](https://www.w3.org/1999/xhtml/vocab/#link)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

DPUB-ARIA role: [doc-biblioref](https://www.w3.org/TR/dpub-aria-1.1/#doc-biblioref)

glossref  
A reference to a [glossary definition](#glossdef).

Inherits from: [xhv:link](https://www.w3.org/1999/xhtml/vocab/#link)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

DPUB-ARIA role: [doc-glossref](https://www.w3.org/TR/dpub-aria-1.1/#doc-glossref)

noteref  
A reference to a note, typically appearing as a superscripted number or symbol in the main body of text.

Inherits from: [xhv:link](https://www.w3.org/1999/xhtml/vocab/#link)

See also: [note](#note)

HTML usage context: [a](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-a-element)

DPUB-ARIA role: [doc-noteref](https://www.w3.org/TR/dpub-aria-1.1/#doc-noteref)

## 14. Document text

[](#document-text)

Terms for describing components at the phrasing level.

concluding-sentence  
A phrase or sentence serving as a concluding summary of the containing paragraph.

HTML usage context: [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

credit  
An acknowledgment of the source of integrated content from third-party sources, such as photos. Typically identifies the creator, copyright, and any restrictions on reuse.

HTML usage context: [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

DPUB-ARIA role: [doc-credit](https://www.w3.org/TR/dpub-aria-1.1/#doc-credit)

keyword  
A key word or phrase.

HTML usage context: [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

topic-sentence  
A phrase or sentence serving as an introductory summary of the containing paragraph.

HTML usage context: [phrasing content](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2)

## 15. Pagination

[](#sec-pagination)

page-list  
A navigational aid that provides a list of links to the [pagebreaks](#pagebreak) in the content.

HTML usage context: [sectioning content](https://html.spec.whatwg.org/multipage/dom.html#sectioning-content-2)

DPUB-ARIA role: [doc-pagelist](https://www.w3.org/TR/dpub-aria-1.1/#doc-pagelist)

Usage details: [The `page-list nav` Element](https://www.w3.org/TR/epub-33/#sec-nav-pagelist) \[[epub-33](#bib-epub-33 "EPUB 3.3")\]

pagebreak  
A separator denoting the position before which a break occurs between two contiguous pages in a statically paginated version of the content.

Page break locators are also commonly used to provide static markers in purely digital publications (i.e., where no statically paginated equivalent exists). These markers provide consistent navigation regardless of differences in font and screen size that can otherwise affect the dynamic pagination of the content.

EPUB creators must ensure the name of the page break is an end user-consumable page number that identifies the page that is beginning.

HTML usage context: [phrasing](https://html.spec.whatwg.org/multipage/dom.html#phrasing-content-2) and [flow](https://html.spec.whatwg.org/multipage/dom.html#flow-content-2) content, where the value of the carrying elements title attribute takes precedence over element content for the purposes of representing the pagebreak value

DPUB-ARIA role: [doc-pagebreak](https://www.w3.org/TR/dpub-aria-1.1/#doc-pagebreak)

## 16. Tables

[](#sec-tables)

table  
A structure containing data or content laid out in tabular form.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable table structure.

table-row  
A row of data or content in a tabular structure.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable table row.

table-cell  
A single cell of tabular data or content.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable table cell.

## 17. Lists

[](#sec-lists)

list  
A structure that contains an enumeration of related content items.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable list structure.

list-item  
A single item in an enumeration.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable list item.

## 18. Figures

[](#sec-figures)

figure  
An illustration, diagram, photo, code listing or similar, referenced from the text of a work, and typically annotated with a title, caption and/or credits.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable figure.

## 19. Asides

[](#sec-asides)

aside  
Secondary or supplementary content.

HTML usage context: Not Allowed

Media overlays usage context: Identifies a [`seq`](https://www.w3.org/TR/epub-33/#dfn-seq) or [`par`](https://www.w3.org/TR/epub-33/#dfn-par) as an escapable or skippable aside.

## A. Deprecated terms

[](#deprecated-terms)

Although use of the following terms remains valid, they are no longer recommended for use in [EPUB publications](https://www.w3.org/TR/epub-33/#dfn-epub-publication). Each term links to its last full definition.

- [annoref](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#annoref)
- [annotation](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#annotation)
- [biblioentry](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#biblioentry)
- [bridgehead](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#bridgehead)
- [endnote](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#endnote)
- [help](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#help) - replaced by [tip](#tip).
- [marginalia](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#marginalia)
- [note](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#note) - replaced by [footnote](#footnote)
- [rearnote](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#rearnote)
- [rearnotes](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#rearnotes) - replaced by [endnotes](#endnotes)
- [sidebar](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#sidebar) - replaced by the \[[html](#bib-html "HTML Standard")\] [`aside`](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element) element.
- [subchapter](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#subchapter)
- [warning](https://www.w3.org/TR/2025/NOTE-epub-ssv-11-20250612/#warning) - replaced by [notice](#notice)

## B. Change log

[](#change-log)

*This section is non-normative.*

Note that this change log only identifies substantive changes to the vocabulary. For a list of all changes, refer to the [Working Group's issue tracker](https://github.com/w3c/epub-specs/issues?q=is%3Aissue%20is%3Aclosed%20label%3ASpec-SSV).

- 2025-06-25: Removed all the draft edupub terms, retaining only the terms that are referenced from DPUB-ARIA 1.1. See [issue 2743](https://github.com/w3c/epub-specs/issues/2743).
- 2025-06-25: Deprecated the `biblioentry` and `endnote` terms to match their deprecation in DPUB-ARIA 1.1.

## C. References

[](#references)

### C.1 Informative references

[](#informative-references)

\[dpub-aria-1.1\]  
[Digital Publishing WAI-ARIA Module 1.1](https://www.w3.org/TR/dpub-aria-1.1/). Matt Garrish; Tzviya Siegman. W3C. 12 June 2025. W3C Recommendation. URL: <https://www.w3.org/TR/dpub-aria-1.1/>

\[epub-33\]  
[EPUB 3.3](https://www.w3.org/TR/epub-33/). Ivan Herman; Matt Garrish; Dave Cramer. W3C. 13 January 2026. W3C Recommendation. URL: <https://www.w3.org/TR/epub-33/>

\[epub-dict-10\]  
[EPUB Dictionaries and Glossaries 1.0](http://idpf.org/epub/dict). IDPF. 26 August 2015. URL: <http://idpf.org/epub/dict>

\[epub-indexes-10\]  
[EPUB Indexes 1.0](http://idpf.org/epub/idx). IDPF. 26 August 2015. URL: <http://idpf.org/epub/idx>

\[epub-region-nav-10\]  
[EPUB Region-Based Navigation 1.0](http://idpf.org/epub/renditions/region-nav). IDPF. 26 August 2015. URL: <http://idpf.org/epub/renditions/region-nav>

\[html\]  
[HTML Standard](https://html.spec.whatwg.org/multipage/). Anne van Kesteren; Domenic Denicola; Dominic Farolino; Ian Hickson; Philip Jägenstedt; Simon Pieters. WHATWG. Living Standard. URL: <https://html.spec.whatwg.org/multipage/>

\[html-aria\]  
[ARIA in HTML](https://www.w3.org/TR/html-aria/). Scott O'Hara; Patrick Lauke. W3C. 15 April 2026. W3C Recommendation. URL: <https://www.w3.org/TR/html-aria/>

[↑](#title)
