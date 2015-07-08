<?php

class CorsicaRouter
{
    static $request;

    public static function getCurrentResource($request)
    {
        self::$request = $request;

        $currentRoute = '/'.trim($request->get['_route_'], '/').'/';
        foreach (CorsicaConfig::$routes as $route => $resource) {
            if (strpos($currentRoute, $route) === 0) {
                return array(
                    'resource' => $resource,
                    'tail' => trim(str_replace($route, '', $currentRoute), '/')
                );
            }
        }
        return null;
    }

    public static function getCurrentUrl()
    {
        return self::$request['route'];
    }
}

