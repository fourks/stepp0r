

function PatternMatrix:__init_launchpad()
    self:__create_matrix_listener()
end

function PatternMatrix:__activate_launchpad()
    self:_refresh_matrix()
    self.pad:register_matrix_listener(self.__matrix_listener)
end

function PatternMatrix:__deactivate_launchpad()
    self:_clear_launchpad()
    self.pad:unregister_matrix_listener(self.__matrix_listener)
end

function PatternMatrix:wire_launchpad(pad)
    self.pad = pad
end

function PatternMatrix:__create_matrix_listener()
    self.__matrix_listener = function (_, msg)
        if self.is_not_active then return end
        if msg.vel ~= Velocity.release then return end
        if self.mode == PatternMatrixData.mode.mix then
            self:__set_mix_to_next_pattern(msg)
        elseif self.mode == PatternMatrixData.mode.copy then
            self:__copy_pattern(msg)
        else
            self:__clear_pattern(msg)
        end
    end
end

function PatternMatrix:__clear_pattern(msg)
    local track_idx   = self:_get_track_idx(msg.x)
    local pattern_idx = self:_get_pattern_idx(msg.x, msg.y)
    print("clear pattern ", pattern_idx, " track ", track_idx)
    renoise.song().patterns[pattern_idx].tracks[track_idx]:clear()
    self:__set_empty_to_matrix(msg.x,msg.y)
    self:_render_matrix()
end
function PatternMatrix:__copy_pattern(msg)
    local track_idx   = self:_get_track_idx(msg.x)
    local pattern_idx = self:_get_pattern_idx(msg.x, msg.y)
    local alias_idx   = self:_get_pattern_alias_idx(self.active_mix_pattern, track_idx)
    if alias_idx ~= -1 then
        local source_pattern_track = renoise.song().patterns[alias_idx].tracks[track_idx]
        renoise.song().patterns[pattern_idx].tracks[track_idx]:copy_from(source_pattern_track)
        self:_set_mix_to_pattern(track_idx, pattern_idx)
        self:_refresh_matrix()
    end
end
function PatternMatrix:__set_mix_to_next_pattern(msg)
    local track_idx   = self:_get_track_idx(msg.x)
    local pattern_idx = self:_get_pattern_idx(msg.x, msg.y)
    local alias_idx = self:_get_pattern_alias_idx(self.next_mix_pattern,track_idx)
    if alias_idx ~= -1 and pattern_idx == alias_idx then
        renoise.song().selected_track_index  = track_idx
    else
        self:_set_mix_to_pattern(track_idx, pattern_idx)
    end
    self:_render_matrix()
end

function PatternMatrix:_refresh_matrix()
    self:_clear_matrix()
    self:_update_matrix()
    self:_render_matrix()
end

function PatternMatrix:_render_matrix()
    self:_clear_launchpad()
    for x = 1, 8 do
        --
        local track_activation = PatternMatrixData.matrix.state.inactive
        if x == self.__track_idx then
            track_activation = PatternMatrixData.matrix.state.active
        end
        --
        local active_pattern_idx = self:_get_pattern_alias_idx(self.active_mix_pattern,x)
        local next_pattern_idx   = self:_get_pattern_alias_idx(self.next_mix_pattern,x)
        --
        for y = 1, 8 do
            local p = self.pattern_matrix[x][y]
            if p then
                local pattern_idx = p[PatternMatrixData.matrix.access.pattern_idx]
                if active_pattern_idx == pattern_idx then
                    self.pad:set_matrix(x,y, self.color[PatternMatrixData.matrix.state.set  + track_activation])
                elseif next_pattern_idx == pattern_idx then
                    self.pad:set_matrix(x,y, self.color[PatternMatrixData.matrix.state.next + track_activation])
                else
                    local state       = p[PatternMatrixData.matrix.access.state]
                    self.pad:set_matrix(x,y, self.color[state + track_activation])
                end
            end
        end
    end
end

function PatternMatrix:_clear_launchpad()
    for x = 1, 8 do
        for y = 1, 8 do
            self.pad:set_matrix(x,y,Color.off)
        end
    end
end


