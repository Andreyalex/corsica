<?php

class CorsicaAcl
{
    public $registry;

    public function __construct($registry)
    {
        $this->registry = $registry;
    }

    /**
     * @param $userGroup
     * @param $resource array with essential resource fields
     * @param string $action
     * @return bool
     */
    public function isAuthorized($userGroup, $resource, $action = 'view')
    {
        $userGroup = (int) $userGroup;

        $isAuthorized = true;
        foreach (CorsicaConfig::$acl[$userGroup] as $item) {
            foreach ($item['resource'] as $key => $val) {
                if ($resource[$key] != $val) {
                    continue 2;
                }
            }
            $isAuthorized = in_array($action, $item['permissions']);
            break;
        }

        return $isAuthorized;
    }
}
