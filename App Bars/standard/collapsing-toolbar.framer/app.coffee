# Set up ScrollComponent
scroll = new ScrollComponent
	parent: StructureLayout
	scrollHorizontal: false
	size: Screen.size
	contentInset: 
		top: appBar.height

# Send the scroll layer behind all other layers
scroll.sendToBack()

# Position the scrollContent layer inside its parent
scrollContent.parent = scroll.content

# Initialize variables to store the on-screen app bar height
h = appBar.height
h1 = 0
h2 = 0

# Initialize variables to store the scroll layer ordinate
y1 =  80
y2 = 0

# AppBar scrollable animation
scroll.onMove (layer) ->

	if scroll.direction is "down"
		# Translate appBar ordinate
		appBar.y = Utils.modulate(layer.y, [y1, y1-h], [h1, -h], true)

		# Storing values
		y2 = Utils.round(layer.y, 0)
		h2 = appBar.height - appBar.maxY

	if scroll.direction is "up"
		# Translate appBar ordinate
		appBar.y = Utils.modulate(layer.y, [y2, y2+h2], [-h2, 0], true)

		# Storing values
		y1 = Utils.round(layer.y, 0)
		h1 = appBar.minY

# Change scroll.content properties
scroll.content.draggable.overdrag = false
scroll.content.draggable.bounce = false