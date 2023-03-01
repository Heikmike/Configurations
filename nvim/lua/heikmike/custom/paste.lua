-- Checks if the assests folder exists in the LaTeX project, if not, it creates it.
function CheckAssetsFolder()
    local assets_path = vim.fn.expand('%:p:h') .. '/assets'
    if vim.fn.isdirectory(assets_path) == 0 then
        vim.fn.mkdir(assets_path)
    end
end

-- Writes the content of the screenshot stores by wl-copy in the image file at the right location.
function ClipboardImageToFile()
    local handle = io.popen('wl-paste')
    if handle == nil then
        print('No image in clipboard')
        return
    end
    -- Stores the output of the `wl-paste` command in the variable `image`
    local image = handle:read('*a')
    handle:close()

    CheckAssetsFolder()
    local image_name = vim.fn.input('Image name: ')
    local image_path = vim.fn.expand('%:p:h') .. '/assets/' .. image_name .. '.png'

    local file = io.open(image_path, 'w')
    if file == nil then
        print('Error creating file')
        return
    end

    file:write(image)
    file:close()

    return image_name
end

-- Writes the LaTeX code to include the image in the document.
function PasteImageInLatex()
    local image_name = ClipboardImageToFile()

    local image = '\\begin{figure}[h]\n\\centering\n\\caption{}\n\\label{fig:}\n\\includegraphics[width=8cm]{' ..
        image_name .. '}\n\\end{figure}'
    vim.fn.setreg('l', image)
    vim.cmd('normal! "lp')
end

vim.keymap.set('n', '<leader>pi', function() PasteImageInLatex() end, { noremap = true, silent = true })
