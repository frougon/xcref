#!/usr/bin/env texlua

-- Build script for the 'xcref' package

-- Identify the bundle and module
bundle = ""
module = "xcref"

-- Files to install to the tex area of the texmf tree
installfiles = {"*.sty", "xcref-*.tex"}

-- We need two LaTeX runs for the automated tests
checkruns = 2
-- Currently, the LuaTeX and XeTeX engines introduce differences that have
-- nothing to do with xcref but would cause the tests to fail
checkengines = {"pdftex"}
-- Commented out because of <https://github.com/latex3/l3build/issues/90>
-- recordstatus = true

demofiles = {"examples/example-*.tex"}

-- Add a few patterns to the default, which is "*.log", "*.pdf", "*.zip
cleanfiles = {"*.aux", "*.glo", "*.hd", "*.idx", "*.ilg", "*.ind", "*.out",
              "*.toc", "*.log", "*.pdf", "*.zip"}

-- Release a TDS-style zip
packtdszip = true

-- Be explicit for the tagging list
tagfiles = {"xcref.dtx"}

-- The command 'l3build tag <tagname>' can perform automatic replacements:
function update_tag(file,content,tagname,tagdate)
  return string.gsub(content,
    "\n\\ProvidesExplPackage%{xcref%}%{[^}]+%}%{[^}]+%}",
    "\n\\ProvidesExplPackage{xcref}{"
      .. tagdate .. "}{" .. string.gsub(tagname, "^v", "") .. "}")
end

function tag_hook(tagname)
-- os.execute('git commit -a -m "Step tag"')
-- os.execute('git tag -a -m "" ' .. tagname)
end

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
