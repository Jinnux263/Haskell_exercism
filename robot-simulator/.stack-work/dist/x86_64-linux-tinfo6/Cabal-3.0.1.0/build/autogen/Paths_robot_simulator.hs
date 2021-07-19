{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_robot_simulator (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [3,2,0,8] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/edric/exercism/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/2b1942a77ef90f90f36d4f2962c1744be2ddecaeb706d3cc00784f78cbc3baee/8.8.4/bin"
libdir     = "/home/edric/exercism/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/2b1942a77ef90f90f36d4f2962c1744be2ddecaeb706d3cc00784f78cbc3baee/8.8.4/lib/x86_64-linux-ghc-8.8.4/robot-simulator-3.2.0.8-6TprwC7b02e27WefV59e92"
dynlibdir  = "/home/edric/exercism/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/2b1942a77ef90f90f36d4f2962c1744be2ddecaeb706d3cc00784f78cbc3baee/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/edric/exercism/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/2b1942a77ef90f90f36d4f2962c1744be2ddecaeb706d3cc00784f78cbc3baee/8.8.4/share/x86_64-linux-ghc-8.8.4/robot-simulator-3.2.0.8"
libexecdir = "/home/edric/exercism/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/2b1942a77ef90f90f36d4f2962c1744be2ddecaeb706d3cc00784f78cbc3baee/8.8.4/libexec/x86_64-linux-ghc-8.8.4/robot-simulator-3.2.0.8"
sysconfdir = "/home/edric/exercism/haskell/robot-simulator/.stack-work/install/x86_64-linux-tinfo6/2b1942a77ef90f90f36d4f2962c1744be2ddecaeb706d3cc00784f78cbc3baee/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "robot_simulator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "robot_simulator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "robot_simulator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "robot_simulator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "robot_simulator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "robot_simulator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
