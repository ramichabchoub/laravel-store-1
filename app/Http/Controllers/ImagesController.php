<?php

namespace App\Http\Controllers;

use ArPHP\I18N\Arabic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class ImagesController extends Controller
{
    public function index($disk, $width, $height, $image_path)
    {
        $cache_file = "images-cache/{$disk}.{$width}x{$height}." . str_replace('/', '-', $image_path);
        if (!Storage::exists($cache_file)) {
        
            if (!Storage::disk($disk)->exists($image_path)) {
                abort(404);
            }

            $path = Storage::disk($disk)->path($image_path);
            
            $image = Image::make($path);

            $image->resize($width, $height, function($constraint) {
                $constraint->aspectRatio();
            })->crop($width, $height);

            //$image->watermark(storage_path('app/watermark.png'));

            $arabic = new Arabic();
            $text = $arabic->utf8Glyphs('للعرض فقط');

            $image->text($text, $width/2, $height/2, function($font) {
                $font->file(storage_path('app/arial.ttf'));
                $font->size(30);
                $font->color([0, 0, 0, 0.5]);
                $font->align('center');
                $font->valign('middle');
            });

            $image->save(storage_path('app/' . $cache_file), 80, 'webp');
        }

        return response()->file(storage_path('app/' . $cache_file));
    }
}
