





{include file='user/newui_header.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


  <main class="profile-page">
    <section class="section-profile-cover section-shaped my-0">
      <div class="shape shape-style-1 shape-default shape-skew alpha-4">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
    </section>
    <section class="section section-skew">
      <div class="container">
        <div class="card card-profile shadow mt--300">
          <div class="px-4">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2" >
              </div> 
              <div class="col-lg-4 order-lg-3 text-lg-right align-self-lg-center">
                <div class="card-profile-actions py-4 mt-lg-0">
                  <div class="text-center">
                  <a href="/user/node" class="btn btn-sm btn-primary">节点列表</a>
                  <a href="/user/shop" class="btn btn-sm btn-primary ">购买套餐</a>
                  <a href="/user/code" class="btn btn-sm btn-default">充值金币</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 order-lg-1">
                <div class="card-profile-stats d-flex justify-content-center">
                  <div>
                    <span class="heading">{$user->money}</span>
                    <span class="description">剩余金币</span>
                  </div>
                  <div>
                    <span class="heading">L{$user->class}</span>
                    <span class="description">等级</span>
                  </div>
                  <div>     
					<span class="heading">{$user->online_ip_count()}</span>
					<span class="description">在线IP数</span>
                  </div>
                </div>
              </div>
            </div>
			
			
			
			
			
			        <div class="row row-grid justify-content-between align-items-center mt-lg">
						<div class="col-lg-8">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
                  <div class="progress-label">
                    <span>流量使用情况</span>
                  </div>
              <div class="progress-wrapper">
                <div class="progress-info">
                  <div class="progress-percentage">
                    <span style="color:#B5B5B5;" title="{number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% 剩余">{$user->LastusedTraffic()}</span>
                    <span style=""> / </span><span style="color:#32CD32;" title="{number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% 剩余">{$user->unusedTraffic()}</span> 
                    <span>({number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}%)</span>
                  </div>
                </div>
                <div class="progress">
                  <div class="progress-bar bg-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}%;"></div>
                </div>
              </div>
                 <div class="row">
                    {if $user->isAbleToCheckin() == 1  && $user->class > 0}
                    <button id="checkin" class="btn btn-primary mt-4" style="margin-left: 1rem;">签到</button>
                    {else}
                    <button disabled="disabled" class="btn btn-primary mt-4" style="margin-left: 1rem;">签到</button>
                    {/if}
					   <p class="col mt-4" style="text-align: right;">
                   </p>	
                  </div>
                  </div>
                </div>
            </div>						
			<div class="col-lg-4">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
                  <div class="progress-label">
                    <span>流量重置日期</span>
                  </div>
						<h2 class="card-title">
                          <p class="mt-4" style="font-weight: 650;">{$user->class_expire}</p>
						</h2>
                    <a  class="btn btn-primary mt-4" href="/user/shop">续费</a>
                  </div>
                </div>
            </div>
        </div>
			
			
            <div class="mt-5 py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
              <div class="mb-3">
                <small class="text-uppercase font-weight-bold">{if $user->lastSsTime()=='从未使用喵'}不知道如何使用？{else}系统公告{/if}</small>
              </div>
										{if $user->lastSsTime()=='从未使用喵'}
										<p style="color:#ff9180">系统检测到您从没使用过，是否需要帮助呢？</p>
										<p style="color:#ff9180">来这里看看我们的<a href="https://docs.flyue.cc"/>教程</a>吧</p>
										<hr>
										{/if}
										<p>{$ann->content}更新日期<code>{$ann->date}</code></p>     
                </div>
              </div>
            </div>
			
			
			
            <div class="mt-5 py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
              <div class="mb-3">
                <small class="text-uppercase font-weight-bold">配置中心</small>
              </div>
              <div class="nav-wrapper">
                <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-text" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0 active" id="all_info-tab" data-toggle="tab" href="#all_info" role="tab" aria-controls="all_info" aria-selected="true">配置信息</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0" id="all_ssr-tab" data-toggle="tab" href="#all_ssr" role="tab" aria-controls="all_ssr" aria-selected="false">SSR快速配置</a>
                  </li>
                   {if URL::SSCanConnect($user)}
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0" id="all_ss-tab" data-toggle="tab" href="#all_ss" role="tab" aria-controls="all_ss" aria-selected="false">SS快速配置</a>
                  </li>
                   {/if}
                </ul>
              </div>
              <div class="card shadow">
                <div class="card-body">
                  <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="all_info" role="tabpanel" aria-labelledby="all_info-tab">
                                      	<p>{$agent}</p>
														<dl class="dl-horizontal">
															<p><dt>端口</dt>
															<dd><code>{$user->port}</code></dd></p>

															<p><dt>密码</dt>
															<dd><code>{$user->passwd}</code></dd></p>

															<p><dt>自定义加密</dt>
															<dd><code>{$user->method}</code></dd></p>

															<p><dt>自定义协议</dt>
															<dd><code>{$user->protocol}</code></dd></p>

															<p><dt>自定义混淆</dt>
															<dd><code>{$user->obfs}</code></dd></p>
														</dl>
														<a class="btn btn-primary mt-4" href="/user/url_reset">重置所有链接</a>
                 </div>
                    <div class="tab-pane fade" id="all_ssr" role="tabpanel" aria-labelledby="all_ssr-tab">
													{$pre_user = URL::cloneUser($user)}
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
															<div style="padding:18px">
																<h4 style="margin-top:12px">普通端口订阅连接</h4>
																<p><code><a class="copy-text" data-clipboard-text="{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=0">{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=0</a></code></p>
																<button class="btn btn-primary mt-4 copy-text" data-clipboard-text="{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=0">点击拷贝</button>
																<h4 style="margin-top:12px">单端口订阅连接</h4>
																<p><code><a class="copy-text" data-clipboard-text="{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=1">{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=1</a></code></p>
																<button class="btn btn-primary mt-4 copy-text" data-clipboard-text="{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=1">点击拷贝</button>
															</div>
																<hr>
															<div style="padding:18px">
																<h4 style="margin-top:12px">普通端口JSON</h4>
                                                              	<p><code>/user/getpcconf?is_mu=0&is_ss=0</code></p>
																<a class="btn btn-primary mt-4" href="/user/getpcconf?is_mu=0&is_ss=0">点击下载</a>
																<h4 style="margin-top:12px">单端口JSON</h4>
                                                              	<p><code>/user/getpcconf?is_mu=1&is_ss=0</code></p>
																<a class="btn btn-primary mt-4" href="/user/getpcconf?is_mu=1&is_ss=0">点击下载</a>
															</div>
																<hr>
															<div style="padding:18px">
																<h4 style="margin-top:12px">普通端口配置文件</h4>
																<button class="btn btn-primary mt-4 copy-text" data-clipboard-text="{$ssr_url_all}">点击拷贝</button>
																<h4 style="margin-top:12px">单端口配置文件</h4>
																<button class="btn btn-primary mt-4 copy-text" data-clipboard-text="{$ssr_url_all}">点击拷贝</button>
															</div>
																<hr>
															<div style="padding:18px">
																<h4 style="margin-top:12px">普通端口路由器脚本</h4>
																<p><code><a >wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond</a></code></p>
																<h4 style="margin-top:12px">单端口路由器脚本</h4>
																<p><code><a >wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond	</a></code></p>
																<hr>
															</div>
                      </div>
                    <div class="tab-pane fade" id="all_ss" role="tabpanel" aria-labelledby="all_ss-tab">
													{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}
																<h4 style="margin-top:12px">订阅连接</h4>
																<p><code><a class="copy-text" data-clipboard-text="{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=1">{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=1</a></code></p>
																<button class="btn btn-primary mt-4 copy-text" data-clipboard-text="{$config["baseUrl"]}/link/{$ssr_sub_token}?mu=1">点击拷贝</button>
																<hr>
																<h4 style="margin-top:12px">配置JSON</h4>
                                                              	<p><code>/user/getpcconf?is_mu=1&is_ss=0</code></p>
																<a class="btn btn-primary mt-4" href="/user/getpcconf?is_mu=0&is_ss=1">点击下载</a>
																<hr>
																<h4 style="margin-top:12px">所有连接</h4>
																<button class="btn btn-primary mt-4 copy-text" data-clipboard-text="{$ss_url_all_win}">点击拷贝</button><hr>
																<h4 style="margin-top:12px"></h4>
																<h4 style="margin-top:12px">普通端口路由器脚本</h4>
																<p><code><a >wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond</a></code></p>
																<hr>
																<h4 style="margin-top:12px">单端口路由器脚本</h4>
																<p><code><a >wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond	</a></code></p>
																<hr>
                     </div>
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
    

	<div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-default">退订确认</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>是否退订当前套餐</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link  ml-auto" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="delete_input">确定</button>
            </div>
        </div>
    </div>
    </div>
	
	
	
    <div class="modal fade" id="info_form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
              <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
                <div class="modal-content">
                  <div class="modal-body p-0">
                    <div class="card bg-secondary shadow border-0">
                      <div class="card-body px-lg-5 py-lg-5">
                        <div class="text-center text-muted mb-4">
                          <small>账户信息</small>
                        </div>
                          <div class="text-center">
						  
						  
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
{include file='newui_dialog.tpl'}


{include file='user/newui_footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>


<script>
$(function(){
	new Clipboard('.copy-text');
});
$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
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
<script>
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}

$(document).ready(function(){
	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/user/bought",
			dataType:"json",
			data:{
				id: deleteid
			},
			success:function(data){
				if(data.ret){
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}else{
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error:function(jqXHR){
				$("#result").modal();
				$("#msg").html(data.msg+"  发生错误了。");
			}
		});
	}
	$("#delete_input").click(function(){
		delete_id();
	});
})
	
</script>