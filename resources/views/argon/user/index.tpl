{include file='user/newui_header.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="profile-page">
		<section class="section-profile-cover section-shaped my-0">
		<div class="shape shape-style-1 shape-primary shape-skew alpha-4">
          <span class="span-150"></span>
          <span class="span-50"></span>
          <span class="span-50"></span>
          <span class="span-75"></span>
          <span class="span-100"></span>
          <span class="span-75"></span>
          <span class="span-50"></span>
          <span class="span-100"></span>
          <span class="span-50"></span>
          <span class="span-100"></span>
        </div>
		</section>
		<section class="section section-skew">
			<div class="container">
				<div class="card card-profile shadow mt--300">
					<div class="px-4">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2" >
								<div class="card-profile-image">
									<a data-container="body" data-original-title="Popover on Top" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
										<img src="{$user->gravatar}" alt="user-image" class="rounded-circle" >
									</a>
								</div>
							</div>
							<div class="col-lg-4 order-lg-3 text-lg-right align-self-lg-center">
								<div class="card-profile-actions py-4 mt-lg-0">
									<a href="/user/code" class="btn btn-sm btn-default">在线充值</a>
									<a href="/user/shop" class="btn btn-sm btn-default">购买套餐</a>
									<a href="/user/node" class="btn btn-sm btn-primary float-right">节点列表</a>
								</div>
							</div>
							<div class="col-lg-4 order-lg-1">
								<div class="card-profile-stats d-flex justify-content-center">
									<div>
										<span class="heading">{$user->money}</span>
										<span class="description">余额</span>
									</div>
									<div>
										<span class="heading">VIP{$user->class}</span>
										<span class="description">等级</span>
									</div>
									<div>
										<span class="heading">{$user->online_ip_count()}</span>
										<span class="description">在线 IP 数</span>
									</div>
								</div>
							</div>
						</div>
<!-- 剩余流量 -->
		<div class="row row-grid justify-content-between align-items-center mt-lg">
			<div class="col-lg-8">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
                  <div class="progress-label">
                    <span>剩余流量</span>
                  </div>
              <div class="progress-wrapper">
                <div class="progress-info">
                  <div class="progress-percentage">
                    <span>{number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}%</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}%;"></div>
                </div>
              </div>
<!-- end -->
<!-- checkin -->
<div class="row">
                    {if $user->isAbleToCheckin() == 1}
                    <button id="checkin" class="btn btn-primary mt-4" style="margin-left: 1rem;">签到<br>（-233M ～ 2888M）</button>
                    {else}
                    <button disabled="disabled" class="btn btn-primary mt-4" style="margin-left: 1rem;">已签到<br>（-233M ～ 2888M）</button>
                    {/if}
					   <p class="col mt-4" style="text-align: right;">
                     <span style="color:#B5B5B5;font-size: 18px" title="{number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% 剩余">已用：{$user->LastusedTraffic()}</span>
                         <span style="font-size: 18px;"> / </span><span style="font-weight: 550;color: #8898aa;font-size: 18px;" title="{number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% 剩余">可用：{$user->unusedTraffic()}</span>
                   </p>	
                  </div>
                  </div>
                </div>
            </div>	
<!-- end -->
<!-- 续费和到期时间 -->
<div class="col-lg-4">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
                  <div class="progress-label">
                    <span>到期时间</span>
                  </div>
						<h2 class="card-title">
						<p class="mt-4" style="font-weight: 700;">{$user->class_expire}</p>
						</h2>
                    <a  class="btn btn-primary mt-4" href="/user/shop">续费</a>
                  </div>
                </div>
            </div>	
            </div>		
<!-- end -->
<!-- 教程 -->
  <div class="mt-5 py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
              <div class="mb-3">
                <small class="text-uppercase font-weight-bold">{if $user->lastSsTime()=='从未使用喵'}不知道如何使用？{else}公告 - {$ann->date} - <a href="/user/announcement">查看历史公告</a>{/if}</small>
              </div>
										{if $user->lastSsTime()=='从未使用喵'}
										<p style="color:#ff9180">系统检测到您从没使用过，是否需要帮助呢？</p>
										<p style="color:#ff9180">来这里看看我们的<a href="https://docs.mimemi.org"/>教程</a>吧</p>
										<hr>
										{/if}
										<p>{$ann->content}</p>     
                </div>
              </div>
            </div>
