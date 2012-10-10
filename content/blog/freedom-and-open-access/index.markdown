---
title: Freedom and Open Access
kind: article
author_name: Chris Chapman
created_at: 2012-10-05
updated_at: 2012-10-05
published: false
tags: 
  - Open Access
  - Opinionated
  - Genealogy
  - Essay
has_video: true
---
 
![Open Access Logo](openaccess.png){: .aside .static .img }
I have been thinking a lot about open access lately and how it relates to what
we are trying to accomplish at Pentandra. I'm not going to go into the details
of open access here---you can read about that
[elsewhere](http://en.wikipedia.org/wiki/Open_access)---but I do want to discuss
what it means to us and how that influences our approach to software design.

In general, academic research is being published the same way it has been
published since the beginning of academic publishing (or at least since
[Johannes Gutenberg](http://en.wikipedia.org/wiki/Johannes_Gutenberg) was
around). In recent years, the venerable research paper has evolved from a
simple paper publication to a complex digital publication as a PDF. This rather
small change has made research papers much cheaper to distribute, making ideas
like open access financially feasible. So when people talk about open access,
they are talking about offering the results of publicly-funded research
(research papers and sometimes the underlying data as well) to the public over
the Internet for free.

<!--MORE-->

We support the principles behind open access. It just makes sense for the
public to be able to have open access to the research it paid for in the first
place. Researchers like open access because it enables their research to have a
broader dissemination and a subsequently larger impact. Pretty much, the only
people that don't like it are the journal publishers.[^anti-OA] Open access
effectively flips their business model upside down.

The problem is that publishers don't want these research papers distributed
freely. They want them behind a paywall so they can continue to profit from
their business model, which is based primarily on journal subscriptions. This
approach has been working great for them for the last
<span class="oldstyle">100+</span> years. Making a profit is not bad---but
they are in a position to charge whatever they want for journals and get away 
with it. And they do. They get all the profits, but they do not add much
value[^pubvalue] to the research that is donated to them. Journal subscription
costs continue to rise <span class="oldstyle">5--7<span class="symbol">%</span></span>
each year as library budgets are shrinking. Yet these publishers have
consistently netted over <span class="oldstyle">35<span class="symbol">%</span></span>
per year, while all the refereeing, writing, and editing is done for them for
free by researchers. Large academic libraries in the UK (and I'm sure it is a
similar cost here in the states) end up paying over
<span class="oldstyle"><span class="symbol">£</span>1,000,000</span> a year
for research that was donated to these insatiable institutions, quite possibly
by members of their own faculty!

C'mon, publishers, are you so comfortable with the status quo that you require
legislation to perpetuate your antiquated business model? There are
[so many other options](http://gigaom.com/2012/03/26/dont-build-a-paywall-create-a-velvet-rope-instead/)
for monetizing the research and publication industry in more valuable ways!
Come down from your this-is-how-it-has-always-been-done ivory towers, stop
digging in your heels, and get with the <span class="oldstyle">21</span>st
century.

Putting their business practices aside, as a researcher, I don't want to shell
out <span class="oldstyle"><span class="symbol">$</span>8--30</span> per paper
when I don't even know beforehand whether the paper will significantly help my
research project. If I was not a student or faculty member of an academic
institution, where I had access to some of the more popular journals, I
probably would not risk the expense unless the paper's abstract was
particularly convincing.

When research is disseminated openly, the entry barrier to build upon that
research is lowered significantly. Anyone can access the research, with or
without an academic affiliation. Further research and innovation can then
accelerate more quickly and with less expense.

## Public Policy

So where does all this publicly-funded research come from? Well, the government
collects taxes from the public. These public funds are distributed by the
government to researchers in the form of grants, and because the government is
distributing the money, it sets the rules. Ideally, those rules would be in the
public interest. To give some context to our thoughts, let me summarize what is
being done about open access right now by governments around the world.

The UK and the European Union seem to be the most progressive in the promotion
of open access. The UK has pioneered efforts to legislate open access, having
mandated that all publicly-funded research will be offered openly by
<span class="oldstyle">2014</span>. Following their footsteps, the European
Commission has mandated open access dissemination of all research paid for by
its latest research initiative, named
<a href="http://ec.europa.eu/research/horizon2020/index_en.cfm?pg=home&video=none" rel="external">Horizon <span class="oldstyle">2020</span></a>.
It is hoped that other EU member states will follow suit.[^EU-OA]

In the US the situation is a little different. Several attempts have been made
to legislate open access. In <span class="oldstyle">2008</span>, a bill was
successfully passed that required that all NIH-funded research be submitted to
[PubMed Central](http://www.ncbi.nlm.nih.gov/pmc/), an open access repository
for the biomedical and life sciences. Following up from that win,[^NIH] the
[Federal Research Public Access Act](http://en.wikipedia.org/wiki/Federal_Research_Public_Access_Act),
which would mandate similar requirements across all the big governmental
funding agencies, has been introduced to US Congress three times up to this
point, but has not made it out of committee, primarily because of the lobbying
efforts of the Association of American Publishers.[^AAP]
The [White House was petitioned](https://petitions.whitehouse.gov/petition/require-free-access-over-internet-scientific-journal-articles-arising-taxpayer-funded-research/wDX82FLQ)
in May of this year to require open access to taxpayer-funded research,
effectually proposing the same thing as FRPAA. As of today, the White House has
yet to respond.

More recently, attempts have been made to promote *closed* access to
publicly-funded research.  The most caddish proposal was made right before the
holidays at the end of last year: the [Research Works Act](http://en.wikipedia.org/wiki/Research_Works_Act).[^RWA]
This act would prohibit any federal agency from mandating open access without
the consent of the publishers, in effect, giving publishers complete control to
restrict public access to all publicly-funded research. Oh, and not letting the
government have a say in it. This is complete troll-like behavior. The public
has paid for this bridge and the publishers want to make a profit off of anyone
who crosses, and they act as if they are entitled to do it. 

Recently, the governor of Georgia (state) announced that the Georgia State
Archives would be closed to the public due to budget cuts. They couldn't afford
to pay the staff. Over the last <span class="oldstyle">10</span> years, Georgia
has cut staff at the archives from <span class="oldstyle">53</span> employees
down to three.[^GSA]

What has the Georgia State Archives to do with open access? Everything. While a
lot of discussion on open access centers around research papers, a big part of
the equation is the [research data](/research/process/#p[DirGaf],h[DirGaf,1,2,DciDce,1]).
Without the data, there would be no papers! If the data is locked up in an
inaccessible archive, it sure makes it hard to access! Why does access to the
data matter? Because without the access, we can't use it. And all the research
that has used that data cannot be verified anymore, and future research cannot
be built reliably on top of it.

Closing the archives also sets a dangerous precedent for thoughtless
legislators to follow when looking for quick and easy budget cuts. Some say
that we are entering the
[beginning of the Dark Ages](http://www.nytimes.com/2012/09/27/us/budget-cuts-to-limit-public-access-to-georgia-archives.html?_r=0#p[WohFyo],h[WohFyo,1])
for public records. (If you have not done so already, please
[sign the petition](http://www.change.org/petitions/the-governor-of-ga-leave-our-state-archives-open-to-the-public)
to save the Georgia State Archives!)

## A Closer Look

Open access is a complicated and highly-debated topic right now. Many people
sit on both sides of the fence. A researcher may publish, referee, and even sit
on editorial boards, all at the same time! If you have a spare half-hour, this
is a good round-table discussion on open access that gives a deeper look into
some of the issues. If you don't have much time right now, feel free to pick a
question or two below that interests you and hear what they have to say:

* [Is open access a good idea?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=1m22s){: .oa-goodidea }
* [How much does open access cost?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=4m2s){: .oa-cost }
* [What is the Gold Open Access model?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=11m44s){: .oa-gold }
* [What can publishers do to add value?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=13m35s){: .oa-value }
* [How can authors afford Gold Open Access?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=15m31s){: .oa-afford }
* [Are publishers really necessary for open access?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=16m33s){: .oa-publishers }
* [What is the Green Open Access model?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=20m38s){: .oa-green }
* [Are publishers confident in their added value?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=21m24s){: .publisher-value }
* [Will open access put publishers out of business?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=22m43s){: .publisher-death }
* [What countries mandate open access right now?](http://www.youtube.com/watch?v=v31zpZ4woOI&t=26m39s){: .oa-promoters }

<figure id="ruvr">
    <video style="width:100%;height:100%;max-width:100%" id="player" preload="none" controls="controls">
      <source type="video/youtube" src="http://www.youtube.com/watch?v=v31zpZ4woOI" />
    </video>
  <figcaption class="small">
    <p> 

      The London Bureau of
      <a href="http://english.ruvr.ru/" rel="external">The Voice of Russia</a>
      interviews several open access advocates, including Ross Mounce, from the 
      <a href="okfn.org">Open Knowledge Foundation</a>, Rita Gardner, the
      director of the Royal Geographic Society, Bjorn Brembs, Professor at the
      Department of Genetics at the University of Leipzig, and Timothy Gowers,
      Math Professor at Cambridge University.

    </p>
  </figcaption>
</figure>

## Our Approach

So what does open access mean for us? How does it affect our software design
approach? This could be summed up in two points:

1. We believe that for many fields, the research paper is not a good fit for
   the dissemination of research. Research is an iterative process and an
   iterative model for research dissemination is a much better solution to the
   problem. This allows research conclusions to be published little by little,
   instead of in one monolithic publication.

2. While wikis are being used successfully for collaborative, iterative
   research dissemination in fields such as math, for many fields a wiki is not
   enough. A [wiki](http://en.wikipedia.org/wiki/Wiki) deals primarily with
   textual revisions and does not provide the structure to follow a research
   conclusion back through the research process to the underlying data the
   conclusion is based upon. Research semantics get lost, and
   [citations are just not enough](/research/#p[RsbOsr],h[RsbOsr,3]).
   We believe we have a solution to that problem.
   
### An Iterative Model

Over the last decade software development processes have evolved from a
[waterfall model](http://en.wikipedia.org/wiki/Waterfall_model) to more
[iterative](http://en.wikipedia.org/wiki/Iterative_and_incremental_development)
methodologies. People realized that it just didn't work to go through one giant
iteration when designing a complicated software system. It is much more
efficient to go through many small iterations through the development process.

Research is, by nature, iterative. It is very uncommon to come to a correct
conclusion to any sophisticated research question in one fell swoop. Yet the
research paper model promotes the idea that the research needs to be completely
finished before it can be published. For some research questions, that is a
good way to go, but for most, it is better to get the research out there to
enable collaboration in earlier phases of the research process. Things just get
done faster this way. As research progresses, the output is presented in an
incremental, natural way.

As practices in traditional research, the pre-publication peer review makes
more sense in a print paradigm, where a paper is printed once and can't be
changed after publication. While we are familiar with this paradigm, and much
of academia uses it, paper publications are just not a very good fit for the
research process. It was just all that was available at the time.

If you are not convinced, take a look at the open-source software movement. I
know that software is not research, but the underlying processes are very
similar. A software developer's research output is, if you will, the source
code. Using some sort of iterative methodology, the developer will piece little
bits of functionality together until, eventually, he will arrive at a
sophisticated product. The researcher "develops" conclusions in a similar
manner. I may have more to say about this in a later article.

### Beyond Wikis

Research is messy. Sometimes it just doesn't fit very well in a four page
research paper. While there are some excellent examples of the use of wikis in
research dissemination, such as [Scholarpedia](http://www.scholarpedia.org/),
wikis are still based on the research paper model. Collaboration occurs only
during the writing of the paper, and not during the whole research process. 

Our approach is to build software around the
[unit of research](/research/process/#unit). This gives research a natural
structure that can be shared or developed in an understandable and
collaborative way. This is an important distinction between
[true research software](/research/#p[WtrHwt],h[WtrHwt,2,3]) and wikis. While
it is possible to provide open access to a research paper and even to the
underlying research data by placing it on the web, if we fail to show _how_
they are connected, then we are failing to give people access to the research
and thought processes behind those research outputs. We need the whole research
[context](/research#context) to really understand those research outputs.

## Why Genealogy?

So where does genealogy fit in all this?

In many research fields, researchers advance their careers through journal
publication. Many of these journals are "held hostage" by some of the big
publishers, including Elsevier, Wiley, and Springer. However, genealogists do
not suffer with this blight. There are a few high-quality journals published in
the field, including the [National Genealogical Society Quarterly](http://www.ngsgenealogy.org/cs/ngsq)
and [The Genealogist](http://www.fasg.org/TheGenealogist.html). These journals
are published by genealogical societies or through universities, and the
peer-review process handled by the society. While the journals are highly
regarded, journal publications are not the primary path for career advancement
in genealogy. Most career advancement is done through private client research
and word-of-mouth.

Genealogy has traditionally been looked on as history's red-headed stepchild.
This is due in part to the large number of amateur researchers, and in part to
misunderstandings as to what good genealogical research looks like. But it has
become a very rigorous, multifaceted research field, the output of which other
fields grow increasingly dependent on.

We are starting with genealogy, first of all, because genealogists are looking
for more efficient and robust ways to collaborate and disseminate their
research. Their are fewer barriers for us to overcome because we don't have to
compete with a deeply entrenched, highly expensive journal as the primary means
for career advancement. We also view genealogy as a highly engaging research
field. I mean who doesn't care about the past and how their ancestors were
affected by it or how their ancestors affected the past? Our approach is not so
much about family trees (there are plenty of companies that do that), but it
could be called micro-history or generational history research (for more info
about that see [Geungle](/products#geungle)).

## Freedom

In that past (as in before the Internet), high-profile, prestigious journals
were the best way to get access to the latest research. Nowadays there are
faster and better ways to communicate and disseminate scholarly research, and
the big journal publishers are actually getting in the way and bottlenecking 
research dissemination. When it comes down to it, this is all about freedom.
There is just no good reason anymore why a third party should stand at the gate
of publicly-funded research, giving or denying access to whomsoever it wishes.
Any time there is someone arbitrarily regulating the free flow of information
(or research, in this case), we, as researchers, entrepreneurs, and citizens
will not have access to the information we need to make the best decisions in
our jobs, lives, and nations.

We, at Pentandra, are committed to designing research software from the ground
up with open access in mind. While there are some exciting advancements in
current research software,[^utopia] we think that these improvements are
transitional, and that the future of research lies in open,
[domain-specific](/research/#p[WtrHwt],h[WtrHwt,2]) research systems.

As always, I would love to hear your thoughts.
{: .conclusion }

## Footnotes

[^anti-OA]: Some publishers do support open access, primarily the "gold"
    variant, where the author pays the fee to publish his research. Then the
    publishers feel that they were paid enough to make it worth their while
    and the public does not need to pay anything for access.
    [More information about methods of financing open access](http://en.wikipedia.org/wiki/Open_access#Methods_of_financing_gold_open_access_publishing)
    can be found on Wikipedia.

[^AAP]: The Association of American Publishers was the 
    [primary opponent](http://en.wikipedia.org/wiki/Federal_Research_Public_Access_Act#Opposition)
    of the
    <a href="http://thomas.loc.gov/cgi-bin/query/z?c112:H.R.4004:" rel="external"><abbr>FRPAA</abbr></a>
    and the
    [proponent](http://en.wikipedia.org/wiki/Research_Works_Act#Reception)
    of the Research Works Act.

[^GSA]: Starting November <span class="oldstyle">1</span> of this year,
    [Georgia State Archives will lose seven](http://georgiaarchivesmatters.org/2012/09/27/the-staff-what-we-stand-to-lose/)
    of the remaining ten employees. At the same time, Georgia is spending
    upwards of <span class="oldstyle">$400</span> million in public funds to
    [build a new football stadium](http://www.bizjournals.com/atlanta/print-edition/2012/05/11/atlantas-proposed-new-football.html?page=all)
    instead of retrofitting the Georgia Dome with a retractable roof.

[^RWA]: The [Research Works Act](http://thomas.loc.gov/cgi-bin/bdquery/z?d112:HR03699:@@@L&summ2=m&)
    would in effect repeal <abbr>NIH</abbr>'s 
    <a href="http://publicaccess.nih.gov/policy.htm">open access policy</a>.
    Richard Price, <abbr>CEO</abbr> of [academia.edu](http://academia.edu),
    wrote about [some of the particular arguments](http://blog.academia.edu/post/17986108041/the-dangerous-research-works-act)
    against this bill. As a reaction to this bill and to being fed up with the
    injustices of the current system in general, some researchers set up a
    website to [boycott Elsevier](http://thecostofknowledge.com/), one of the
    primary promoters of the bill.

[^utopia]: Such as [Utopia Documents](http://utopiadocs.com/).

[^NIH]: While I do consider this a battle won, the policy requires only that
    the paper be submitted to PubMed within
    [twelve months of publication](http://publicaccess.nih.gov/policy.htm).
    While it is great that the research will be available eventually, twelve
    months is too long to wait for the latest research for most research
    organizations, so a subscription to the journal is still necessary.

[^pubvalue]: Most of the value added by publishers currently involves
    selecting and typesetting research papers, assigning a
    <a href="http://www.doi.org/"><abbr>DOI</abbr></a>, and organizing the
    peer-review process for those papers. While this is commendable, it is
    hardly worth the money they get paid for it.
    [Listen](http://www.youtube.com/watch?v=v31zpZ4woOI&t=13m35s){: .oa-value }
    to the discussion about the value that publishers currently add to the
    research dissemination process.

[^EU-OA]: The announcement of the mandate from the European Commission came
    only a day after the UK announced their new open access policy. The
    commission
    [hopes](http://www.nature.com/news/europe-joins-uk-open-access-bid-1.11022)
    that open access publishing by member states will reach 
    <span class="oldstyle">60<span class="symbol">%</span></span> by 
    <span class="oldstyle">2016</span>.

*[PDF]: Portable Document Format
*[FRPAA]: Federal Research Public Access Act
*[NIH]: National Institutes of Health
*[EU]:

<% content_for :javascripts do %>
<script>

(function() {

  var ruvr = document.getElementById('ruvr');
  var playerEl = document.getElementById('player');
  var player = new MediaElementPlayer(playerEl, {
    alwaysShowControls: true
  });

  function showVideoAndSeekTo(seconds) {

    if (withinViewport(ruvr)) {
        player.setCurrentTime(seconds);
    } else {
      $.smoothScroll({
        scrollTarget: ruvr,
        offset: $(ruvr).height() - $(window).height(),
        afterScroll: function() {
          player.setCurrentTime(seconds);
        }
      });
    }

    return false;
  }

  $("a.oa-goodidea").click(function(event) {
    return showVideoAndSeekTo(82);
  });

  $("a.oa-cost").click(function(event) {
    return showVideoAndSeekTo(242);
  });

  $("a.oa-gold").click(function(event) {
    return showVideoAndSeekTo(704);
  });

  $("a.oa-value").click(function(event) {
    return showVideoAndSeekTo(815);
  });

 $("a.oa-afford").click(function(event) {
    return showVideoAndSeekTo(931);
  });

  $("a.oa-publishers").click(function(event) {
    return showVideoAndSeekTo(993);
  });

 $("a.oa-green").click(function(event) {
    return showVideoAndSeekTo(1238);
  });

  $("a.publisher-value").click(function(event) {
    return showVideoAndSeekTo(1288);
  });

  $("a.publisher-death").click(function(event) {
    return showVideoAndSeekTo(1363);
  });

  $("a.oa-promoters").click(function(event) {
    return showVideoAndSeekTo(1599);
  });

}());

</script>
<% end %>
