<?php
/**
 *
 *   Copyright © 2010-2012 by xhost.ch GmbH
 *
 *   All rights reserved.
 *
 **/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!--
 -
 -   Copyright © 2010-2012 by xhost.ch GmbH
 -
 -   All rights reserved.
 -
 -->
<head>
	<meta content="initial-scale=1.0, width=device-width, user-scalable=yes" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<link rev="made" href="mailto:multicraft@xhost.ch">
	<meta name="description" content="Multicraft: The Minecraft server control panel">
	<meta name="keywords" content="Multicraft, Minecraft, server, management, control panel, hosting">
	<meta name="author" content="xhost.ch GmbH">

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('screen.css') ?>" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('print.css') ?>" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('ie.css') ?>" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('main.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('form.css') ?>" />

	<script type="text/javascript" src="//use.typekit.net/hdc5zbf.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
	<link rel="stylesheet" href="//hailhost.com/css/style.css" type="text/css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css" type="text/css">

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>
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
					<li><a href="//hailhost.com/billing/cart.php">Pricing</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">About Us <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="//hailhost.com//our-team">Our Team</a></li>
							<li><a href="//hailhost.com//faq">FAQ</a></li>
							<li><a href="//hailhost.com//why-hailhost">Why HailHost</a></li>
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
					<?php
					$items = array();

					$simple = (Yii::app()->theme && in_array(Yii::app()->theme->name, array('simple', 'mobile', 'platform')));
					if (!$simple)
						$items[] = array('label'=>Yii::t('mc', 'Home'), 'url'=>array('/site/page', 'view'=>'home'));
					if (@Yii::app()->params['installer'] !== 'show')
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Servers'),
							'url'=>array('/server/index', 'my'=>($simple && !Yii::app()->user->isSuperuser() ? 1 : 0)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Users'),
							'url'=>array('/user/index'),
							'visible'=>(Yii::app()->user->isSuperuser()
								|| !(Yii::app()->user->isGuest || (Yii::app()->params['hide_userlist'] === true) || $simple)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Profile'),
							'url'=>array('/user/view', 'id'=>Yii::app()->user->id),
							'visible'=>(!Yii::app()->user->isSuperuser() && !Yii::app()->user->isGuest
								&& ((Yii::app()->params['hide_userlist'] === true) || $simple)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Settings'),
							'url'=>array('/daemon/index'),
							'visible'=>Yii::app()->user->isSuperuser(),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Support'),
							'url'=>array('/site/report'),
							'visible'=>!empty(Yii::app()->params['admin_email']),
						);
					}
					if (Yii::app()->user->isGuest)
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Login'),
							'url'=>array('/site/login'),
							'itemOptions'=>$simple ? array('style'=>'float: right') : array(),
						);
					}
					else
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Logout ({name})', array('{name}'=>Yii::app()->user->name)),
							'url'=>array('/site/logout'),
							'itemOptions'=>$simple ? array('style'=>'float: right') : array(),
						);
					}
					$items[] = array(
						'label'=>Yii::t('mc', 'About'),
						'url'=>array('/site/page', 'view'=>'about'),
						'visible'=>$simple,
						'itemOptions'=>array('style'=>'float: right'),
					);
					
					
					$this->widget('zii.widgets.CMenu', array(
						'items'=>$items,
						'htmlOptions' => array('class' => 'nav navbar-nav')
					)); ?>
				</nav>
			</div>
		</div><!-- mainmenu -->
		<div id="intro" class="noplane">
			<div class="container">
				<h1>Multicraft</h1>
			</div>
		</div>
		<div class="whitegrad">
			<div class="container">
				<div class="pagecontent">
				
					<?php
						if (!$simple)
						{
							array_pop($this->breadcrumbs);
							$this->widget('zii.widgets.CBreadcrumbs', array(
								'homeLink'=>'',
								'links'=>$this->breadcrumbs,
								'tagName' => 'ol',
								'htmlOptions' => array('class' => 'breadcrumb'),
								'separator' => '',
								'activeLinkTemplate' => '<li><a href="{url}">{label}</a></li>',
								'inactiveLinkTemplate' => '<li class="active">{label}</li>',
							));
						}
					?>

					<?php echo $content; ?>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="left">
				<a href="#">Terms of Service</a>
			</div>
			Copyright 2014 HailHost
			<div class="right">
				<a href="http://pyxld.com">Designed</a>
			</div>
		</div>
	</footer>
	<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
</body>
</html>
