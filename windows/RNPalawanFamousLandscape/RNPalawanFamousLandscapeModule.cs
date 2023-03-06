using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Palawan.Famous.Landscape.RNPalawanFamousLandscape
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNPalawanFamousLandscapeModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNPalawanFamousLandscapeModule"/>.
        /// </summary>
        internal RNPalawanFamousLandscapeModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNPalawanFamousLandscape";
            }
        }
    }
}
