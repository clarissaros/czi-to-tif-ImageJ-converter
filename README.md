# 🔬 CZI to TIF Batch Converter for ImageJ

Automated conversion of Zeiss .czi microscopy files to .tif using ImageJ macros. 
Designed for biologists who need to process multichannel images without programming experience.

## 📋 What This Repository Contains

This repository includes **three ready-to-use ImageJ macros** for different experimental setups:

| Macro File | Channels | Use Case |
|------------|----------|----------|
| `czi_converter_2channels.ijm` | 2 channels | Double-staining experiments (e.g. nuclei + 1 marker) |
| `czi_converter_3channels.ijm` | 3 channels | Triple-staining experiments (e.g., nuclei + 2 markers) |
| `czi_converter_4channels.ijm` | 4 channels | Quad-staining or multiplex experiments |

## 🚀 Quick Start (No Coding Required!)

### Step 1: Install ImageJ/Fiji
If you don't have ImageJ yet:
1. Download [Fiji (ImageJ distribution)](https://fiji.sc/)
2. Install and open Fiji

### Step 2: Choose the Right Macro
Select the macro that matches your number of channels:
- **2 channels?** → Use `czi_converter_2channels.ijm`
- **3 channels?** → Use `czi_converter_3channels.ijm`
- **4 channels?** → Use `czi_converter_4channels.ijm`

### Step 3: Run the Macro
1. Open ImageJ/Fiji
2. Go to **File → Open** and select your `.ijm` macro file
3. Click **Run** (or press `Ctrl+R` / `Cmd+R`)
4. Select the folder containing your `.czi` files
5. Select the output folder for converted `.tif` files
6. Wait for completion! ✨

## 📁 Expected File Naming Convention

Your `.czi` files should be named consistently and sorted alphabetically. The macro will automatically assign suffixes based on file order.

**Example:** If your folder contains:
- sample001.czi
- sample002.czi
- sample003.czi

With the 3-channel macro, you'll get:
- sample001_nuclei.tif
- sample002_channel2.tif
- sample003_channel3.tif


## ⚙️ Customization

Want to change the channel names? Open the macro in ImageJ (**File → Open**) and modify this line:

```javascript
suffixes = newArray("_nuclei", "_channel2", "_channel3");  // Change these names
```

## 📝 Requirements

- ImageJ or Fiji (recommended: [Fiji](https://fiji.sc/))
- Bio-Formats plugin (included in Fiji) for `.czi` support
- No programming knowledge needed!

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| Dialog boxes still appear | Make sure you're using Fiji (includes Bio-Formats) |
| Files not sorted correctly | Rename files with consistent numbering (e.g., `sample001.czi`, `sample002.czi`) |
| Error opening `.czi` files | Install Bio-Formats plugin or update Fiji |

## 📚 How It Works

This macro:
1. Opens all `.czi` files in a folder
2. Sorts them alphabetically
3. Assigns channel suffixes automatically based on position
4. Exports each file as `.tif`
5. Closes the image to free memory

## 📄 License

MIT License

