---
title: "Defining the Scholarly Commons: persistent identifiers"
description: To be or not to be. Is persistent identification really the question?
kind: vignette
author_name: Chris Chapman
created_at: 2017-05-11
updated_at: 2017-06-07
part_of_series_id: '/static/blog/posts/defining-the-scholarly-commons/index.*'
tags:
  - Defining the Commons
  - Technology
  - World Wide Web
---

A lot of scholarly infrastructure is set up right now around DOIs, and they
have, and are gaining momentum as mechanisms of citability. But do we
explicitly design a system around _coolness factor_ when it introduces barriers
to use and does not offer any non-proprietary technical advantage? DOIs have
some significant barriers to use, and I'm not yet convinced that they fit in
the culture of the commons.

I want to look at persistent identifiers here through the lens of barriers to
participation. As we try to create this new culture of open scholarship, the
DOI system becomes more and more of a visible misfit and barrier to progress.
It was not designed for open scholarship or scholarly commoning, and is a poor
fit for it because it was designed to centralize power and decision-making,
making it difficult for just anyone to participate in the system.

The aim of this essay is not as much to present solutions, as it is to paint a
picture of a way to think about a problem and point out some directions that we
could move forward towards solving it. Call it a pattern if you wish. Either
way, I apologize in advance for the number of acronyms in this post.

<!--MORE-->

# A question of control

The DOI system was motivated by three motivations: the need to identify objects
within an information resource, the need to describe metadata about that
resource, and a contractual agreement to care for the resources for which the
institution was responsible (i.e. the social infrastructure).

But there is a deeper problem with DOI that wasn't as apparent in these early
days of the Web, one that I think is much more subtle and sinister, and more of
a barrier to a free and open culture of scholarship. The social infrastructure
of the DOI system created an explicit barrier to participation---one that was
placed high deliberately. This makes more sense when you understand that the
DOI system was designed in order [for publishers to interoperate with other
publishers][crossref] to unambiguously identify business products. This is not
intrinsically bad, and as a system of identification, it is a nice system for
for what it was designed. The DOI system created a centralized, proprietary
registry of research products. It was never designed to be a researcher-facing
identification scheme or something that just anyone could create and use in a
global context. As it has become more visible to researchers and even the
public however, the DOI has taken on the ad hoc role of saying what counts as
scholarship and delineating the scholarly record,[^herbert-doi-comment] and
with the rise of publisher-supported SaaS products where DOIs can be created
for free, the DOI is quickly becoming a proprietary lock-in mechanism to keep
publishers in control.

I can understand why a publisher would jump on the DOI bandwagon: it offers a
proprietary advantage. The DOI website [has whitepapers][doi whitepapers]
praising the economic benefits of the DOI system for publishers that invest in
it. But researchers have their own, different priorities, and need to
understand the implications of their choices, and that there all alternatives,
some of which would give them greater freedom and autonomy. We give up that
freedom when we give others control. And this choice may be acceptable to many.
But we need to know what we are choosing. We need to understand that the issue
is not between decentralization or centralization, but is nothing more than an
age-old argument in disguise: the question of individual agency and
accountability versus compulsion; the question of who is in control.

