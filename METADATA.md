# Metadata information

## Keys relating to HTML document metadata

### `title`

Used to set the document title

### `description`

Used to set the content of the HTML `meta[@name="description"]` elements as
well as a short description of the document that is used as needed on the site.

### `meta_description`

Overrides `description` when something more specific needs to said on the HTML
`meta[@name="description"]` element.

## Keys relating to document state

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
the URL!!! If you must, please also add an HTTP redirection.
