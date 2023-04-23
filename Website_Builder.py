import re
import shutil
import textwrap
import datetime
import subprocess
from pathlib import Path
from urllib.parse import urlparse


def encode_unicode_encoding(string: str, type: str):
    if type == "path":
        replacements = {
            '\\\\': 'U+005C',
            '\\/': 'U+002F',
        }
    else:
        replacements = {
            '\\': 'U+005C',
            '/': 'U+002F',
        }
    replacements.update({
        ':': 'U+003A',
        '*': 'U+002A',
        '?': 'U+003F',
        '"': 'U+0022',
        '<': 'U+003C',
        '>': 'U+003E',
        '|': 'U+007C',
    })
    for chars, replacement in replacements.items():
        string = string.replace(chars, replacement)
    return string

def decode_unicode_encoding(string: str, type: str):
    if type == "path":
        replacements = {
            'U+005C': '\\\\',
            'U+002F': '\\/',
        }
    else:
        replacements = {
            'U+005C': '\\',
            'U+002F': '/',
        }
    replacements.update({
        'U+003A': ':',
        'U+002A': '*',
        'U+003F': '?',
        'U+0022': '"',
        'U+003C': '<',
        'U+003E': '>',
        'U+007C': '|',
    })
    for chars, replacement in replacements.items():
        string = string.replace(chars, replacement)
    return string

def encode_html_entity_encoding(string: str):
    replacements = {
        '&': '&amp;',
        '"': '&quot;',
        '\'': '&#39;',
        '<': '&lt;',
        '>': '&gt;',
        ' ': '&nbsp;',
    }
    for chars, replacement in replacements.items():
        string = string.replace(chars, replacement)
    return string

def decode_html_entity_encoding(string: str):
    replacements = {
        '&amp;': '&',
        '&quot;': '"',
        '&#39;': '\'',
        '&lt;': '<',
        '&gt;': '>',
    }
    for chars, replacement in replacements.items():
        string = string.replace(chars, replacement)
    return string

def encode_url_encoding(string: str):
    replacements = {
        '%': '%25',
        ' ': '%20',
        '[': '%5B',
        ']': '%5D',
        '{': '%7B',
        '}': '%7D',
        '^': '%5E',
        '`': '%60',
        '#': '%23',
    }
    for chars, replacement in replacements.items():
        string = string.replace(chars, replacement)
    return string

def decode_url_encoding(string: str):
    replacements = {
        '%25': '%',
        '%20': ' ',
        '%5B': '[',
        '%5D': ']',
        '%7B': '{',
        '%7D': '}',
        '%5E': '^',
        '%60': '`',
        '%23': '#',
    }
    for chars, replacement in replacements.items():
        string = string.replace(chars, replacement)
    return string

def write_html_header() -> None:
    display_pathbar = _folder_path = ""
    for folder in bookmark_path__html_href_path.split("/"):
        if _folder_path:
            _folder_path += f"/{folder}"
        else:
            _folder_path = folder
        html_text = encode_html_entity_encoding(decode_url_encoding(decode_unicode_encoding(folder, "folder")))
        display_pathbar += f'<a href="/Illegal_Services/{_folder_path}/index.html">{html_text}</a> > '
    display_pathbar += "index.html"
    with open(bookmark_path__windows_index_path__str, "a+", encoding="utf-8", newline="\r\n") as file:
        text = f"""
            <!DOCTYPE html>
            <html lang="en-US">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta name="description" content="Illegal Services Bookmarks">
                <meta name="keywords" content="Illegal, Services, Bookmarks, website">
                <meta name="author" content="IB_U_Z_Z_A_R_Dl">
                <title>IS Bookmarks - Illegal Services</title>
                <link rel="shortcut icon" href="/Illegal_Services/icons/favicon.ico" type="image/x-icon">
                <link rel="icon" href="/Illegal_Services/icons/favicon.ico" type="image/x-icon">
                <link rel="stylesheet" href="/Illegal_Services/css/styles.css">
                <link rel="stylesheet" href="/Illegal_Services/font-awesome-4.7.0/css/font-awesome.min.css">
            </head>

            <body>
                <nav>
                    <div class="navbar">
                        <a href="/Illegal_Services/index.html"><i class="fa fa-home"></i><span class="navbar-text-padding">Home</span></a>
                        <a href="/Illegal_Services/credits.html"><i class="fa fa-handshake-o"></i><span class="navbar-text-padding">Credits</span></a>
                        <a href="/Illegal_Services/tutorial.html"><i class="fa fa-life-ring"></i><span class="navbar-text-padding">Tutorial</span></a>
                        <a href="/Illegal_Services/faq.html"><i class="fa fa-question-circle"></i><span class="navbar-text-padding">FAQ</span></a>
                        <a href="/Illegal_Services/downloads.html"><i class="fa fa-cloud-download"></i><span class="navbar-text-padding">Downloads</span></a>
                        <a href="/Illegal_Services/Bookmarks%20Toolbar/Illegal%20Services/index.html" class="navbar-active"><i class="fa fa-bookmark-o"></i><span class="navbar-text-padding"><u>IS Bookmarks</u></span></a>
                    </div>
                </nav>

                <div class="search-or-request_parent">
                    <div class="search-or-request_container">
                        <div class="search-or-request_child1">
                            <form action="https://eofo904128t6ry8.m.pipedream.net/" method="post" target="_blank">
                                <h4>
                                    <label for="search_link">Search a link or folder in IS database:</label>
                                    <br>
                                    <br>
                                    <input type="text" name="search_link" id="search_link" placeholder="https://example.com/">
                                    <input type="submit" value="Search">
                                </h4>
                            </form>
                        </div>
                        <div class="search-or-request_child2">
                            <form action="https://eolu77sciiyyni6.m.pipedream.net/" method="post" target="_blank">
                                <h4>
                                    <label for="request_link">Request a link to be added in IS database:</label>
                                    <br>
                                    <br>
                                    <input type="text" name="request_link" id="request_link" placeholder="https://example.com/">
                                    <input type="submit" value="Request">
                                </h4>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="pathbar">
                    {display_pathbar}
                </div>
                <br>

                <div class="vertical-menu">
        """
        text = textwrap.dedent(text).removeprefix("\n")
        file.write(text)
        file.close()
    if not (bookmark_path__windows_index_path__path.exists() and bookmark_path__windows_index_path__path.is_file()):
        print(f'ERROR (write_html_header): "{bookmark_path__windows_index_path__path}"')
        input()
        exit(0)
    if not (bookmark_path__windows_path__path.exists() and bookmark_path__windows_path__path.is_dir()):
        print(f'ERROR (write_html_header): "{bookmark_path__windows_path__path}"')
        input()
        exit(0)

