<div id="header">
	<table style="width: 100%">
		<tr>
			<td id="dvHeader"><h1>
					AssistMe <span class="arrow"></span>
				</h1>
				<h3>Your own Personal Assistant</h3></td>

			<td align="right" style="width: 100px">

					<span>${currentUser.firstName} ${currentUser.lastName} </span><br>
				<div id="showDropdown">
					<img src="/assistme-mvn/resources/images/settings.bmp" width="30"
						height="30">
				</div>
				<div id="dropdown">
					<ul style="list-style: none">
						<li><a href="profile.html">Profile</a></li>
						<li><a href="user-settings.html">Settings</a></li>
						<li><a href="logout.html">Logout</a></li>
					</ul>
				</div>				
			</td>
		</tr>
	</table>
</div>

<script>
	document.getElementById('showDropdown').onclick = showDropDown;

	function showDropDown(e) {
		document.getElementById('showDropdown').onclick = function() {
		};
		if (e.stopPropagation)
			e.stopPropagation(); // W3C model
		else
			e.cancelBubble = true; // IE model

		document.getElementById("dropdown").style.display = "block";
		document.onclick = function(e) {
			var ele = document.elementFromPoint(e.clientX, e.clientY);
			if (ele == document.getElementById("showDropdown")) {
				hideDropDown();
				return;
			}
			do {
				if (ele == document.getElementById("dropdown"))
					return;
			} while (ele = ele.parentNode);
			hideDropDown();
		};
	}

	function hideDropDown() {
		document.onclick = function() {
		};
		document.getElementById("dropdown").style.display = "none";
		document.getElementById('showDropdown').onclick = showDropDown;
	}
</script>