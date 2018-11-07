





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
                  		<div class="col-lg-12 col-md-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">color_lens</i>&nbsp置顶公告</p>
										<p><a href="https://t.me/LKFWorld" target="_blank">Telegram群组</a> | <a href="https://t.me/mimemi_push1" target="_blank">Telegram公告栏</a> <!-- | <a href="/client.html" target="_blank">相关软件</a> --> | <a href="https://docs.mimemi.org" target="_blank">使用教程</a> | <a href="https://mimemi.org/help/windows" target="_blank">视频教程</a></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">color_lens</i>&nbsp公告栏</p>
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>

								</div>
							</div>   
							<!-- 一键切换SS/SSR -->
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">whatshot</i>&nbsp一键切换 SSR/SS 模式<br>(Surge客户端用户请点击切换成SS模式即可)</p>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<p id="checkin-btn">
												<button id="mode-ssr" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;SSR 模式</button>
												<button id="mode-ss" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;SS 模式</button>
											</p>
										</div>
									</div>
								</div>
							</div>

							<!-- V4 宅男养成计划 -->
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md t4-text">stars</i>&nbspV4 宅男养成计划(Netflix账号)</p>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<p id="checkin-btn">
												{if $user->class>=4}
												Netflix账号:<br>
												<font color='purple'>
													
													001@mdu.edu.rs
													<br>
													002@mdu.edu.rs
													<br>
												003@mdu.edu.rs<br>
											004@mdu.edu.rs
												</font>
												<br>
												密码:<br><font color="purple">

												mimemi</font>
												{else}
												<fonr color='red'>抱歉,您还不是VIP4,所以您不能享受此计划</font>
												<font><b>购买套餐<a href="/user/shop">点击这里</a></b></font>
												{/if}
											</p>
										</div>
									</div>
								</div>
							</div>
                          

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">phonelink</i>&nbsp快速添加MIMEMI节点</p>
										<p>点击下面选择你所使用的系统（设备）,安装对应软件后按指导快速添加节点使用</p>
										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li >
													<a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;
													{if $ssr_prefer}ShadowsocksR{/if}
													{if !$ssr_prefer}Shadowsocks{/if}</a>
												</li>
											</ul>
										</nav>
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}

													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>

															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ssr_info">
														{if $ssr_prefer}
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
                                                            <p><font color="red">敬告:此页面包含您的订阅信息和密码，阁下应当妥善保管，请勿泄露或分享给他人！</font></p>
                                                            <p>ShadowsocksR 全平台订阅地址:</p>
                                                            <p>普通端口:</p>
                                                            <p><dd><code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code></dd></p>
                                                            <a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击复制</a>
                                                            <p>995端口:</p>
                                                            <p><dd><code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code></dd></p>
                                                            <a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">点击复制</a>
                                                            <p>Surge 托管地址:</p>
                                                            <p><dd><code>{$baseUrl}/link/{$ios_token}?is_ss=1</code></dd></p>
                                                            <a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ios_token}?is_ss=1">点击复制</a>

															<p><dt>端口</dt>
															<dd><font color="purple">{$user->port}</font></dd></p>

															<p><dt>密码</dt>
															<dd><font color="purple">{$user->passwd}</font></dd></p>

															<p><dt>自定义加密</dt>
															<dd><font color="purple">{$user->method}</font></dd></p>

															<p><dt>自定义协议</dt>
															<dd><font color="purple">{$user->protocol}</font></dd></p>

															<p><dt>自定义混淆</dt>
															<dd><font color="purple">{$user->obfs}</font></dd></p>
															
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>

															<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>

															<p>请注意，在当前状态下您的 SSR 订阅链接已经失效，您无法通过此种方式导入节点。</p>
														{/if}
														{else}
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p>各个节点的地址请到节点列表查看！</p>


															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
															<p>同时, Shadowsocks 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
														{/if}
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ssr_windows">
														{if $ssr_prefer}
                                                        <p>Windows客户端<a href="/ssr-download/ssr-win.7z">点击下载</a>
														<p><span class="icon icon-lg text-black">looks_one</span> 解压至任意磁盘</p>
														<p><span class="icon icon-lg text-black">looks_two</span> 运行程序</p>
														<p> <span class="icon icon-lg text-black">looks_3</span> 任务栏右下角右键纸飞机图标--服务器订阅--SSR服务器订阅设置，将订阅链接设置为下面的地址，确定之后再更新 SSR 服务器订阅。</p>
														<p> <span class="icon icon-lg text-black">looks_4</span> 然后选择一个合适的服务器，代理规则选“绕过局域网和大陆”，然后即可上网。</p>
														<p><span class="icon icon-lg text-black">looks_5</span>选择PAC模式，并将此文件<a href="/downloads/pac.txt">右击链接另存为</a>放到客户端安装目录</p>
														<br>
														<br>
														<br>
														<p>如果你无法正常使用订阅,请下载<a href="/user/getpcconf?is_mu=0&amp;is_ss=0">这个</a>,右键小飞机 -&gt; <code>服务器</code> -&gt; <code>从配置文件导入服务器</code>，选择这个文件，<br><br>
														</p>
														<p>SSR 订阅地址:
														<br>
														普通端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击复制</a><br>
														995端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">点击复制<br>
														{else}
														<p><a href="/ssr-download/ss-win.zip">下载</a>，解压，运行程序，然后您有两种方式导入所有节点<br>
															(1)下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>，放到小飞机的目录下，然后打开小飞机。<br>
															(2)点击<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">这里（普通端口）</a>, 然后右键小飞机 -- 从剪贴板导入 URL<br>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ssr_mac">
														{if $ssr_prefer}
                                                        <p>Mac OS 客户端<a href="/ssr-download/ssr-mac.dmg">点击下载</a>
														<p><span class="icon icon-lg text-black">looks_one</span>打开下载的.dmg文件</p>
														<p><span class="icon icon-lg text-black">looks_two</span>把ShadowsocksX拖入到Finder的应用程序列表(Applications)</p>
														<p><span class="icon icon-lg text-black">looks_3</span>打开Launchapad里的ShadowsocksX</p>
														<p><span class="icon icon-lg text-black">looks_4</span>菜单栏的纸飞机图标-服务器-服务器订阅填入以下订阅地址，更新后出现您的节点</p>
														<p><span class="icon icon-lg text-black">looks_5</span>菜单栏的纸飞机图标-打开shadowsocks</p>
														</p>
														<p>SSR 订阅地址:
														<br>
														普通端口:
														<br>
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击复制</a><br>
														995端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">点击复制<br>
														{else}
														<p><a href="/ssr-download/ss-mac.zip">下载</a>，安装，然后下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=1">这个（单端口多用户）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
														{/if}

													</div>
													<div class="tab-pane fade" id="all_ssr_ios">
														{if $ssr_prefer}
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>（需美区Apple id）,可联系站长索要,或用爱思助手安装:<a href="https://www.mimemi.me/downloads/Shadowrocket_2.1.12.ipa">这个</a><br>
															<br>
															<p><span class="icon icon-lg text-black">looks_one</span> 打开Shadowrocket软件后，点击右上角<span class="icon icon-lg text-black">add</span>，添加类型为<code>Subscribe</code>，URL填写以下地址即可自动更新节点</p>
															<p><span class="icon icon-lg text-black">looks_two</span> 选择任意节点点击连接，然后点击allow后解锁指纹</p>
															<br>
															<br>
															<p>如果无法正常订阅，可以在Safari中<a href="{$ssr_url_all}">点击这里</a>,再点击确定，就可以批量添加节点</p>
															<p>SSR 订阅地址:
																<br>
														普通端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击复制</a><br>
														995端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">点击复制<br>
														{else}
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，然后在 Safari 中点击<a href="{$ss_url_all}">这个（普通端口）</a>或者<a href="{$ss_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
														<p>iOS 下载<a href="/link/{$ios_token}?is_ss=1">这个（普通端口）</a>或者<a href="/link/{$ios_token}?is_ss=1&is_mu=1">这个（单端口多用户）</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ssr_android">
														{if $ssr_prefer}
                                                        <p>Andorid 客户端<a href="/ssr-download/ssr-android.apk">点击下载</a>
														<p><span class="icon icon-lg text-black">looks_one</span> 打开App，点击右下角的<span class="icon icon-lg text-black">add</span>号图标</p>
														<p><span class="icon icon-lg text-black">looks_two</span> 点击添加/升级 SSR订阅，输入复制的订阅地址后确定</p>
														<p><span class="icon icon-lg text-black">looks_3</span> 请把系统自带的「FreeSSR-public」订阅左滑删除（不删无法更新）</p>
														<p><span class="icon icon-lg text-black">looks_4</span> 点击确定并升级，选择任意节点，路由选择：绕过局域网及中国大陆地址</p>
														<p><span class="icon icon-lg text-black">looks_5</span> 点击右上角的纸飞机图标即可连接</p>
														<br>
														<br>
														<p>如果无法正常订阅，可以在手机默认浏览器<a href="{$ssr_url_all}">点击这个</a>再点确定，就可以批量添加节点.</p>
														<p>SSR 订阅地址:
														<br>
														普通端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击复制</a><br>
														995端口:
														<a class="copy-text" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">点击复制<br>
														{else}
														<p><a href="/ssr-download/ss-android.apk">下载</a>，再<a href="/ssr-download/ss-android-obfs.apk">下载</a>，然后安装，然后在手机上点击<a class="copy-text" data-clipboard-text="{$ss_url_all}">这个链接（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">这个链接（单端口多用户端口）</a>复制到剪贴板，打开 Shadowsocks 客户端，选择从剪贴板导入，然后选择一个节点，设置一下路由为绕过大陆，点击飞机就可以上网了。</p>
														{/if}


                                                  	<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ss_info">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p>各个节点的地址请到节点列表查看！</p>


															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
															<p>同时, Shadowsocks 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ss_windows">
														<p><a href="/ssr-download/ss-win.zip">下载</a>，解压，运行程序，然后您有两种方式导入所有节点<br>
															(1)下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>，放到小飞机的目录下，然后打开小飞机。<br>
															(2)点击<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">这里（普通端口）</a>, 然后右键小飞机 -- 从剪贴板导入 URL<br>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p><a href="/ssr-download/ss-mac.zip">下载</a>，安装，然后下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=1">这个（单端口多用户）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，已购买此软件的美国商店Apple ID:<code>shz7348@icloud.com</code> 密码<code>Qq654321.</code>注意特殊符号与大小写,自行切换商店账号下载安装，然后在 Safari 中点击<a href="{$ss_url_all}">这个（普通端口）</a>或者<a href="{$ss_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
														<p>iOS 下载<a href="/link/{$ios_token}?is_ss=1">这个（普通端口）</a>或者<a href="/link/{$ios_token}?is_ss=1&is_mu=1">这个（单端口多用户）</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p><a href="/ssr-download/ss-android.apk">下载</a>，再<a href="/ssr-download/ss-android-obfs.apk">下载</a>，然后安装，然后在手机上点击 <a class="copy-text" data-clipboard-text="{$ss_url_all}"> 这个链接（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">这个链接（单端口多用户端口）</a>复制到剪贴板，打开 Shadowsocks 客户端，选择从剪贴板导入，然后选择一个节点，设置一下路由为绕过大陆，点击飞机就可以上网了。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														或者这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="btn btn-brand btn-flat waves-attach" href="/user/url_reset"><span class="icon">autorenew</span>&nbsp重置我的订阅链接</a></p>
											</div>
										</div>
									</div>    
								</div>
							</div>
							</div>
							</div>


                          
						</div>

						<div class="col-lg-6 col-md-6">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">whatshot</i>&nbsp账号使用情况</p>
										<dl class="dl-horizontal">
                              
											<p><dt>会员级别</dt>
											{if $user->class!=0}
											<dd><i class="icon icon-md t4-text">stars</i>&nbspVIP&nbsp{$user->class}</dd></p>
											{else}
                                            <dd><i class="icon icon-md t4-text">stars</i>&nbsp;免费</dd>
                                            {/if}
                                         	 {if $user->class!=0}
                                          	<p><dt>Telegram(VIP可见)</dt>
											<dd><i class="icon icon-md t4-text">stars</i>&nbsp;<a href="https://t.me/joinchat/GB7fekvCIS56kD-WXbpZYA" target="view_window">点击加入TG群</a></dd>
                                          	{else}
                                             
                                             {/if}
                                          	</p>
											<p><dt>端口号</dt>
											<dd><i class="icon icon-md">settings_input_component</i>&nbsp{$user->port}</dd></p>

											<p><dt>在线IP数</dt>
											<dd><i class="icon icon-md">phonelink</i>&nbsp{$user->online_ip_count()}</dd></p>     

									     	<p><dt>当前余额</dt>
                                            <dd><i class="icon icon-md">monetization_on</i>&nbsp{$user->money}&nbspCNY</dd></p>
                                        
											<p><dt>等级过期时间</dt>
                                            {if $user->class_expire!="1989-06-04 00:05:00"}
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->class_expire}</dd>
												<font color="red">

                                              <span class="label-level-expire">&nbsp&nbsp&nbsp&nbsp&nbsp剩余</span>
											  <span id="days-level-expire"></span>
                                              <span class="label-level-expire">天</span>
                                          		</font>
                                          	{else}
                                            <dd><i class="icon icon-md">event</i>&nbsp;不过期</dd>
                                            {/if}
											</p>

											<p><dt>上次使用时间</dt>
                                            {if $user->lastSsTime()!="从未使用喵"}
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->lastSsTime()}</dd>
                                          	{else}
                                          	<dd><i class="icon icon-md">event</i>&nbsp;从未使用</dd>
                                          	{/if}</p>

											<p><dt>上次签到时间</dt>
                                            <dd><i class="icon icon-md">event</i>&nbsp;{$user->lastCheckInTime()}</dd></p>


											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
                                         
										</dl>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;点我签到&nbsp;<span class="icon">screen_rotation</span>&nbsp;或者摇动手机签到</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;今日已签到</a></p>
											{/if}
										</div>
									</div>
									
								</div>
							</div>


							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">

										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>

										<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100}, legendText:"已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>

									</div>

								</div>
							</div>       
                             

							<!-- <div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-lg">local_gas_station</i>续命获取流量</p>
											<p>流量不会重置，可以通过续命获取流量。</p>

											<p>每次续命可以获取{$config['checkinMin']}~{$config['checkinMax']}MB流量。</p>

											<p>每天可以续命一次。您可以点击按钮或者摇动手机来续命。</p>

											<p>上次续命时间：<code>{$user->lastCheckInTime()}</code></p>

											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;续命</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能续命</a></p>
											{/if}
										</div>
									</div>

								</div>
							</div> -->


						{include file='dialog.tpl'}

					</div>


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

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
                    method: "aes-256-cfb"
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
                    obfs: "simple_obfs_tls"
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
/*
 * Author: neoFelhz & CloudHammer
 * https://github.com/CloudHammer/CloudHammer/make-sspanel-v3-mod-great-again
 * License: MIT license & SATA license
 */
