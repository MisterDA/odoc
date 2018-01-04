(** Here, we test the rendering of comment markup. *)


(** {2 Sections}

    Let's get those done first, because sections will be used to break up the
    rest of this test.

    Besides the section heading above, there are also

    {3 Subsection headings}

    and

    {4 Sub-subsection headings}

    but odoc has banned deeper headings. There are also title headings, but they
    are only allowed in mld files.


    {2 Styling}

    This paragraph has some styled elements: {b bold} and {i italic},
    {b {i bold italic}}, {e emphasis}, {e {e emphasis} within emphasis},
    {b {i bold italic}}, super{^script}, sub{_script}. The line spacing should
    be enough for superscripts and subscripts not to look odd.

    [code] is a different kind of markup that doesn't allow nested markup.

    It's possible for two markup elements to appear {b next} {i to} each other
    and have a space, and appear {b next}{i to} each other with no space. It
    doesn't matter {b how}  {i much} space it was in the source: in this
    sentence, it was two space characters. And in this one, there is {b a}
    {i newline}.

    Code can appear {b inside [other] markup}. Its display shouldn't be
    affected.


    {2 Links and references}

    This is a {{:#} link}. It sends you to the top of this page. Links can have
    markup inside them: {{:#} {b bold}}, {{:#} {i italics}},
    {{:#} {e emphasis}}, {{:#} super{^script}}, {{:#} sub{_script}}, and
    {{:#} [code]}. Links can also be nested {e {{:#} inside}} markup. Links
    cannot be nested inside each other. This link has no replacement text:
    {{:#}}. The URL is filled in by odoc.

    This is a reference to {!foo}. References can have replacement text:
    {{!foo} the value foo}. Except for the special lookup support, references
    are pretty much just like links. The replacement text can have nested
    styles: {{!foo} {b bold}}, {{!foo} {i italic}}, {{!foo} {e emphasis}},
    {{!foo} super{^script}}, {{!foo} sub{_script}}, and {{!foo} [code]}. It's
    also possible to surround a reference in a style: {b {!foo}}. References
    can't be nested inside references, and links and references can't be nested
    inside each other.


    {2 Preformatted text}

    This is a code block:
{[
let foo = ()
(** There are some nested comments in here, but an unpaired comment
    terminator would terminate the whole doc surrounding comment. It's
    best to keep code blocks no wider than 72 characters. *)
]}

    We still need to add syntax highlighting. That should be its own test.

    There are also verbatim blocks:

{v
The main difference is these don't get syntax highlighting.
v}


    {2 Lists}

    - This is a
    - shorthand bulleted list,
    - and the paragraphs in each list item support {e styling}.

    + This is a
    + shorthand numbered list.

    - Shorthand list items can span multiple lines, however trying to put two
      paragraphs into a shorthand list item using a double line break

      just creates a paragraph outside the list.

    - Similarly, inserting a blank line between two list items

    - creates two separate lists.

    {ul
      {li To get around this limitation, one

          can use explicitly-delimited lists.}
      {li This one is bulleted,}}

    {ol {li but there is also the numbered variant.}}

    {ul
      {li
        {ul
          {li lists}
          {li can be nested.}}}}


    {2 Unicode}

    The parser supports any ASCII-compatible encoding, in particuλar UTF-8.


    {2 Tags}

    Each comment can end with zero or more tags. Here are some examples:

    @author antron
    @deprecated a {e long} time ago
    @param foo unused
    @raise Failure always
    @return never
    @see <#> this url
    @see 'foo.ml' this file
    @see "Foo" this document
    @since 0
    @before 1.0 it was in b{^e}t{_a}
    @version -1 *)

val foo : unit
(** Comments in structure items {b support} {e markup}, t{^o}{_o}. *)