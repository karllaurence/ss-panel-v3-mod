<!DOCTYPE html>
<html lang="zh">
<head>
    <link rel=”alternate” href=”{$config["baseUrl"]}” hreflang=”zh-cn” />
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
    <link rel="icon shortcut" type="image/ico" href="{$config["baseUrl"]}/favicon.ico">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport"><meta property="og:type" content="website">
  	<meta property="og:title" content="{$config["appName"]} | 更好的网络加速">
  	<meta property="og:image" content="{$config["baseUrl"]}/favicon.ico">
  	<meta property="og:description" content="{$config["appName"]} 可帮助您访问您喜欢的网站和服务，改善外服游戏体验，解锁限制地域访问的流媒体服务，力求达到让您满意的水平，为您开辟全球业务保驾护航。{$config["appName"]} 选用中国优化线路配合TCP拥塞控制算法，有效降低延时和网络抖动，更能承受诸多生产环境考验。">
  	<meta name="keywords" content="Flyue, 飞悦, 流量中继, 互联网, 数据传输, 云服务, 加速器, 流量代理, 游戏加速, 网游加速, 回国加速, 国际加速, 网游加速器, 外服加速器, 海外游戏加速, steam加速, 好用的网游加速器, 海外网站解锁, 视频加速">
	<meta name="description" content="{$config["appName"]} 可帮助您访问您喜欢的网站和服务，改善外服游戏体验，解锁限制地域访问的流媒体服务，力求达到让您满意的水平，为您开辟全球业务保驾护航。{$config["appName"]} 选用中国优化线路配合TCP拥塞控制算法，有效降低延时和网络抖动，更能承受诸多生产环境考验。">
	<meta name="theme-color" content="#24292e">
 	 <meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,viewport-fit=cover">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="Cache-Control" content="no-transform">
	<meta http-equiv="Cache-Control" content="no-siteapp">
  	<link rel="canonical" href="{$config["baseUrl"]}/">
	<title>{$config["appName"]}</title>

	<!-- css -->
	<link href="https://cdn.godann.com/theme/material/css/base.css" rel="stylesheet">
	<link href="https://cdn.godann.com/theme/material/css/project.min.css" rel="stylesheet">
	<link href="https://cdn.godann.com/theme/material/css/Material+Icons.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.godann.com/theme/material/css/iconfont.css">
	<!-- favicon -->
	<!-- ... -->
  <script type="application/ld+json">{
            "@context": "http://schema.org",
            "@type": "Website",
            "name": "Flyue | 更好的网络加速器",
            "headline": "Flyue | 更好的网络加速器",
            "author": {
                "@type": "Organization",
                "name": "{$config["appName"]}",
                "logo": {
                    "@type": "ImageObject",
                    "url": "https://cat.flyue.top/favicon.ico"
                },
                "description": "{$config["appName"]} 可帮助您访问您喜欢的网站和服务，改善外服游戏体验，解锁限制地域访问的流媒体服务，力求达到让您满意的水平，为您开辟全球业务保驾护航。{$config["appName"]} 选用中国优化线路配合TCP拥塞控制算法，有效降低延时和网络抖动，更能承受诸多生产环境考验。"
            },
            "url": "https://cat.flyue.top/",
            "image": {
                "@type": "ImageObject",
                "url": "https://cat.flyue.top/favicon.ico"
            },
            "mainEntityOfPage": {
                "@type": "Website",
                "@id": "https://cat.flyue.top"
            },
            
                "keywords": "Flyue, 飞悦, 流量中继, 互联网, 数据传输, 云服务, 加速器, 流量代理, 游戏加速, 网游加速, 回国加速, 国际加速, 网游加速器, 外服加速器, 海外游戏加速, steam加速, 好用的网游加速器, 海外网站解锁, 视频加速",
            
            "description": "{$config["appName"]} 可帮助您访问您喜欢的网站和服务，改善外服游戏体验，解锁限制地域访问的流媒体服务，力求达到让您满意的水平，为您开辟全球业务保驾护航。{$config["appName"]} 选用中国优化线路配合TCP拥塞控制算法，有效降低延时和网络抖动，更能承受诸多生产环境考验。"
            }</script>

</head>
<body class="page-brand">
	<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
				{if $user->isLogin}
					<span class="access-hide">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="{$user->gravatar}"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/user/"><span class="icon icon-lg margin-right">account_box</span>用户中心</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">exit_to_app</span>登出</a>
						</li>
					</ul>
				{else}
					<span class="access-hide">未登录</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="/theme/material/images/users/avatar-001.jpg"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">account_box</span>登录</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/register"><span class="icon icon-lg margin-right">pregnant_woman</span>注册</a>
						</li>
					</ul>
				{/if}
					
			</li>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="/"><i class="icon icon-lg">restaurant_menu</i>&nbsp;菜单</a>
				<ul class="nav">
					<li>
						<a  href="/"><i class="icon icon-lg">bookmark_border</i>&nbsp;首页</a>
					</li>
					<li>
						<a  href="/tos"><i class="icon icon-lg">text_format</i>&nbsp;TOS</a>
					</li>
					<li>
						<a  href="/help"><i class="icon icon-lg">help</i>&nbsp;帮助</a>
					</li>
					{if $user->isLogin}
					<li>
						<a  href="/user"><i class="icon icon-lg">person</i>&nbsp;用户中心</a>
					</li>
					<li>
						<a  href="/user/logout"><i class="icon icon-lg">call_missed_outgoing</i>&nbsp;退出</a>
					</li>
					{else}
					<li>
						<a  href="/auth/login"><i class="icon icon-lg">vpn_key</i>&nbsp;登录</a>
					</li>
					<li>
						<a  href="/auth/register"><i class="icon icon-lg">pregnant_woman</i>&nbsp;注册</a>
					</li>
					{/if}
				</ul>
			</div>
		</div>
	</nav>

	