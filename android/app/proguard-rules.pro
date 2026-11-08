# google_mobile_ads -> play-services-ads -> WorkManager + Room.
# R8 otherwise removes the generated Room database and the workers, and the
# app crashes at launch in release builds.
-keep class androidx.work.** { *; }
-keep class * extends androidx.work.ListenableWorker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}
-keep class androidx.room.** { *; }
-keep class * extends androidx.room.RoomDatabase { *; }
-dontwarn androidx.work.**
-dontwarn androidx.room.**
