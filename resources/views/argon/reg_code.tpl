<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="description" content="专业的网游加速器-Flyue网游加速器,新用户免费试用!有效解决玩家在网络游戏中遇到的延时过高,登录困难,容易掉线畅玩全球游戏">
	<meta name="theme-color" content="#3f51b5">
	<title>{$config["appName"]}</title>

	<!-- css -->
	<link href="/theme/material/css/base.min.css" rel="stylesheet">
	<link href="/theme/material/css/project.min.css" rel="stylesheet">
	<link href="/theme/material/css/fonts/MaterialIcons.css" rel="stylesheet">
	
	<!-- favicon -->
	<!-- ... -->
</head>
<body>
<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-lg-push-0 col-sm-12 col-sm-push-0">
						<h1 class="content-heading">邀请码</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
				<section class="content-inner margin-top-no">
				
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>{$config["appName"]} 的邀请码，没了的话就烧纸吧。</p>
							</div>
						</div>
					</div>
				
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner margin-bottom-no">
								<p class="card-heading">邀请码</p>
								<div class="card-table">
									<div class="table-responsive">
										<table class="table">
											<thead>
											<tr>
												<th>###</th>
												<th>邀请码 (点击邀请码进入注册页面)</th>
												<th>状态</th>
											</tr>
											</thead>
											<tbody>
											{foreach $codes as $code}
											<tr>
												<td>{$code->id}</td>
												<td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
												<td>可用</td>
											</tr>
											{/foreach}
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					
					
					
							
		
			
		</div>
	</main>
		<script src="//cdn.staticfile.org/jquery/2.2.1/jquery.min.js"></script>
	<script src="//static.geetest.com/static/tools/gt.js"></script>
	
	<script src="/theme/material/js/base.min.js"></script>
	<script src="/theme/material/js/project.min.js"></script>
	</body>