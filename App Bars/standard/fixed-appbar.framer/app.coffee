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

# Change scroll.content properties
scroll.content.draggable.overdrag = false
scroll.content.draggable.bounce = false