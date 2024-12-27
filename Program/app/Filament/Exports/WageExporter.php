<?php

namespace App\Filament\Exports;

use App\Models\Wage;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class WageExporter extends Exporter
{
    protected static ?string $model = Wage::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('employee.employee_name'),
            ExportColumn::make('working_hours'),
            ExportColumn::make('employee.position.hourly_rate'),
            ExportColumn::make('bonus'),
            ExportColumn::make('total'),
            ExportColumn::make('date'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your wage export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
