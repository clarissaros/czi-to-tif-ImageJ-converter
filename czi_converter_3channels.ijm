// ============================================================
// CZI to TIF Batch Converter for ImageJ/Fiji
// Author: Clarissa Rosato – https://orcid.org/0000-0001-5437-5463
// https://github.com/clarissaros/czi-to-tif-ImageJ-converter.git
// Version: 1.0
// Last updated: 2026
//
// Description:
//   This macro batch-converts Zeiss .czi microscopy files
//   to .tif format. Files are processed in alphabetical order
//   and automatically renamed with channel-specific suffixes
//   based on their position within each triplet (every 3 files).
//
// Expected input structure:
//   Files must be sorted as triplets (3 channels per sample):
//     Position 0 → _nuclei  (e.g., DAPI channel)
//     Position 1 → _dcx     (e.g., DCX staining)
//     Position 2 → _tuj1    (e.g., Tuj1 staining)
//
// Usage:
//   1. Run the macro in ImageJ/Fiji (Plugins > Macros > Run)
//   2. Select the input folder containing your .czi files
//   3. Select the output folder for the converted .tif files
//   4. Wait for the "Conversion completed" message
//
// Notes:
//   - Files must be named consistently to ensure correct
//     alphabetical sorting and suffix assignment
//   - Non-.czi files in the input folder are automatically skipped
//   - Requires Bio-Formats plugin (included in Fiji by default)
// ============================================================

// Prompt the user to select the input and output directories
dir = getDirectory("Select directory with .czi files");
outputDir = getDirectory("Select output directory");

// Retrieve and sort all files in the input directory alphabetically
// Alphabetical order is critical for correct suffix assignment
list = getFileList(dir);
list = Array.sort(list);

// Define the channel suffixes assigned cyclically every 3 files
// Modify these strings to match your experimental staining panel
suffixes = newArray("_nuclei", "_channel2", "_channel3");

// Loop through all files in the directory
for (i = 0; i < list.length; i++) {
    
    // Skip any file that is not a .czi file
    if (!endsWith(list[i], ".czi")) continue;
    
    // Open the current .czi file using Bio-Formats
    open(dir + list[i]);
    
    // Determine channel suffix based on file position within the triplet
    // Modulo 3 cycles through indices 0, 1, 2 regardless of total file count
    suffixIndex = i % 3;
    suffix = suffixes[suffixIndex];
    
    // Build the output filename: remove .czi extension, append channel suffix
    baseName = substring(list[i], 0, lastIndexOf(list[i], "."));
    newName = baseName + suffix + ".tif";
    
    // Save the image as a .tif file in the output directory
    saveAs("Tiff", outputDir + newName);
    
    // Close the current image to free memory before opening the next
    close();
}

// Print a completion message to the ImageJ Log window
print("Conversion completed. Files saved in: " + outputDir);