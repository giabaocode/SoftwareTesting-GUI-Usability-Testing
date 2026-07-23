#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc != 3) {
            fprintf(stderr, "Usage: create_montage input_dir output.png\n");
            return 2;
        }
        NSString *inputDir = [NSString stringWithUTF8String:argv[1]];
        NSString *outputPath = [NSString stringWithUTF8String:argv[2]];
        NSArray<NSString *> *entries = [[[NSFileManager defaultManager]
            contentsOfDirectoryAtPath:inputDir error:nil]
            sortedArrayUsingSelector:@selector(localizedStandardCompare:)];
        NSPredicate *pngPredicate = [NSPredicate predicateWithBlock:^BOOL(NSString *name, NSDictionary *bindings) {
            return [[name pathExtension].lowercaseString isEqualToString:@"png"];
        }];
        NSArray<NSString *> *files = [entries filteredArrayUsingPredicate:pngPredicate];
        if (files.count == 0) return 3;

        NSInteger columns = 3;
        NSInteger rows = (files.count + columns - 1) / columns;
        CGFloat cellWidth = 900.0;
        CGFloat cellHeight = 680.0;
        NSSize canvasSize = NSMakeSize(columns * cellWidth, rows * cellHeight);
        NSImage *canvas = [[NSImage alloc] initWithSize:canvasSize];
        [canvas lockFocus];
        [[NSColor colorWithWhite:0.93 alpha:1.0] setFill];
        NSRectFill(NSMakeRect(0, 0, canvasSize.width, canvasSize.height));

        NSDictionary *labelAttributes = @{
            NSFontAttributeName: [NSFont boldSystemFontOfSize:28],
            NSForegroundColorAttributeName: [NSColor colorWithWhite:0.15 alpha:1.0]
        };

        for (NSInteger index = 0; index < files.count; index++) {
            NSInteger column = index % columns;
            NSInteger row = index / columns;
            CGFloat originX = column * cellWidth;
            CGFloat originY = canvasSize.height - (row + 1) * cellHeight;
            NSRect cell = NSMakeRect(originX + 12, originY + 12, cellWidth - 24, cellHeight - 24);
            [[NSColor whiteColor] setFill];
            NSRectFill(cell);

            NSString *name = files[index];
            [name drawAtPoint:NSMakePoint(originX + 28, originY + 22) withAttributes:labelAttributes];

            NSImage *image = [[NSImage alloc] initWithContentsOfFile:[inputDir stringByAppendingPathComponent:name]];
            if (!image) continue;
            CGFloat maxWidth = cellWidth - 56;
            CGFloat maxHeight = cellHeight - 82;
            CGFloat scale = MIN(maxWidth / image.size.width, maxHeight / image.size.height);
            NSSize drawSize = NSMakeSize(image.size.width * scale, image.size.height * scale);
            CGFloat drawX = originX + (cellWidth - drawSize.width) / 2;
            CGFloat drawY = originY + 68 + (maxHeight - drawSize.height) / 2;
            [image drawInRect:NSMakeRect(drawX, drawY, drawSize.width, drawSize.height)
                     fromRect:NSZeroRect
                    operation:NSCompositingOperationSourceOver
                     fraction:1.0];
        }
        [canvas unlockFocus];

        NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithData:canvas.TIFFRepresentation];
        NSData *png = [bitmap representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
        [png writeToFile:outputPath atomically:YES];
    }
    return 0;
}

