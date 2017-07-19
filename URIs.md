# URI Design for pentandra.com

Any URI that ends in a `/` refers to the information resource to which it
resolves. A fragment identifier created by a hash following a slash
(`https://pentandra.com/…/#scholarly-commoning`), refers to a section or other
part of that information resource.

Any URI that does not end in a `/` does not refer to an information resource,
but to some other resource, such as a concept.

## Available prefixes

A few concepts that are listed as prefixes in the base layout are:

```turtle
# To refer to the company (Pentandra) as an entity
@prefix pentandra: <https://pentandra.com/company#> .

# To refer to the blog as a concept
@prefix pentandra-blog: <https://pentandra.com/blog#> . 

# To refer to the website (located at https://pentandra.com) as a concept
@prefix pentandra-website: <https://pentandra.com#> .
```
*[URI]: Uniform Resource Identifier
