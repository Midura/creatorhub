$html = [System.IO.File]::ReadAllText("f:\Website\contact.html", [System.Text.Encoding]::UTF8)

# Because we failed before, the HTML might be in a weird state. 
# We need to restore it or just do the replace safely.
# Actually, the previous script failed during string definition, so the file wasn't written!
# Wait, it did say "Successfully added" because the string definition threw an error but $html.Replace still ran with an empty or malformed string?
# Let's check if contact.html has the script tag.
