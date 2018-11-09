{include file='user/newui_header.tpl'}



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
                  <a href="/user" class="btn btn-sm btn-primary float-right">用户中心</a>
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
		
			
			        <div class="row row-grid justify-content-between align-items-center mt-lg">
						<div class="col-lg-6">
                <div class="card card-lift shadow border-0">
                 
                </div>
            </div>		
					{if $user->class!=0}				
			<div class="col-lg-12">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
									<div class="card-inner">
										<p class="card-heading">邀请码（您的朋友将获得注册奖励）</p>
										<p>当前您可以生成<code>{$user->invite_num}</code>个邀请码。 </p>
									</div>
									{if $user->invite_num }
									<div class="card-action">
										<div class="card-action-btn pull-left">
												<button id="invite" class="btn btn-primary">生成邀请码</button>
										</div>
									</div>
							{/if}
                  </div>
                </div>
            </div>
			{/if}
        </div>
					
					
					
					
					
					
					
					{if $user->class!=0}		
					<div class="col-lg-12 col-md-12 mt-4">
						<div class="card margin-bottom-no">
							<div class="card-main">
								
									<div class="card-inner">
									
										<div class="card-table">
											<div class="table-responsive">
											{$codes->render()}
												<table class="table">
													<thead>
													<tr>
														<th>###</th>
														<th>邀请码</th>
														<th>状态</th>
													</tr>
													</thead>
													<tbody>
													{foreach $codes as $code}
														<tr>
															<td><b>{$code->id}</b></td>
															<td><a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a>
															</td>
															<td>可用</td>
														</tr>
													{/foreach}
													</tbody>
												</table>
											{$codes->render()}
											</div>
										</div>
									
								</div>
							</div>
						</div>
					</div>
					{/if}



          </div>
        </div>
      </div>
      
    </section>
    

	
	
	
{include file='newui_dialog.tpl'}


{include file='user/newui_footer.tpl'}

<script>
$(function(){
	new Clipboard('.copy-text');
});
$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已拷贝到您的剪贴板，请您继续接下来的操作。");
});
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