<!-- end -->

<!-- all in one -->
<div class="mt-5 py-5 border-top text-center">
						<div class="row justify-content-center">
							<div class="col-lg-9">
						<div class="mb-3">
							<small class="text-uppercase font-weight-bold" style="color: black !important;">All-in-One</small>
						</div>
							<div class="nav-wrapper">
								<ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-text" role="tablist">
									<li class="nav-item">
										<a class="nav-link mb-sm-3 mb-md-0 active" id="all_info-tab" data-toggle="tab" href="#all_info" role="tab" aria-controls="all_info" aria-selected="true">连接信息</a>
									</li>
									<li class="nav-item">
										<a class="nav-link mb-sm-3 mb-md-0" id="all_ssr-tab" data-toggle="tab" href="#all_ssr" role="tab" aria-controls="all_ssr" aria-selected="false">SSR 一键导入</a>
									</li>
									<li class="nav-item">
										<a class="nav-link mb-sm-3 mb-md-0" id="all_ss-tab" data-toggle="tab" href="#all_ss" role="tab" aria-controls="all_ss" aria-selected="false">SS 一键导入</a>
									</li>
									<li class="nav-item">
										<a class="nav-link mb-sm-3 mb-md-0" id="all_v2-tab" data-toggle="tab" href="#all_v2" role="tab" aria-controls="all_v2" aria-selected="false">V4 宅男养成计划(Netflix账号)</a>
									</li>

									<li class="nav-item">
										<a class="nav-link mb-sm-3 mb-md-0" id="all_other-tab" data-toggle="tab" href="#all_other" role="tab" aria-controls="all_other" aria-selected="false">如果您无法更新订阅请看这里</a>
									</li>
									{if $user->class>=2}
									<li class="nav-item">
										<a class="nav-link mb-sm-3 mb-md-0" id="all_vip-tab" data-toggle="tab" href="#all_vip" role="tab" aria-controls="all_other" aria-selected="false">VIP用户群</a>
									</li>
									{/if}

								</ul>
							</div>

<!-- end -->

