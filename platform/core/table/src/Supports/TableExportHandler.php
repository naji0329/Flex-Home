<?php

namespace Botble\Table\Supports;

use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Events\BeforeSheet;
use Maatwebsite\Excel\Events\Event;
use PhpOffice\PhpSpreadsheet\Exception;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Worksheet\MemoryDrawing;
use PhpOffice\PhpSpreadsheet\Worksheet\PageSetup;
use Yajra\DataTables\Services\DataTablesExportHandler;

class TableExportHandler extends DataTablesExportHandler implements WithEvents
{
    /**
     * @return array
     */
    public function registerEvents(): array
    {
        return [
            BeforeSheet::class => function (BeforeSheet $event) {
                $this->beforeSheet($event);
            },
            AfterSheet::class  => function (AfterSheet $event) {
                $this->afterSheet($event);
            },
        ];
    }

    /**
     * @param BeforeSheet $event
     */
    protected function beforeSheet(BeforeSheet $event)
    {
        $delegate = $event->sheet->getDelegate();

        $delegate
            ->getPageSetup()
            ->setOrientation(PageSetup::ORIENTATION_LANDSCAPE)
            ->setPaperSize(PageSetup::PAPERSIZE_A4)
            ->setFitToWidth(1)
            ->setFitToHeight(0)
            ->setHorizontalCentered(true)
            ->setVerticalCentered(false);

        $delegate
            ->getPageMargins()
            ->setTop(0.4)
            ->setLeft(0.4)
            ->setBottom(0.4)
            ->setRight(0.4)
            ->setHeader(0.0)
            ->setFooter(0.0);
    }

    /**
     * @param AfterSheet $event
     * @throws Exception
     */
    protected function afterSheet(AfterSheet $event)
    {
        $delegate = $event->sheet->getDelegate();
        $totalColumns = count(array_filter($this->headings()));
        $lastColumnName = $this->getNameFromNumber($totalColumns);
        try {
            $dimensions = 'A1:' . $lastColumnName . '1';
            $delegate->getStyle($dimensions)->applyFromArray(
                [
                    'font'      => [
                        'bold'  => true,
                        'color' => [
                            'argb' => 'ffffff',
                        ],
                    ],
                    'alignment' => [
                        'horizontal' => Alignment::HORIZONTAL_CENTER,
                    ],
                    'fill'      => [
                        'fillType'   => Fill::FILL_SOLID,
                        'startColor' => [
                            'argb' => '1d9977',
                        ],
                    ],
                ]
            );
        } catch (Exception $exception) {
            info($exception->getMessage());
        }

        $delegate->getColumnDimension('A')->setWidth(10);
        $delegate->getRowDimension(1)->setRowHeight(20);

        for ($index = 2; $index <= $totalColumns; $index++) {
            $delegate->getColumnDimension($this->getNameFromNumber($index))->setWidth(25);
        }

        $delegate
            ->getStyle('A1:Z' . ($this->collection->count() + 1))
            ->getAlignment()
            ->setWrapText(true)
            ->setHorizontal(Alignment::HORIZONTAL_CENTER)
            ->setVertical(Alignment::VERTICAL_CENTER);

        $delegate
            ->setSelectedCell('A1')
            ->freezePane('A2');
    }

    /**
     * @param int $number
     * @return string
     */
    protected function getNameFromNumber($number)
    {
        $numeric = ($number - 1) % 26;
        $letter = chr(65 + $numeric);
        $num2 = intval(($number - 1) / 26);
        if ($num2 > 0) {
            return $this->getNameFromNumber($num2) . $letter;
        }

        return $letter;
    }

    /**
     * @param string $imageUrl
     * @return null|resource
     */
    protected function getImageResourceFromURL($imageUrl)
    {
        if (!$imageUrl) {
            return null;
        }

        $imageUrl = url($imageUrl);

        try {
            $content = @file_get_contents($imageUrl);
            if (!$content) {
                return null;
            }
            return imagecreatefromstring($content);
        } catch (Exception $exception) {
            return null;
        }
    }

    /**
     * @param Event $event
     * @param string $cell
     * @throws Exception
     */
    protected function drawingImage(Event $event, string $column, int $row)
    {
        if (request()->input('action') !== 'excel') {
            return false;
        }

        $image = $event->sheet->getDelegate()
            ->getCell($column . $row)
            ->getValue();

        $imageContent = $this->getImageResourceFromURL($image);

        if ($imageContent) {
            $drawing = new MemoryDrawing;
            $drawing->setName('Image')
                ->setWorksheet($event->sheet->getDelegate());

            $drawing
                ->setRenderingFunction(MemoryDrawing::RENDERING_PNG)
                ->setMimeType(MemoryDrawing::MIMETYPE_PNG)
                ->setImageResource($imageContent)
                ->setCoordinates($column . $row)
                ->setWidth(70)
                ->setHeight(70)
                ->setOffsetX(10)
                ->setOffsetY(10);

            $event->sheet->getDelegate()
                ->getCell($column . $row)
                ->setValue(null);

            $event->sheet->getDelegate()
                ->getRowDimension($row)
                ->setRowHeight(65);

            $event->sheet->getDelegate()
                ->getColumnDimension($column)
                ->setWidth(11);
        }

        return true;
    }
}
