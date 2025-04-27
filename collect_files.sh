from collections import defaultdict

def collect_files(input_dir, output_dir, max_depth=None):
    files = defaultdict(list)

    return files

def test_collect_files_max_depth():
    input_dir = "path_to_input_dir"
    output_dir = "path_to_output_dir"
    expected_files = {
        'file1.txt': 'path_to_file1.txt',
        'file2.txt': 'path_to_file2.txt',
        'file3.txt': 'path_to_file3.txt',
    }

    result = collect_files(input_dir, output_dir, max_depth=3)
    
    assert dict(result) == expected_files
