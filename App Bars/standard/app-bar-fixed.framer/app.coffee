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

# Initialize a variable to store the scroll content ordinate
storedOrdinateDown = scrollContent.screenFrame.y
storedOrdinateUp = scrollContent.screenFrame.y

# AppBar scrollable animation
scroll.onMove ->

	if scroll.direction is "down"
		# Translate toolBar ordinate on scroll delta
		appBar.y = scrollContent.screenFrame.y - storedOrdinateUp
		
		# Storing the scroll content ordinate when scrolling down
		storedOrdinateDown = scrollContent.screenFrame.y

	if scroll.direction is "up"
		# Translate toolBar ordinate on scroll delta
		appBar.y = scrollContent.screenFrame.y - storedOrdinateDown -
					appBar.height
		
		# Storing the scroll content ordinate when scrolling up
		storedOrdinateUp = scrollContent.screenFrame.y
	
	# Fixed toolBar
	if appBar.y > 0
		appBar.y = 0

# Change scroll.content properties
scroll.content.draggable.overdrag = false
scroll.content.draggable.bounce = false


