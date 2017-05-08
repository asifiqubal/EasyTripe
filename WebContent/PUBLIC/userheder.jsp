
<!DOCTYPE html>

<html dir="ltr" lang="en">
<head>
<style type="text/css">
	html, body {
  height: 100%;
  margin: 0;
}
.wrapper ,.main-content{
  min-height: 100%;

  /* Equal to height of footer */
  /* But also accounting for potential margin-bottom of last child */
  margin-bottom: -75px;
}
.footer,
.push {
  height: 50px;
}
</style>

</head>
<body class="page-body" data-url="#">
	<div class="header">

		<header>
			<div class="container-fluid">
				<div class="row">
					<!-- Profile Info and Notifications -->

					<div class="col-md-6 col-sm-8 clearfix">

						<ul class="user-info pull-left pull-none-xsm">
							<!-- Profile Info -->
							<li class="profile-info dropdown">
								<!-- add class "pull-right" if you want to place this from right -->
								
								<a href="/easytrip/profile/" class="dropdown-toggle"
								data-toggle="dropdown" id="setname"> </a>
							</li>
						</ul>

						<ul class="user-info pull-left pull-right-xs pull-none-xsm">

							<!-- Raw Notifications -->


						</ul>

					</div>


					<!-- Raw Links -->
					<div class="col-md-6 col-sm-4 clearfix hidden-xs">

						<ul class="list-inline links-list pull-right">

							<!-- Language Selector -->


							<li><a href="/easytrip/cngpassword"> <i
									class="entypo-key"></i> Change Password
							</a></li>
							<li><a href="/easytrip/logout">Log Out </a></li>
						</ul>

					</div>

				</div>
			</div>
		</header>

	</div>