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

# Initialize variables to store the scroll content ordinate
storedOrdinateDown = scrollContent.screenFrame.y
storedOrdinateUp = scrollContent.screenFrame.y

# Initialize variables to store the off-screen app bar height
storedOffScreenDown = 0
storedOffScreenUp = 0

# AppBar scrollable animation
scroll.onMove ->
	
	if scroll.direction is "down"

		# Storing the values
		storedOrdinateDown = scrollContent.screenFrame.y
		storedOffScreenDown = appBar.height - appBar.maxY

		# Translate appBar ordinate on scroll delta
		appBar.y = scrollContent.screenFrame.y - storedOrdinateUp - storedOffScreenUp
		# Translate appBar ordinate
		tabBar.y = appBar.y + appBar.height - tabBar.height

	if scroll.direction is "up"

		# Storing the values
		storedOrdinateUp = scrollContent.screenFrame.y
		storedOffScreenUp = appBar.height - appBar.maxY

		# Translate appBar ordinate on scroll delta
		appBar.y = scrollContent.screenFrame.y - storedOrdinateDown-storedOffScreenDown
		# Translate appBar ordinate
		tabBar.y = appBar.y + appBar.height - tabBar.height

	# Set up height limits
	if storedOffScreenDown >= appBar.height
		storedOffScreenDown = appBar.height

	if storedOffScreenUp <= 0
		storedOffScreenUp = 0

	# Fixed toolBar
	if appBar.y > 0
		appBar.y = 0
	
	# Fixed tabBar
	if tabBar.y < statusBar.height
		tabBar.y = 0 + statusBar.height

	if tabBar. y > (appBar.height - tabBar.height)
		tabBar.y = (appBar.height - tabBar.height)

# Change scroll.content properties
scroll.content.draggable.overdrag = false
scroll.content.draggable.bounce = false