<?php

class CorsicaAcl
{
    public $request = null;

    static public $acl = array(
        CorsicaConfig::CUSTOMER_GROUP_GUEST => array(
            'route=collection/category' => array()
        ),
        CorsicaConfig::CUSTOMER_GROUP_USER => array(
            'route=collection/category' => array()
        ),
        CorsicaConfig::CUSTOMER_GROUP_BUYER => array(
        )
    );


    public function isAuthorized($userGroup, $action = 'view', $resource = null)
    {
        $currResource = $resource? $resource : $this->getCurrentResource();

        $userGroup = (int) $userGroup;

        $isAuthorized = true;
        foreach (self::$acl[$userGroup] as $aclResource => $permissions) {
            if (strpos($currResource, $aclResource) === 0) {
                $isAuthorized = in_array($action, $permissions);
                break;
            }
        }
        return $isAuthorized;
    }


    public function getCurrentResource()
    {
        $uid = array();
        $container = !empty($this->request->post)? $this->request->post : $this->request->get;
        switch (true) {
            case !empty($container['_route_']):
                $uid['route'] = $container['_route_'];
                break;
            case !empty($container['route']):
                $uid['route'] = $container['route'];
                break;
        }

        if (!empty($container['category_id'])) {
            $uid['category_id'] = $container['category_id'];
        } elseif (!empty($container['path'])) {
            $uid['category_id'] = $container['path'];
        }

        $res = array();
        foreach($uid as $key => $value) {
            $res[] = join('=', array($key, $value));
        }
        return join('&', $res);
    }
}
