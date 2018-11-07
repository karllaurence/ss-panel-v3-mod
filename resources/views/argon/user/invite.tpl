















{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">邀请奖励</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
				
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading"><i class="icon icon-md">warning</i> 注意！！！</p>

										<p><i class="icon icon-md">warning</i>邀请码请给你认识或你认为可靠的人注册使用，邀请有记录，若被邀请的人违反用户协议，您将会有连带责任。</p>

										<p><i class="icon icon-md">warning</i>切勿使用自己的邀请码换邮箱注册多个帐户，系统有记录判断，一经发现，将连带所有帐户删除并不提供解释机会，请珍惜你的帐户。</p>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading"><i class="icon icon-md">rate_review</i> 说明</p>

										<p><i class="icon icon-md">monetization_on</i>邀请码暂时无法购买，请珍惜。</p>

										<p><i class="icon icon-md">monetization_on</i>当有用户需要邀请码时，你可以生成你的邀请码并发给他。</p>
										
										<p><i class="icon icon-md">monetization_on</i>您每拉一位用户注册，当 TA 充值时您就会获得 TA 充值金额的 <code>{$config["code_payback"]} %</code> 的提成。</p>
										
										<p><i class="icon icon-md">monetization_on</i><a href="/user/profile" title="点击查看">我的邀请奖励记录</a></p>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">邀请</p>
										<p>当前您可以生成<code>{$user->invite_num}</code>个邀请码。 </p>
									</div>
									{if $user->invite_num }
									<div class="card-action">
										<div class="card-action-btn pull-left">
											
												<button id="invite" class="btn btn-flat waves-attach">生成我的邀请码</button>
											
										</div>
									</div>
									{/if}
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12">
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
														<th>邀请码(点右键复制链接)</th>
														<th>状态</th>
													</tr>
													</thead>
													<tbody>
													{foreach $codes as $code}
														<tr>
															<!-- <b>{$code->id}</b> --><td><b>{$code->id}</b></td>
															
															<td><a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a>
															</td>
															<td>可用</td>
															<!-- <a class="copy-text" data-clipboard-text="{$code->code}">点击复制</a> -->
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
					
					
					
					{include file='dialog.tpl'}
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


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

