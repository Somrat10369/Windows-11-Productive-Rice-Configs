theme
{
	name = "modern"

	view = view.small

	background
	{
		color = {background}
		opacity = 100
		// effect = 2
	}

	item
	{
		opacity = 100

		prefix = 1

		text
		{
			normal = {foreground}
			select = {foreground}
			normal-disabled = {color8}
			select-disabled = {color8}
		}

		back
		{
			select = {color0}
			select-disabled = {color8}
		}
	}

	// font
	// {
	// 	size = 14
	// 	name = "JetBrainsMono Nerd Font Propo"
	// 	weight = 2
	// 	italic = 0
	// }

	border
	{
		enabled = true
		size = 1
		color = {color6}
		opacity = 100
		radius = 2
	}

	shadow
	{
		enabled = true
		size = 5
		opacity = 5
		color = {background}
	}

	separator
	{
		size = 1
		color = {color8}
	}

	symbol
	{
		normal = {color4}
		select = {color4}
		normal-disabled = {color8}
		select-disabled = {color8}
	}

	image
	{
		enabled = true
		color = [{foreground}, {color4}, {background}]
	}
}
