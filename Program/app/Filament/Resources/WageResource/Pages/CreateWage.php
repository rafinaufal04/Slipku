<?php

namespace App\Filament\Resources\WageResource\Pages;

use App\Filament\Resources\WageResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateWage extends CreateRecord
{
    protected static string $resource = WageResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
