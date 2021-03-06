<extend file="resource/view/site"/>
<block name="content">
	<ul class="nav nav-tabs" role="tablist">
		<li class="active"><a href="javascript:;">文章管理</a></li>
		<li><a href="?a=content/articlePost&t=site&cid={{q('get.cid')}}&m=article">发表文章</a></li>
	</ul>
	<form action="?a=article/content/articleOrder&t=site" method="post" id="form" ng-cloak class="ng-cloak" ng-controller="MyController">
		<div class="panel panel-default">
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
					<tr>
						<th>编号</th>
						<th width="150">排序</th>
						<th>栏目编号</th>
						<th>标题</th>
						<th>属性</th>
						<th width="150">操作</th>
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="field in data">
						<td>@{{field.aid}}</td>
						<td>
							<input type="text" class="form-control" ng-model="field.orderby">
						</td>
						<td ng-bind="field.category_cid"></td>
						<td ng-bind="field.title"></td>
						<td>
							<span class="label label-danger" ng-if="field.ishot==1">头条</span>
							<span class="label label-success" ng-if="field.iscommend==1">推荐</span>
						</td>
						<td>
							<a href="javascript:;" class="copy" url="{{__ROOT__}}?a=entry/content&aid=@{{field.aid}}&m=article&siteid={{SITEID}}&t=web">复制链接</a> -
							<a href="?a=content/articlePost&t=site&aid=@{{field.aid}}&m=article">编辑</a> -
							<a href="javascript:;" ng-click="del(field.aid)">删除</a>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		<input type="hidden" name="data">
		<button type="submit" class="btn btn-primary" ng-if="data.length>0">确定</button>
	</form>
	{{$data->links()}}
</block>

<script>
	require(['angular', 'util'], function (angular, util) {
		angular.module('myApp', []).controller('MyController', ['$scope', function ($scope) {
			$scope.data =<?php echo json_encode( $data?$data->toArray():[] );?>;
			$scope.del = function (aid) {
				util.confirm('确定删除文章吗,删除后将不可以恢复?', function () {
					location.href = '?a=content/articleDel&t=site&m=article&aid=' + aid;
				})
			}
			//修改排序
			$('form').submit(function () {
				$("[name='data']").val(angular.toJson($scope.data));
			});
		}]);
		$(function () {
			angular.bootstrap(document.getElementById('form'), ['myApp'])
		});
		//复制链接
		$('.copy').each(function () {
			var This = this;
			util.zclip(This, $(This).attr('url'))
		});
	});
</script>