<extend file="resource/view/site"/>
<block name="content">
    <ul class="nav nav-tabs">
        <li role="presentation" class="active"><a href="#">平台相关数据</a></li>
    </ul>
    <div class="page-header">
        <h4><i class="fa fa-comments"></i> 公众号信息</h4>
    </div>
    <div class="panel panel-default row">
        <div class="panel-body">
            <div class="col-sm-7">
                <p>
                    <strong>{{v("site.wechat.wename")}}</strong>
                    <span class="label label-success">
                        <?php echo service('WeChat')->chatNameBylevel(v('site.wechat.level')) ?>
                    </span>
                    &nbsp;&nbsp;&nbsp;
                    <if value="v('site.wechat.is_connect')">
                       <span class="text-success">
                            <i class="fa fa-check-circle"></i> 接入成功
                       </span>
                    </if>
                </p>
                <p>
                    <strong>接口地址:</strong>
                    <span>{{__ROOT__}}/index.php?s=site/api/deal&siteid={{SITEID}}</span>
                </p>
                <p>
                    <strong>Token:</strong>
                    <span>{{v('site.wechat.token')}}</span>
                </p>
            </div>
        </div>
    </div>
</block>