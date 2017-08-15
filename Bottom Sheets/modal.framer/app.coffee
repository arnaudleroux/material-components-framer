# Set animation options
curvemove = 'cubic-bezier(0.4, 0, 0.2, 1)'
curvein = 'cubic-bezier(0, 0, 0.2, 1)'
curveout = 'cubic-bezier(0.4, 0, 1, 1)'

modal.draggable.enabled = true
modal.draggable.horizontal = false
modal.draggable.overdrag = false

constraints = new Layer 
	y: 224
	width: Screen.width
	height: modal.height*2
	opacity: 0

# Set dragging constraints
modal.draggable.constraints = constraints.frame

# Set dismiss area
dismiss = new Layer 
	width: Screen.width
	height: Screen.height/3
	opacity: 0

# Set states
modal.states.show =
	y: Screen.height/3
	animationOptions:
		curve: curvemove
		time: 0.3

modal.states.hide =
	y: Screen.height
	animationOptions:
		curve: curveout
		time: 0.2

modal.states.sticky =
	y: constraints.y
	animationOptions:
		curve: curvemove
		time: 0.3

scrim.states.show =
	opacity: 1
	animationOptions:
		curve: curvein
		time: 0.2

scrim.states.hide =
	opacity: 0
	animationOptions:
		curve: curveout
		time: 0.2

dismiss.states.sticky =
	height: constraints.y

# Switch default states
scrim.stateSwitch("hide")
modal.stateSwitch("hide")

moreButton.onTap ->
	# Switch states on click
	scrim.animate("show")
	modal.animate("show")
	dismiss.stateSwitch("default")

# Dismiss by swiping the bottom sheet down
modal.onDragEnd ->
	if modal.y > constraints.y+72
		modal.animate("hide")
		scrim.animate("hide")
	else
		modal.animate("sticky")
		dismiss.stateSwitch("sticky")

# Dismiss by touching outside of the bottom sheet surface
dismiss.onTap ->
	# Switch states on click
	scrim.animate("hide")
	modal.animate("hide")
