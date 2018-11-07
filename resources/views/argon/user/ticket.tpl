





{include file='user/newui_header.tpl'}



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
                  <a href="/user" class="btn btn-sm btn-primary">用户中心</a>
                  <a href="/user/shop" class="btn btn-sm btn-default float-right">商店</a>
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
                    <span class="description">在线设备数</span>
                  </div>
                </div>
              </div>
            </div>
			<div class="mt-5 py-5 text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
                    <a  class="btn btn-primary mt-4"  href="/user/ticket/create">创建新工单</a>
                </div>
              </div>
            </div>
						
            <div class="mt-5 py-5 text-center">
              <div class="row justify-content-center">
                <div class="col-lg-12">
              <div class="mb-3">
                <small class="text-uppercase font-weight-bold">您创建的工单</small>
              </div>
					<div class="table-responsive">
						{$tickets->render()}
                        <table class="table">
                            <tr>
								<th>操作</th>
                                <th>ID</th>
                                <th>日期</th>
                                <th>标题</th>
								<th>状态</th>
                            </tr>
                            {foreach $tickets as $ticket}
                                <tr>
									<td>
										<a class="btn btn-primary mt-4" href="/user/ticket/{$ticket->id}/view">查看</a>
									</td>
                                    <td>#{$ticket->id}</td>
                                    <td>{$ticket->datetime()}</td>
                                    <td>{$ticket->title}</td>
									{if $ticket->status==1}
									<td>开启</td>
									{else}
									<td>关闭</td>
									{/if}
                                </tr>
                            {/foreach}
                        </table>
                        {$tickets->render()}
					</div>
                </div>
              </div>
            </div>

			
          </div>
        </div>
      </div>
      
    </section>
    

	


{include file='user/newui_footer.tpl'}