def write_footer() -> None:
    with open(windows_href_path__str, "a+", encoding="utf-8", newline="\r\n") as file:
        text = """
                </div>
                <br>

                <script src="/Illegal_Services/js/counter.js"></script>
                <noscript>
                    <div class="javascript-disabled">
                        <img src="/Illegal_Services/icons/no_js.png">
                        JavaScript disabled in your browser;<br>
                        can't display the counter informations.
                    </div>
                </noscript>

                <footer>
                    <a href="https://illegal-services.github.io/Illegal_Services/" target="_blank"><img src="/Illegal_Services/svgs/internet.svg" alt="Website" title="https://illegal-services.github.io/Illegal_Services/"></a>
                    <a href="https://github.com/Illegal-Services/Illegal_Services" target="_blank"><img src="/Illegal_Services/svgs/github.svg" alt="GitHub" title="https://github.com/Illegal-Services/Illegal_Services"></a>
                    <a href="https://t.me/illegal_services_forum" target="_blank"><img src="/Illegal_Services/svgs/telegram.svg" alt="Telegram forum" title="https://t.me/illegal_services_forum"></a>
                    <a href="https://t.me/illegal_services" target="_blank"><img src="/Illegal_Services/svgs/telegram.svg" alt="Telegram channel" title="https://t.me/illegal_services"></a>
                    <br>
                    © 2020-2023 IB_U_Z_Z_A_R_Dl. All rights reserved.
                </footer>
            </body>

            </html>
        """
        text = textwrap.dedent(text).removeprefix("\n")
        file.write(text)
        file.close()
    if not (windows_href_path__path.exists() and windows_href_path__path.is_file()):
        print(f'ERROR (write_footer): "{bookmark_folder__href}" "{bookmark_folder__text}"')
        input()
        exit(0)

def create_folder_or_path(folder_or_path: Path):
    if not (folder_or_path.exists() and folder_or_path.is_dir()):
        folder_or_path.mkdir(parents=False, exist_ok=False)
    if not (folder_or_path.exists() and folder_or_path.is_dir()):
        print(f'ERROR (create_folder_or_path): "{folder_or_path}"')
        input()
        exit(0)
    return folder_or_path


links_counter = 0

for file_or_folder in [Path(R"Bookmarks Toolbar"), Path(R"js")]:
    if file_or_folder.exists():
        if file_or_folder.is_dir():
            shutil.rmtree(file_or_folder)
        elif file_or_folder.is_file():
            file_or_folder.unlink()
    if file_or_folder.exists():
        input()
        exit(0)

bookmarks_db = subprocess.check_output([
    R"D:\Git\Illegal_Services\bookmarks_parser.exe",
    "--extended-parsing",
    "--folders-path",
    "--quoting-style",
    "'",
    R"D:\Git\Illegal_Services\IS.bookmarks.html"
]).decode().splitlines(keepends=False)

