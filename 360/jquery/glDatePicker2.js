(function($)
{
	var defaults =
	{
		calId: 0,
		cssName: "default",
		startDate: -1,
		endDate: -1,
		selectedDate: -1,
		showPrevNext: true,
		allowOld: true,
		showAlways: false,
		position: "absolute"
	};

	var methods =
	{
		init: function(options)
		{
			return this.each(function()
			{
				var self = $(this);
				var settings = $.extend({}, defaults);

				// Save the settings and id
				settings.calId = self[0].id+"-gldp";
				if(options) { settings = $.extend(settings, options); }
				self.data("settings", settings);

				// Bind click and focus event to show
				self
					.click(methods.show)
					.focus(methods.show);

				// If always showing, trigger click causing it to show
				if(settings.showAlways)
				{
					setTimeout(function() { self.trigger("focus"); }, 50);
				}

				// Bind click elsewhere to hide
				$(document).bind("click", function(e)
				{
					methods.hide.apply(self);
				});
			});
		},

		// Show the calendar
		show: function(e)
		{
			e.stopPropagation();

			// Instead of catching blur we'll find anything that's made visible
			methods.hide.apply($("._gldp").not($(this)));

			methods.update.apply($(this));
		},

		// Hide the calendar
		hide: function()
		{
			if($(this).length)
			{
				var s = $(this).data("settings");

				// Hide if not showing always
				if(!s.showAlways)
				{
					// Hide the calendar and remove class from target
					$("#"+s.calId).slideUp(200);
					$(this).removeClass("_gldp");
				}
			}
		},

		// Set a new start date
		setStartDate: function(e)
		{
			$(this).data("settings").startDate = e;
		},

		// Set a new end date
		setEndDate: function(e)
		{
			$(this).data("settings").endDate = e;
		},

		// Set a new selected date
		setSelectedDate: function(e)
		{
			$(this).data("settings").selectedDate = e;
		},

		// Render the calendar
		update:function()
		{
			var target = $(this);
			var settings = target.data("settings");

			// Get the calendar id
			var calId = settings.calId;

			// Get the starting date
			var startDate = settings.startDate;
			if(settings.startDate == -1)
			{
				startDate = new Date();
				startDate.setDate(1);
			}
			startDate.setHours(0,0,0,0);
			var startTime = startDate.getTime();

			// Get the end date
			var endDate = new Date(0);
			if(settings.endDate != -1)
			{
				endDate = new Date(settings.endDate);
				if((/^\d+$/).test(settings.endDate))
				{
					endDate = new Date(startDate);
					endDate.setDate(endDate.getDate()+settings.endDate);
				}
			}
			endDate.setHours(0,0,0,0);
			var endTime = endDate.getTime();

			// Get the selected date
			var selectedDate = new Date(0);
			if(settings.selectedDate != -1)
			{
				selectedDate = new Date(settings.selectedDate);
				if((/^\d+$/).test(settings.selectedDate))
				{
					selectedDate = new Date(startDate);
					selectedDate.setDate(selectedDate.getDate()+settings.selectedDate);
				}
			}
			selectedDate.setHours(0,0,0,0);
			var selectedTime = selectedDate.getTime();

			// Get the current date to render
			var theDate = target.data("theDate");
				theDate = (theDate == -1 || typeof theDate == "undefined") ? startDate : theDate;

			// Calculate the first and last date in month being rendered.
			// Also calculate the weekday to start rendering on
			var firstDate = new Date(theDate); firstDate.setDate(1);
			var firstTime = firstDate.getTime();
			var lastDate = new Date(firstDate); lastDate.setMonth(lastDate.getMonth()+1); lastDate.setDate(0);
			var lastTime = lastDate.getTime();
			var lastDay = lastDate.getDate();

			// Calculate the last day in previous month
			var prevDateLastDay = new Date(firstDate);
				prevDateLastDay.setDate(0);
				prevDateLastDay = prevDateLastDay.getDate();

			// The month names to show in toolbar
			var monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiempre", "Octubre", "Noviembre", "Diciembre"];

			// Save current date
			target.data("theDate", theDate);

			// Render the cells as <TD>
			var days = "";
			for(var y = 0, i = 0; y < 6; y++)
			{
				var row = "";

				for(var x = 0; x < 7; x++, i++)
				{
					var p = ((prevDateLastDay - firstDate.getDay()) + i + 1);
					var n = p - prevDateLastDay;
					var c = (x == 0) ? "sun" : ((x == 6) ? "sat" : "day");

					// If value is outside of bounds its likely previous and next months
					if(n >= 1 && n <= lastDay)
					{
						var today = new Date(); today.setHours(0,0,0,0);
						var date = new Date(theDate); date.setHours(0,0,0,0); date.setDate(n);
						var dateTime = date.getTime();

						// Test to see if it's today
						c = (today.getTime() == dateTime) ? "today":c;

						// Test to see if we allow old dates
						if(!settings.allowOld)
						{
							c = (dateTime < startTime) ? "noday":c;
						}

						// Test against end date
						if(settings.endDate != -1)
						{
							c = (dateTime > endTime) ? "noday":c;
						}

						// Test against selected date
						if(settings.selectedDate != -1)
						{
							c = (dateTime == selectedTime) ? "selected":c;
						}
					}
					else
					{
						c = "noday"; // Prev/Next month dates are non-selectable by default
						n = (n <= 0) ? p : ((p - lastDay) - prevDateLastDay);
					}

					// Create the cell
					row += "<td class='gldp-days "+c+" **-"+c+"'><div class='"+c+"'>"+n+"</div></td>";
				}

				// Create the row
				days += "<tr class='days'>"+row+"</tr>";
			}

			// Determine whether to show Previous arrow
			var showP = ((startTime < firstTime) || settings.allowOld);
			var showN = ((lastTime < endTime) || (endTime < startTime));

			// Force override to showPrevNext on false
			if(!settings.showPrevNext) { showP = showN = false; }

			// Build the html for the control
			var titleMonthYear = monthNames[theDate.getMonth()]+" "+theDate.getFullYear();
			var html =
				"<div class='**'>"+
					"<table>"+
						"<tr>"+ /* Prev Month/Year Next*/
							("<td class='**-prevnext prev'>"+(showP ? "◄":"")+"</td>")+
							"<td class='**-monyear' colspan='5'>{MY}</td>"+
							("<td class='**-prevnext next'>"+(showN ? "►":"")+"</td>")+
						"</tr>"+
						"<tr class='**-dow'>"+ /* Day of Week */
							"<td>Dom</td><td>Lun</td><td>Mar</td><td>Mier</td><td>Jue</td><td>Vier</td><td>Sab</td>"+
						"</tr>"+days+
					"</table>"+
				"</div>";

			// Replace css, month-year title
			html = (html.replace(/\*{2}/gi, "gldp-"+settings.cssName)).replace(/\{MY\}/gi, titleMonthYear);
			var elemento = $(this);
			var alto = $(this).height();
			var posicion = elemento.position();
			//alert( "left: " + posicion.left + ", top: " + posicion.top );
			// If calendar doesn't exist, make one
			if($("#"+calId).length == 0)
			{
				target.after
				(
					$("<div id='"+calId+"'></div>")
					.css(
					{
						"position":settings.position,
						"z-index":99,
						"left":posicion.left,
						"top":posicion.top+alto+7,
						"width":225
					})
				);
			}

			// Show calendar
			var calendar = $("#"+calId);
			calendar.html(html).slideDown(200);

			// Add a class to make it easier to find when hiding
			target.addClass("_gldp");

			// Handle previous/next clicks
			$("[class*=-prevnext]", calendar).click(function(e)
			{
				e.stopPropagation();

				if($(this).html() != "")
				{
					// Determine offset and set new date
					var offset = $(this).hasClass("prev") ? -1 : 1;
					var newDate = new Date(firstDate);
						newDate.setMonth(theDate.getMonth()+offset);

					// Save the new date and render the change
					target.data("theDate", newDate);
					methods.update.apply(target);
				}
			});

			// Highlight day cell on hover
			$("tr.days td:not(.noday, .selected)", calendar)
				.mouseenter(function(e)
				{
					var css = "gldp-"+settings.cssName+"-"+$(this).children("div").attr("class");
					$(this).removeClass(css).addClass(css+"-hover");
				})
				.mouseleave(function(e)
				{
					if(!$(this).hasClass("selected"))
					{
						var css = "gldp-"+settings.cssName+"-"+$(this).children("div").attr("class");
						$(this).removeClass(css+"-hover").addClass(css);
					}
				})
				.click(function(e)
				{
					e.stopPropagation();
					var day = $(this).children("div").html();
					var settings = target.data("settings");
					var newDate = new Date(theDate); newDate.setDate(day);

					// Save the new date and update the target control
					target.data("theDate", newDate);
					target.val(newDate.getDate()+"/"+(newDate.getMonth()+1)+"/"+newDate.getFullYear());

					// Run callback to user-defined date change method
					if(settings.onChange != null && typeof settings.onChange != "undefined")
					{
						settings.onChange(target, newDate);
					}

					// Save selected
					settings.selectedDate = newDate;

					// Hide calendar
					methods.hide.apply(target);
				});
		}
	};

	// Plugin entry
	$.fn.glDatePicker = function(method)
	{
		if(methods[method]) { return methods[method].apply(this, Array.prototype.slice.call(arguments, 1)); }
		else if(typeof method === "object" || !method) { return methods.init.apply(this, arguments); }
		else { $.error("Method "+ method + " does not exist on jQuery.glDatePicker"); }
	};
})(jQuery);