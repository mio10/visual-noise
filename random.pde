class Cell
{
    int x;
    int y;
    int r;
    int g;
    int b;

    Cell(int x, int y)
    {
        this.x = x;
        this.y = y;
        if (monochrome) {
            int c = (int) random(brightness, 256);
            this.r = c;
            this.g = c;
            this.b = c;
        } else {
            this.r = (int) random(brightness, 256);
            this.g = (int) random(brightness, 256);
            this.b = (int) random(brightness, 256);
        }
    }
}

int cellSize = 5;
boolean paused = false;
boolean monochrome = false;
ArrayList<Cell> cells;
int prevWidth;
int prevHeight;
int brightness = 0;

void setup()
{
    surface.setResizable(true);
    surface.setTitle("[Пробел] пауза    [M] вкл./откл. ч/б режим    [W][S] ув./ум. размер клетки    [A][D] ум./ув. яркость");

    prevWidth = width;
    prevHeight = height;

    cells = new ArrayList<Cell>();
    int cellsWidth = floor(width / cellSize);
    int cellsHeight = floor(height / cellSize);
    for (int j = 0; j < cellsHeight; j++) {
        for (int i = 0; i < cellsWidth; i++) {
            cells.add(new Cell(i, j));
        }
    }
}

// TODO: Toggle monochrome mode
// TODO: Increase/decrease cell size (do not forget to setup() after)
// TODO: Increase/decrease brightness of colors (do not forget to setup() after)
void draw()
{
    if (prevWidth != width || prevHeight != height) {
        prevWidth = width;
        prevHeight = height;
        setup();
    }
    if (!paused) {
        setup();
    }
    for (int i = 0; i < cells.size(); i++) {
        noStroke();
        Cell cell = cells.get(i);
        fill(cell.r, cell.g, cell.b);
        rect(cell.x * cellSize, cell.y * cellSize, cellSize, cellSize);
    }
}

void keyPressed()
{
    if (key == ' ') {
        if (paused) {
            paused = false;
        } else {
            paused = true;
        }
    }
    if (key == 'w' || key == 'ц' || key == 'W' || key == 'Ц') {
        if (cellSize < width && cellSize < height) {
            cellSize++;
            setup();
        }
    }
    if (key == 's' || key == 'ы' || key == 'S' || key == 'Ы') {
        if (cellSize > 1) {
            cellSize--;
            setup();
        }
    }
    if (key == 'm' || key == 'ь' || key == 'M' || key == 'Ь') {
        if (monochrome) {
            monochrome = false;
        } else {
            monochrome = true;
        }
    }
    if (key == 'a' || key == 'ф' || key == 'A' || key == 'Ф') {
        if (brightness > 0) {
            brightness--;
            setup();
        }
    }
    if (key == 'd' || key == 'в' || key == 'D' || key == 'В') {
        if (brightness < 256) {
            brightness++;
            setup();
        }
    }
}