from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parent.parent
PICTURES_DIR = PROJECT_ROOT / "pictures"


def picture_path(filename):
    return (PICTURES_DIR / filename).as_posix()


def picture_dir():
    return PICTURES_DIR.as_posix()
