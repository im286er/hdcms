<?php
/** .-------------------------------------------------------------------
 * |  Software: [HDCMS framework]
 * |      Site: www.hdcms.com
 * |-------------------------------------------------------------------
 * |    Author: 向军 <2300071698@qq.com>
 * |    WeChat: aihoudun
 * | Copyright (c) 2012-2019, www.houdunwang.com. All Rights Reserved.
 * '-------------------------------------------------------------------*/
namespace app\system\controller;

/**
 * 前端组件处理
 * Class component
 * @package system\controller
 * @author 向军
 */
class Component {
	//模块列表
	public function moduleBrowser() {
		service( 'user' )->loginAuth();
		View::with( 'modules', v( 'site.modules' ) );
		View::with( 'useModules', explode( ',', q( 'get.mid', '', [ ] ) ) );

		return view();
	}

	//加载系统链接
	public function linkBrowser() {
		service( 'user' )->loginAuth();

		return view();
	}

	//模块列表
	public function moduleList() {
		service( 'user' )->loginAuth();
		$modules = Db::table( 'modules' )->get();

		return view()->with( 'modules', $modules );
	}

	//字体列表
	public function font() {
		service( 'user' )->loginAuth();

		return View::make();
	}

	//上传图片webuploader
	public function uploader() {
		if ( ! v( 'user' ) ) {
			message( '没有操作权限', 'back', 'error' );
		}
		$file = Upload::path( c( 'upload.path' ) . '/' . date( 'Y/m/d' ) )->make();
		if ( $file ) {
			$data = [
				'uid'        => v( 'user.info.uid' ) ?: v( 'user.member.uid' ),
				'siteid'     => SITEID,
				'name'       => $file[0]['name'],
				'filename'   => $file[0]['filename'],
				'path'       => $file[0]['path'],
				'extension'  => strtolower( $file[0]['ext'] ),
				'createtime' => time(),
				'size'       => $file[0]['size'],
				'user_type'  => v( 'user.system.user_type' ),
				'data'       => Request::post( 'data', '' )
			];
			Db::table( 'core_attachment' )->insert( $data );
			ajax( [ 'valid' => 1, 'message' => $file[0]['path'] ] );
		} else {
			ajax( [ 'valid' => 0, 'message' => \Upload::getError() ] );
		}
	}

	//获取文件列表webuploader
	public function filesLists() {
		$db = Db::table( 'core_attachment' )
		        ->where( 'uid', v( 'user.info.uid' ) ?: v( 'user.member.uid' ))
		        ->whereIn( 'extension', explode( ',', strtolower( $_GET['extensions'] ) ) )
		        ->where( 'user_type', v( 'user.system.user_type' ) )
		        ->orderBy( 'id', 'DESC' );
		if ( v( 'user.system.user_type' ) == 'member' ) {
			//前台会员根据站点编号读取数据
			$db->where( 'siteid', SITEID );
		}
		$data = $db->get();
		if ( $data ) {
			foreach ( $data as $k => $v ) {
				$data[ $k ]['createtime'] = date( 'Y/m/d', $v['createtime'] );
				$data[ $k ]['size']       = Tool::getSize( $v['size'] );
			}
		}
		ajax( [ 'data' => $data ?: [ ], 'page' => $db->links() ] );
	}

	//删除图片delWebuploader
	public function removeImage() {
		if ( v( 'user.uid' ) ) {
			message( '请登录后操作', 'back', 'error' );
		}
		$db   = Db::table( 'core_attachment' );
		$file = $db->where( 'id', $_POST['id'] )->where( 'uid', v( 'user.info.uid' ) )->first();
		if ( is_file( $file['path'] ) ) {
			unlink( $file['path'] );
		}
		$db->where( 'id', $_POST['id'] )->where( 'uid', v( 'user.info.uid' ) )->delete();
	}

	//选择用户
	public function users() {
		if ( ! Session::get( 'admin_uid' ) ) {
			message( '请登录后操作', 'back', 'error' );
		}
		if ( isset( $_GET['loadUser'] ) ) {
			//过滤不显示的用户
			$filterUid = explode( ',', q( 'get.filterUid', '' ) );
			$db        = Db::table( 'user' )->join( 'user_group', 'user.groupid', '=', 'user_group.id' );
			//排除站长
			if ( ! empty( $filterUid ) ) {
				$db->whereNotIn( 'uid', $filterUid );
			}
			//按用户名筛选
			if ( empty( $_GET['username'] ) ) {
				$users = $db->get();
			} else {
				$users = $db->where( "username LIKE '%{$_GET['username']}%'" )->get();
			}
			ajax( $users );
		}

		return view();
	}

	//模块与模板列表,添加站点时选择扩展模块时使用
	public function ajaxModulesTemplate() {
		if ( ! Session::get( 'admin_uid' ) ) {
			message( '请登录后操作', 'back', 'error' );
		}
		$modules   = Db::table( 'modules' )->where( 'is_system', 0 )->get();
		$templates = Db::table( 'template' )->where( 'is_system', 0 )->get();

		return view()->with( [
			'modules'   => $modules,
			'templates' => $templates
		] );
	}

	//百度编辑器
	public function ueditor() {
		if ( ! v( "user.info.uid" ) ) {
			message( '请登录后操作', 'back', 'error' );
		}
		$path   = ROOT_PATH . '/resource/hdjs/component/ueditor';
		$CONFIG = json_decode( preg_replace( "/\/\*[\s\S]+?\*\//", "", file_get_contents( $path . "/php/config.json" ) ), TRUE );
		$action = $_GET['action'];
		switch ( $action ) {
			case 'config':
				$result = json_encode( $CONFIG );
				break;
			/* 上传图片 */
			case 'uploadimage':
				/* 上传涂鸦 */
			case 'uploadscrawl':
				/* 上传视频 */
			case 'uploadvideo':
				/* 上传文件 */
			case 'uploadfile':
				$result = include( $path . "/php/action_upload.php" );
				break;

			/* 列出图片 */
			case 'listimage':
				$result = include( $path . "/php/action_list.php" );
				break;
			/* 列出文件 */
			case 'listfile':
				$result = include( $path . "/php/action_list.php" );
				break;

			/* 抓取远程文件 */
			case 'catchimage':
				$result = include( $path . "/php/action_crawler.php" );
				break;

			default:
				$result = json_encode( [
					'state' => '请求地址出错'
				] );
				break;
		}
		/* 输出结果 */
		if ( isset( $_GET["callback"] ) ) {
			if ( preg_match( "/^[\w_]+$/", $_GET["callback"] ) ) {
				echo htmlspecialchars( $_GET["callback"] ) . '(' . $result . ')';
			} else {
				echo json_encode( [
					'state' => 'callback参数不合法'
				] );
			}
		} else {
			echo $result;
		}
	}
}