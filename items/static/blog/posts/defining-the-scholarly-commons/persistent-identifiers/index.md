---
title: "Defining the Scholarly Commons: persistent identifiers"
description: To be or not to be. Is persistent identification really the question?
kind: vignette
author_name: Chris Chapman
created_at: 2017-05-11
updated_at: 2017-05-17
part_of_series_id: '/static/blog/posts/defining-the-scholarly-commons/index.*'
tags:
  - Defining the Commons
  - Technology
---

I want to look at persistent identifiers here through the lens of barriers to
participation.

Of course its really easy to get a DOI. All you have to do is go drop your
stuff in a repository! What's so bad about that? This isn't an issue of owning
your own stuff as it is about missed opportunities. I think besides the trust
issues, researchers are missing a big opportunity here by only focusing here on
the large-grained research outputs. The research process is being broken up and
partitioned into all these places that don't make sense with how it came about!

HTTP URIs as identifiers are just as separable from the underlying technology
as are DOI URIs. I can represent either in ASCII, and HTTP IRIs support UTF-8!
Both are currently dependent on DNS for resolution. Either could support
multiple resolution mechanisms, and URIs have a native resolution mechanism.
DOI doesn't have a native mechanism, and according to Larry Stone, it
'currently needs the crutch of HTTP proxies which have the same DNS naming
problem'. [Stone's evaluation][stone evaluation] was largely based on
contemporary and now largely irrelevant implementation details. And some things
he mentions are just plain wrong. He is right in saying that we shouldn't rely
on PURLs to attach truly archival, long-lived names to network-accessible
resources. Let's just archive the resources and use the URIs to identify them
directly!

But there is a deeper problem with DOI that wasn't seen in these early days of
the Web, and one which DNS miraculously managed to escape (in large part thanks
to [David Holtzman]), one that I think is much more subtle and sinister, and
more of a barrier to a free and open culture of scholarship. DOIs were created
with an explicit barrier to entry, one that was placed high deliberately. The
DOI System was designed in order [for publishers to interoperate with other
publishers][crossref] to unambiguously identify PDF products. This is not
intrinsically bad, and as a system of identification, it is a nice system for
for what it was designed. The DOI created a centralized, proprietary Web of
research products. Even though it wasn't designed for this, the DOI has turned
into a proprietary lock-in mechanism that keeps publishers in control.

All of this makes sense if you understand that the DOI system was [designed for
proprietary B2B interactions][crossref] and not as something that just anyone
could create and use in a global context.

But as we try to create this new culture of open scholarship, the DOI system
becomes more and more of a visible misfit and barrier to progress. It was not
designed for open scholarship or scholarly commoning, and is a poor fit for it
because it was designed to centralize power and decision-making, making it
difficult for just anyone to participate in the system.

