<?php

class ObjectA
{
    public function getAge($date)
    {
        return $date;
    }

    public function name()
    {
        return self::class;
    }
}

class A
{
    private static $obj;

    public $name = 'Mohammed';

    protected $attrs = [];

    public function __construct()
    {
        self::init();
    }

    public static function init()
    {
        self::$obj = new ObjectA;
    }

    public function __toString()
    {
        return $this->name;
    }

    public function __set($name, $value)
    {
        $this->attrs[$name] = $value;
    }

    public function __get($name)
    {
        return $this->attrs[$name] ?? null;
    }

    public function __isset($name)
    {
        return isset($this->attrs[$name]);
    }

    public function __call($name, $arguments)
    {
        return $this->obj->$name(...$arguments);
        
        return call_user_func([self::$obj, $name], $arguments);
    }

    public static function __callStatic($name, $arguments)
    {
        return call_user_func([self::$obj, $name], $arguments);
    }

    public function __invoke()
    {
        echo 'Function';
    }

    public function __clone()
    {
        $this->name = 'Ahmed';
        return $this;
    }
}

$a = new A;
$b = clone $a;
var_dump($b);

echo $a->name;
exit;
//echo $a->getAge('2020-02-02');

A::init();

echo A::name();
