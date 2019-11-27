# Metadata descriptions for Nanoc items in this project

Terms in brackets are optional.

## General metadata

### `title`

The document title.

### `description`

A description of the content of the HTML `meta[@name="description"]` elements
as well as a short description of the document that is used as needed on the
site.

### [`meta_description`]

Overrides `description` when something more specific needs to said on the HTML
`meta[@name="description"]` element.

### [`priority`]

For the sitemap helper, the relative priority of the page. See the [sitemap
protocol][sitemap] for more information.

### [`change_freq`]

For the sitemap helper, how often the page is expected to change. See the
[sitemap protocol][sitemap] for more information.

### [`lang`]

The language of the document, formatted according to [BCP47]. Defaults to the
author's [`preferredlanguage`](#preferredlanguage) (if there is one) and then
to the `Locale.default` if not specified.

### `mtime`

The last modification time of the source (e.g. file) upon which an item's data
is based. Required for most data sources as a heuristic to know whether or not
to recompile dependent items.

## Metadata relating to document state

All time attributes SHOULD be fully qualified according to [RFC3339], either as
Coordinated Universal Time (UTC) or with a local offset, otherwise the object
values may be indeterminate, instantiated relative to the arbitrary time zone
of the current build machine.

### `created_at`

The date or time the document was created.

### `updated_at`

The most recent date or time that the document had a meaningful edit.

### [`published_at`]

The date or time the document was published. Syndicated items are built in this
system whether they are published or not, to allow for private sharing before
publication. Publishing a blog post does not change the location of the
document, but it does do the following:

1. Adds the post to the blog index
2. Adds the post to the recent thoughts
3. Adds the post to the RSS feed
4. Includes words from the post in the search index
5. Adds the post to the sitemap
6. Generates short links for sharing the document

In other words, it _publicates_ the post. After publishing, you may not change
the URL!!! If you must, please also add the appropriate HTTP redirection.

### [`submitted_at`]

If a proposal has been submitted, when it was.

## Metadata relating to inclusion of items in local indices

### [`is_hidden`]

If true, item is excluded from sitemap, feeds, search, and other local indices.
This attribute is set during the [preprocessing
phase](../rules/preprocessing.rb#L7) for many items that should be hidden.

### [`is_hidden_from_human_search`]

If true, item is only excluded from the search index.

## Metadata relating to document provenance

### `author_name`

The name of the author. Should be equal to the `name` of a [person
item](#metadata-relating-to-people-member-and-organization-items).

### `kind`

The kind of document. Currently we have the following kinds of documents:

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
* `event`
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

## Metadata relating to relationships between documents

### [`cover_image_id`]

An identifier for an image item that serves as a cover image for social media
sharing using the Open Graph Protocol and Twitter's thing. The image should
have an associated `yaml` file containing metadata about the image itself.

### [`part_of_id`]

This document is part of another document.

### [`in_reply_to_id`]

The item to which this proposal is in reply. Most of the time, this should
resolve to a document in the archive.

### [`redirect_to_id`]

The item to which this item should be redirected in some way. Required for
items with `kind: redirect`.

## Metadata relating to person, member, and organization items

Many of these terms and descriptions come from LDAP, defined in a bunch of
[RFCs][ldap rfcs], specifically [RFC2798], [RFC4519], and [RFC4524].

### `name`

The name that is most commonly used to refer to a person or organization.
Obtained, in order, from the LDAP `displayName` or `cn` or joining of the
`givenname` and `sn` for persons or the `o` value for organizations.

### `cn`

The full (common) name of the person or organization.

### `sn`

The surname (or family name) of a person. Required for persons.

### [`c`]

The two-letter [ISO3166] country code of the organization.

### [`description`]

A short description of the person, around 25 words long.

### [`displayname`]

The preferred name of a person.

### [`drink`]

The favorite drink of a person.

### [`edupersonorcid`]

The [ORCID iD] of a person.

### [`employeenumber`]

### [`employeetype`]

### [`generationqualifier`]

The suffix of a person's name, e.g. "III", "3rd.", "Jr.".

### [`givenname`]

The given names of a person, i.e. those names that are not the `sn`.

### [`initials`]

Initial letters of some or all of a person's given names (not the `sn`).

### [`jpegphoto`]

A binary value that depicts the person in a photo.

### [`l`]

The locality of an organization, such as city, county or other geographic
region.

### `mail`

The email address of the person.

### [`manager`]

The person's manager.

### [`mobile`]

The person's mobile telephone number.

### [`o`]

The primary organization to which the person belongs.

### [`ou`]

The organizational unit to which the person belongs.

### [`personaltitle`]

Specifies personal titles for a person, e.g. "Frau", "Dr.", "Herr",
"Professor".

### `pkey`

A list of public keys of user certificates. Constructed as an array that could
be empty.

#### `modulus`

The modulus (n) of the RSA public key.

#### `exponent`

The publicExponent (e) of the RSA public key.

#### `md5`

The MD5 digest of the DER-encoded RSA public key.

#### `sha1`

The SHA1 digest of the DER-encoded RSA public key.

#### `sha256`

The SHA256 digest of the DER-encoded RSA public key.

### [`postalcode`]

Codes used by a postal service to identify postal service zones of an
organization.

### [`preferredlanguage`]

The preferred language of a person. It is generally assumed that, unless
otherwise specified in the item's [`lang` attribute](#general-metadata),
syndicated items are written in the author's most preferred language. If the
person does not have a preferred language, the fallback is the default language
for the build.

The value should conform to the syntax for HTTP Accept-Language header values
as defined in [RFC2616], e.g. `fr, en-gb;q=0.8, en;q=0.7`.

### [`preferredtimezone`]

The time zone that a person normally inhabits, i.e. where they call home. It is
generally assumed that for syndicated items, any date or time will be relative
to the author's time zone, unless the time zone or UTC offset is explicitly
specified as part of the value. If the person does not have a preferred time
zone, the fallback is the default timezone for the build.

The value should conform to a definition in IANA's [Time Zone Database].

### `service_profiles`

A list of profiles provided for the person or organization by third-party
services, e.g. twitter. Constructed as an array that could be empty.

#### `uri`

The URI of the profile page, e.g. "https://twitter.com/cd_chapman".

#### `label`

The human-oriented label for the profile, e.g. "Twitter Profile".

#### `account_name`

The name of the account, e.g. "cd_chapman".

#### `class`

The class of the service, formed from the first word of the label, e.g.
"twitter". Used for locating a particular service.

#### `holder`

The name of the holder of the service account, the `display_name` of a person
or the `o` of an organization, e.g. "Chris Chapman".

#### `service_homepage`

The homepage of the service, e.g. "https://twitter.com/".

### `slug`

A safe (i.e. spaces and non-ASCII characters replaced) representation of a
person's `name` used for building the personal profile page path.

### [`st`]

Contains the full name of the state or province of an organization.

### [`street`]

Site information from a postal address, i.e. the street name, place, avenue,
and the house number.

### [`telephonenumber`]

The telephone number associated wih a person or organization. Should comply
with ITU Recommendation [E.123] or [E.164].

### [`title`]

The title of a person in their organizational context.

### [`web_id`]

The [WebID] of the person, if the person has one.

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
[RFC2616]: https://tools.ietf.org/html/rfc2616
[RFC2798]: https://tools.ietf.org/html/rfc2798
[RFC3339]: https://tools.ietf.org/html/rfc3339
[RFC4519]: https://tools.ietf.org/html/rfc4519
[RFC4524]: https://tools.ietf.org/html/rfc4524
[Time Zone Database]: https://www.iana.org/time-zones
