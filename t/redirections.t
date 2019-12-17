use Test::Nginx::Socket 'no_plan';

run_tests();

__DATA__

=== TEST 1: Redirect from author page to profile page.

We transitioned from a more basic author profile page to a more comprehensive,
WebID-enabled personal profile page. These are treated as permanent
redirections for the two author pages we had at the time.

--- request eval
[q(GET /authors/chris-chapman/),
 q(GET /authors/katie-chapman/)]
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/people/chris-chapman/),
 q(Location: https?://localhost(?::\\d+)?/people/katie-chapman/)]
--- error_code eval
[301, 301]

=== TEST 2: Redirect from Pentandra's blog feed to Atom resource.
--- request
GET /blog/feed
--- response_headers_like
Location: https?://localhost(?::\d+)?/blog/feed.atom$
--- error_code: 302

=== TEST 3: Redirect from members' feeds to Atom resources.
--- request eval
[q(GET /people/chris-chapman/feed),
 q(GET /people/katie-chapman/feed)]
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/people/chris-chapman/feed.atom),
 q(Location: https?://localhost(?::\\d+)?/people/katie-chapman/feed.atom)]
--- error_code eval
[302, 302]

=== TEST 4: Redirect from products to solutions.

When we first built the website we had a /products/ page. Eventually we moved
this to /solutions/ to better align with our business name and a more
comprehensive focus.

--- request
GET /products/
--- response_headers_like
Location: https?://localhost(?::\d+)?/solutions/
--- error_code: 301

=== TEST 5: Redirect from funding to funders.

We changed this to put the focus on the people who have made this possible.

--- request
GET /company/funding/
--- response_headers_like
Location: https?://localhost(?::\d+)?/company/funders/
--- error_code: 301

=== TEST 6: Redirect from company as a concept to an information resource.
--- request
GET /company
--- response_headers_like
Location: https?://localhost(?::\d+)?/company/
--- error_code: 303

=== TEST 7: Redirect from the blog as a concept to an information resource.
--- request
GET /blog
--- response_headers_like
Location: https?://localhost(?::\d+)?/blog/
--- error_code: 303

=== TEST 8: Return RDF/XML by default for personal profile pages.
--- request eval
[q(GET /people/chris-chapman/),
 q(GET /people/katie-chapman/)]
--- response_headers_like eval
[q(Content-Type: application/rdf\+xml; charset=utf-8),
 q(Content-Type: application/rdf\+xml; charset=utf-8)]

=== TEST 9: Accept RDF/XML for personal profile pages.
--- request eval
[q(GET /people/chris-chapman/),
 q(GET /people/katie-chapman/)]
--- more_headers
Accept: application/rdf+xml
--- response_headers_like eval
[q(Content-Type: application/rdf\+xml; charset=utf-8),
 q(Content-Type: application/rdf\+xml; charset=utf-8)]

=== TEST 10: Accept turtle for personal profile pages.
--- request eval
[q(GET /people/chris-chapman/),
 q(GET /people/katie-chapman/)]
--- more_headers
Accept: text/turtle
--- response_headers_like eval
[q(Content-Type: text/turtle; charset=utf-8),
 q(Content-Type: text/turtle; charset=utf-8)]

=== TEST 11: Accept HTML for personal profile pages.
--- request eval
[q(GET /people/chris-chapman/),
 q(GET /people/katie-chapman/)]
--- more_headers
Accept: text/html
--- response_headers_like eval
[q(Content-Type: text/html; charset=utf-8),
 q(Content-Type: text/html; charset=utf-8)]

=== TEST 12: Accept XHTML for personal profile pages.
--- request eval
[q(GET /people/chris-chapman/),
 q(GET /people/katie-chapman/)]
--- more_headers
Accept: application/xhtml+xml
--- response_headers_like eval
[q(Content-Type: text/html; charset=utf-8),
 q(Content-Type: text/html; charset=utf-8)]

=== TEST 13: Accept JSON-LD for personal profile pages.
--- request eval
[q(GET /people/chris-chapman/),
 q(GET /people/katie-chapman/)]
--- more_headers
Accept: application/ld+json
--- response_headers_like eval
[q(Content-Type: application/ld\+json; charset=utf-8),
 q(Content-Type: application/ld\+json; charset=utf-8)]

=== TEST 14: Redirects to RDF/XML by default for linked data vocabularies.
--- request eval
[q(GET /solutions/scholarly-commons/scearl),
 q(GET /solutions/research-intent-ontology/rio),
 q(GET /solutions/research-intent-ontology/examples/leonardo),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa-nested)]
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/solutions/scholarly-commons/scearl.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/rio.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa-nested.rdf)]
--- error_code eval
[303, 303, 303, 303, 303]

=== TEST 15: Accept RDF/XML for linked data vocabularies.
--- request eval
[q(GET /solutions/scholarly-commons/scearl),
 q(GET /solutions/research-intent-ontology/rio),
 q(GET /solutions/research-intent-ontology/examples/leonardo),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa-nested)]
--- more_headers
Accept: application/rdf+xml
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/solutions/scholarly-commons/scearl.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/rio.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa.rdf),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa-nested.rdf)]
--- error_code eval
[303, 303, 303, 303, 303]

=== TEST 16: Accept turtle for linked data vocabularies.
--- request eval
[q(GET /solutions/scholarly-commons/scearl),
 q(GET /solutions/research-intent-ontology/rio),
 q(GET /solutions/research-intent-ontology/examples/leonardo),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa-nested)]
--- more_headers
Accept: text/turtle
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/solutions/scholarly-commons/scearl.ttl),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/rio.ttl),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo.ttl),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa.ttl),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa-nested.ttl)]
--- error_code eval
[303, 303, 303, 303, 303]

=== TEST 17: Accept HTML for linked data vocabularies.
--- request eval
[q(GET /solutions/scholarly-commons/scearl),
 q(GET /solutions/research-intent-ontology/rio),
 q(GET /solutions/research-intent-ontology/examples/leonardo),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa-nested)]
--- more_headers
Accept: text/html
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/solutions/scholarly-commons/scearl.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/rio.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa-nested.html)]
--- error_code eval
[303, 303, 303, 303, 303]

=== TEST 17: Accept XHTML for linked data vocabularies.
--- request eval
[q(GET /solutions/scholarly-commons/scearl),
 q(GET /solutions/research-intent-ontology/rio),
 q(GET /solutions/research-intent-ontology/examples/leonardo),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa-nested)]
--- more_headers
Accept: application/xhtml+xml
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/solutions/scholarly-commons/scearl.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/rio.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa.html),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa-nested.html)]
--- error_code eval
[303, 303, 303, 303, 303]

=== TEST 17: Accept JSON-LD for linked data vocabularies.
--- request eval
[q(GET /solutions/scholarly-commons/scearl),
 q(GET /solutions/research-intent-ontology/rio),
 q(GET /solutions/research-intent-ontology/examples/leonardo),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa),
 q(GET /solutions/research-intent-ontology/examples/leonardo-oa-nested)]
--- more_headers
Accept: application/ld+json
--- response_headers_like eval
[q(Location: https?://localhost(?::\\d+)?/solutions/scholarly-commons/scearl.jsonld),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/rio.jsonld),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo.jsonld),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa.jsonld),
 q(Location: https?://localhost(?::\\d+)?/solutions/research-intent-ontology/examples/leonardo-oa-nested.jsonld)]
--- error_code eval
[303, 303, 303, 303, 303]