The [ISO 26324][DOI standard] is a standard, but not an open standard, as the
last time I checked it costs 88 CHF to purchase it directly if you are not an
ISO member. This is a one-time purchase. Once I have bought the PDF that
provides 'a structured, extensible means of identification, description and
resolution' of digital objects, I can implement a DOI registry myself, but it
will not be part of the scholarly DOI web (i.e. resolvable at the
<http://dx.dio.org> HTTP proxy) until I meet the contractual obligations of the
DOI system and am willing to pay to become a member of the system. I could not
find any information on how to become a member of the DOI system on
<www.doi.org>. The most helpful information about this I found [on
Wikipedia](https://en.wikipedia.org/wiki/Digital_object_identifier), so if any
registrars would like to fill me in, I'd love to know.

DOIs are centrally maintained by a trusted third party, whereas DNS is
decentralized and is trusted because no one controls it. The social problem is
bigger and harder to overcome than the technical one. The issue is less about
how well the system will persist into the future than what that system is
enabling or disabling _right now_.

The DOI people may have had some form of intellectual foresight when it came to
not relying on the Web, but they lacked foresight or understanding of the
social aspect of research, because they thought of research in the paper
paradigm, as controlled by institutions. Whatever the intellectual shortcomings
of DNS, they got the social aspect right.

The DOI System was designed for a world in which it made more sense to have
resources on the Web located at only one point of reference to eliminate
unneeded duplication and maximize efficiency of storage. This approach also
played well with the artificial scarcity enforced by paywalls. IPFS does not
eliminate this 'unneeded' duplication of resources. It only calls it by a
different name.

ICANN has a lower barrier to entry.

All Web resources do not need live global resolution. That they existed at some
point in time should be enough. How many of us type in complete URLs to find
the resources we need? We need universal identifiers, but we don't need
omnipresent resolution. Local resolution of universal identifiers.

Using the DOI system for scholarship seems to fit better with pre-Web legacy
approaches such as using the PDF as the container for scholarly communication.
All of the benefits of using the DOI system for scholarship---object
identification, metadata model, and social infrastructure---are more openly,
universally, and robustly provided by the W3C's open linked data
infrastructure. Why do something else?

DOI is not specific to the needs of scholarship, and is not a full solution to
the requirements of the scholarly record. While resolution is open to all,
creation of the identifiers is not.

While the answers are most likely multi-faceted, and dependent on the
situation, I think that there are some principles and rationale to think about,
what should help direct the best path forward. I know there is a lot of
infrastructure set up right now around DOIs, and that they have, and are
gaining momentum as mechanisms of citability. But do we explicitly design a
system around 'coolness factor' when it introduces barriers to use and does not
offer any non-proprietary technical advantage? DOIs have some significant
barriers to use, and I'm not yet convinced that they fit in the culture of the
commons. Here are a few reasons why:

- They do not preserve, at least for humans, the structure of the information
  that they represent.
- Technically, there is nothing special about a DOI over a URI.
- Sarven Capadisli has a few other good things to say about this.
- From a good annotation by Herbert Van de Sompel on the above article:
  'Somehow, DOIs have taken on the role of delineating the scholarly record,
  making recognizable what is and what is not part of the record. They were not
  intended to provide that functionality but they somehow have taken on that
  role in an ad-hoc manner.' I think we need a more robust solution for
  delineating the scholarly record, and that DOIs are not it.
- The scholarly record needs to include more than citations to large-grain
  articles, and the various implementations of the DOI are not reliable when it
  comes to passing parameters or fragment identifiers, and component DOIs are
  not a solution for this either. Hypothes.is and the W3C have a more
  universally working approach for fine-grained identification of annotated
  fragments with robust anchors and direct links.
- There is an element here of social ownership, and the Social Web community is
  quick to point out that POSSE (Publish on Own Site, Syndicate Elsewhere)
  preserves the canonical origin of digital content, and makes sense to
  preserve this ownership conceptually and technically if possible. Without
  this we lose the implicit trust built into the Web architecture. (For
  example, right now, what is stopping anyone from publishing something with a
  DOI and impersonating you using your ORCiD id? This would be much harder to
  do if they had to publish it under a domain that you controlled.)
- Distributed web archiving is a simpler, more universal, and more stable
  solution than relying on the publisher-maintained citation indirection
  architecture of DOIs.

However, I also understand that there are times to be pragmatic. Researchers
choose DOIs because they provide a solution to two problems: persistence and
identification.

that not everyone has a namespace on the Web that is under their control. So my
opinion on this is that it is better to create your own identifiers using a
namespace under your control if you have it, and if you don't have control of a
namespace or if you need a DOI for compatibility with a legacy tool, fall back
to DOI (yes, I'm seeing a decision tree for this in the future ;-).

It is the resolution aspect of this that researchers really care about, and
that offers any advantage over URI. But the DOI web is also unwieldy and prone
to breaking at any time, just like the Open Web. DOI resolution relies on the
publishers to update stuff when it changes for the resolving services to
continue to work. This is at least a difficult task to consider when thinking
about a long future ahead, and is no different than redirection services that
anybody else could provide. The resolution is not proprietary, but is based on
the open resolution services of DNS and HTTP. Persistent identifiers are easy.
It is the persistent locator that we really want.

If we take a step back, we may wonder, why do we need persistent locators for
research anyways? Isn't there a better solution for this? DOIs and PURLs are a
dated solution to the problem of persistent access to certain information. The
problem that the indirection layer provided by DOIs meant to solve can be
solved nowadays in a much simpler, more stable, more conceptually sound and
low-maintenance way: distributed web archiving.

What is more important is to have persistent identifiers, which any
identification system should provide.

The DOI system was made for a perfect world that is closed and centrally
managed. It was made at a time when the idea of a World Wide Web was a bit more
unstable. It was made at a time when web archiving wasn't even a thing, let
alone a possible solution.

social infrastructure (DOI names are backed by an organization dedicated to
their growth and survival) is good, but not enough.

Why people worry about link rot it is not because the URIs don't identify the
resource anymore (persistent identification), but that the resource can't be
resolved and accessed anymore (ready and available resolution). The need for
ready and available resolution came about because these resources were always
behind paywalls and had to be resolved each time they were accessed. They could
not be locally archived. The method of citation brought about by the scarcity
of physical items was perpetuated.

If we get rid of the need to resolve the original resources, we can have a
persistent id with any identification scheme, so long as there are not identity
collisions. This is true even if the identity scheme is inextricably connected
to a specific technology. Isn't DOI even dependent upon the English language?
How about ASCII or the handle system? What if we come up with some better way
to represent all these things? Even if these things do not change during the
course of the next millennium, there are still DOIs that are not resolvable
because the resources do not exist anymore anywhere on the Web. DOI can't help
here. We need a better solution. Archiving preserves the context of the
resource, exposing and preserving the context of the original research as well
as the technology with which it was originally made available, whereas DOI does
not. That knowledge gets lost when resources are migrated over time to newer
infrastructures. Archiving allows the identifiers to persist and the resources
to be resolved no matter what the identification scheme. We need to separate
the identifier from the resolution of the identifier, and archive the resource
alongside whatever is building upon it. This will provide real stability, and
is much more powerful than creating a citation link to that resource alone, and
needing all of these other resources to be available at all times at their
original location, with the only sacrifice being a little more disk space. A
great living example of this is <https://via.hypothes.is>, which creates an
archival snapshot of each page before it is annotated.

In the Commons, whatever you are building on should be available, so that as
you build on it, you retain an archived representation. Think of the things you
build upon as dependencies. Most often when trying to view a resource that has
been referenced, we want to see what it looked like when it was referenced.
Distributed web archiving seems like a perfect solution for this requirement,
would satisfy LOCKSS, and would provide a stable foundation of evidence while
not necessitating all of this stuff to perpetually remain available at its
original location. It will never break. There is still work to be done in this
area, but it seems like what the Commons should enable.

Content format becomes more important than ready resolution. So we need to pick
formats that are ubiquitous to allow the most likelihood that these types will
be supported into the future.

It's not that the Scholarly Commons prefers one system over another. But it is
that the Scholarly Commons prefers that which provides the least barriers to
participation. The other end of the stick is that the Scholarly Commons should
support whatever identifiers exist from whatever identification schemes exist.
Preferring and supporting are two different things.

If the publishers are able to provide a quick and easy way to do this, it
should be possible to do this in an open way as well.

[DOI standard]: <https://www.iso.org/standard/43506.html> "Digital object identifier system ISO standard"
[DOI standardization announcement]: <https://www.iso.org/news/2012/05/Ref1561.html>
[crossref]: <https://www.crossref.org/blog/dois-unambiguously-and-persistently-identify-published-trustworthy-citable-online-scholarly-literature-right/>
[sarven-doi]: <http://csarven.ca/web-science-from-404-to-200#doi>
[doi-purl]: <http://www.doi.org/factsheets/DOI_PURL.html> "DOI® System and Persistent URLs (PURLs)"
[dns history]: <http://cyber.law.harvard.edu/icann/pressingissues2000/briefingbook/dnshistory.html>
[David Holtzman]: <http://www.pittmag.pitt.edu/spring2005/feature3.html>
[bad boys]: <http://www.nytimes.com/2001/04/23/business/technology-Internet-bad-boy-takes-on-a-new-challenge.html>
[stone evaluation]: <http://web.mit.edu/handle/www/purl-eval.html>
