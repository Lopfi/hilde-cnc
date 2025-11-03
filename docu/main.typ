#set page("a4")
// --- Title Page ---
#v(5cm)
#align(center, text(2em, weight: 700, [Hilde CNC]))
#v(1cm)
#align(center, image("images/cnc.png", height: 60%))

#pagebreak()

= Connectors

== Spindle

#figure(
  image("images/wiring/spindle.svg", width: 100%),
  caption: [
    Wiring of the spindle connector
  ],
)

== 230V Aux

The 230V Aux connector is used to power the water pump. It is connected to the 230V Distribution terminalblock.

#figure(
  image("images/wiring/230v_aux.svg", width: 100%),
  caption: [
    Wiring of the 230V Aux connector
  ],
)

== Steppers

All stepper cables and connectors are the same, except for the X-axis. In order for it to go in the right direction the first two wires in the terminalblocks had to be switched as you can see in @x-axis-connectors.

#figure(
  image("images/wiring/stepper.svg", width: 100%),
  caption: [
    Wiring of the stepper cables for Y, Z and A
  ],
)

#figure(
  image("images/wiring/stepper_x.svg", width: 100%),
  caption: [
    Wiring of the stepper cables for X
  ],
)<x-axis-connectors>

== Tool Setter

The tool setter one normally open (NO) and one normally closed (NC) contact. The NC contact is used for overtravel and triggers the emergency stop of the controller.

#figure(
  image("images/wiring/toolsetter.svg", width: 100%),
  caption: [
    Wiring of the tool setter connector
  ],
)<toolsetter-connector>

== E-Stop

The emergency stop (E-Stop) connector has one normally open (NO) and one normally closed (NC) contact. The NO contact is used to trigger the emergency stop of the controller. The NC switch is used to control a relay that cuts the 230V power to the stepper power supplies and to the VFD for the spindle.

#figure(
  image("images/wiring/e-stop.svg", width: 100%),
  caption: [
    Wiring of the E-Stop connector
  ],
)<estop-connector>

== 24V Aux

The 24V Aux connector provides 24V power and ground for auxiliary devices like lights, fans, etc.

#figure(
  image("images/wiring/24v_aux.svg", width: 100%),
  caption: [
    Wiring of the 24V Aux connector
  ],
)<24v-aux-connector>

= Terminal Blocks

#let cable_color(color) = (
  if color == "GRYE" {
    table.cell(fill: gradient.linear(green, yellow), [Green&Yellow])
  } else if color == "BUWH" {
    table.cell(fill: gradient.linear(blue, white), [Blue&White])
  } else if color == "BKBN" {
    table.cell(fill: gradient.sharp(gradient.linear(rgb("#964B00"), gray), 2), [Brown Black])
  } else if color == "BN" {
    table.cell(fill: rgb("#964B00"), [Brown])
  } else if color == "BNBU" {
    table.cell(fill: gradient.sharp(gradient.linear(rgb("#964B00"), blue),2), [Brown/Blue])
  } else if color == "BK" {
    table.cell(fill: gray, [Black])
  } else if color == "RD" {
    table.cell(fill: red, [Red])
  } else if color == "BU" {
    table.cell(fill: blue, [Blue])
  } else if color == "VT" {
    table.cell(fill: purple, [Purple])
  } else if color == "OG" {
    table.cell(fill: orange, [Orange])
  } else if color == "YE" {
    table.cell(fill: yellow, [Yellow])
  } else {
    table.cell([NOT FOUND])
  }
)

#let stepper_table(axis) = (
	table.cell(rowspan: 7, axis), 
    [1], [A+], [1], cable_color("BU"), 	
		[2], [A-], [1], cable_color("BU"), 	
		[3], [B+], [1], cable_color("BU"), 	
		[4], [B-], [1], cable_color("BU"), 	
		[5], [Endstop], [0.75], cable_color("VT"), 	
		[6], [GND], [0.5], cable_color("BK"), 	
		[7], [Brake], [1], cable_color("BUWH"), 	
)

#figure(
table(
	columns: 5,
  align: horizon,
  table.header(
	[*Name*], [*Pin No.*], [*Function*], [*Wire Size [mm²]*], [*Color*]),
	table.cell(rowspan: 4, [Spindle]), 
    [1], [U], [1.5], cable_color("BK"), 	
		[2], [V], [1.5], cable_color("BK"), 	
		[3], [W], [1.5], cable_color("BK"), 	
		[4], [PE], [1.5], cable_color("GRYE"), 	
	table.cell(rowspan: 4, [230V Input]), 
    [1], [L], [1.5], cable_color("OG"), 	
		[2], [N], [1.5], cable_color("BU"), 	
		[3], [PE], [1.5], cable_color("GRYE"), 	
		[4], [L Switched], [1.5], cable_color("BKBN"), 
	table.cell(rowspan: 5, [230V Distribution]), 
    [1], [L Bridge], [1.5], cable_color("BN"), 	
		[2], [Input / 24V PSU], [1.5], cable_color("BNBU"), 
		[3], [Water Pump / Safety Relay], [1.5], cable_color("BNBU"), 
		[4], [Free / Free], [1.5], cable_color("BNBU"), 
		[5], [PE], [1.5], cable_color("GRYE"), 	
	..stepper_table("X-Axis").flatten(),
  ..stepper_table("Y-Axis").flatten(),
  ..stepper_table("Z-Axis").flatten(),
), caption: [Terminalblocks - 1])

#figure(
table(
	columns: 5,
  align: horizon,
  table.header(
	[*Name*], [*Pin No.*], [*Function*], [*Wire Size [mm²]*], [*Color*]),
  ..stepper_table("A-Axis").flatten(),
	table.cell(rowspan: 4, [Tool Setter]), 
    [1], [NC], [0.75], cable_color("VT"), 	
		[2], [24V], [0.5], cable_color("RD"), 	
		[3], [NO], [0.75], cable_color("VT"), 	
		[4], [GND], [0.5], cable_color("BK"), 	
	table.cell(rowspan: 4, [E-Stop]), 
    [1], [NO], [0.75], cable_color("VT"), 	
		[2], [24V], [0.5], cable_color("RD"), 	
		[3], [NC], [0.75], cable_color("VT"), 	
		[4], [GND], [0.5], cable_color("BK"), 	
	table.cell(rowspan: 4, [24V Aux]), 
    [1], [24V], [1.5], cable_color("RD"), 	
		[2], [24V], [1.5], cable_color("RD"), 	
		[3], [GND], [1.5], cable_color("BK"), 	
		[4], [GND], [1.5], cable_color("BK"), 	
), caption: [Terminalblocks - 2])

#set page(flipped: true)
= Flexi-HAL CNC Controller

Expatria Technologies GRBLHAL and LinuxCNC (and more!) CNC control board
#figure(
  image("images/Board_Overview.png", height: 88%),
  caption: [
    Pinout Overview
  ],
)

#figure(
  image("images/Pinout.png", width: 100%),
  caption: [
    Detailed Pinout
  ],
)