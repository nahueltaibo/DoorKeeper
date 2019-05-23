using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MMALSharp;
using MMALSharp.Handlers;

namespace DoorKeeper.Controllers
{
    [Route("api/[controller]")]
    public class VideoController : Controller
    {
        private HttpClient _client;

        public VideoController()
        {
            _client = new HttpClient();
        }

        [HttpGet]
        public async Task<FileStreamResult> Get()
        {

            try
            {
                var urlBlob = "rtmp://184.72.239.149/vod/BigBuckBunny_115k.mov";

                var stream = await _client.GetStreamAsync(urlBlob);

                return new FileStreamResult(stream, "video/mp4");
            }
            catch(Exception ex)
            {
                throw;
            }

            //MMALCamera cam = MMALCamera.Instance;

            ////using (var vidCaptureHandler = new VideoStreamCaptureHandler("/home/pi/videos/", "h264"))
            //using (var vidCaptureHandler = new MemoryStreamCaptureHandler())
            //{
            //    var cts = new CancellationTokenSource(TimeSpan.FromMinutes(3));




            //    //var urlBlob = "/dev/video";
            //    //var urlBlob = "https://localhost/feed.mp4";
            //    var urlBlob = "https://anthonygiretti.blob.core.windows.net/videos/earth.mp4";

            //    //var stream = await _client.GetStreamAsync(urlBlob);

            //    var stream = vidCaptureHandler.CurrentStream;

            //    // Take video for 3 minutes.
            //    await cam.TakeVideo(vidCaptureHandler, cts.Token);

            //    // Only call when you no longer require the camera, i.e. on app shutdown.
            //    cam.Cleanup();

            //    return new FileStreamResult(stream, "video/mp4");
            //}


        }

        // Self-contained method for recording H.264 video for a specified amount of time. Records at 30fps, 25Mb/s at the highest quality.
        public async Task TakeVideoHelper()
        {
            MMALCamera cam = MMALCamera.Instance;

            //using (var vidCaptureHandler = new VideoStreamCaptureHandler("/home/pi/videos/", "h264"))
            using (var vidCaptureHandler = new MemoryStreamCaptureHandler())
            {
                var cts = new CancellationTokenSource(TimeSpan.FromMinutes(3));

                // Take video for 3 minutes.
                await cam.TakeVideo(vidCaptureHandler, cts.Token);
            }

            // Only call when you no longer require the camera, i.e. on app shutdown.
            cam.Cleanup();
        }
    }
}
