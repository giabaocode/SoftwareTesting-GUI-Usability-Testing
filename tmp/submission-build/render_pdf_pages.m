#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <PDFKit/PDFKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc != 3) {
            fprintf(stderr, "Usage: render_pdf_pages input.pdf output_dir\n");
            return 2;
        }

        NSString *inputPath = [NSString stringWithUTF8String:argv[1]];
        NSString *outputPath = [NSString stringWithUTF8String:argv[2]];
        NSError *directoryError = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:outputPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&directoryError];
        if (directoryError) {
            fprintf(stderr, "Cannot create output directory: %s\n",
                    directoryError.localizedDescription.UTF8String);
            return 3;
        }

        PDFDocument *document = [[PDFDocument alloc] initWithURL:[NSURL fileURLWithPath:inputPath]];
        if (!document) {
            fprintf(stderr, "Cannot open PDF: %s\n", inputPath.UTF8String);
            return 4;
        }

        for (NSInteger index = 0; index < document.pageCount; index++) {
            PDFPage *page = [document pageAtIndex:index];
            NSRect bounds = [page boundsForBox:kPDFDisplayBoxMediaBox];
            NSSize size = NSMakeSize(bounds.size.width * 1.5, bounds.size.height * 1.5);
            NSImage *image = [page thumbnailOfSize:size forBox:kPDFDisplayBoxMediaBox];
            NSData *tiff = image.TIFFRepresentation;
            NSBitmapImageRep *bitmap = [NSBitmapImageRep imageRepWithData:tiff];
            NSData *png = [bitmap representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
            NSString *fileName = [NSString stringWithFormat:@"page-%03ld.png", (long)index + 1];
            [png writeToFile:[outputPath stringByAppendingPathComponent:fileName] atomically:YES];
        }

        printf("%s: %ld pages\n", inputPath.lastPathComponent.UTF8String, (long)document.pageCount);
    }
    return 0;
}

