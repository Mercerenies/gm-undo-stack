function RowAddChange(grid) : UndoableChange() constructor {
    target_grid = grid;
    
	// expands the grid by one row filled with gray cells
    static apply = function() {
        var width = ds_grid_width(target_grid);
        var target_height = ds_grid_height(target_grid) + 1;
        ds_grid_resize(target_grid, width, target_height);
        ds_grid_set_region(target_grid, 0, target_height - 1, width - 1, target_height - 1, c_gray);
    }
    
	// shrinks the grid back
    static undo = function() {
        var width = ds_grid_width(target_grid);
        var target_height = ds_grid_height(target_grid) - 1;
        ds_grid_resize(target_grid, width, target_height);
    }
}