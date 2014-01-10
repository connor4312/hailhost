<!DOCTYPE html>
<html lang="en">
	<head>
	<meta http-equiv="content-type" content="text/html; charset={$charset}" />
	<title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

	{if $livehelpjs}{$livehelpjs}
	{/if}
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<script type="text/javascript" src="//use.typekit.net/hdc5zbf.js"></script>
	<script type="text/javascript">Typekit.load();</script>
	<link rel="stylesheet" href="//hailhost.com/css/style.css" type="text/css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css" type="text/css">

	{$headoutput}

	</head>

	<body>

{$headeroutput}
	<nav class="main navbar navbar-default navbar-fixed-top"> 
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#js-navcollapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="//hailhost.com/"><b>Hail</b>Host</a>
			</div>
			<div class="collapse navbar-collapse" id="js-navcollapse">
				<div class="navbar-form navbar-right"><a class="btn btn-primary" href="//hailhost.com//billing/cart.php">Buy Now</a></div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="//hailhost.com/">Home</a></li>
					<li><a href="//hailhost.com/pricing">Pricing</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">About Us <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="//hailhost.com/our-team">Our Team</a></li>
							<li><a href="//hailhost.com/faq">FAQ</a></li>
							<li><a href="//hailhost.com/why-hailhost">Why HailHost</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Panel <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="//hailhost.com/billing">Billing</a></li>
							<li><a href="//multicraft.hailhost.com">Multicraft</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
<div id="page-wrap">
	<div id="subbar">
		<div class="container">
			<nav class="navbar navbar-inverse navbar-sub">
				<ul class="nav navbar-nav">
					<li><a href="{if $loggedin}clientarea{else}index{/if}.php">{$LANG.hometitle}</a></li>
		{if $loggedin}
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.navservices}&nbsp;<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="clientarea.php?action=products">{$LANG.clientareanavservices}</a></li>
						{if $condlinks.pmaddon}<li><a href="index.php?m=project_management">{$LANG.clientareaprojects}</a></li>{/if}
						<li class="divider"></li>
						<li><a href="cart.php">{$LANG.navservicesorder}</a></li>
						<li><a href="cart.php?gid=addons">{$LANG.clientareaviewaddons}</a></li>
					</ul>
				</li>


					{if $condlinks.domainreg || $condlinks.domaintrans}
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.navdomains}&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
						<li><a href="clientarea.php?action=domains">{$LANG.clientareanavdomains}</a></li>
						<li class="divider"></li>
						<li><a href="cart.php?gid=renewals">{$LANG.navrenewdomains}</a></li>
						{if $condlinks.domainreg}<li><a href="cart.php?a=add&domain=register">{$LANG.navregisterdomain}</a></li>{/if}
						{if $condlinks.domaintrans}<li><a href="cart.php?a=add&domain=transfer">{$LANG.navtransferdomain}</a></li>{/if}
						{if $enomnewtldsenabled}<li><a href="index.php?m=enomnewtlds">Preregister New TLDs</a></li>{/if}
						<li class="divider"></li>
						<li><a href="domainchecker.php">{$LANG.navwhoislookup}</a></li>
						</ul>
					</li>{/if}
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.navbilling}&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
						<li><a href="clientarea.php?action=invoices">{$LANG.invoices}</a></li>
						<li><a href="clientarea.php?action=quotes">{$LANG.quotestitle}</a></li>
						<li class="divider"></li>
						{if $condlinks.addfunds}<li><a href="clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>{/if}
						{if $condlinks.masspay}<li><a href="clientarea.php?action=masspay&all=true">{$LANG.masspaytitle}</a></li>{/if}
						{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>{/if}
						</ul>
					</li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.navsupport}&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
						<li><a href="supporttickets.php">{$LANG.navtickets}</a></li>
						<li><a href="knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
						<li><a href="downloads.php">{$LANG.downloadstitle}</a></li>
						<li><a href="serverstatus.php">{$LANG.networkstatustitle}</a></li>
						</ul>
					</li>
					<li><a href="submitticket.php">{$LANG.navopenticket}</a></li>
					{if $condlinks.affiliates}<li><a href="affiliates.php">{$LANG.affiliatestitle}</a></li>{/if}
				</ul>

					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.hello}, {$loggedinuser.firstname}!&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
						<li><a href="clientarea.php?action=details">{$LANG.editaccountdetails}</a></li>
						{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>{/if}
						<li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>
						{if $condlinks.addfunds}<li><a href="clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>{/if}
						<li><a href="clientarea.php?action=emails">{$LANG.navemailssent}</a></li>
						<li><a href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
						<li class="divider"></li>
						<li><a href="logout.php">{$LANG.logouttitle}</a></li>
						</ul>
					</li>
					</ul>
		{else}
					<li><a href="announcements.php">{$LANG.announcementstitle}</a></li>
					<li><a href="knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
					<li><a href="serverstatus.php">{$LANG.networkstatustitle}</a></li>
					<li><a href="affiliates.php">{$LANG.affiliatestitle}</a></li>
					<li><a href="contact.php">{$LANG.contactus}</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">{$LANG.account}&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="clientarea.php">{$LANG.login}</a></li>
							<li><a href="register.php">{$LANG.register}</a></li>
							<li class="divider"></li>
							<li><a href="pwreset.php">{$LANG.forgotpw}</a></li>
						</ul>
					</li>
				</ul>
		{/if}
			</nav>
		</div>
	</div>
	<div id="intro" class="noplane">
		<div class="container">
			<h1>Billing Area</h1>
		</div>
	</div>
	<div class="whitegrad">
	<div class="container">
		<div class="pagecontent">

{if $pagetitle eq $LANG.carttitle}<div id="whmcsorderfrm">{/if}