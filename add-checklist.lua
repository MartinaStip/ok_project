function Meta(meta)
  if meta.author then
    local checklist = pandoc.RawBlock('latex', 
      '\\vspace{1em}\n' ..
      '{\\normalsize\n' ..
      '\\textbf{Režim přístupnosti}\\\\[0.5em]\n' ..
      '☑ Vedení ZČU\\\\\n' ..
      '☑ Vedení součástí\\\\\n' ..
      '☐ Zaměstnanci\\\\\n' ..
      '☐ Studující\n' ..
      '\\par}\\clearpage\n'
    )
    meta['include-before'] = pandoc.MetaBlocks{checklist}
  end
  return meta
end