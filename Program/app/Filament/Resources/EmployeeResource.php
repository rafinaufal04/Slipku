<?php

namespace App\Filament\Resources;

use App\Filament\Exports\EmployeeExporter;
use App\Filament\Resources\EmployeeResource\Pages;
// use App\Filament\Resources\EmployeeResource\RelationManagers;
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

class EmployeeResource extends Resource
{
    protected static ?string $model = Employee::class;

    protected static ?string $navigationGroup = 'Menu';

    protected static ?string $navigationIcon = 'heroicon-o-user-group';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                //card
                Forms\Components\Card::make()
                    ->schema([

                        //name
                        Forms\Components\TextInput::make('employee_name')
                            ->label('Employee Name')
                            ->placeholder('Employee Name')
                            ->required(),

                        //address
                        Forms\Components\Textarea::make('address')
                            ->label('Address')
                            ->placeholder('Address')
                            ->rows(3)
                            ->required(),

                        //phone
                        Forms\Components\TextInput::make('phone')
                            ->numeric()
                            ->label('Phone Number')
                            ->placeholder('Phone Number')
                            ->required(),

                        //position
                        Forms\Components\Select::make('position_id')
                            ->label('Position')
                            ->relationship('position', 'position_name')
                            ->required(),

                    ])

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('employee_name')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('address')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('phone')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('position.position_name')
                    ->label('Position')
                    ->searchable()
                    ->sortable()
                    ->toggleable(),
            ])
            ->filters([
                //
            ])
            ->headerActions([
                ExportAction::make()->exporter(EmployeeExporter::class),
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
                ExportBulkAction::make()->exporter(EmployeeExporter::class),
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
            'index' => Pages\ListEmployees::route('/'),
            'create' => Pages\CreateEmployee::route('/create'),
            'edit' => Pages\EditEmployee::route('/{record}/edit'),
        ];
    }
}
