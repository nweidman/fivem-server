-- client/dna_hash.lua
-- Global ReverseDnaHash that NEVER returns nil for non-empty input.
-- Replace the "TODO" block with your real reverse/mapping logic.

-- Make it global:
-- function ReverseDnaHash(str)
--     local s = tostring(str or ''):gsub('^%s+', ''):gsub('%s+$', '')  -- trim
--     if s == '' then return nil end

--     -- Normalization examples (keep if your scheme needs them)
--     s = s:gsub('^0x', ''):upper()

    ----------------------------------------------------------------
    -- TODO: your real reverse logic here, e.g. decode a hash, etc.
    -- Must return a citizenid string like "ABC12345".
    -- Example mapping (delete after you implement your decode):
    -- if s == 'DEADBEEF' then return 'ABC12345' end
    -- if s == 'CAFEBABE' then return 'XYZ98765' end
    ----------------------------------------------------------------

    -- Default: pass-through to allow testing (treat input as citizenid)
    -- return s
-- end