<!-- start -->
<div class="card shadow" style="background-color: #ffffff !important">
								<div class="card-body">
									<div class="tab-content" id="myTabContent">
										<div class="tab-pane fade show active" id="all_info" role="tabpanel" aria-labelledby="all_info-tab">
											
											
											<dl class="dl-horizontal">
												<p><dt>端口</dt>
												<dd><code style="color: purple !important">{$user->port}</code></dd></p>

												<p><dt>密码</dt>
												<dd><code style="color: purple !important">{$user->passwd}</code></dd></p>

												<p><dt>加密</dt>
												<dd><code style="color: purple !important">{$user->method}</code></dd></p>

												<p><dt>协议</dt>
												<dd><code style="color: purple !important">{$user->protocol}</code></dd></p>

												<p><dt>混淆</dt>
												<dd><code style="color: purple !important">{$user->obfs}</code></dd></p>
												<p><dt>自定义混淆参数</dt>
													<dd><code style="color: purple !important">{$user->obfs_param}</code></dd>
													
												</p>
											</dl>
											{if URL::SSRCanConnect($user)}
												<button id="mode-ss" class="btn btn-primary mt-4 switch-ss">切换为 SS 模式</button>
												{/if}
												{if URL::SSCanConnect($user)}
												<button id="mode-ssr" class="btn btn-primary mt-4 switch-ssr">切换为 SSR 模式</button>
												{/if}
											<button id="reset-link" class="btn btn-primary mt-4 reset-link">重置订阅/托管地址</button>
										</div>
										<div class="tab-pane fade" id="all_ssr" role="tabpanel" aria-labelledby="all_ssr-tab">
											<div style="padding:18px">
												{if URL::SSRCanConnect($user)}
													<p>SSR 普通端口订阅地址</p>
													<p>
													<code style="color: purple !important"><a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">{$baseUrl}/link/{$ssr_sub_token}?mu=0</a></code>
													</p>
													<p>SSR 995端口订阅地址</p>
													<p>
													<code style="color: purple !important"><a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">{$baseUrl}/link/{$ssr_sub_token}?mu=1</a></code>
													</p>
													 <p><a href="Shadowrocket://add/sub://{$ssr_url_0}?remarks=MIMEMI%20Cloud" target="_blank" class="btn btn-primary mt-4">&nbsp;Shadwrocket<br>一键导入订阅</a></p>

                                                     <p><a href="quantumult://configuration?server={$ssr_url_0}&filter={$filterUrl}&rejection={$rejectUrl}" target="_blank" class="btn btn-primary mt-4">&nbsp;Quantumult<br>一键导入订阅&规则</a></p>
												{else}
													<p>SSR 995端口订阅地址</p>
													<p>
													<code style="color: purple !important"><a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">{$baseUrl}/link/{$ssr_sub_token}?mu=1</a></code>
													</p>
													 <p><a href="Shadowrocket://add/sub://{$ssr_url_1}?remarks=MIMEMI%20Cloud 995单端口" target="_blank" class="btn btn-primary mt-4">&nbsp;Shadwrocket<br>一键导入订阅</a></p>

                                                     <p><a href="quantumult://configuration?server={$ssr_url_1}&filter={$filterUrl}&rejection={$rejectUrl}" target="_blank" class="btn btn-primary mt-4">&nbsp;Quantumult<br>一键导入订阅&规则</a></p>
													
												{/if}
											</div>
										</div>
										<div class="tab-pane fade" id="all_ss" role="tabpanel" aria-labelledby="all_ss-tab">
											{if URL::SSCanConnect($user)}
												<p>SSD 订阅地址</p>
												<p>
												<code style="color: purple !important"><a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=3">{$baseUrl}/link/{$ssr_sub_token}?mu=3</a></code>
												</p>
												<hr>
											{/if}
											{if URL::SSCanConnect($user)}
												<p>Surge 2&3 / Surfboard 个人端口托管地址</p>
												<p>
												<code style="color: purple !important"><a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ios_token}?is_ss=0">{$baseUrl}/link/{$ios_token}?is_ss=1</a></code>
												</p>

												<p><a href="surge3:///install-config?url={$surge_url_1}" target="_blank" class="btn btn-primary mt-4">&nbsp;Surge<br>一键托管&规则</a></p>
												
											{/if}
										
										</div>
											<div class="tab-pane fade" id="all_v2" role="tabpanel" aria-labelledby="all_v2-tab">
												<p>V4 宅男养成计划(Netflix账号 每月更新)</p>
												{if $user->class>=4}
												<font color='purple'>
													11011@mimemi.org
													<br>
													11012@mimemi.org
													<br>
													110103@mimemi.org
													<br>
													11014@mimemi.org
												</font>
												<br>
												密码:<br><font color="purple">

												mimemi</font>
												{else}
												<font color='red'>抱歉,您还不是VIP4,所以您不能享受此计划</font>
												<font><b>购买套餐<a href="/user/shop">点击这里</a></b></font>
												{/if}
												
												</div>

												<div class="tab-pane fade" id="all_other" role="tabpanel" aria-labelledby="all_other-tab">
												{$pre_user = URL::cloneUser($user)}
												{$user = URL::getSSRConnectInfo($pre_user)}
												{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
												{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
												{$user = URL::getSSConnectInfo($pre_user)}
												{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
												{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
												{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}
												<p>备用订阅地址</p>
												<P style="color: black !important; font-weight: bold;">请将订阅地址的mimemi.org部分替换为mimemi.club</P>
												<p>
												示例(其他地址同理)：
												<code style="color: purple !important"><a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">https://www.mimemi.club/link/{$ssr_sub_token}?mu=0</a></code>
												</p>
												<br>
												{if URL::SSRCanConnect($user)}
												<p>备用导入节点方法 - 电脑端 - SSR</p>
												<p>点击&nbsp&nbsp<a class="copy-text" data-clipboard-text="{$ssr_url_all}"><code style="color: red !important">这里(普通端口)</code></a>或者<a class="copy-text" data-clipboard-text="{$ssr_url_all_mu}"><code style="color: red !important">&nbsp&nbsp这个(995端口）</code></a>，然后右键小飞机->从剪贴板复制地址</p>
												<br>


												<p>备用导入节点方法 - 电脑端 - SSR - Json导入</p>
												<p>下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个(普通端口)</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=0">这个(995端口)</a>，右键小飞机 服务器 -- 从配置文件导入服务器，选择这个文件，</p>
												<br>
												<p>备用导入节点方法 - 手机端 - SSR</p>
												<p>在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接(普通端口)</a>或者<a href="{$ssr_url_all_mu}">这个链接(995端口)</a>，然后点击确定</p>
												{/if}
												{if URL::SSCanConnect($user)}
												<p>备用导入节点方法 - 电脑端 - SS</p>
												<p>
												(2)点击<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">这里（普通端口）</a>, 然后右键小飞机 -- 从剪贴板导入 URL</p>
												<br>

												<p>备用导入节点方法 - 电脑端 - SS - Json</p>
												下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个(普通端口)</a>，放到小飞机的目录下，然后打开小飞机。<br>
												<br>
												

												<p>备用导入节点方法 - 手机端 - SS</p>
												在系统自带浏览器中点击<a href="{$ss_url_all}">这个（普通端口）</a>然后点击确定，就可以批量添加节点。</p>
												{/if}
												</div>



												<!-- VIP Club-->
												<div class="tab-pane fade" id="all_vip" role="tabpanel" aria-labelledby="all_vip-tab">
												<p>Telegram VIP Club</p>
												{if $user->class>=2}
												<font color='purple'>
													<a href="https://t.me/joinchat/GB7fekvCIS56kD-WXbpZYA" target="_blank" class="btn btn-primary mt-4">点击加入</a>
												</font>
												<br>
												{else}
												{/if}
												</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
<!-- end -->

{include file='newui_dialog.tpl'}



{include file='user/newui_footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>
<script>
    $(document).ready(function () {
        $("#mode-ssr").click(function () {
			
            $.ajax({
                type: "POST",
                url: "/user/method",
                dataType: "json",
                data: {
                    method: "chacha20-ietf"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html("成功了");
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
			
           $.ajax({
                type: "POST",
                url: "/user/ssr",
                dataType: "json",
                data: {
                    protocol: "auth_aes128_md5",
                    obfs: "tls1.2_ticket_auth"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
<script>
    $(document).ready(function () {
        $("#mode-ss").click(function () {
        	
            $.ajax({
                type: "POST",
                url: "/user/method",
                dataType: "json",
                data: {
                    method: "chacha20-ietf-poly1305"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html("成功了");
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
			
           $.ajax({
                type: "POST",
                url: "/user/ssr",
                dataType: "json",
                data: {
                    protocol: "origin",
                    obfs: "simple_obfs_http"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>
<script>
$(function(){
	new Clipboard('.copy-text');
});
$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});
$(".reset-link").click(function () {
	$("#result").modal();
	$("#msg").html("已重置订阅链接，请您继续接下来的操作。");
	window.setTimeout("location.href='/user/url_reset'", {$config['jump_delay']});
});
  
{if $geetest_html == null}
window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });
    myShakeEvent.start();
    window.addEventListener('shake', shakeEventDidOccur, false);
    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                  	window.setTimeout("location.href='/user'", {$config['jump_delay']});
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};
$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
                  	window.setTimeout("location.href='/user'", {$config['jump_delay']})
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})
{else}
window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });
    myShakeEvent.start();
    window.addEventListener('shake', shakeEventDidOccur, false);
    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
        c.show();
    }
};
var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};
initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);
{/if}
</script>