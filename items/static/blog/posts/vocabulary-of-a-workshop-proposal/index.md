---
title: Vocabulary of a Workshop Proposal
description: Or why the current Web is still so difficult.
kind: blogpost
author_name: Chris Chapman
created_at: 2017-09-06
updated_at: 2017-09-13
tags:
  - Scholarly Commons
  - Technology
---

So it all started with a simple question: _[how can I markup our proposals to
FORCE2017 in a way that would express the idea of what they are to a
machine?]{typeof="rio:ResearchQuestion"}_ As this website is in part an
experiment in linked data technologies, particularly HTML+RDFa, I have
encountered difficulties along the way in describing certain things. But never
before have I encountered the difficulties that I have encountered in trying to
find a satisfying answer to this question, or the abundance of misfit
vocabularies that describe the existing academic culture, and I think this
illuminates the fact that the culture that is being incubated within the
scholarly commons is something very new and different.

<!--MORE-->

First of all, I will try to describe in free text what I want to express: we
submitted [a poster], [a flash talk], and [a three-session workshop]. For the
purposes of this post, I will be focusing on the workshop proposal, but the
same questions could apply to all three. Our proposals are open on the Web
since being submitted (the point at which they have actually been on the web
has been delayed several weeks as I've tried to grapple with this question. I
did however eventually break down and made them available as Google Docs), and
we describe the review status of the proposals, i.e. at what point are they in
the submission and review process. They are parts of a complex, dynamic process
of critical reasoning on the part of the program committee of FORCE2017 as well
as my own (and Katie's) evolving thoughts as we think through these nascent
bits and create something rich and real out of them. They are spots of light
ahead of us that are helping to guide future action, instead of after-the-fact
summarizations.

So here's my journey of discovery in trying to find a way to represent these
ideas in a machine-readable way. I will be doing this exercise wearing the hat
of a machine vocabulary user, not a ontologist or ontology designer. One of the
principles of Linked Data is to build upon anything that is already there that
fits, and I want to see whether there is anything I can use that already exists
and is available.

# Initial candidates

The traditional method to classify things in scholarship is bibliographically,
so I started there. My first reaction was to see if any of the standard [SPAR
ontologies][spar] fit. I started with one of my personal favorites: FaBiO, the
[FRBR-aligned Bibliographic Ontology][fabio].

[`fabio:Abstract`{.term}](http://purl.org/spar/fabio/Abstract) seemed like a
likely proposition, but he intent of these abstracts is not to stand as static
summaries of papers that were written, in order to make it easier for others to
decide whether or not to read (or purchase) the full text. 

``` {#experiment-1 .turtle}
@prefix fabio: &lt;http://purl.org/spar/fabio/&gt; .
@prefix this: &lt;https://example.com/a-systems-perspective#&gt; .

this:workshop
  a fabio:Abstract . # This isn't right.
```

I realized that the workshop and the workshop proposal are two different
concepts, and need to be separated. And even though this proposal describes
some of the format of the workshop, it is not a comprehensive description of
how the workshop will proceed. It was written for the conference program
committee to have some idea of what the workshop would be about, enough to know
whether or not it would fit in the program, and if so, where it would fit best.

``` {#experiment-2 .turtle}
@prefix fabio: &lt;http://purl.org/spar/fabio/&gt; .
@prefix workshop: &lt;https://example.com/a-systems-perspective#&gt; .

workshop:proposal
  a fabio:Abstract . # This is better...
```

it's an abstract and you can label it as such and catalog it. What's the point
of that?

[`fabio:Proposition`{.term}](http://purl.org/spar/fabio/Proposition) could
work, but it's based on
[`frbr:Work`{.term}](http://purl.org/vocab/frbr/core#Work), which is described
as "an abstract entity; there is no single material object one can point to as
the work"---distinct intellectual or artistic creations---not an expression or
manifestation of one. It is also too abstract for what I am trying to describe,
and FaBiO does not include any subclasses of this term or any expressions of
this work that would fit the concept of a workshop.

[`fabio:WorkshopPaper`{.term}](http://purl.org/spar/fabio/WorkshopPaper) is
interesting, but this is not a traditional academic workshop, and the workshop
will not be based around a paper.

[`fabio:WorkshopProceedings`{.term}](http://purl.org/spar/fabio/WorkshopProceedings)
might be useful once the workshop is over, but we are not publishing "[the
programme and collected workshop papers, or their abstracts, presented at a
workshop]{lang="en-GB"}". This workshop, again, not a traditional academic
workshop, and is not built around papers. What we would do afterwards would
most likely be to publish the transcript and process and outputs of the
workshop similar to how we did after the Madrid workshop. This idea might fit
better as a
[`fabio:StructuredSummary`{.term}](http://purl.org/spar/fabio/StructuredSummary).

[`fabio:ConferencePoster`{.term}](http://purl.org/spar/fabio/ConferencePoster)
could be used to describe the poster once it was in existence, not the proposal
or the purpose for proposing it. It's a proposal for a poster, not a poster
itself.

In fact most of [the SPAR ontologies][spar], which are really good at
describing the publication process, do not really address what I'm trying to
address here. Much of this comes from the bibliographic roots of these
ontologies, and does not capture the evolutionary process that I tried to
outline above. So I could describe the workshop as an abstract concept with
this, and then with an expression at FORCE2017, manifested in a particular
room, existing as an item inside the mind and heart of each attendee, but I
think it is a stretch.

From a GitHub issue
([`openrif/community#5`{.handle}](https://github.com/openrif/community/issues/5))
I discovered two excellent resources that helped in this search: a [mapping]
from FaBiO to BIBO and BIBFRAME and a more [general comparison] of a whole
bunch of bibliographic typologies.

The [Bibliographic Ontology][bibo] 

The [VIVO-ISF Ontology][vivo] builds on the [Bibliographic Ontology][bibo], and 

[`vivo:ResearchProposal`{.term}](http://vivoweb.org/ontology/core#ResearchProposal)
is described as a "proposal for a research grant that has been submitted but
not approved; does not represent an existing activity". This is a subclass of
[`bibo:Document`{.term}](http://purl.org/ontology/bibo/Document), and there is
no more abstract concept of a proposal in this ontology.

The [Semantic Web Conference Ontology][swco] is somewhat similar in the
bibliographic sense. It was designed to markup the proceedings of academic
conferences including the concrete outputs thereof. But it can be used broader
than that.

I don't want to see the workshop as something to be cataloged. I want to see it
more as a defining process from inception to culmination. This workshop is a
reaction, not only to the call for abstracts, but to the existing system of
scholarship. I guess I want some more systemic way to describe these things.

At first, the [Creative Workshop Management Ontology][cwmo] seemed more along
the lines of what I wanted. This is, in fact, a creative workshop. But the
focus of this ontology is on describing the actual creative methods and
techniques with which that the workshop would be facilitated, rather than the
purpose of the workshop or what the intended outcomes would be. It is
incredibly granular and complex in what it can describe, and seems like an
owner's manual would be good to go alongside the ontology. I checked. There was
an owner's manual---[behind a paywall][cwmo paywall], though the owner, Alex
Gabriel, has set up [a GitHub repository][cwmo git] specifically for the
ontology.

But after thinking about it further, I realized, that I'm not as much
interested in describing the format of the creative things we will be doing at
this workshop. I don't really care about the bibliographic nature of these
scholarly objects either. I'm not creating them to be able to put one more line
on my CV, or to justify my salary. I think of them more as _tools for change_.

Now here is really why the semantic web is so hard. There are many ways to say
things, and each approach carries its own semantic nuances. It's easy to be
ambiguous or even clever in the use of words to communicate multiple things to
multiple audiences at the same time. Linked data allows us to say multiple
things at the thing, but we have to express each perspective explicitly and
independently. Also some of the more general vocabularies may carry in a
certain situation, but by nature of their generality only give general
relationships, not specific. It is so tempting just to do things the way they
always have been done---to just classify these things in a bibliographic sort
of way and be done with it.

But to design the semantic web, or a new system of scholarship, or really
anything _right_, we have to think through _why_ we're doing it, so we can know
what it is that we are really trying to do and say. It is easy to talk about
things, and harder to discover the meaning of things. A duck is a duck, right?
Isn't a web page a web page, too? Maybe to a search engine. But to people
trying to accomplish things together, we need something more. How can we expect
people or machines to help us throughout this process if we don't share what we
are trying to achieve? How do we expect machines to be able to connect people
together who are trying to accomplish similar things if this intent is not made
explicit? We need that something more if we expect machines to be able to help
us work together.

Just think of the example of describing an event like a workshop. How many
possible ways can we classify or even conceptualize it? To answer this
question, we have to venture at least a little bit down the rabbit hole of the
_meaning of meaning_. We can look at the concept of a workshop from various
linguistical [aspects][aspectual] and [agents][agentive], as well as the nature
of the participants and how they [each view reality][framing].

Adapting from [a description] of [a term] from [an upper-level ontology], any
event, such as a workshop or the act of submitting a proposal for a workshop,
could be viewed in many different ways, including from the perspective of an
accomplishment (what has brought about a certain state to occur), an
achievement (the state resulting from a previous accomplishment), a temporal
entity (if we collapse the meaning of the event into a duration of time), or a
transition (something that has changed from one state to another). And if that
is not complicated enough, we can introduce the concept of identity. Any event,
such as a workshop or the act of submitting a proposal for a workshop, could be
viewed as an observable situation or as a relational context created by an
observer on the basis of a [frame][framing]. Viewed in such a way, the
situation creates a context where each particular view can have a proper
identity, while the event itself preserves its own identity.

If you made it through that paragraph, you may wonder what is to be done?
Obviously we can't model everything, so we have to pick the view of reality
that says what we are trying to say.

<figure id="representing-what-we-want-to-conceptualize" class="bq grab" lang="en-GB">

> Ultimately, this discussion has no end, because realists will keep defending
> the idea that events in reality are not changed by the way we describe them,
> while constructivists will keep defending the idea that, whatever 'true
> reality' is about, it can't be modelled without the theoretical burden of how
> we observe and describe it. Both positions are in principle valid, but, if
> taken too radically, they focus on issues that are only partly relevant to
> the aim of computational ontologies, which only attempt to assist domain
> experts in representing what they want to conceptualize a certain portion of
> reality according to their own ideas. 

<figcaption>From a comment to the RDF term [`luv:Event`{.term}](http://www.ontologydesignpatterns.org/ont/dul/DUL.owl#Event), by [Aldo Gangemi]</figcaption>
</figure>

And why am I sharing all this? It is because this is the whole point of why the
scholarly commons is different. We are looking at scholarship differently, and,
from this perspective, it's a whole new world out there. What is it that we
need to ask or say as scholars? What would make the biggest impact? A small
adjustment at the helm of a large ship can make a huge difference in where that
ship eventually ends up. By definition, the scholarly commons will be a whole
new world, distinct in almost every way from the current research world. And we
need to take the time to explore and classify all of its particulars. I'm
imagining that this new world will not be so grounded in the bibliographic
mindset. I'm imagining a world of scholarship that is more about future
potentialities rather than about documenting past achievements. I'm imagining a
world that enables research to move forward at its own pace, as a first-class
thing in its own right, and prosaic, narrative descriptions of the research
coming into the picture only as an optional secondary.

In order to move to this new world, we need to know the intent of things. We
need goals. [allusion to some concrete metaphor]. It took writing this journey
to realize that what I want is to look for some systemic or purpose-oriented
way to describe these submissions. It would be nice to be able to describe why
we thought of proposing this workshop at this place and time, the purpose or
the mission behind the workshop, and how this mission relates to our company
mission, for example. I would also like to be able to describe how this
workshop fits in the bigger scholarly commons efforts more from a systems point
of view.

# Going deeper

Going to the other extreme now. What if we think of a workshop proposal as a a
product or service we are offering to the FORCE11 community? We could bring in
the Good Relations ontology. 

``` {.turtle}
<> a gr:Offer .
```

This gets across the idea that this proposal is something that is being freely
offered, with some idea of a process that will end up either accepting or
rejecting the offer.

I'm offering this to be done at this conference, but it is not a product I am
selling for money, so that's out. While we are not selling the full-text of the
workshops or posters or flash talks, we are in some sense trying to sell the
ideas to the program committee of the conference, with the hope that they will
be included in the conference program, and that they will see as we see the
value as we see it and place these things in a representative manner in the
program.

* schema.org

* PAV

* [`meb:Submission`{.term}](http://rdf.myexperiment.org/ontologies/base/Submission).
This is from a lower-level, application specific ontology for myExperiment. The
only reason I'm including it here is that it seemed to capture some of the idea
of the submission dynamics. It is described as "An object that has been
submitted." and is also an
[`owl:EquivalentClass`{.term}](http://www.w3.org/2002/07/owl#EquivalentClass)
with [`sioc:Item`{.term}](http://rdfs.org/sioc/ns#Item), so let's look there
next.

* [`sioc:Item`{.term}](http://rdfs.org/sioc/ns#Item) is described as "something
which can be in a Container." I guess you could look at a workshop proposal
this way, but describing a bunch of proposals that fit in a container is
somewhat bibliographic or at least grouping in nature and really is not
applicable to the problem at hand.

* PSO

``` {.turtle}
@prefix workshop: <http://example.org/workshop/> .
@prefix pso: <http://purl.org/spar/pso/> .

workshop:1
  pso:holdsStatusInTime workshop
```

* The Federal Enterprise Architecture Vocabulary, is fairly general and
  limited, but still allows us to say something important, but not about the
  workshop, just about the intent of the company.

``` {.turtle}
pentandra:company
  a fea:Company ;
  fea:hasIntent [
    a fea:Mission ;
    fea:description "To understand how the system of scholarship works, how it could work, and how to get from here to there."@en ;
  ] .
```

* The IPO

``` {.turtle}
symptom:1
  a ipo:Symptom ;
  ipo:indicates issue:1 .

issue:1
  a ipo:Issue ;
  ipo:solvedBy this:workshop .

this:workshop
  a ipo:Activity
  ipo:hasPostCondition "A better understanding of the complex system that we call scholarship." .

```

* DIO

* activitystreams?

* DULCE+DnS Ultralite



# A wasted exercise?

So at this point you may be justified in asking: what is the point of all of
this? In one sense your concern is probably valid. What difference will going
to all this trouble make? This is just a simple workshop abstract. But looking
at this differently has also answered some questions for me and helped me have
greater understanding. For one thing, I now know that a bibliographic approach
to scholarly communications might be great for certain things, such as current
libraries and archives, and that there is so much more potential if we look at
things differently.

Not only must you think about how to model what you are trying to say, you must
also think about what sort of machine clients you are writing for. Going
through this exercise has made me question the fundamental premise of basing
our scholarly ecosystem primarily around publication workflows. What did I gain
by exposing the data this way? What sort of clients would use this kind of
information? What would they do with it? What affordances or connections could
be created from it? These questions all seem to elicit the wrong kinds of
answers. I understand the point of it for the publications of the legacy
system, but it seems that if we could take a step back and really ask ourselves
what it is that is essential, we could truly reimagine research and come up
with an alternative system that would encourage collaboration, cooperation, and
synergy across many boundaries, ultimately helping many more of us to focus on
what the whole scholarly or scientific enterprise should really be about:
inquiry and discovery.

Another is that we have to start applying these ideas to our work. Questions
will arise and insights will come as we are in the thick of it that we would
not have otherwise. Only after we figure out what needs to be happening on a
basic level will we know what needs to be enabled and how to make the process
easier.

The scholarship of the future must be purposeful. The scholarship of the future
must bring people together. The scholarship of the future must go deep enough
to cross all sorts of boundaries and help us see things in a different way.

Link to this page in another representation.

[a poster]: </solutions/F17/is-a-scholarly-commons-what-we-really-want/> "Is a Scholarly Commons what we really want? by Katie Chapman"
[a flash talk]: </solutions/F17/a-vision-of-hope-for-scholarship/> "A vision of hope for scholarship by Katie Chapman"
[a three-session workshop]: </solutions/F17/a-systems-perspective/> "The Scholarly Commons: a systems perspective by Chris and Katie Chapman"

[fabio]: <http://purl.org/spar/fabio/>
[bibo]: <http://purl.org/ontology/bibo/>
[vivo]: <http://vivoweb.org/ontology/core#>
[swco]: <http://data.semanticweb.org/ns/swc/ontology>
[cwmo]: <http://purl.org/cwmo/#>
[cwmo paywall]: <http://ieeexplore.ieee.org/document/7907529/>
[cwmo git]: <https://github.com/gabriel-alex/cwmo> "Creative Workshop Management Ontology documentation and code source"
[spar]: <http://www.sparontologies.net/>
[fea on lov]: <http://lov.okfn.org/dataset/lov/vocabs/fea> "fea on Linked Open Vocabularies"
[mapping]: <http://goo.gl/2zZx8G>
[general comparison]: <http://goo.gl/NKU1XR>

[`openrif/community#5`{.handle}]: <https://github.com/openrif/community/issues/5> "Review FaBIO ontology for inclusion and possible replacement of parts of BIBO ontology"

[aspectual]: <https://en.wikipedia.org/wiki/Grammatical_aspect> "Aspect is a grammatical category that expresses how an action, event, or state, denoted by a verb, extends over time."
[agentive]: <https://en.wikipedia.org/wiki/Agent_(grammar)> "In linguistics, a grammatical agent is a thematic relation that refers to the cause or initiator of an event."
[framing]: <https://en.wikipedia.org/wiki/Framing_(social_sciences)> "In the social sciences, framing comprises a set of concepts and theoretical perspectives on how individuals, groups, and societies, organize, perceive, and communicate about reality."
[Aldo Gangemi]: <http://ontologydesignpatterns.org/wiki/User:AldoGangemi>
