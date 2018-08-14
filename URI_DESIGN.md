# Uniform Resource Identifier design for pentandra.com

The following are basic design decisions that have been made for consistency
across this project. See [Cool URIs for the Semantic Web][cooluris] for some
background information in URI design.

To start off, note that there are two types of URIs in this project: those that
identify an information resource (i.e. a web page) and those that identify
something else, such as a concept. Any URI that ends in a `/` refers to the
information resource to which it resolves. For example, a fragment identifier
created by a hash following a slash
(`https://pentandra.com/…/#scholarly-commoning`), refers to a section or other
fragment of that information resource. Any URI that does not end in a `/` does
not refer to an information resource, but to some other resource, such as a
concept.

## Pentandra-specific RDFa context

A few concepts that are listed as prefixes in the base layout are:

```turtle
# To refer to the company (Pentandra) as an entity
@prefix pentandra: <https://pentandra.com/company#> .

# To refer to the blog as a concept
@prefix pentandra-blog: <https://pentandra.com/blog#> . 

# To refer to the website (located at https://pentandra.com) as a concept
@prefix pentandra-website: <https://pentandra.com#> .
```

## Fragment identifier design

Use rich, descriptive fragment identifiers comprised of lower case letters
(unless there is some important reason to do otherwise), separated by the `-`
character. Resource identifiers using hashes should follow the same pattern.

When a resource identifier identifies a document fragment, the resource
identifier may be the same as the fragment identifier. This arrangement makes
logical sense and satisfies [httpRange-14].

### Common fragment identifiers in document structure

```
#title: the title of the document
#document-context: the context of the document
#content: the content of the document
```

### Other fragment identifiers

```
#series: to identify a resource that represents a series of something
```

[httpRange-14]: <http://lists.w3.org/Archives/Public/www-tag/2005Jun/0039.html>
[cooluris]: <https://www.w3.org/TR/cooluris/>
