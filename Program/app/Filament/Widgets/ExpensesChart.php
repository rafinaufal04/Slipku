<?php

namespace App\Filament\Widgets;

use App\Models\Wage;
use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;
use Filament\Support\RawJs;

class ExpensesChart extends ChartWidget
{
    protected static ?string $heading = 'Expenses Per Month';

    protected static ?int $sort = 2;

    protected int | string | array $columnSpan = 'full';

    protected static ?string $maxHeight = '400px';

    protected function getData(): array
    {
        $data = Trend::model(Wage::class)
            ->dateColumn('date')
            ->between(
                start: now()->subYear(),
                end: now(),
            )
            ->perMonth()
            ->sum('total');

        return [
            'datasets' => [
                [
                    'label' => 'Expenses',
                    'data' => $data->map(fn(TrendValue $value) => $value->aggregate),
                ],
            ],
            'labels' => $data->map(fn(TrendValue $value) => \Carbon\Carbon::parse($value->date)->format('M')),
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }

    protected function getOptions(): RawJs
    {
        return RawJs::make(<<<JS
        {
            scales: {
                y: {
                    ticks: {
                        callback: (value) => {
                        if (value >= 1000) {
                            return '$ ' + (value / 1000).toFixed(0) + 'K';
                        }
                        return '$ ' + value;
                    },
                    },
                },
            },
        }
    JS);
    }
}
