<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Hello,</h2>
    <p>Here're latest products added to our store in the last 7 days.</p>
    <div class="">
        @foreach ($products as $product)
        <div class="">
            <img src="{{ $product->image_url }}" alt="">
            <h3>{{ $product->name }}</h3>
            <div>{{ $product->price }}</div>
        </div>
        @endforeach
    </div>
</body>
</html>