# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#优化时允许访问并修改有修饰符的类和类的成员
-allowaccessmodification
#-optimizations !code/simplification/arithmetic
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*
-keepattributes *Annotation*

# 设置混淆的压缩比率 0 ~ 7
-optimizationpasses 5
# 混淆时不使用大小写混合，混淆后的类名为小写
-dontusemixedcaseclassnames
# 指定不去忽略非公共库的类
-dontskipnonpubliclibraryclasses
# 指定不去忽略非公共库的成员
-dontskipnonpubliclibraryclassmembers
# 混淆时不做预校验
-dontpreverify
# 混淆时不记录日志
-verbose
# 忽略警告
-ignorewarnings
# 关闭压缩功能?。默认情况下，会开启压缩;
-dontshrink
# 不优化输入的类文件
-dontoptimize
# 保留注解不混淆
-keepattributes *Annotation*,InnerClasses
# 避免混淆泛型
-keepattributes Signature
# 保留代码行号，方便异常信息的追踪
-keepattributes SourceFile,LineNumberTable
# 混淆采用的算法
-optimizations !code/simplification/cast,!field/*,!class/merging/*

# dump.txt文件列出apk包内所有class的内部结构
#-dump class_files.txt
# seeds.txt文件列出未混淆的类和成员
#-printseeds seeds.txt
# usage.txt文件列出从apk中删除的代码
#-printusage unused.txt
# mapping.txt文件列出混淆前后的映射
#-printmapping mapping.txt

-keep public class * extends android.app.Activity
-keep public class * extends android.app.Fragment
-keep public class * extends androidx.fragment.app.Fragment
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.preference.Preference
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.view.View
-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

#support
-keep class android.support.** {*;}
-dontwarn android.support.**
-keep interface android.support.** { *; }
#v4/v7
-keep public class * extends android.support.v4.**
-keep public class * extends android.support.v7.**
-keep public class * extends android.support.annotation.**
#support design库
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }
# 实体类
-keep class com.lovense.vibemate.bean.**{*;}
-keep class com.lovense.vibemate.main.socketio.bean.**{*;}
-keep class com.lovense.bean.**{*;}
-keep class com.lovense.vibemate.network.bean.**{*;}
-keep class com.lovense.vibemate.event.**{*;}
-keep class com.lovense.vibemate.gpt.bean.**{*;}

#避免layout中onclick方法（android:onclick="onClick"）混淆
-keepclassmembers class * extends android.app.Activity{
    public void *(android.view.View);
}
#避免回调函数 onXXEvent 混淆
-keepclassmembers class * {
    void *(*Event);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
#Natvie 方法不混淆
-keepclasseswithmembernames class * {
    native <methods>;
}
#避免Parcelable混淆
-keepclassmembers class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}
#避免Serializable接口的子类中指定的某些成员变量和方法混淆
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
#避免资源混淆
-keepclassmembers class **.R$* {
    public static <fields>;
}
#WebView混淆配置
-keepclassmembers class android.webkit.WebView {
    public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String);
}
-keepattributes JavascriptInterface

-keep class android.animation.** { *; }
-keep class no.nordicsemi.android.** { *; }

-keep class com.google.firebase.** { *; }
-keep class com.crashlytics.** { *; }
-keep class com.crashlytics.android.**
-keepattributes SourceFile, LineNumberTable, *Annotation*
-keep class io.fabric.sdk.android.** { *; }
-dontwarn io.fabric.sdk.android.**
-dontwarn com.crashlytics.**
-keep class io.fabric.** { *; }
-keep public class * extends java.lang.Exception
-dontwarn org.xmlpull.v1.**
-dontnote org.xmlpull.v1.**
-keep class org.xmlpull.** { *; }
-keepclassmembers class org.xmlpull.** { *; }

#OKhttp
-dontwarn okio.**
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.ParametersAreNonnullByDefault
-dontwarn javax.annotation.**
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn okhttp3.internal.platform.ConscryptPlatform
-keep class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-keepdirectories src/main/resources/okhttp3/**
-dontwarn com.squareup.okhttp3.**
-keep class com.squareup.okhttp3.** { *;}

#EventBus
-keepattributes Signature
-keepattributes *Annotation*
-keep enum org.greenrobot.eventbus.ThreadMode { *; }
# Only required if you use AsyncExecutor
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}

# 图片选择
-dontwarn com.lwkandroid.imagepicker.**
-keep class com.lwkandroid.imagepicker.**{*;}

#databinding
-dontwarn android.databinding.**
-keep class android.databinding.** { *; }

#databinding
-keepclassmembers class androidx.databinding.ViewDataBinding {
    public *;
}
-keepclassmembers class androidx.viewbinding.ViewBinding {
    public *;
}

# dagger2
-dontwarn dagger.**
-keep class dagger.** { *; }

# rxjava rxandroid
-dontwarn rx.**
-keep class rx.** { *; }
-dontwarn rx.android.**
-keep class rx.android.** { *; }
-dontwarn sun.misc.**
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
   long producerIndex;
   long consumerIndex;
}

#Glide 4
-keep public class * implements com.bumptech.glide.module.AppGlideModule
-keep public class * implements com.bumptech.glide.module.LibraryGlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
#Glide webp.decoder，getWebPDrawableTotalDurations方法反射获取webp播放时长
-keep class com.bumptech.glide.integration.webp.decoder.** {*;}

#Picasso
-keep class com.parse.*{ *; }
-dontwarn com.parse.**
-dontwarn com.squareup.picasso.**
-keepclasseswithmembernames class * {
    native <methods>;
}

#Gson
-keep class com.google.gson.** {*;}
-keep class com.google.**{*;}
-keep class sun.** { *; }
-keep class com.google.gson.stream.** { *; }
-keep class com.google.gson.examples.android.model.** { *; }
-dontwarn com.google.gson.**

#Banner
-keep class com.youth.banner.** {
    *;
 }

# retrofit
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
# retrofit 混淆需要，retrofit里面使用了okhttp
-dontwarn okio.**
-dontwarn javax.annotation.**

#Fastjson
-keep class javax.ws.rs.** { *; }
-dontwarn com.alibaba.fastjson.**
-keep class com.alibaba.fastjson.** { *; }
-keepattributes Signature

# androidx 混淆
-keep class com.google.android.material.** {*;}
-keep class androidx.** {*;}
-keep public class * extends androidx.**
-keep interface androidx.** {*;}
-dontwarn com.google.android.material.**
-dontnote com.google.android.material.**
-dontwarn androidx.**

-dontwarn javax.ws.rs.**
-dontwarn android.bluetooth.**

#greendao
-keep class org.greenrobot.greendao.**{*;}
-keepclassmembers class * extends org.greenrobot.greendao.AbstractDao { public static java.lang.String TABLENAME; }
-keep class **$Properties{*;}
-keep class com.lovense.vibemate.db.entity.**{*;}

-keep class com.shuyu.gsyvideoplayer.video.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.video.**
-keep class com.shuyu.gsyvideoplayer.video.base.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.video.base.**
-keep class com.shuyu.gsyvideoplayer.utils.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.utils.**
-keep class tv.danmaku.ijk.** { *; }
-dontwarn tv.danmaku.ijk.**

-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, java.lang.Boolean);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keep class repeackage.com.uodis.opendevice.aidl.** { *; }
-keep interface repeackage.com.uodis.opendevice.aidl.** { *; }
-keep class repeackage.com.asus.msa.SupplementaryDID.** { *; }
-keep interface repeackage.com.asus.msa.SupplementaryDID.** { *; }
-keep class repeackage.com.bun.lib.** { *; }
-keep interface repeackage.com.bun.lib.** { *; }
-keep class repeackage.com.heytap.openid.** { *; }
-keep interface repeackage.com.heytap.openid.** { *; }
-keep class repeackage.com.samsung.android.deviceidservice.** { *; }
-keep interface repeackage.com.samsung.android.deviceidservice.** { *; }
-keep class repeackage.com.zui.deviceidservice.** { *; }
-keep interface repeackage.com.zui.deviceidservice.** { *; }
-keep class repeackage.com.coolpad.deviceidsupport.** { *; }
-keep interface repeackage.com.coolpad.deviceidsupport.** { *; }
-keep class repeackage.com.android.creator.** { *; }
-keep interface repeackage.com.android.creator.** { *; }
-keep class repeackage.com.google.android.gms.ads.identifier.internal.** { *; }
-keep interface repeackage.com.google.android.gms.ads.identifier.internal.* { *; }

#=========================================去除log代码=========================================#
#关闭log日志
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
    public static int e(...);
}

# 去除System.out.println();
-assumenosideeffects class java.io.PrintStream {
    public void println(...);
}

# 去除java.util.logging.Logger日志
-assumenosideeffects class java.util.logging.Logger {
    public void log(...);
    public void warning(...);
    public void info(...);
    public void info(...);
}

# 屏蔽日志组件打印
-assumenosideeffects class com.component.dxutilcode.lib.utils {
    public static void v(...);
    public static void vTag(...);
    public static void i(...);
    public static void iTag(...);
    public static void w(...);
    public static void wTag(...);
    public static void d(...);
    public static void dTag(...);
    public static void e(...);
    public static void eTag(...);
    public static void json(...);
    public static void xml(...);
}

# 屏蔽timber日志打印
-assumenosideeffects class timber.log.Timber {
        public static void v(...);
        public static void i(...);
        public static void w(...);
        public static void d(...);
        public static void e(...);
        public static void wtf(...);
        public static void log(...);
}
#=========================================去除log代码 end=========================================#

# 防止kotlin-reflect被混淆导致fastJson无法反序列化
-dontwarn kotlin.reflect.jvm.internal.**
-keep class kotlin.** { *; }
-keep class org.jetbrains.** { *; }


# 高斯模糊混淆处理
-keep class android.support.v8.renderscript.** { *; }
-keep class androidx.renderscript.** { *; }

######################组件相关##################################

## DXHyttoUtils组件
## 大头虾
-keep class com.component.dxdtxutils.lib.D {
    *;
}

## Hytto SO库
-keep class com.component.dxhyttoutils.lib.protect.P {
    *;
}


# 保持 native 方法不被混淆
#-keep class * {
#    native <methods>;
#}
-keepclasseswithmembers class * {
    native <methods>;
}

####################################################################


##保留注解，如果不添加改行会导致我们的@Keep注解失效
-keepattributes *Annotation*
-keep,allowobfuscation interface androidx.annotation.Keep
-keep @androidx.annotation.Keep class *
-keepclassmembers class * {
    @androidx.annotation.Keep *;
}

####################################################################

## ARouter路由组件
-keep public class com.alibaba.android.arouter.routes.**{*;}

-keep public class com.alibaba.android.arouter.facade.**{*;}

-keep class * implements com.alibaba.android.arouter.facade.template.ISyringe{*;}

# 如果使用了 byType 的方式获取 Service，需添加下面规则，保护接口

-keep interface * implements com.alibaba.android.arouter.facade.template.IProvider

# 如果使用了 单类注入，即不定义接口实现 IProvider，需添加下面规则，保护实现

-keep class * implements com.alibaba.android.arouter.facade.template.IProvider

-dontwarn com.alibaba.android.arouter.**

#不混淆包含arouter的@Autowired注解的类的类名以及@Autowired变量
-keepclasseswithmembernames class * {
    @com.alibaba.android.arouter.facade.annotation.Autowired <fields>;
}

####################################################################
## ABTest 中使用的firebase
##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature

# For using GSON @Expose annotation
-keepattributes *Annotation*

#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { *; }
-keep class com.google.** { *; }
-keep class sun.misc.** { *; }
-dontwarn com.google.**
##---------------End: proguard configuration for Gson  ----------

####################################################################

## http组件

# OkHttp3
-dontwarn okhttp3.logging.**
-keep class okhttp3.internal.**{*;}
-dontwarn okio.**
#retrofit
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions
-keep class io.reactivex.** { *; }

####################################################################
# 所有实体 bean、entity 不混淆
-keep class com.component.**.bean.**
-keep class com.component.**.bean.** { *;}
-keep class com.component.**.entity.**
-keep class com.component.**.entity.** { *;}

-keep class com.components.**.bean.**
-keep class com.components.**.bean.** { *;}
-keep class com.components.**.entity.**
-keep class com.components.**.entity.** { *;}

####################################################################

#APP 封禁组件
-keep class com.component.dxfunctionkits.ForbiddenResponse {*;}
-keep class com.component.dxfunctionkits.ForbiddenRequest {*;}

####################################################################

# APP日志SDK
-keep class com.tencent.mars.** {
    *;
}


# 腾讯mmkv混淆
# Keep all native methods, their classes and any classes in their descriptors
-keepclasseswithmembers,includedescriptorclasses class com.tencent.mmkv.** {
    native <methods>;
    long nativeHandle;
    private static *** onMMKVCRCCheckFail(***);
    private static *** onMMKVFileLengthError(***);
    private static *** mmkvLogImp(...);
    private static *** onContentChangedByOuterProcess(***);
}

# tfLite 全部类混淆
-keep class org.tensorflow.** {
    *;
}