The [ISO [26324]{.oldstyle}][DOI standard] is a standard, but not an open
standard, as the last time I checked it costs [88]{.oldstyle} CHF to purchase
it directly if you are not an ISO member. This is a one-time purchase. Once I
have bought the [17]{.oldstyle}-page PDF that provides 'a structured,
extensible means of identification, description and resolution' of digital
objects, I can implement a DOI registry myself, but it will not be part of the
scholarly DOI web (i.e. resolvable at <http://doi.org>) until I meet the
contractual obligations of the DOI system and am willing to pay to become a
member. I spent some time looking on [the DOI website][], but could not find
any information on how to become a member or registrar of the DOI system. The
most helpful information about this I found [on Wikipedia][doi], so if any
registrars would like to fill me in, I'd love to know.

Of course its really easy to get a DOI. All you have to do is go drop your
stuff in an institutional repository! What's so bad about that? This isn't an
issue of owning your own stuff as it is about missed opportunities. I think
besides the trust issues, researchers are missing a big opportunity here by
allowing the institutions to control the situation. In business, such a thing
is called a _natural monopoly_. Utility companies are a good example of this.
It doesn't currently make a lot of sense to allow open competition in providing
electricity to households. It is usually easier to select one company ahead of
time that will provide the infrastructure, it, and they run the poles, wire,
transformers, etc. to all the houses in the neighborhood. Sure, this provides
stability and minimizes the amount of hardware, but innovation slows in such an
economy because of the lack of competition.

The DOI system was designed for a closed, centralized world, in which it made
more sense to have resources on the Web located at only one point of reference
to eliminate unneeded duplication and maximize efficiency of storage. This
approach also played well with need to induce artificial scarcity through the
use of paywalls.

Using the DOI system for scholarship seems to fit better with pre-Web legacy
approaches such as using the PDF as the container for scholarly communication.
All of the benefits of using the DOI system for scholarship---object
identification, metadata model, and social infrastructure---are more openly,
universally, and robustly provided by the W3C's open linked data
infrastructure.

<figure id="the-second-rule-of-linked-data" class="bq grab">

> The second rule, to use HTTP URIs, is also widely understood. The only
> deviation has been, since the web started, a constant tendency for people to
> invent new URI schemes (and sub-schemes within the `urn:`{.code} scheme) such
> as LSIDs and handles and XRIs and DOIs and so on, for various reasons.
> Typically, these involve not wanting to commit to the established Domain Name
> System (DNS) for delegation of authority but to construct something under
> separate control. Sometimes it has to do with not understanding that HTTP
> URIs are names (not addresses) and that HTTP name lookup is a complex,
> powerful and evolving set of standards. This issue discussed at length
> elsewhere, and time does not allow us to delve into it here.

<figcaption>The second rule (or expectation of behavior) of Linked Data, by Tim Berners-Lee, [2006]{.oldstyle}</figcaption>
</figure>

HTTP URIs as identifiers are just as separable from the underlying technology
as are DOI URIs. Either could support multiple resolution mechanisms, though in
practice, both currently depend upon DNS for resolution. ~~DOI doesn't have a
native mechanism, and according to Larry Stone, it 'currently needs the crutch
of HTTP proxies which have the same DNS naming problem'.[^stone-evaluation]~~
[Stone's evaluation][stone evaluation] was largely based on contemporary and
now largely irrelevant implementation details. He did not foresee Web-scale
archiving initiatives, and some things he mentions are just plain wrong. If you
want to look more in-depth at the arguments in favor of HTTP URIs to which
Berners-Lee was referring, check out [this article][myRI] from
[2006]{.oldstyle}.

A DOI, like a URI, is a just unique name, and can be reused in other contexts.
There is nothing that requires a DOI to resolve to some normative document, so
resolvers could use alternative methods of resolution to resolve a DOI to
anything actually. In fact, the DOI system is already being brilliantly
repurposed by ImpactStory, who has set up [a DOI resolver service][oadoi] that
redirects DOIs to alternative, open versions of research papers.

ICANN has a lower barrier to entry.

DOI is not specific to the needs of scholarship, and is not a full solution to
the requirements of the scholarly record. While resolution is open to all,
creation of the identifiers is not.

# Inversion of control

The DOI people may have had some form of intellectual optimism when it came to
not relying on the Domain Name System (even though current implementations do
rely on DNS for object resolution), but they lacked foresight or understanding
of the social aspect of research, and especially of the free and open culture
of scholarship that the Scholarly Commons envisions. They viewed research in
the current paradigm: a paper-based economy controlled by institutions and
publishers.

In my vision of the Scholarly Commons, I see parallels between where we are now
to what the Scholarly Commons could be and the transition of a tiny, centrally
administered [ARPANET][] to a colossal, open, distributed Internet. At the time
of the [depiction below](#arpanet-in-1977), there were less than
[200]{.oldstyle} nodes on the network. In these early days, if you wanted to
add a host to the network, you had to call [Elizabeth Feinler][] at the Network
Information Center at Stanford University during business hours. If your host
was eligible to connect to the ARPANET, your host's name and assigned IP
address were then added to a centralized text file. To discover and communicate
with your host, every other computer on the ARPANET periodically downloaded
this file via FTP.

<figure id="arpanet-in-1977" property="schema:sharedContent" resource="#arpanet-in-1977" typeof="schema:ImageObject">
  <img alt="A diagram of the ARPANET in March 1977, composed of nodes, depicted as rectangular labeled boxes, connected together by lines, representing networked circuits." class="simple" src="Arpanet_logical_map,_march_1977.png" />
  <figcaption>A top-down logical map of ARPANET, the predecessor of the Internet, forty years ago this year. At this point in time, ARPANET was centrally administered, and this approach was nearing its limits of manageability.</figcaption>
</figure>

It did not take long for this centralized approach to become unwieldy. By
[1983]{.oldstyle}, [Jon Postel][] and [Paul Mockapetris][] had come up with a
solution. It was bold and forward-thinking---quite different than the status
quo. Here is some of the language of the proposal:

<figure id="the-need-for-a-consistent-name-space" class="bq grab">

> The basic need is for a consistent name space which will be used for
> referring to resources. ... The sheer size of the database and frequency of
> updates suggest that it must be maintained in a distributed manner, with
> local caching to improve performance. Approaches that attempt to collect a
> consistent copy of the entire database will become more and more expensive
> and difficult, and hence should be avoided. The same principle holds for the
> structure of the name space, and in particular mechanisms for creating and
> deleting names; these should also be distributed.

<figcaption>From RFC [882]{.oldstyle}: <cite>Domain Names -- Concepts and Facilities</cite>, [1983]{.oldstyle}</figcaption>
</figure>

It is a little hard to understand, from our perspective in time, what this
proposal meant to Paul and Jon, or to those that worked in the Network
Information Center. They were essentially handing over control of the network
_to the network_, hoping that this would help it grow. This was hardly
anarchy---the proposal for the Domain Name System was quite prescriptive in how
it would work and interoperate, but it was very deliberate in its approach to
distributing authority and control. Can you imagine what the Internet would be
like today if they hung onto that control, even out of good intentions, and you
had to request a domain name through the United States Department of Defense?

DOIs are centrally maintained by a trusted third party, which is fine if you
actually trust (and continue to trust) the third party. DNS is decentralized
and is trusted because no one controls it. This is the basic idea behind the
word <dfn id="def:trustlessness">trustlessness</dfn>. In the DOI system, the
institutions and publishers are in control; in the DNS, the control is
distributed.

Whatever the intellectual shortcomings of DNS, they got the social aspect
right. The social problem is bigger and harder to overcome than the technical
one. The issue is less about how well the system will persist into the future
than what that system is enabling or disabling _right now_.

In all of what I'm saying, I'm not recommending that we get rid of institutions
and publishers. We need them, but not as the controllers of what counts as
scholarship. We need institutions and publishers to act in a supportive role,
following Postel's law (otherwise known as the [robustness principle]), which
is to be conservative in what you do, and be liberal in what you accept from
others. We need institutions and publishers to take the archiving approach of
LOCKSS, contributing to and enhancing the experience of researchers while they
are traveling on their journeys. As for what counts in the Scholarly Commons,
EVERYTHING COUNTS! Whatever you build on or produce during your research should
be as FAIR as is reasonably possible, whether it is something that another
researcher published, or something that was found on some blog post published
by some enthusiastic, science-crazed high-school student.

# A deeper look at persistence

We need to embrace the Wild World Web with all its inconsistency and
unavailability if we are going to find a real solution to this universal
problem. If we look at the World Wide Web as a vast [distributed data store],
we can then apply Eric Brewer's [CAP theorem] to the problem, which essentially
states that _in the presence of a network partition, one has to choose between
consistency and availability_. Framing the Web this way would allow us to
define a broken link as an information resource with an availability problem.
And as far as consistency goes, with a state that constantly fluxing between
convergence and divergence, I don't have much hope that the Web will ever
achieve perfect global consistency, perhaps not even _eventually_. I'm not even
sure that's what we want.

In answer to this problem, the DOI system offers a naive solution because it
assumes that these resources will always be available in a consistent form
somewhere on the Internets. It tries to solve the availability problem using a
redirection layer, but this does not solve the problem---it only shifts the
responsibility for the problem and control to the entities that meet the
contractual obligations of the DOI system, with the side effect of adding
another potential (technical) point of failure that must be maintained: the
redirection links. We are putting ourselves in the situation where we are tying
ourselves to the publishers, committing to play by their rules because we don't
want all our links to break. Beyond that, the DOI system does not address the
consistency guarantee, but just makes the assumption that these resources don't
change after they receive an identifier, which is often not the case, and will
increasingly _not_ be the case as scholarly communication becomes more dynamic.

The DOI system also offers only a partial solution to the problem, because DOIs
are only created for scholarly _outputs_, and not for the inputs, unless those
inputs also happen to also be outputs of some earlier scholarly process, and
they have previously received a DOI. If you happen to build on inputs that are
_not_ also scholarly outputs, the integrity of the system breaks. You have a
guarantee that only _some_ of the objects will persist, and as for the rest,
they are at risk of eventually rotting away, leaving future generations with an
incomplete picture of your intellectual achievements.[^doi-pressure] It is
precisely because the DOI system is tied to the current publishing paradigm
that the DOI system has this quality of onesidedness. It was never designed to
be a complete solution to the problem of persistence of scholarly objects, just
the publishers' side of it, which, in the past, only included the scholarly
outputs.

So what do we do? Is there any hope for the Web as a stable medium for research
or scholarly communication? I think that the answer to this question is _yes_,
but we need to look deeper at what is really going on here. In the context of
research and scholarly communication, availability and consistency should be
thought of as having ready access to see what the researcher saw at the time
she did her research.

The solution here is simple: get rid of the network partition. Linked Data
resources already do this for data. Unlike the Web of Documents where web pages
are hosted by servers partitioned by namespaces, and availability of each web
server is needed to access each resource, Linked Data is able to represent
useful data and relationships across multiple namespaces within one document.
Here's a tiny example:

<% me = person_by_name(@item[:author_name]) %>
``` {#tiny-web-of-data .turtle}
@prefix cc: &lt;https://creativecommons.org/ns#&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .

&lt;<%= iri_for(me) %>&gt; a foaf:Person ;
    rdfs:label "<%= full_name(me) %>"@en ;
    foaf:familyName "<%= me[:last_name] %>"@en ;
    foaf:givenName "<%= me[:first_name] %>"@en ;
    foaf:img &lt;<%= photo_url(me, global: true) %>&gt; ;
    foaf:mbox &lt;mailto:<%= me[:email] %>&gt; ;
    foaf:name "<%= full_name(me) %>"@en ;
    cc:license &lt;https://creativecommons.org/licenses/by/4.0/&gt; .
```

If I have access to [this example resource](#tiny-web-of-data) from this one
server, I can see linked data described in four different namespaces without
needing access to four separate servers. If I use a reasoner which has some
knowledge of the data within this tiny web of data, it can make inferences and
create more knowledge without needing ready access to any other remotely hosted
resources directly---the data is independent of the hosts that describe the
data. The server hosting the <https://creativecommons.org/ns#> resource could
be down and the ontology unavailable, and the data would still be interoperable
(the <abbr>I</abbr> in FAIR) as long as I had a local copy of the data file.
For the reusability (and reproducibility) aspect of research (the
<abbr>R</abbr> in FAIR), the need for preservation enters the picture here. We
need a way to preserve the sources upon which the researcher is basing claims.
If we can preserve not only the research, but the blocks upon which that
research builds, we will always have access to all the resources, whether or
not they are currently available at their original locations. If we remove the
network partition and preserve the sources locally as the research dependencies
are created, all of those resources will be guaranteed to be locally consistent
and available. The [PACELC theorem], which builds upon the CAP theorem, states
that _a high availability requirement implies that the system must replicate
data_. How to actually do this replicating is a topic for another time (and
relates to the <abbr>F</abbr> and <abbr>A</abbr> of FAIR), and could happen in
various ways, from web archiving to IPFS. But it should be obvious by now that
mere citations of resources are not enough, irrespective of the 'archival
quality' of the identifier scheme. We need to realize that citation systems
originated in the scarcity of the paper publication paradigm, where it really
was not feasible to distribute all of the research dependencies alongside each
research paper. With the technologies that exist and are emerging, we have an
amazing opportunity _and responsibility_ to do this better.

# The need for resolution

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

All Web resources do not need live global resolution. That they existed at some
point in time should be enough. How many of us type in complete URLs to find
the resources we need? We need universal identifiers, but we don't need
omnipresent resolution. Local resolution of universal identifiers.

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

---

- They do not preserve, at least for humans, the structure of the information
  that they represent.
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

---

# In all practicality...

However, I also understand that there are times to be pragmatic. Researchers
choose DOIs because they provide a solution to two problems: persistence and
identification.

that not everyone has a namespace on the Web that is under their control. So my
opinion on this is that it is better to create your own identifiers using a
namespace under your control if you have it, and if you don't have control of a
namespace or if you need a DOI for compatibility with a legacy tool, fall back
to DOI (yes, I'm seeing a decision tree for this in the future ;-).

If the publishers are able to provide a quick and easy way to do this, it
should be possible to do this in an open way as well.

# Conclusion

To sum up...

* The DOI system was designed with centralization in mind, and with an explicit
barrier to participation. The DNS was designed to distribute authority and
control.
* Both DOIs and HTTP URIs are names that can be used to identify objects.
Technically, there is nothing special about a DOI over a URI.
* Neither DOIs or HTTP URIs depend on any underlying infrastructure or
technology, including HTTP or DNS, to function as unique identifiers. They both
currently rely on DNS to resolve objects, but could use any other type of
resolution mechanism if desired.
* In current practice, DOIs are resolved centrally, and then delegate to DNS to
do the resolution of the actual HTTP URI. This redundant infrastructure adds
another layer of links to maintain and keep from breaking.
* We need an effective and robust mechanism to manage research dependencies,
because it is possible to resolve any type of object locally, in a distributed
way.
* We need institutions and publishers to act in a supporting, not controlling
manner.

The DOI system was made for a perfect world that is closed and centrally
managed. It was made at a time when the idea of a World Wide Web was a bit more
unstable. It was made at a time when web archiving wasn't even a thing, let
alone a possible solution.

In the Commons, whatever you are building on should be available, so that as
you build on it, you retain an archived representation. Think of the things you
build upon as dependencies. Most often when trying to view a resource that has
been referenced, we want to see what it looked like when it was referenced.
Distributed web archiving seems like a perfect solution for this requirement,
would satisfy LOCKSS, and would provide a stable foundation of evidence while
not necessitating all of this stuff to perpetually remain available at its
original location. It will never break. There is still work to be done in this
area, but it seems like what the Commons should enable.

It's not that the Scholarly Commons prefers one system over another. But it is
that the Scholarly Commons prefers that which provides the least barriers to
participation. The other end of the stick is that the Scholarly Commons should
support whatever identifiers exist from whatever identification schemes exist.
Preferring and supporting are two different things. In short, the Scholarly
Commons follows the robustness principle.

[DOI]: <https://en.wikipedia.org/wiki/Digital_object_identifier> "Digital Object Identifier on Wikipedia"
[The DOI Website]: <http://www.doi.org>
[DOI standard]: <https://www.iso.org/standard/43506.html> "Digital object identifier system ISO standard"
[DOI standardization announcement]: <https://www.iso.org/news/2012/05/Ref1561.html>
[DOI whitepapers]: <http://www.doi.org/publications.html>
[crossref]: <https://www.crossref.org/blog/dois-unambiguously-and-persistently-identify-published-trustworthy-citable-online-scholarly-literature-right/>
[sarven-doi]: <http://csarven.ca/web-science-from-404-to-200#doi>
[doi-purl]: <http://www.doi.org/factsheets/DOI_PURL.html> "DOI® System and Persistent URLs (PURLs)"
[dns history]: <http://cyber.law.harvard.edu/icann/pressingissues2000/briefingbook/dnshistory.html>
[David Holtzman]: <http://www.pittmag.pitt.edu/spring2005/feature3.html>
[bad boys]: <http://www.nytimes.com/2001/04/23/business/technology-Internet-bad-boy-takes-on-a-new-challenge.html>
[stone evaluation]: <http://web.mit.edu/handle/www/purl-eval.html>
[distributed data store]: <https://en.wikipedia.org/wiki/Distributed_data_store> "Distributed data store on Wikipedia"
[cap theorem]: <https://en.wikipedia.org/wiki/CAP_theorem> "CAP theorem on Wikipedia"
[pacelc theorem]: <https://en.wikipedia.org/wiki/PACELC_theorem> "PACELC theorem on Wikipedia"
[Paul Mockapetris]: <https://en.wikipedia.org/wiki/Paul_Mockapetris> "Paul Mockapetris on Wikipedia"
[Linked Data]: <https://www.w3.org/DesignIssues/LinkedData.html> "Linked Data, by Tim Berners-Lee"
[oadoi]: <https://oadoi.org>
[Elizabeth Feinler]: <https://en.wikipedia.org/wiki/Elizabeth_J._Feinler> "Elizabeth Feinler was the director of the Network Information Center during the ARPANET era"
[Jon Postel]: <https://en.wikipedia.org/wiki/Jon_Postel>
[arpanet]: <https://en.wikipedia.org/wiki/ARPANET> "ARPANET on Wikipedia"
[LOCKSS]: <https://en.wikipedia.org/wiki/LOCKSS> "LOCKSS on Wikipedia"
[myRI]: <http://www.w3.org/2001/tag/doc/URNsAndRegistries-50>
[robustness principle]: <https://en.wikipedia.org/wiki/Robustness_principle> "Robustness Principle on Wikipedia"

[^herbert-doi-comment]:

    In response to <a href="http://csarven.ca/web-science-from-404-to-200#1186379419">a
    statement</a> in <a href="http://csarven.ca/web-science-from-404-to-200"><cite>Where is Web
    Science? From 404 to 200</cite></a> by Sarven Capadisli, Herbert Van de
    Sompel observed, '<q cite="https://linkedresearch.org/annotation/csarven.ca/web-science-from-404-to-200/11ed0985-80ba-4763-b692-b268a38e7e7b">Somehow,
    DOIs have taken on the role of delineating the scholarly record, making
    recognizable what is and what is not part of the record. They were not
    intended to provide that functionality but they somehow have taken on that
    role in an ad-hoc manner.</q>'

[^stone-evaluation]:

    He is right in saying that we shouldn't rely on PURLs to attach truly
    archival, long-lived names to network-accessible resources. With some few
    exceptions, let's just archive the resources and use the URIs to identify
    them directly, as is shown further on in this essay!

[^doi-pressure]:

    There is subtle pressure here to then only build upon scholarly outputs
    that can claim a DOI, limiting the scope of the scholarly conversation in a
    way that is very closed and exclusive. If this is perpetuated to the
    extreme, scholarship will never be able to transcend current scholarly
    circles. To an [open email list](https://groups.google.com/a/force11.org/forum/#!forum/f11discussion)
    Leslie Chan posted [the following insightful comment](https://groups.google.com/a/force11.org/d/msg/f11discussion/_jE0D4ns_RQ/f_yE86vFCQAJ):

    <div class="bq grab">

    > Thank you for putting into words so succinctly why I have been feeling
    > uncomfortable about the ORCID/DOI bandwagon. I was not able to put my
    > fingers on exactly why I felt uneasy when I see that some publishers are
    > demanding that authors acquired an ORCID before they can submit. While
    > ORCID is technically free to obtain, the social cost or fear of exclusion
    > is, I suspect, what drives many authors to sign up. This is not unlike FB
    > membership.
    >
    > This is a hypothesis only, but worth asking whether the growth in adoption
    > of ORCID is due to perceived advantages of ORCID, or perceived fear of
    > exclusion from being “counted”. Social pressure is indeed powerful,
    > especially when big publishers are behind driving up the pressure, and
    > institutions are addicted to auditing.
    >
    > I also think that the more these technologies (ORCID, DOI, Altmetrics, et.)
    > are bundled, the more we are locked in a dependent path of development and
    > dependency. I don’t have any technical background so I may be way off,
    > though I am speaking from a science and technology studies perspective,
    > where we can find many examples over time how “standards” are adopted not
    > because of technical superiority, but because of social and other community
    > norms. The web is supposed to be decentralized. Why do we want to keep
    > giving power to a small number of centralized entities?

    </div>
