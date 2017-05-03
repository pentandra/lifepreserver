# Metadata descriptions for Nanoc items in this project

## Metadata relating to the HTML document

### `title`

The document title.

### `description`

A description of the content of the HTML `meta[@name="description"]` elements
as well as a short description of the document that is used as needed on the
site.

### `meta_description`

Overrides `description` when something more specific needs to said on the HTML
`meta[@name="description"]` element.

### `priority`

For the sitemap helper, the relative priority of the page.

### `change_freq`

For the sitemap helper, how often the page is expected to change.

## Metadata relating to document state

### `created_at`

When the document was created.

### `updated_at`

When the document had a meaningful edit.

### `published_at`

Blog posts are built in this system whether they are published or not, to allow
for private sharing before publication. Publishing a blog post does not change
the location of the document, but it does do the following:

1. Adds the post to the blog index
2. Adds the post to the recent thoughts
3. Adds the post to the RSS feed
4. Includes words from the post in the search index
5. Adds the post to the sitemap
6. Generates short links for sharing the document

In other words, it _publicates_ the post. After publishing, you may not change
the URL!!! If you must, please also add the appropriate HTTP redirection.

### `submitted_at`

When a proposal was submitted.

## Metadata relating to document provenance

### `author_name`

The name of the author.

### `kind`

The kind of document. Currently we have the following kinds of documents:

* `article`: a formal, scholarly document that can have multiple authors
* `essay`: a semiformal document with one author, higher quality
* `vignette`: similar to an essay, but with more of an artistic approach
* `blogpost`: an informal document with one author
* `note`: a short statement by one author, like a tweet
* `proposal`
* `project`
* `benefit-report`
* `tag`
* `tag-page` (distinct from tag as a concept)
* `author-page`
* `archive-page`
* `vocabulary`
* `dependency`
* `person`
* `base-dictionary`
* `extra-dictionary`
* `acronym-dictionary`

## Metadata relating to relationships between documents

### `cover_image_id`

An identifier for an image item that serves as a cover image for social media
sharing using the Open Graph Protocol and Twitter's thing. The image should
have an associated `yaml` file containing metadata about the image itself.

### `part_of_id`

This document is part of another document.

### `in_reply_to_id`

The item to which this proposal is in reply. Most of the time, this should
resolve to a document in the archive.
