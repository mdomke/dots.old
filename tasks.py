from __future__ import print_function
import fnmatch
import os
import sys
from invoke import task, run


# Result = type('Result', (object, ), {'failed': False})
#
#
# def run(cmd, **kwargs):
#     print(cmd)
#     return Result()


@task
def init_submodules():
    task_description('Update submodules')
    # run('git submodule update --init --recursive')


@task(init_submodules)
def install():
    if sys.platform == 'darwin':
        # install_homebrew()
        pass

    setup_zsh()
    setup_vim()


def install_homebrew():
    if run('which brew', hide=True).failed:
        task_description('Installing homebrew')
        url = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
        run('ruby -e "$(curl -fsSL %s)"' % url)

    update_homebrew()


def update_homebrew():
    task_description('Instaling/updating homebrew packages')
    run('brew update', warn=True)
    run('brew upgrade', warn=True)

    run('brew tap neovim/neovim')
    brews = ['neovim', 'zsh', 'ctags', 'git', 'hub', 'tmux', 'mr', 'grc', 'fasd',
             'the_silver_searcher', 'reattach-to-user-namespace']
    for brew in brews:
        info('Install %s' % brew)
        run('brew install %s' % brew)

    run('brew install caskroom/cask/brew-cask')
    run('brew tap caskroom/versions')

    casks = ['iterm2-nightly', 'google-chrome-beta', 'virtualbox', 'seil karabiner', 'spotify',
             'viscosity', 'istat-menus', '1password', 'launchbar', 'gpgtools', 'adium']
    for cask in casks:
        run('brew cask install %s' % cask)
    end()


def setup_vim():
    task_description('Setting up vim')
    info('Creating config locations')
    run('mkdir -p $HOME/.config/nvim')
    file_op('$HOME/.yadr/vim', '$HOME/.config/nvim')

    install_vimplug()
    install_vim_plugins()
    end()


def install_vimplug():
    info('Installing vim plugin manager')
    run('curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs '
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    end()


def install_vim_plugins():
    info('Installing vim plugins')
    run('nvim --noplugin -u ~/.config/nvim/plugins.vim -N +PlugInstall +qa', pty=True)
    end()


@task
def update_vim_plugins():
    info('Updating vim plugins')
    run('nvim --noplugin -u ~/.config/nvim/plugins.vim -N +PlugUpdate +PlugUpgrade +qa', pty=True)
    end()


@task
def setup_zsh():
    task_description('Setup zsh')
    enable_zsh()
    vimify_shell()
    install_prezto()
    end()


@task
def reset_zsh():
    vimify_shell(install=False)
    uninstall_prezto()


def enable_zsh():

    if 'zsh' in os.environ['SHELL']:
        info('zsh is already configured as default shell')
        return

    info('configure zsh as default shell')
    if os.path.exists('/usr/local/bin/zsh'):
        with open('/private/etc/shells') as fp:
            if '/usr/local/bin/zsh' not in fp.readlines():
                run('echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells')

        run('chsh -s /usr/local/bin/zsh')
    else:
        run('chsh -s /bin/zsh')


@task
def install_prezto():
    info('Installing prezto')

    run('mkdir -p $HOME/.zsh.before')
    run('mkdir -p $HOME/.zsh.after')
    run('mkdir -p $HOME/.zsh.prompts')
    run('touch $HOME/.hushlogin')

    do_prezto_files(install=True)

    with open(os.path.expanduser('~/.zshrc'), 'a') as fp:
        fp.write('for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file')


@task
def uninstall_prezto():
    info('Uninstalling prezto')
    do_prezto_files(install=False)


def do_prezto_files(install=True):

    dir_op('$HOME/.yadr/zsh/prezto/runcoms',
           match='z*',
           skip='zpreztorc' if install else None,
           action='copy' if install else 'remove')
    file_op('$HOME/.yadr/zsh/prezto', '$HOME/.zprezto', action='link' if install else 'unlink')
    file_op('$HOME/.yadr/zsh/prezto-override/zpreztorc', '$HOME/.zpreztorc',
            action='link' if install else 'unlink')

    dir_op('$HOME/.yadr/zsh/before', dstdir='$HOME/.zsh.before',
           action='link' if install else 'unlink')
    dir_op('$HOME/.yadr/zsh/after', dstdir='$HOME/.zsh.after',
           action='link' if install else 'unlink')
    dir_op('$HOME/.yadr/zsh/prompts', dstdir='$HOME/.zsh.prompts',
           action='link' if install else 'unlink')


def vimify_shell(install=True):
    info('Install vim keybindings')
    dir_op('$HOME/.yadr/vimify', action='link' if install else 'unlink')


def dir_op(dirname, match=None, skip=None, dstdir=None, action=None):
    match = match or '*'
    skip = skip or ''
    for fname in fnmatch.filter(os.listdir(os.path.expandvars(dirname)), match):
        if fnmatch.fnmatch(fname, skip):
            continue
        src = os.path.join(dirname, fname)
        dst = os.path.join(dstdir, os.path.basename(fname)) if dstdir else None
        file_op(src, dst, action=action)


def file_op(src, dst=None, action=None):
    action = action or 'link'
    dst = dst or '$HOME/.%s' % os.path.basename(src)
    if action == 'copy':
        op('Copy: %s -> %s' % (src, dst))
        run('cp -f "%s" "%s"' % (src, dst))
    elif action == 'link':
        op('Link: %s -> %s' % (src, dst))
        run('ln -snf "%s" "%s"' % (src, dst))
    elif action == 'unlink':
        op('Unlink: %s -> %s' % (src, dst))
        run('rm -f "%s"' % dst)
    elif action == 'remove':
        op('Remove: %s' % dst)
        run('rm -f "%s"' % dst)


def task_description(message):
    print(" ===> %s" % message)


def info(message):
    print(" ---> %s" % message)


def op(message):
    print("   -> %s" % message)


def end():
    print()
