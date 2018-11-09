





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
              </div> 
              <div class="col-lg-4 order-lg-3 text-lg-right align-self-lg-center">
                <div class="card-profile-actions py-4 mt-lg-0">
                  <div class="text-center">
                  <a href="/user" class="btn btn-sm btn-default">用户中心</a>
                  <a href="/user/shop" class="btn btn-sm btn-primary ">购买套餐</a>
                  <a href="/user/code" class="btn btn-sm btn-primary">在线充值</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 order-lg-1">
                <div class="card-profile-stats d-flex justify-content-center">
                  <div>
                    <span class="heading">{$user->money}</span>
                    <span class="description">剩余金额</span>
                  </div>
                  <div>
                    <span class="heading">VIP{$user->class}</span>
                    <span class="description">等级</span>
                  </div>
                  <div>
                    <span class="heading">{$user->online_ip_count()}</span>
                    <span class="description">在线设备数</span>
                  </div>
                </div>
              </div>
            </div>
			
						        <div class="row row-grid justify-content-between align-items-center mt-lg">
																{$id=0}
											{foreach $node_prefix as $prefix => $nodes}

										
										
										
												{$id=$id+1}
																{foreach $nodes as $node}

																	{$relay_rule = null}
																	{if $node->sort == 10}
																		{$relay_rule = $tools->pick_out_relay_rule($node->id, $user->port, $relay_rules)}
																

						<div class="col-lg-6" style=" margin-top: 3rem;">
                <div class="card card-lift shadow border-0">
                  <div class="card-body">
							<div class="card-main">
								<div class="card-inner">
									<p class="card-heading" >
										{$node->name}{if $relay_rule != null} - {$relay_rule->dist_node()->name}{/if}
									</p>
										{if $node->mu_only != 1 && $node->sort != 11}
											{if $node->node_class > $user->class}
											<a class="btn btn-flat pull-right" >等级不足</a>
										{else}
											<a class="btn btn-sm btn-primary pull-right" href="javascript:void(0);" onClick="urlChange('{$node->id}',0,{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">配置信息</a>
										{/if}
									{/if}

										{if ($node->sort == 0 || $node->sort == 10) && $node->custom_rss == 1 && $node->mu_only != -1}
																		{foreach $node_muport as $single_muport}

																			{if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
																				{continue}
																			{/if}

																			{if !($single_muport['user']->class >= $node->node_class && ($node->node_group == 0 || $single_muport['user']->node_group == $node->node_group))}
																				{continue}
																			{/if}

																			{$relay_rule = null}
																			{if $node->sort == 10 && $single_muport['user']['is_multi_user'] != 2}
																				{$relay_rule = $tools->pick_out_relay_rule($node->id, $single_muport['server']->server, $relay_rules)}
																			{/if}
                                  
                                  									<a class="btn btn-sm btn-primary pull-right" href="javascript:void(0);" onClick="urlChange('{$node->id}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">{$single_muport['server']->server} 端口</a>
																						
																		{/foreach}
																	{/if}
									<p>
										节点状态：
										{if $node_heartbeat[$prefix]=="在线"}
										<span class="badge badge-pill badge-success text-uppercase">正常</span>
										{else}{if $node_heartbeat[$prefix]=='暂无数据'}
										<span class="badge badge-pill badge-info text-uppercase">暂无数据</span>
										{else}
										<span class="badge badge-pill badge-danger text-uppercase">维护</span>
										{/if}{/if}
									</p>
									{if $node->sort == 0||$node->sort==7||$node->sort==8||$node->sort==10}
										<p>流量比例：
										<span class="label label-red">
										{$node->traffic_rate}
										</span></p>
									{/if}
										<!-- <p>节点类型：
										{$node->info}</p>
 -->										<p>在线人数：
									{$node_alive[$prefix]}
										</p>
										<p>流量情况：
									{if isset($node_bandwidth[$prefix])==true}{$node_bandwidth[$prefix]}{else}N/A{/if}
										</p>			
								</div>
							</div>
                  </div>
            </div>				
          </div>
	{/if}
	{/foreach}
{/foreach}
        </div>
			

       </div>
     </div>
   </div>
    </section>
<div aria-hidden="true" class="modal modal-va-middle fade" id="nodeinfo" role="dialog" tabindex="-1" >
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner" style="height:480px">
				<iframe class="iframe-seamless" frameborder="0" scrolling="no" title="Modal with iFrame" id="infoifram"></iframe>
			</div>
		</div>
	</div>
</div>
	
{include file='newui_dialog.tpl'}


{include file='user/newui_footer.tpl'}


<script>
function urlChange(id,is_mu,rule_id) {
    var site = './node/'+id+'?ismu='+is_mu+'&relay_rule='+rule_id;
	if(id == 'guide')
	{
		var doc = document.getElementById('infoifram').contentWindow.document;
		doc.open();
		doc.write('<img src="https://i.loli.net/2017/08/22/599b07e61d823.gif" style="width:500px;height:500px; border: none;"/>');
		doc.close();
	}
	else
	{
		document.getElementById('infoifram').src = site;
	}
	$("#nodeinfo").modal();
}
</script>
