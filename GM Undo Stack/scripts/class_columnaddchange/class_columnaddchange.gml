function ColumnAddChange(grid) : UndoableChange() constructor {
    target_grid = grid;
    
    static apply = function() {
        var target_width = ds_grid_width(target_grid) + 1;
        var height = ds_grid_height(target_grid);
        ds_grid_resize(target_grid, target_width, height);
        ds_grid_set_region(target_grid, target_width - 1, 0, target_width - 1, height - 1, c_gray);
    }
    
    static undo = function() {
        var target_width = ds_grid_width(target_grid) - 1;
        var height = ds_grid_height(target_grid);
        ds_grid_resize(target_grid, target_width, height);
    }
}
