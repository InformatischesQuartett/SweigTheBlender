using CppApiWrapper;

namespace CsClient
{
    public static class Plugin
    {
        public static float LastVolume;

        public static void Init()
        {
            MuteScene();
        }

        private static void MuteScene()
        {
            var pyUni = new pyUniplug();
            pyUni.print("### Uniplug ###");
            
            var context = pyUni.context();
            var scene = context.scene();
            var volume = scene.audio_volume();

            var objects = scene.objects();
            var cube = objects["Cube"];
            var loc = cube.location();

            pyUni.print("Location of the Cube: " + loc);

            if (volume > 0)
            {
                pyUni.print("Volume is above 0. Muting.");
                LastVolume = volume;
                scene.audio_volume(0);
            }
            else
            {
                pyUni.print("Volume is 0. Setting volume back to " + LastVolume);
                scene.audio_volume(LastVolume);
            }
        }
    }
}
