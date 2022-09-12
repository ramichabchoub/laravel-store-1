<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class DatabaseBackup implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $config = config('database.connections.mysql');
        $file = storage_path('backups/' . date('YmdHis') . '.sql');

        echo "mysqldump -u {$config['username']} –p{$config['password']} {$config['database']} > {$file}";

        mysqldump -u {$config['username']} –p{$config['password']} {$config['database']} > {$file}`;
    }
}
