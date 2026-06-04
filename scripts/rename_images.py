import os
import glob
import shutil

src_dir = r"C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787"
dest_dir = r"F:\Website\images"

prefixes = [
    "food_cover", "food_thumb_1", "food_thumb_2", "food_thumb_3",
    "travel_cover", "travel_thumb_1", "travel_thumb_2", "travel_thumb_3",
    "gaming_cover", "gaming_thumb_1", "gaming_thumb_2", "gaming_thumb_3"
]

mapping = {
    "food_cover": "food_cover.png",
    "food_thumb_1": "food_1.png",
    "food_thumb_2": "food_2.png",
    "food_thumb_3": "food_3.png",
    "travel_cover": "travel_cover.png",
    "travel_thumb_1": "travel_1.png",
    "travel_thumb_2": "travel_2.png",
    "travel_thumb_3": "travel_3.png",
    "gaming_cover": "gaming_cover.png",
    "gaming_thumb_1": "gaming_1.png",
    "gaming_thumb_2": "gaming_2.png",
    "gaming_thumb_3": "gaming_3.png"
}

for prefix in prefixes:
    pattern = os.path.join(src_dir, f"{prefix}_*.png")
    matches = glob.glob(pattern)
    if matches:
        # Take the most recent one
        latest_file = max(matches, key=os.path.getctime)
        dest_path = os.path.join(dest_dir, mapping[prefix])
        shutil.copy2(latest_file, dest_path)
        print(f"Copied {latest_file} -> {dest_path}")
    else:
        print(f"No match found for {prefix}")