is_first_folder__flag = False
for bookmark in bookmarks_db:
    parts = re.findall(r"'(.*?)'", bookmark)

    bookmark_type = str(parts[0])
    bookmark_depth = str(parts[1])
    bookmark_path = str(parts[2])

    #print(bookmark)
    #print(parts)

    if (
        bookmark_type == "PATH"
        and bookmark_depth == "0"
        and bookmark_path == ""
    ):
        is_first_folder__flag = True
        bookmark_path = str(parts[3])
    bookmark_path__windows_path__str = encode_unicode_encoding(decode_html_entity_encoding(bookmark_path), "path")
    bookmark_path__windows_path__path = Path(bookmark_path__windows_path__str)
    bookmark_path__windows_index_path__str = f"{bookmark_path__windows_path__str}/index.html"
    bookmark_path__windows_index_path__path = Path(bookmark_path__windows_index_path__str)
    bookmark_path__html_href_path = encode_url_encoding(decode_url_encoding(bookmark_path__windows_path__str))
    bookmark_path__html_href_text = encode_html_entity_encoding(bookmark_path__windows_path__str)
    if not (bookmark_path__windows_path__path.exists() and bookmark_path__windows_path__path.is_dir()):
        create_folder_or_path(bookmark_path__windows_path__path)
        write_html_header()
    if is_first_folder__flag is True:
        is_first_folder__flag = None
        continue

    if bookmark_type == "LINK":
        bookmark_link = str(parts[3])
        bookmark_link_title = str(parts[4])
        links_counter += 1
        bookmark_link_hostname = urlparse(bookmark_link).netloc
        bookmark_link_title__text = encode_html_entity_encoding(decode_html_entity_encoding(bookmark_link_title))

        match = re.search(r"^(.*)( \| \(untrusted(?:\: .*))$", bookmark_link_title)
        if match:
            bookmark_link_title__html_text = f'{match.group(1)}<font color="red">{match.group(2)}</font>'
        else:
            bookmark_link_title__html_text = bookmark_link_title__text

        with open(bookmark_path__windows_index_path__str, "a+", encoding="utf-8", newline="\r\n") as file:
            file.write(f'        <a href="{bookmark_link}" target="_blank"><img src="https://external-content.duckduckgo.com/ip3/{bookmark_link_hostname}.ico">{bookmark_link_title__html_text}</a>\n')
            file.close()
        if not (bookmark_path__windows_index_path__path.exists() and bookmark_path__windows_index_path__path.is_file()):
            print(f'ERROR (WRITE_LINK_INDEX): "{bookmark_link}" "{bookmark_folder__text}" "{bookmark_link_title__text}"')
            input()
            exit(0)

    elif bookmark_type == "PATH":
        bookmark_folder = str(parts[3])
        bookmark_folder__href = f"{encode_url_encoding(encode_unicode_encoding(decode_html_entity_encoding(bookmark_folder), 'folder'))}/index.html"
        bookmark_folder__text = encode_html_entity_encoding(decode_html_entity_encoding(bookmark_folder))
        with open(bookmark_path__windows_index_path__str, "a+", encoding="utf-8", newline="\r\n") as file:
            file.write(f'        <a href="{bookmark_folder__href}"><i class="fa fa-folder-o"></i>{bookmark_folder__text}</a>\n')
            file.close()
        if not (bookmark_path__windows_index_path__path.exists() and bookmark_path__windows_index_path__path.is_file()):
            print(f'ERROR (WRITE_PATH_INDEX): "{bookmark_folder__href}" "{bookmark_folder__text}"')
            input()
            exit(0)

    elif bookmark_type == "HR":
        #bookmark_hr = str(parts[3]) # this code, not correctly implemented in "bookmarks_parser.py" (expected: "--------------------" instead of --------------------)
        with open(bookmark_path__windows_index_path__str, "a+", encoding="utf-8", newline="\r\n") as file:
            file.write("        <HR>\n")
            file.close()
        if not (bookmark_path__windows_index_path__path.exists() and bookmark_path__windows_index_path__path.is_file()):
            print(f'ERROR (WRITE_HR_INDEX): "{bookmark_path__windows_index_path__str}"')
            input()
            exit(0)
    else:
        print(True)
        input()
        exit(0)

folder_path = Path("Bookmarks Toolbar")
for file_path in folder_path.glob("**/*.html"):
    if not (file_path.exists() and file_path.is_file()):
        continue

    windows_href_path__path = file_path
    windows_href_path__str = str(file_path)
    if windows_href_path__str:
        write_footer()

js_conter__path = Path("js\counter.js")
create_folder_or_path(js_conter__path.parent.resolve())
with open("js\counter.js", "w", encoding="utf-8") as file:
    text = f"""
        document.write(`
            <div class="counter">
                Updated: {datetime.date.today().strftime("%d/%m/%Y")}&nbsp;&nbsp;|&nbsp;&nbsp;{links_counter} links indexed.
            </div>
            <br>
        `);
    """
    text = textwrap.dedent(text).removeprefix("\n")
    file.write(text)
    file.close()
if not (js_conter__path.exists() and js_conter__path.is_file()):
    print(f'ERROR (write_js_conter): "{bookmark_path__windows_index_path__path}"')
    input()
    exit(0)

exit(0)