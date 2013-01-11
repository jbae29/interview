import java.util.*;

public class GameOfLife {
  private int gridSize;
  private boolean[][] grid;

  public GameOfLife(int gridSize) {
    this.gridSize = gridSize;
    this.grid = new boolean[gridSize][gridSize];
  }

  public void set(int x, int y) {
    grid[x][y] = true;
  }

  public void tick() {
    boolean[][] newGrid = new boolean[this.gridSize][this.gridSize];

    for(int x=0; x < grid.length; x++) {
      for(int y=0; y < grid.length; y++) {
        int alive = aliveNeighbors(x, y);
        if (alive == 3 || alive == 2 && grid[x][y]) {
          newGrid[x][y] = true;
        }
      }
    }

    grid = newGrid;
  }

  public int aliveNeighbors(int x, int y) {
    boolean[] neighbors = getNeighbors(x, y);
    int alive = 0;
    for (int i=0; i < neighbors.length; i++) {
      alive += neighbors[i] ? 1 : 0;
    }

    return alive;
  }

  public boolean[] getNeighbors(int x, int y) {
    boolean[] neighbors = new boolean[8];

    neighbors[0] = getNeighbor(x-1, y-1);    
    neighbors[1] = getNeighbor(x-1, y);    
    neighbors[2] = getNeighbor(x-1, y+1);    
    neighbors[3] = getNeighbor(x, y-1);    
    neighbors[4] = getNeighbor(x, y+1);    
    neighbors[5] = getNeighbor(x+1, y-1);    
    neighbors[6] = getNeighbor(x+1, y);    
    neighbors[7] = getNeighbor(x+1, y+1);    

    return neighbors;
  }

  public boolean getNeighbor(int x, int y) {
    if (x < 0 || x >= gridSize || y < 0 || y >= gridSize) {
      return false;
    }

    return grid[x][y];
  }

  public void draw() {
    for (int i=0; i < grid.length; i++) {
      for (int j=0; j < grid.length; j++) {
        System.out.print((grid[i][j] ? "X" : " "));
      }

      System.out.println("");
    }
  }

  public static void main(String[] args) {
    GameOfLife l = new GameOfLife(10);
    l.set(5, 3);
    l.set(5, 4);
    l.set(5, 5);

    l.draw();
    l.tick();
    l.draw();
    l.tick();
    l.draw();
  }
}
