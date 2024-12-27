<?php

namespace App\Filament\Widgets;

use App\Models\Position;
use App\Models\Employee;
use App\Models\Wage;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        return [
            Stat::make('Positions', Position::count())
                ->icon('heroicon-o-briefcase'),

            Stat::make('Employees', Employee::count())
                ->icon('heroicon-o-user-group'),

            Stat::make('Wages', Wage::count())
                ->icon('heroicon-o-banknotes'),
        ];
    }
}
