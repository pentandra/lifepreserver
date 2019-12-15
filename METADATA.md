# Metadata descriptions for items in the [LifePreserver project](README.md)

The key words "REQUIRED_FOR_KINDS" "RECOMMENDED_FOR_KINDS", and
"OPTIONAL_FOR_KINDS" in this document specify for which [kinds](#kind) of items
the attribute is REQUIRED, RECOMMENDED, or OPTIONAL, respectively, for the best
functionality and interoperability of items within the project.

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in [RFC2119].

## General metadata

### `title`

REQUIRED_FOR_KINDS: all

The item title.

### `full_title`

Overrides the [`title`](#title) attribute on the [base HTML
layout](layouts/base.erb) as the full value of the default HTML `title`
element.

### `short_title`

Overrides the [`title`](#title) attribute in certain layouts when a shorter
title is needed, e.g. the search page.

### `description`

REQUIRED_FOR_KINDS: all

A description of the content of the HTML `meta[@name="description"]` elements
as well as a short description of the item that is used as needed on the
site.

### `meta_description`

OPTIONAL_FOR_KINDS: all

Overrides [`description`](#description) when something more specific or
descriptive needs to said on the HTML `meta[@name="description"]` element.

### `priority`

OPTIONAL_FOR_KINDS: all

For the [sitemap helper](lib/helpers/xml_sitemap.rb), the relative priority of
the page. Valid values range from 0.0 to 1.0, with the default being 0.5.

> This value does not affect how your pages are compared to pages on other
> sites—it only lets the search engines know which pages you deem most
> important for the crawlers.
>
> Please note that the priority you assign to a page is not likely to influence
> the position of your URLs in a search engine's result pages. Search engines
> may use this information when selecting between URLs on the same site, so you
> can use this tag to increase the likelihood that your most important pages
> are present in a search index.
>
> Also, please note that assigning a high priority to all of the URLs on your
> site is not likely to help you. Since the priority is relative, it is only
> used to select between URLs on your site.

See the [sitemap protocol][sitemap] for more information.

### `change_freq`

OPTIONAL_FOR_KINDS: all

For the [sitemap helper](lib/helpers/xml_sitemap.rb), how often the page is
expected to change.

> This value provides general information to search engines and may not
> correlate exactly to how often they crawl the page. Valid values are:
>
> * `always`
> * `hourly`
> * `daily`
> * `weekly`
> * `monthly`
> * `yearly`
> * `never`
>
> The value `always` should be used to describe documents that change each time
> they are accessed. The value `never` should be used to describe archived
> URLs.
>
> Please note that the value of this tag is considered a hint and not a
> command. Even though search engine crawlers may consider this information
> when making decisions, they may crawl pages marked `hourly` less frequently
> than that, and they may crawl pages marked `yearly` more frequently than
> that. Crawlers may periodically crawl pages marked `never` so that they can
> handle unexpected changes to those pages.

See the [sitemap protocol][sitemap] for more information.

### `lang`

OPTIONAL_FOR_KINDS: all

The language of the document, formatted according to [BCP47]. Defaults to the
author's [`preferredlanguage`](#preferredlanguage) (if there is one) and then
to the `Locale.default` if not specified.

### `mtime`

REQUIRED_FOR_KINDS: `{base,extra,acronym,personal}-dictionary` and all items from Nanoc's filesystem data source.

The last modification time of the source (e.g. file) upon which an item's data
is based. Required as a heuristic to know when to recompile dependent items.

## Relating to item state

Attributes relating to item state MAY use either Date or Time objects, in
accordance with the [W3C Datetime] format.

All time attributes SHOULD be fully qualified according to [RFC3339], either as
Coordinated Universal Time (UTC) or with a local offset, otherwise the object
values may be indeterminate, instantiated relative to the arbitrary time zone
of the current build machine.

### `created_at`

REQUIRED_FOR_KINDS: `abstract`, `article`, `benefit-report`, `blogpost`, `essay`, `note`, `presentation`, `project`, `proposal`, `specification`

The date or time the item was created.

### `updated_at`

REQUIRED_FOR_KINDS: `abstract`, `article`, `benefit-report`, `blogpost`, `essay`, `note`, `presentation`, `project`, `proposal`, `specification`

The most recent date or time that the item had a meaningful edit.

### `published_at`

REQUIRED_FOR_KINDS: `article`, `benefit-report`, `blogpost`, `essay`, `note`, `presentation`

The date or time the item was published. Syndicated items are built in this
system whether they are published or not, to allow for private sharing before
publication. Publishing a item does not change the URL of the output, but it
does do the following:

1. Adds the item to the blog index
2. Adds the item to the index of recent thoughts
3. Adds the item to respective Atom syndication feeds
4. Includes words from the item in the search index
5. Adds the items to the sitemap
6. Generates short links for sharing the item

In other words, it _publicates_ the item. After publishing, the item's public
path (and Atom tag identifier) SHOULD NOT change. If the situation requires
that the URL change, a `redirect` item SHALL be added at the original location
to apply an appropriate HTTP redirection.

### `submitted_at`

REQUIRED_FOR_KINDS: `abstract`, `proposal`

If a proposal has been submitted, the date or time it was.

### `starts_at`

REQUIRED_FOR_KINDS: `event`

The date or time of the start of the event.

### `ends_at`

REQUIRED_FOR_KINDS: `event`

The date or time of the end of the event.

## Relating to inclusion of items in local indices

### `is_hidden`

OPTIONAL_FOR_KINDS: all

If true, item is excluded from sitemap, feeds, search, and other local indices.
This attribute is set during the [preprocessing
phase](rules/preprocessing.rb#L7) for many items that should be hidden.

### `is_hidden_from_human_search`

OPTIONAL_FOR_KINDS: all

If true, item is only excluded from the search index.

## Relating to item provenance

### `author_name`

REQUIRED_FOR_KINDS: `article`, `blogpost`, `essay`, `note`, `presentation`

The name of the author. Should be equal to the [`name`](#name) of a `person` or
`member` item.

### `author_uri`

REQUIRED_FOR_KINDS: `article`, `blogpost`, `essay`, `note`, `presentation`

The URI of the author. A convenience attribute that, if not set on the item,
defaults to the [`web_id`] of the author.

### `feed_url`

OPTIONAL_FOR_KINDS: `feed`

Allows the feed URL (the `link[@rel=self]` value of the feed) to be set to some
other URL, such as an external distribution endpoint. If not set, it defaults
to the path of the feed item.

### `kind`

REQUIRED_FOR_KINDS: all

The kind of item. Currently we have the following kinds:

* `abstract`: a short proposal.
* `acronym-dictionary`: a key-value lookup dictionary of acronyms.
* `archive-page`
* `article`: a formal, scholarly document that can have multiple authors
* `base-dictionary`: a regular Hunspell dictionary.
* `benefit-report`: an annual corporate benefit report.
* `blogpost`: an informal document with one author
* `concept`: an abstract item (with a URI) denoting a concept.
* `dependency`: an application dependency.
* `essay`: a semiformal document with one author, higher quality
* `event`: a business event that occurs at a specific place and time.
* `extra-dictionary`: a custom dictionary that extends a Hunspell base dictionary.
* `feed`: an Atom feed.
* `member`: a member of the company (Pentandra).
* `note`: a short statement by one author, like a tweet
* `organization`: an organization.
* `person`: A person that's not a member of the company.
* `personal-profile-page`: a foaf [personal profile document][foaf:profile].
* `presentation`
* `project`
* `proposal`: a formal proposal from the company.
* `redirect`: a permanent (301) redirect.
* `specification`
* `tag-page` (distinct from tag as a concept)
* `tag`: the tag itself (a controlled concept)
* `vocabulary`: an item that represents an RDF ontology.

### `license`

OPTIONAL_FOR_KINDS: all

A URI for a specific machine-readable license for an item. Defaults to
[Creative Commons Attribution 4.0 International][CC-BY], unless otherwise
specified.

### `license_type`

OPTIONAL_FOR_KINDS: all

The mimetype of the [`license`](#license) resource.

### `rights`

OPTIONAL_FOR_KINDS: all

A human-readable assertion of rights held over the content of the item.
Defaults to the following (or similar) unless otherwise specified:

>  Copyright © 2011–2019 Pentandra Research Solutions, Inc. All content, except
>  where otherwise noted, is licensed under a Creative Commons Attribution 4.0
>  International license.

## Relating to relationships between items and other resources

### `cover_image_id`

RECOMMENDED_FOR_KINDS: all

An identifier for an image item that serves as a cover image for social media
sharing using the Open Graph Protocol. The image item SHOULD have an associated
`yaml` file containing additional metadata about the image, including:

#### `width`

The width of the image, in pixels.

#### `height`

The height of the image, in pixels.

#### `size`

The size of the image, in bytes.

#### `alt`

An alternative text description of the image, to be used in the `@alt`
attribute of the HTML \<img\> element.

### `alternate_url`

RECOMMENDED_FOR_KINDS: `feed`

Allows the alternate URL (the `link[@rel=alternate]` value of the feed) to be
set to some other URL, such as an HTML representation of the feed. If not set
explicitly, it will default to the parent directory of the feed and the web
server will redirect to an index page at the same level of the path component
of the [`feed URL`](#feed_url).

### `in_reply_to_id`

OPTIONAL_FOR_KINDS: `abstract`, `proposal`

The item to which this proposal is in reply. It is RECOMMENDED for this value
to resolve to a document in the archive.

### `part_of_id`

OPTIONAL_FOR_KINDS: all

This item is part of another item.

### `redirect_to_id`

REQUIRED_FOR_KINDS: `redirect`

The identifier of the item to which this item should be redirected in some way.

### `tags`

OPTIONAL_FOR_KINDS: `article`, `blogpost`, `essay`, `note`, `presentation`

An array of names for authors to tag related items. Uses a controlled set of
tags defined in [tags.yaml](etc/tags.yaml).

## Relating to person, member, and organization items

Many of these terms and descriptions originate from LDAP specifications,
primarily [RFC2798], [RFC4519], and [RFC4524]. Additional restrictions and/or
semantics may be expressed for this context.

### `name`

REQUIRED_FOR_KINDS: `person`, `member`, `organization`

The name that is most commonly used to refer to a person or organization.
Constructed in the [Company][Company data source] or [People][People data source]
data sources from the LDAP [`displayName` attribute](#displayname) or
[`cn` attribute](#cn), or by the [`o` attribute](#o) for organizations or the
joining of the [`givenname` attribute](#givenname) and [`sn` attribute](#sn)
for persons.

### `cn`

REQUIRED_FOR_KINDS: `person`, `member`, `organization`

The full (common) name of the person or organization.

### `sn`

REQUIRED_FOR_KINDS: `person`, `member`

The surname (or family name) of a person.

### `c`

RECOMMENDED_FOR_KINDS: `organization`

The two-letter [ISO3166] country code.

### `description`

RECOMMENDED_FOR_KINDS: `person`, `member`, `organization`

A short description of the person, around 25 words long.

### `displayname`

RECOMMENDED_FOR_KINDS: `person`, `member`

The preferred name of a person.

### `drink`

OPTIONAL_FOR_KINDS: `person`, `member`

The favorite drink of a person.

### `edupersonorcid`

OPTIONAL_FOR_KINDS: `person`, `member`

The [ORCID iD] of a person.

### `generationqualifier`

OPTIONAL_FOR_KINDS: `person`, `member`

The suffix of a person's name, e.g. "III", "3rd.", "Jr.".

### `givenname`

RECOMMENDED_FOR_KINDS: `person`, `member`

The given names of a person, i.e. those names that are not the `sn`.

### `initials`

RECOMMENDED_FOR_KINDS: `person`, `member`

Initial letters of some or all of a person's given names (not the `sn`).

### `jpegphoto`

RECOMMENDED_FOR_KINDS: `person`, `member`

A binary value that depicts the person in a photo.

### `l`

RECOMMENDED_FOR_KINDS: `organization`

The locality of an organization, such as city, county or other geographic
region.

### `mail`

RECOMMENDED_FOR_KINDS: `person`, `member`, `organization`

The email address.

### `manager`

OPTIONAL_FOR_KINDS: `person`, `member`

The person's manager.

### `mobile`

OPTIONAL_FOR_KINDS: `person`, `member`

The person's mobile telephone number.

### `o`

RECOMMENDED_FOR_KINDS: `person`, `member`

The primary organization to which the person belongs.

### `ou`

RECOMMENDED_FOR_KINDS: `person`, `member`

The organizational unit to which the person belongs.

### `personaltitle`

OPTIONAL_FOR_KINDS: `person`, `member`

Specifies personal titles for a person, e.g. "Frau", "Dr.", "Herr",
"Professor".

### `pkey`

RECOMMENDED_FOR_KINDS: `member`

A list of public keys extracted from user certificates. Constructed as an array
containing `Hash` objects with the following keys, each representing an x509
public key.

This array could be empty if the member has no valid user certificates.

#### `id`

The URI subject alternative name definitively bound to the public key. The `id`
of the first element of the [`pkey`](#pkey) is used as the value of the user's
[`web_id`](#web_id) attribute.

#### `modulus`

The modulus (n) of the RSA public key, as a hex binary string.

#### `exponent`

The publicExponent (e) of the RSA public key, as an integer.

#### `md5`

The MD5 digest identifier of the DER-encoded RSA public key.

#### `sha1`

The SHA1 digest identifier of the DER-encoded RSA public key.

#### `sha256`

The SHA256 digest identifier of the DER-encoded RSA public key.

### `postalcode`

RECOMMENDED_FOR_KINDS: `organization`

Codes used by a postal service to identify postal service zones of an
organization.

### `preferredlanguage`

RECOMMENDED_FOR_KINDS: `person`, `member`

The preferred language of a person. It is generally assumed that, unless
otherwise specified in the item's [`lang` attribute](#lang), syndicated items
are written in the author's most preferred language. If the person does not
have a preferred language, the fallback is the default language for the build.

The value should conform to the syntax for HTTP Accept-Language header values
as defined in [RFC2616], e.g. `fr, en-gb;q=0.8, en;q=0.7`.

### `preferredtimezone`

RECOMMENDED_FOR_KINDS: `person`, `member`

The time zone that a person normally inhabits, i.e. where they call home. It is
generally assumed that for syndicated items, any date or time will be relative
to the author's time zone, unless the time zone or UTC offset is explicitly
specified as part of the value. If the person does not have a preferred time
zone, the fallback is the default timezone for the build.

The value should conform to a definition in IANA's [Time Zone Database].

### `service_profiles`

OPTIONAL_FOR_KINDS: `person`, `member`, `organization`

A list of profiles provided for the person or organization by third-party
services, e.g. twitter. Constructed as an array containing `Hash` objects with
the following keys, each representing a service profile. This array could be
empty if the member has no third-part service profiles.

Composed from LDAP `labeledURI` values that have the word _Profile_ in the
label.

#### `uri`

The URI of the profile page, e.g. "https://twitter.com/cd_chapman".

#### `label`

The human-oriented label for the profile, e.g. "Twitter Profile".

#### `account_name`

The name of the account, e.g. "cd_chapman".

#### `class`

The class of the service, formed from the first word of the label, e.g.
"twitter". Used for locating a particular service.

#### `service_homepage`

The homepage of the service, e.g. "https://twitter.com/".

### `slug`

REQUIRED_FOR_KINDS: `person`, `member`

A safe (i.e. spaces and non-ASCII characters replaced) representation of a
person's `name` used for building the personal profile page path. Constructed
in the [Company][Company data source] or [People][People data source] data
sources from from the item's [`name` attribute](#name).

### `st`

RECOMMENDED_FOR_KINDS: `organization`

Contains the full name of the state or province of an organization.

### `street`

RECOMMENDED_FOR_KINDS: `organization`

Site information from a postal address, i.e. the street name, place, avenue,
and the house number.

### `telephonenumber`

OPTIONAL_FOR_KINDS: `person`, `member`, `organization`

The telephone number associated wih a person or organization. Format SHOULD
comply with ITU Recommendation [E.123] or [E.164].

### `title`

RECOMMENDED_FOR_KINDS: `person`, `member`

The title of a person in their organizational context.

### `web_id`

REQUIRED_FOR_KINDS: `person`, `member`

The [WebID] of the person, or local Web identifier if not known. For members
with user certificates, the value is from the URI subject alternative name
[URI value](#id) of [the x509 certificate](#pkey). For other people, the
attibute is added directly to the [people.yaml](var/people.yaml) file.

### [`hashtag`]

The fragment identifier to use to identify the person denoted by the WebID. By
default uses the identifier `me`.

[BCP47]: https://tools.ietf.org/html/bcp47
[WebID]: https://www.w3.org/2005/Incubator/webid/spec/identity/
[foaf:profile]: http://xmlns.com/foaf/spec/#term_PersonalProfileDocument
[sitemap]: https://www.sitemaps.org/protocol.html
[ldap rfcs]: https://ldap.com/ldap-related-rfcs/
[ORCID iD]: https://orcid.org/
[ISO3166]: https://www.iso.org/iso-3166-country-codes.html
[E.123]: https://www.itu.int/rec/T-REC-E.123
[E.164]: https://www.itu.int/rec/T-REC-E.164
[RFC2119]: https://tools.ietf.org/html/rfc2119
[RFC2616]: https://tools.ietf.org/html/rfc2616
[RFC2798]: https://tools.ietf.org/html/rfc2798
[RFC3339]: https://tools.ietf.org/html/rfc3339
[RFC4519]: https://tools.ietf.org/html/rfc4519
[RFC4524]: https://tools.ietf.org/html/rfc4524
[Time Zone Database]: https://www.iana.org/time-zones
[Company data source]: lib/data_sources/company.rb
[People data source]: lib/data_sources/people.rb
[W3C Datetime]: https://www.w3.org/TR/NOTE-datetime
[CC-BY]: http://creativecommons.org/licenses/by/4.0/
[dictionaries]: lib/data_sources/dictionaries.rb
