<?php

namespace App\Scopes;

use App\Models\Product;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;

class ActiveStatusScope implements Scope
{
    public function apply(Builder $builder, Model $model)
    {
        if ($model instanceof Product) {
            $builder->where('status', '=', 'in-stock');
        } else {
            $builder->where('status', '=', 'active');
        }
    }
}