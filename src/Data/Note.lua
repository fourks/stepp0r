--
-- User: palo
-- Date: 7/4/14
--
-- should be a standard note translation system, if you need moar information put them at the end of every note,
-- or create a new mapping
--
access = {
    x      = 3,
    y      = 4,
    pitch  = 1,
    label  = 2,
}

note = {
    c   = {  0 , "C-"  , 1, 2 },
    cis = {  1 , "C#"  , 2, 1 },
    d   = {  3 , "D-"  , 2, 2 },
    dis = {  4 , "D#"  , 3, 1 },
    e   = {  5 , "E-"  , 3, 2 },
    f   = {  6 , "F-"  , 4, 2 },
    fis = {  7 , "F#"  , 5, 1 },
    g   = {  8 , "G-"  , 5, 2 },
    gis = {  9 , "G#"  , 6, 1 },
    a   = { 10 , "A-"  , 6, 2 },
    ais = { 11 , "A#"  , 7, 1 },
    b   = { 12 , "B-"  , 7, 2 }, -- h
    C   = { 13 , "C-"  , 8, 2 },
    off = { -1 , "OFF" , 4, 1 },
}

-- ---
-- calculate pitch
--
function pitch(note,octave)
    return note[access.pitch] + (octave * 12)
end
