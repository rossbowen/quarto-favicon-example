-- Using scripts works wonderfully.
-- The output HTML includes a reference to a copy of the script inside the
-- template_files directory.

quarto.doc.add_html_dependency({
	name = "example-js",
	scripts = { "example.js" },
})

-- resources does not behave in the same way.

-- href = "favicon.ico" copies the favicon into the template_files directory,
-- but the link added to the output uses an absolute reference to the incorrect
-- location.

-- This suggests I need to change the href.

-- I have tried a relative path href = "./favicon2.ico". The link here would
-- work if combined with the `format-resources` option in _extension.yml, but it
-- does not work when combined with the resources option in add_html_dependency.

-- I have also tried using quarto.utils.resolve_path(). This returns an absolute
-- path to the file, and this time uses the location of the file within the
-- _extensions directory. Absolute paths do not feel like the right solution.

quarto.doc.add_html_dependency({
	name = "favicon",
	resources = {
		{ name = "favicon.ico", path = "favicon.ico" },
		{ name = "favicon2.ico", path = "favicon2.ico" },
		{ name = "favicon3.ico", path = "favicon3.ico" },
	},
	links = {
		{
			rel = "icon",
			href = "favicon.ico",
		},
		{
			rel = "icon",
			href = "/favicon2.ico",
		},
		{
			rel = "icon",
			href = quarto.utils.resolve_path("favicon3.ico"),
		},
	},
})
