Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A54FBE6AC
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2019 22:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393361AbfIYUwI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Sep 2019 16:52:08 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41467 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393339AbfIYUwI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Sep 2019 16:52:08 -0400
Received: by mail-io1-f65.google.com with SMTP id r26so491727ioh.8;
        Wed, 25 Sep 2019 13:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QlumAdAZpco+DbubUz8rFBgcYHpYwul2c4C7CU0Axuo=;
        b=i9sQ7q63jYd+GikWtOSHX7Jv0SdmJVRJgnoBxRhbsdC+wND57OtQg3m6kKxdiKeNqj
         STq0m0U/nOW77EYviwsFfDWh+oo3bMM03L5pXFUjSR/qNOOrFLDnYvQ97a3Fbb0MvCuJ
         HqGMdBtiD2Wz/l69DnIW56STOs7X15i8lOlCWYwYKe4qgAhyTWKGnkXKjPgZhKtJw+YB
         OxN42Q33rArVLtWtN7QNmvAeg1LP+6PZno5aJcTNlGzBw4QTIgYYGE49pm0RY8f4WfyE
         szes2X4g+DpEA3abuH0MT0klABfvrSZmZZI6RepWag0hFWSQk1pZ6k31kYwho0nZ+APr
         gpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QlumAdAZpco+DbubUz8rFBgcYHpYwul2c4C7CU0Axuo=;
        b=SvrkIqJYB/sigbtFO/oPv4bL0DWuJuAJKsJBLd0YC5MbL9Ull9Uz3HTerNzRFJZhur
         ab4qMgjVotE8OrdSlCaTMUusoqIarWMami+76JVenWnxDYvsiFnY10VoZJ9vqGK98NfR
         wd98PNQ38GkcJnsO3vyfTCV4uiodlmQMRcceYUXNFOkePeNDOn7nl6MRSyJux+hx6T9s
         lLUAtBVm28xaQSlMlVmUm9S1nFz8sKWBl3c+qTzpNkyQF4LB0BxQ8QFMgkX326fqu9eY
         ZKCgi1kTnqZKimmC6dDR3hoLonAIGNY4+Xl7M1HXbTtbuCpHC92f9/0nM8FtbKptkua9
         vKRg==
X-Gm-Message-State: APjAAAVF8sfwZjxylJdAr/HJAfWB3FQKPYaUuaYPcQvUNfX4bUpM/caK
        HvSGzUy56n/YckXybdtbbAQ8p86yfvVyQZQlkYs=
X-Google-Smtp-Source: APXvYqzq/zJ2FRL2qW+Bz7wvGDq7olEEl903VGt8aFe4OSW1v/Dt/wgQUXQRB5mI9LzTg6yFug5Ufd+8p3GuhJtGlEk=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr1522196iod.205.1569444726948;
 Wed, 25 Sep 2019 13:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com> <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
In-Reply-To: <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 25 Sep 2019 15:51:55 -0500
Message-ID: <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 28, 2019 at 10:53 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi,
>
> On 28/05/2019 18:09, Adam Ford wrote:
> > On Tue, May 28, 2019 at 4:11 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> >>
> >> Hi,
> >>
> >> On 10/05/2019 22:42, Adam Ford wrote:
> >>> Currently the source code is compiled using hard-coded values
> >>> from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
> >>> clock divider value to be moved to the device tree and be changed
> >>> without having to recompile the kernel.
> >>>
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>
> >> I understand why you want to do this, but I'm not sure it's a good idea.
> >> It's really something the driver should figure out, and if we add it to
> >> the DT, it effectively becomes an ABI.
> >>
> >> That said... I'm not sure how good of a job the driver could ever do, as
> >> it can't know the future scaling needs of the userspace at the time it
> >> is configuring the clock. And so, I'm not nacking this patch, but I
> >> don't feel very good about this patch...
> >>
> >> The setting also affects all outputs (exluding venc), which may not be
> >> what the user wants. Then again, I think this setting is really only
> >> needed on OMAP2 & 3, which have only a single output. But that's the
> >> same with the current kconfig option, of course.
> >>
> >> So, the current CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK is an ugly hack, in my
> >> opinion, and moving it to DT makes it a worse hack =). But I don't have
> >> any good suggestions either.
> >
> > As it stands the Logic PD OMAP35 and AM37/DM37 boards (SOM-LV and
> > Torpedo) require this to be hard coded to 4 or it hangs during start.
> > This is the case for all versions 4.2+.  I haven't tested it with
> > older stuff.  Tony has a DM3730 Torpedo kit and reported the hanging
> > issue to me. I told him to set that value to 4 to make it not hang.
> > He asked that I move it to the DT to avoid custom kernels.  I agree
> > it's a hack, but if it's create a customized defconfig file for 4
> > boards or modify the device tree, it seems like the device tree
> > approach is less intrusive.
>
> Ok, well, I think that's a separate thing from its intended use. The
> point of the kconfig option is to ensure that the fclk/pclk ratio stays
> under a certain number to allow enough scaling range. It should never
> affect a basic non-scaling use case, unless you set it to a too high
> value, which prevents finding any pclk.
>
> Has anyone debugged why the hang is happening?
I started to debug this, but I got distracted when I noticed the LCD
did't work at all on modern kernels.  I have that fixed now, so I can
go back to investigating this.

Working version:

[    7.999359] DISPC: dispc_runtime_get
[    7.999542] DSS: dss_restore_context
[    7.999542] DSS: context restored
[    7.999572] DISPC: dispc_runtime_put
[    7.999603] DISPC: dispc_save_context
[    7.999633] DISPC: context saved
[    7.999694] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    7.999694] [drm] No driver support for vblank timestamp query.
[    8.025909] DSS: dss_save_context
[    8.025939] DSS: context saved
[    8.031951] DISPC: dispc_runtime_get
[    8.032043] DSS: dss_restore_context
[    8.032043] DSS: context restored
[    8.032073] DPI: dpi_set_timings
[    8.032104] DISPC: dispc_ovl_setup 0, pa 0x9e900000, pa_uv
0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
chan 0 repl 1
[    8.032135] DISPC: scrw 480, width 480
[    8.032135] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
[    8.032135] DISPC: 0,0 480x272 -> 480x272
[    8.032135] DISPC: dispc_enable_plane 0, 1
[    8.032165] DISPC: dispc_runtime_get
[    8.032196] DISPC: dispc_runtime_get
[    8.032196] DSS: set fck to 36000000
[    8.032257] DISPC: lck = 36000000 (1)
[    8.032257] DISPC: pck = 9000000 (4)
[    8.034240] DISPC: channel 0 xres 480 yres 272
[    8.034271] DISPC: pck 9000000
[    8.034271] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
[    8.034271] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
de_level 1 sync_pclk_edge -1
[    8.034271] DISPC: hsync 17077Hz, vsync 59Hz
[    8.493347] DISPC: dispc_runtime_put
[    8.493438] Console: switching to colour frame buffer device 60x34
[    8.493774] DISPC: dispc_runtime_get
[    8.493835] DISPC: dispc_ovl_setup 0, pa 0x9e900000, pa_uv
0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
chan 0 repl 1
[    8.493896] DISPC: scrw 480, width 480
[    8.493896] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
[    8.493927] DISPC: 0,0 480x272 -> 480x272
[    8.493957] DISPC: dispc_enable_plane 0, 1
[    8.493988] DISPC: GO LCD
[    8.506774] DISPC: dispc_runtime_put
[    8.512298] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer device
[    8.516632] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
[    8.581359] wlcore: WARNING Detected unconfigured mac address in
nvs, derive from fuse instead.
[    8.581359] wlcore: WARNING Your device performance is not optimized.
[    8.581390] wlcore: WARNING Please use the calibrator tool to
configure your device.
[    8.583862] wlcore: loaded
[    9.520355] DISPC: dispc_runtime_get
[    9.520446] DISPC: dispc_ovl_setup 0, pa 0x9e900000, pa_uv
0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
chan 0 repl 1
[    9.520477] DISPC: scrw 480, width 480
[    9.520507] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
[    9.520538] DISPC: 0,0 480x272 -> 480x272
[    9.520568] DISPC: dispc_enable_plane 0, 1
[    9.520599] DISPC: GO LCD
[    9.535400] DISPC: dispc_runtime_put


The Non-working version with the divisor set to 0:

[   10.719512] DSS: dss_runtime_get
[   10.723022] DSS: dss_restore_context
[   10.726623] DSS: OMAP DSS rev 2.0
[   10.730041] DSS: dss_runtime_put
[   10.733306] DSS: dss_save_context
[   10.736633] DSS: context saved
[   10.740417] DSS: dss_restore_context
[   10.744018] DSS: context restored
[   10.748046] DISPC: dispc_runtime_get
[   10.751770] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
[   10.758514] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
[   10.765289] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
[   10.772033] DISPC: dispc_restore_context
[   10.775970] DISPC: dispc_restore_gamma_tables()
[   10.780578] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
[   10.787322] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
[   10.794067] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
[   10.800842] omapdss_dispc 48050400.dispc: OMAP DISPC rev 3.0
[   10.806518] DISPC: dispc_runtime_put
[   10.810150] DISPC: dispc_save_context
[   10.813873] DISPC: context saved
[   10.817291] omapdss_dss 48050000.dss: bound 48050400.dispc (ops
hdmi5_configure [omapdss])
[   10.927215] DSS: dss_save_context
[   10.930725] DSS: context saved
[   11.097503] omapdrm omapdrm.0: DMM not available, disable DMM support
[   11.104248] omapdss_dss 48050000.dss: connect(NULL, 48050000.dss)
[   11.110473] omapdss_dss 48050000.dss: connect(48050000.dss, NULL)
[   11.116729] DISPC: dispc_runtime_get
[   11.120452] DSS: dss_restore_context
[   11.124053] DSS: context restored
[   11.127410] DISPC: dispc_runtime_put
[   11.131072] DISPC: dispc_save_context
[   11.134765] DISPC: context saved
[   11.138092] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   11.144775] [drm] No driver support for vblank timestamp query.
[   11.156372] DSS: dss_save_context
[   11.159729] DSS: context saved

** hang **

I noticed there doesn't seem to be the calculation for setting fck,
pck or any of the timings.  Are there any more debug options I can
enable?

I would prefer to fix the calculation so the display can work without
the defconfig or device tree modification, and then we dump this all
together.

>
> If we can't fix the bug itself, rather than adding a DT option, we could
> change add a min_fck_per_pck field (as you do), keep the kconfig option,
> and set the min_fck_per_pck based on the kconfig option, _or_ in case of
> those affected SoCs, set the min_fck_per_pck even without the kconfig
> option.
>
>   Tomi
>

thanks

adam
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
