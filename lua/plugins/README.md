# 사용자 설정

초기 설치 과정에 lua/plugins 하위에 위치 하는 모든 파일들은 비활성 되어 있음.\

```lua
if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
```
> 위 구문이 설정의 첫번째 라인에 위치 합니다.

해당 파일들을 수정하지 않고 upstream 설정들과 격리된 파일들에 설정을 하려고 하였으나, 의도 되지 않은것 같습니다.\
`$HOME/.config/nvim/lua/plugins/` 하위에 설정들을 직접 관리 합니다.

```bash
git clone git@github.com:upgradeksh/AstroNvim.git ~/.config/nvim
```
