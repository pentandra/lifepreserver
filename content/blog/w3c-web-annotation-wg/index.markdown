---
title: W3C Web Annotation Working Group
description: Web annotations are really going to happen! Bring on the web.
kind: article
author_name: Chris Chapman
created_at: 2014-08-21
updated_at: 2014-08-29
published: false
tags:
  - Open Standards
  - W3C
  - Open Research
  - Technology
---

We are thrilled that one of the core building blocks that we are using for
Geungle made it into a [W3C working group](http://www.w3.org/annotation/)
yesterday! This is a great achievement, and in fact, Doug Schepers
[mentioned][schepers] that the <q
cite="http://lists.w3.org/Archives/Public/public-openannotation/2014Aug/0003.html">
charter broke the record for any charter review since W3C first started using
its polling system</q>. It has been a long road up to this point, and there is
still a good ways to go before it becomes a <a class="abbr"
href="http://www.w3.org/standards/faq#std">W3C Recommendation</a>, and is
adopted by the general Web community. This effort has taken many people working
together, and I want to especially thank the co-chairs of the [Open Annotation
Collaboration](http://www.openannotation.org/), Rob Sanderson, Paolo Ciccarese,
and Herbert Van de Sompel for their vision and inclusive approach. 

Since the [creation of the World Wide Web][oai8], not all has been
[peachy-keen][pk]. The original vision of the Web, according to Tim
Berners-Lee, was one of openness and collaboration, one of democracy and
egalitarianism. While there has been forward progress, there has also been [a
lot of backsliding][internet-lost].[^indiewebcamp]

<!--MORE-->

Web annotations have the potential to be a significant boon to this vision
because they give the content creator the choice of where and how to publish
their annotations. The publisher doesn't get to decide that, and must compete
on some basis other than vendor lock-in. This has enormous potential for moving
beyond [the current publishing paradigm](/blog/a-social-business/), which is
part of our [mission][mission]. In saying this, I would be remiss if I did not
mention the many technologies web annotations build on, including [RDF][RDF]
and [JSON-LD][JSON-LD].

## Annotations for Research

To understand why web annotations are useful for research, we need to look a
little deeper at what research _is_. The verb _research_ is from the Old French
<dfn id="def-recercher">recercher</dfn>, which means to _seek out_, or _search
closely_.[^term-research] The <dfn id="def-re-">re-</dfn> prefix means _back to
the original place; again, anew, once more_, also with sense of
_undoing_.[^term-re-] No wonder we beat our heads against the wall sometimes!
It often feels like we need to start over again for the umpteenth time.

So _seeking out_, or _searching closely_ implies that there is an object that
is being sought after. In research, this object is something that contains
[information][I] that might help in answering a [question][Q]. This object is
what is searched so closely, over and over, until _new_ knowledge, in the form
of a [conclusion][C], is obtained.

<figure about="<%= url_for @item %>higgsboson.jpeg" id="simulated-higgs" class="img" prefix="dc: http://purl.org/dc/terms/ cc: http://creativecommons.org/ns#">
  <img class="static" alt="CMS: Simulated Higgs to two jets and two electrons" src="higgsboson.jpeg" />
  <figcaption class="small">
    <b property="dc:title">CMS: Simulated Higgs to two jets and two electrons</b>
    by <a href="http://cern.ch" property="cc:attributionName" rel="cc:attributionURL dc:creator">CERN</a>.
    <span property="dc:description">Here a Higgs boson is produced which decays
    into two jets of hadrons and two electrons. The lines represent the
    possible paths of particles produced by the proton-proton collision in the
    detector while the energy these particles deposit is shown in blue.</span>
    Licensed under a 
    <a property="cc:license" rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">CC-BY-SA license.</a>
    <span class="icon-cc"></span><span class="icon-cc-by"></span><span class="icon-cc-sa"></span>
  </figcaption>
</figure>

If you are trying to understand [the weak force][weak-force], you need [a
really large particle accelerator][LHC]. If you are trying to piece together
the past, you need all the artifacts from that time that you can get your hands
on. Once information is obtained the process of finding answers using that
information is surprisingly similar. Really the only thing that differentiates
the research domains from each other is what that information is and how that
information is obtained.

Web annotations let us build on top of these existing sources of information.
They are domain agnostic, so it doesn't matter whether the information I am
dealing with involves census records or high-speed proton collisions. Web
annotations do not change the data or documents that they point to. Since web
annotations are creative works, so the annotation creator is at liberty to
choose how (or if) to license an annotation, just like any other content on the
web. This makes it possible to share annotations of images in paywalled image
repositories. (Yes, I'm looking at you.)

So to conclude, web annotations are fundamental for collaborative, open
research. They have the potential to revolutionize the way that research is
published. They are lightweight and distributed. They are awesome. Bring on the
Web!
{: .conclusion }

<figure about="<%= url_for @item %>annotation-architecture.svg"
vocab="http://creativecommons.org/ns#" id="annotation_architecture" class="section">
  <div class="embed-container wideScreen"> 
    <iframe src="annotation-architecture.svg" class="simple static"></iframe>
  </div>
  <figcaption class="small">
    <b>Web Annotation Architecture</b>,
    an infographic from the W3C about web annotations. 
    <a href="annotation-architecture.svg">Display fullscreen</a> for the best
    viewing experience.
    Licensed under a
    <a property="http://creativecommons.org/ns#license" rel="license" href="http://creativecommons.org/publicdomain/zero/1.0/">CC0 license.</a> 
    <span class="icon-cc"></span><span class="icon-cc-zero"></span>
  </figcaption>
</figure>

## Notes

[^indiewebcamp]: One notable example of an initiative to take the web back to its roots is the [IndieWeb](http://indiewebcamp.com/).
[^term-research]: _research_, from the [Online Etymology Dictionary](http://www.etymonline.com/index.php?term=research).
[^term-re-]: _re-_, from the [Online Etymology Dictionary](http://www.etymonline.com/index.php?term=re-)

[internet-lost]: http://www.theguardian.com/technology/2014/aug/24/internet-lost-its-way-tim-berners-lee-world-wide-web "How the web lost its way–and its founding principles"
[pk]: http://www.oxforddictionaries.com/definition/american_english/peachy-keen 
[RDF]: http://en.wikipedia.org/wiki/Resource_Description_Framework
[JSON-LD]: http://json-ld.org/
[oai8]: /blog/heading-to-oai8/#p[TsrKoa],h[TsrKoa] "A little about the beginnings of the WWW"
[schepers]: http://lists.w3.org/Archives/Public/public-openannotation/2014Aug/0003.html
[mission]: /company#mission
[I]: /research/process/#p[IiiIsb]
[Q]: /research/process/#p[TetAwc],h[TetAwc]
[C]: /research/#p[RifNmw],h[RifNmw,3]
[LHC]: http://home.web.cern.ch/topics/large-hadron-collider "Expensive information"
[weak-force]: http://en.wikipedia.org/wiki/Weak_interaction

*[W3C]: World Wide Web Consortium
*[RDF]: Resource Description Framework
*[JSON-LD]: JSON for Linking Data
*[CERN]: The European Organization for Nuclear Research
*[CC-BY-SA]: Creative Commons Attribution-ShareAlike
