
import strutils

type
  Input = tuple[min: BiggestInt, max: BiggestInt]

const
  gcInput: Input = (152085.toBiggestInt, 670283.toBiggestInt)


proc partOne =
  var lPassword: BiggestInt = gcInput.max
  let lPasswordStrMax = $lPassword
  let lIndexMax = [($lPasswordStrMax[0]).parseBiggestInt, ($lPasswordStrMax[
      1]).parseBiggestInt, ($lPasswordStrMax[2]).parseBiggestInt, (
      $lPasswordStrMax[3]).parseBiggestInt, ($lPasswordStrMax[
      4]).parseBiggestInt, ($lPasswordStrMax[5]).parseBiggestInt]
  lPassword = gcInput.min
  let lPasswordStrMin = $lPassword
  let lIndexMin = [($lPasswordStrMin[0]).parseBiggestInt, ($lPasswordStrMin[
      1]).parseBiggestInt, ($lPasswordStrMin[2]).parseBiggestInt, (
      $lPasswordStrMin[3]).parseBiggestInt, ($lPasswordStrMin[
      4]).parseBiggestInt, ($lPasswordStrMin[5]).parseBiggestInt]

  template indexLoop (aIndex: BiggestInt,
                      aBody: untyped) =
    block indexLoop:
      lIndex[aIndex] = lIndex[aIndex-1]
      while (lIndex[aIndex] <= 9):
        block indexLoop_Body:
          aBody
        lindex[aindex].inc

  template indexStr: string =
    $lIndex[0] & $lIndex[1] & $lIndex[2] & $lIndex[3] & $lIndex[4] & $lIndex[5]

  proc checkDouble(aString: string): bool =
    var lIndex = 1;
    result = false
    while (not result) and (lindex < aString.len):
      result = (aString[lIndex] == aString[lIndex-1])
      lIndex.inc

  var lPassswordCount: BiggestInt = 0
  var lIndex = lIndexMin
  while (lIndex[0] <= lIndexMax[0]):
    indexLoop(1):
      indexLoop(2):
        indexLoop(3):
          indexLoop(4):
            indexLoop(5):
              let lCurrentPasswordStr = indexStr
              if lCurrentPasswordStr.parseBiggestInt >= gcInput.min:
                if lCurrentPasswordStr.parseBiggestInt <= gcInput.max:
                  if checkDouble(lCurrentPasswordStr):
                    lPassswordCount.inc
                    # echo lCurrentPasswordStr
    lIndex[0].inc

  echo "partOne $1"%[$lPassswordCount]

proc partTwo =
  var lPassword: BiggestInt = gcInput.max
  let lPasswordStrMax = $lPassword
  let lIndexMax = [($lPasswordStrMax[0]).parseBiggestInt, ($lPasswordStrMax[
      1]).parseBiggestInt, ($lPasswordStrMax[2]).parseBiggestInt, (
      $lPasswordStrMax[3]).parseBiggestInt, ($lPasswordStrMax[
      4]).parseBiggestInt, ($lPasswordStrMax[5]).parseBiggestInt]
  lPassword = gcInput.min
  let lPasswordStrMin = $lPassword
  let lIndexMin = [0, 0, 0, 0, 0, 0]

  template indexLoop (aIndex: BiggestInt,
                      aBody: untyped) =
    block indexLoop:
      lIndex[aIndex] = lIndex[aIndex-1]
      while (lIndex[aIndex] <= 9):
        block indexLoop_Body:
          aBody
        lindex[aindex].inc

  template indexStr: string =
    $lIndex[0] & $lIndex[1] & $lIndex[2] & $lIndex[3] & $lIndex[4] & $lIndex[5]


  proc checkDouble(aString: string): bool =
    var lIndex = 0;

    func checkSame(): int =
      var lCurrent = lIndex
      while (lCurrent < aString.len) and (aString[lCurrent] == aString[lIndex]):
        lCurrent.inc
      result = (lCurrent-lIndex)

    var lDoubleFound: BiggestInt = 0
    while (lindex < aString.len):
      let lSame = checkSame()
      if 2 == lSame:
        lDoubleFound.inc
      lindex.inc(lSame)
    result = (lDoubleFound > 0)

  var lPassswordCount: BiggestInt = 0
  var lIndex = lIndexMin
  while (lIndex[0] <= 9):
    indexLoop(1):
      indexLoop(2):
        indexLoop(3):
          indexLoop(4):
            indexLoop(5):
              let lCurrentPasswordStr = indexStr
              if lCurrentPasswordStr.parseBiggestInt >= gcInput.min:
                if lCurrentPasswordStr.parseBiggestInt <= gcInput.max:
                  if checkDouble(lCurrentPasswordStr):
                    lPassswordCount.inc
                    # echo lCurrentPasswordStr
    lIndex[0].inc

  echo "partTwo $1"%[$lPassswordCount]

partOne() #1764
partTwo() #1196
