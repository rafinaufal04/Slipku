<?php

namespace App\Filament\Resources;

use App\Filament\Exports\WageExporter;
use App\Filament\Resources\WageResource\Pages;
// use App\Filament\Resources\WageResource\RelationManagers;
use App\Models\Wage;
use App\Models\Employee;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Table;
// use Illuminate\Database\Eloquent\Builder;
// use Illuminate\Database\Eloquent\SoftDeletingScope;

class WageResource extends Resource
{
    protected static ?string $model = Wage::class;

    protected static ?string $navigationGroup = 'Menu';

    protected static ?string $navigationIcon = 'heroicon-o-banknotes';

    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                //card
                Forms\Components\Card::make()
                    ->schema([

                        //employee
                        Forms\Components\Select::make('employee_id')
                            ->label('Employee')
                            ->relationship('employee', 'employee_name')
                            ->required()
                            ->reactive() // Make the field reactive
                            ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                $employee = Employee::find($state);
                                $hourlyRate = $employee ? $employee->position->hourly_rate : 0;
                                $set('hourly_rate', $hourlyRate);

                                $workingHours = $get('working_hours');
                                $bonus = ($workingHours > 160) ? ($workingHours - 160) * $hourlyRate : 0;
                                $set('bonus', $bonus);

                                $total = ($workingHours * $hourlyRate) + $bonus;
                                $set('total', $total);
                            }),

                        //grid
                        Forms\Components\Grid::make(2)
                            ->schema([

                                //working_hours
                                Forms\Components\TextInput::make('working_hours')
                                    ->numeric()
                                    ->label('Working Hours')
                                    ->placeholder('Working Hours')
                                    ->required()
                                    ->reactive()
                                    ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                        $employeeId = $get('employee_id');
                                        $employee = Employee::find($employeeId);
                                        $hourlyRate = $employee ? $employee->position->hourly_rate : 0;
                                        $bonus = ($state > 160) ? ($state - 160) * $hourlyRate : 0;
                                        $set('bonus', $bonus);

                                        $total = ($state * $hourlyRate) + $bonus;
                                        $set('total', $total);
                                    }),

                                //hourly_rate
                                Forms\Components\TextInput::make('hourly_rate')
                                    ->numeric()
                                    ->prefix('$')
                                    ->label('Hourly Rate')
                                    ->placeholder('Hourly Rate')
                                    ->required()
                                    ->reactive()
                                    ->afterStateHydrated(function ($state, callable $set, $record) {
                                        if ($record) {
                                            $employee = Employee::find($record->employee_id);
                                            $hourlyRate = $employee ? $employee->position->hourly_rate : null;
                                            $set('hourly_rate', $hourlyRate);
                                        }
                                    })
                                    ->afterStateUpdated(function ($state, callable $set, callable $get) {
                                        $workingHours = $get('working_hours');
                                        $employeeId = $get('employee_id');
                                        $employee = Employee::find($employeeId);
                                        $hourlyRate = $employee ? $employee->position->hourly_rate : 0;
                                        $bonus = ($workingHours > 160) ? ($workingHours - 160) * $hourlyRate : 0;
                                        $set('bonus', $bonus);

                                        $total = ($workingHours * $hourlyRate) + $bonus;
                                        $set('total', $total);
                                    })
                                    ->readOnly(),
                            ]),

                        //grid
                        Forms\Components\Grid::make(2)
                            ->schema([

                                //bonus
                                Forms\Components\TextInput::make('bonus')
                                    ->numeric()
                                    ->prefix('$')
                                    ->label('Bonus')
                                    ->placeholder('Bonus')
                                    ->required()
                                    ->readOnly(),

                                //total
                                Forms\Components\TextInput::make('total')
                                    ->numeric()
                                    ->prefix('$')
                                    ->label('Total')
                                    ->placeholder('Total')
                                    ->required()
                                    ->readOnly(),

                            ]),


                        //date
                        Forms\Components\DatePicker::make('date')
                            ->format('Y-m-d')
                            ->label('Date')
                            ->placeholder('Date')
                            ->required(),

                    ])

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('employee.employee_name')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('working_hours')
                    ->searchable()
                    ->sortable()
                    ->formatStateUsing(function ($state) {
                        return $state . ' hours';
                    })
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('bonus')
                    ->searchable()
                    ->sortable()
                    ->formatStateUsing(function ($state) {
                        return '$ ' . number_format($state, 0);
                    })
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('total')
                    ->searchable()
                    ->sortable()
                    ->formatStateUsing(function ($state) {
                        return '$ ' . number_format($state, 0);
                    })
                    ->toggleable(),
                Tables\Columns\TextColumn::make('date')
                    ->searchable()
                    ->sortable()
                    ->date('d M Y')
                    ->toggleable(),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                ExportAction::make()->exporter(WageExporter::class),
            ])
            ->actions([
                Tables\Actions\ViewAction::make()
                    ->color('blue'),
                Tables\Actions\EditAction::make()
                    ->color('warning'),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
                ExportBulkAction::make()->exporter(WageExporter::class),
            ])
            ->defaultSort('created_at', 'desc');
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListWages::route('/'),
            'create' => Pages\CreateWage::route('/create'),
            'edit' => Pages\EditWage::route('/{record}/edit'),
        ];
    }
}