function CountDown() {
    var levelExpire = Date.parse("{$user->class_expire}");
    var accountExpire = Date.parse("{$user->expire_in}");
    var nowDate = new Date();
    var a = nowDate.getTime();
    var b = levelExpire - a;
    var c = accountExpire - a;
    var levelExpireDays = Math.floor(b/(24*3600*1000));
    var accountExpireDays = Math.floor(c/(24*3600*1000));
    if (levelExpireDays < 0 || levelExpireDays > 315360000000) {
        document.getElementById('days-level-expire').innerHTML = "无限期";
        for (var i=0;i<document.getElementsByClassName('label-level-expire').length;i+=1){
            document.getElementsByClassName('label-level-expire')[i].style.display = 'none';
        }
    } else {
        document.getElementById('days-level-expire').innerHTML = levelExpireDays;
    }
    if (accountExpireDays < 0 || accountExpireDays > 315360000000) {
        document.getElementById('days-account-expire').innerHTML = "无限期";
        for (var i=0;i<document.getElementsByClassName('label-account-expire').length;i+=1){
            document.getElementsByClassName('label-account-expire')[i].style.display = 'none';
        }
    } else {
        document.getElementById('days-account-expire').innerHTML = accountExpireDays;
    }
}
</script>

<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到剪贴板，请在客户端里使用。");
});

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();
    CountDown()

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
