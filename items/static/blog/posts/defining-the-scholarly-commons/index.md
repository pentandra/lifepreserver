---
title: Defining the Scholarly Commons
description: Introducing a series of vignettes to discuss the Scholarly Commons.
kind: blogpost
author_name: Chris Chapman
created_at: 2017-04-20
updated_at: 2017-11-03
cover_image_id: '/static/blog/posts/defining-the-scholarly-commons/1-Thierry-Noir-Howard-Griffin-Gallery_742_560_80_s_c1_smart_scale.jpg'
tags:
  - Scholarly Commons
  - Holism
  - FORCE11
  - Connections
---

<figure id="the-key-to-success" property="schema:sharedContent" class="img" resource="#the-key-to-success" typeof="schema:ImageObject">
  <link property="schema:representativeOfPage" resource="schema:True" />
  <meta property="schema:width" content="742 px" datatype="schema:Distance" />
  <meta property="schema:height" content="560 px" datatype="schema:Distance" />
  <meta property="schema:contentSize" content="51KB" />
  <img property="schema:contentUrl" class="static" alt="An elephant made of various parts with a large key in the middle representing the key to success" src="1-Thierry-Noir-Howard-Griffin-Gallery_742_560_80_s_c1_smart_scale.jpg" />
  <figcaption property="schema:caption"><b>Elephant Key</b>, a repainting of one of <span lang="fr">Thierry Noir</span>'s first paintings on the Berlin Wall, represents the key to success: hard work every day. Also brings to mind the well-known parable of <a href="https://en.wikipedia.org/wiki/Blind_men_and_an_elephant">the blind monks examining an elephant</a>, in which each monk reaches a different conclusion based upon which part of the elephant he examined. Image copyright © <a property="pav:retrievedFrom" href="http://howardgriffingallery.com/images/made/uploads/images/1-Thierry-Noir-Howard-Griffin-Gallery_742_560_80_s_c1_smart_scale.jpg">Howard Griffin Gallery</a>.</figcaption>
</figure>

A little over two years ago, FORCE11 received a grant to try to answer the
question, _are we ready to define the Scholarly Commons?_ I was invited to be
on the steering committee of a working group around this program, and to date
we have held four workshops in various parts of the world to try to gather
consensus on this topic with the hopes of answering this question in the
affirmative. Our intention was to design a new system of scholarly
communication from scratch as a system explicitly designed for machine-based
access and networked scholarship. But perhaps out of fear that few would adopt
a new system of scholarly communication if it looked too different from our
current system, we have yet to approach some fundamental questions and define
what it is that we're really talking about. Perhaps because there is [so much
at stake here][f11 discussion] and so many ways to do things wrong, it is
tempting to avoid risk and leave the responsibility on others to figure out the
details. But then we run the risk of not achieving what we could have achieved,
and all our work ending up insignificant and unhelpful in answering the really
important questions of how to actually do this.

It is with the hope that we can stir up the discussion that I am announcing
here a series of vignettes, to prompt the many fundamental discussions that
have not yet happened around this important topic, and to paint the picture of
the Scholarly Commons from various perspectives. Of course, we are painting
here with the broad stroke of our own opinion, and these vignettes do not
necessarily reflect the consensus of the Scholarly Commons Working Group. For
many of these subjects, these vignettes should be viewed as the first foray
onto the subject, and most definitely should _not_ be viewed as the last word
on any. The intent is to raise questions, open the discussion, and broaden our
collective horizons, with the hope that through this exercise, we can come to
some understanding as to which questions we need to be asking, and, not any
less important, how best to find answers to those questions. We may not agree
on all the answers to those questions or even how to go about obtaining them,
and I think that is okay. We all have different motivations for doing what we
do, and different desires for the outcomes of it all. But it is in our best
interest to come together, to come to an agreement on what the important
questions are, and to find shared practices and values with which to build a
foundation that would bring us together. Maybe the Scholarly Commons is not
something that any one of us can define, but is truth that needs to be
discovered---and it is the search for that truth that will hold us together.

<!--MORE-->

Here are a few questions that we're starting with. If you have other ideas that
you would like to discuss or see discussed, we invite you to share them. We
want to involve anyone that would like to be involved, and invite you to share
your voice openly. We're working on a mechanism to allow people to contribute
to this discussion without needing to ask for our permission :joy:.

<dl>
<% children_of(@item).sort_by { |c| c.identifier }.each do |post| %>
  <dt><%= link_to_if_published(post, published_blog_posts) %></dt>
  <dd><%= post[:description] %></dd>
<% end %>
</dl>

[f11 discussion]: <https://groups.google.com/a/force11.org/forum/#!topic/f11discussion/_jE0D4ns_RQ>
