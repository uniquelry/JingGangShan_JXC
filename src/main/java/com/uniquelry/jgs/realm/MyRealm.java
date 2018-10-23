package com.uniquelry.jgs.realm;

import com.uniquelry.jgs.entity.Menu;
import com.uniquelry.jgs.entity.Role;
import com.uniquelry.jgs.entity.User;
import com.uniquelry.jgs.repository.MenuRepository;
import com.uniquelry.jgs.repository.RoleRepository;
import com.uniquelry.jgs.repository.UserRepository;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Description  自定义Realm
 * @Author uniquelry
 * @Email 1909506001@qq.com
 * @Date 2018/10/20 0:16
 * @Version V1.0
 */
public class MyRealm extends AuthorizingRealm{

	@Resource
	private UserRepository userRepository;
	
	@Resource
	private RoleRepository roleRepository;
	
	@Resource
	private MenuRepository menuRepository;
	
	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String userName=(String) SecurityUtils.getSubject().getPrincipal();
		User user=userRepository.findByUserName(userName);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<Role> roleList = roleRepository.findByUserId(user.getId());
		Set<String> roles = new HashSet<String>();
		for(Role role:roleList){
			roles.add(role.getName());
			List<Menu> menuList = menuRepository.findByRoleId(role.getId());
			for(Menu menu:menuList){
				info.addStringPermission(menu.getName()); // 添加权限
			}
		}
		info.setRoles(roles);
		return info;
	}

	/**
	 * 权限认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName=(String)token.getPrincipal();
		User user=userRepository.findByUserName(userName);
		if(user!=null){
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUserName(),user.getPassword(),"xxx");
			return authcInfo;
		}else{
			return null;				
		}
	}

}
