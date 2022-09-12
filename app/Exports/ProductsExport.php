<?php

namespace App\Exports;

use App\Models\Product;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

class ProductsExport implements FromQuery, WithMapping, WithColumnFormatting,
    WithHeadings
{

    protected $query;

    public function setQuery($query)
    {
        $this->query = $query;
    }

    /**
    * @return Builder
    */
    public function query()
    {
        return $this->query;
    }

    public function map($product) : array
    {
        return [
            $product->name,
            $product->category->name,
            $product->price,
        ];
    }

    public function columnFormats(): array
    {
        return [
            'C' => NumberFormat::FORMAT_CURRENCY_USD_SIMPLE,
        ];
    }

    public function headings() : array
    {
        return [
            'Title',
            'Category',
            'Price',
        ];
    }
}
