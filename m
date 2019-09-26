Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF3CBEC38
	for <lists+linux-omap@lfdr.de>; Thu, 26 Sep 2019 08:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfIZGzv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Sep 2019 02:55:51 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54908 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfIZGzu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Sep 2019 02:55:50 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8Q6tdK4088798;
        Thu, 26 Sep 2019 01:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569480939;
        bh=A/f9ZqkxkN4yUdWiy4LeSVsRxFbD1p0JvG/8w/tucvE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lMSPhqNjcHiLDq32UoUpR26cub2CCJLVWJslfjPyG4KT4gVmHJoeHh4tfN78zSZOS
         vN07K5t5hga1mqB4xN1ERFnCmNSQM0yAwC7A6VsjY5quQCC78RwXOghnLboWL2EiiR
         984PRo+aQqnx/ChIxmP9vUYEQSltFqFmb4yRAgYo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8Q6tdpq129077
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 26 Sep 2019 01:55:39 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 26
 Sep 2019 01:55:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 26 Sep 2019 01:55:38 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8Q6tZZ7051142;
        Thu, 26 Sep 2019 01:55:36 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To:     Adam Ford <aford173@gmail.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
Date:   Thu, 26 Sep 2019 09:55:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/09/2019 23:51, Adam Ford wrote:

>> Has anyone debugged why the hang is happening?
> I started to debug this, but I got distracted when I noticed the LCD
> did't work at all on modern kernels.  I have that fixed now, so I can
> go back to investigating this.
> 
> Working version:
> 
> [    7.999359] DISPC: dispc_runtime_get
> [    7.999542] DSS: dss_restore_context
> [    7.999542] DSS: context restored
> [    7.999572] DISPC: dispc_runtime_put
> [    7.999603] DISPC: dispc_save_context
> [    7.999633] DISPC: context saved
> [    7.999694] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    7.999694] [drm] No driver support for vblank timestamp query.
> [    8.025909] DSS: dss_save_context
> [    8.025939] DSS: context saved
> [    8.031951] DISPC: dispc_runtime_get
> [    8.032043] DSS: dss_restore_context
> [    8.032043] DSS: context restored
> [    8.032073] DPI: dpi_set_timings
> [    8.032104] DISPC: dispc_ovl_setup 0, pa 0x9e900000, pa_uv
> 0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
> chan 0 repl 1
> [    8.032135] DISPC: scrw 480, width 480
> [    8.032135] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
> [    8.032135] DISPC: 0,0 480x272 -> 480x272
> [    8.032135] DISPC: dispc_enable_plane 0, 1
> [    8.032165] DISPC: dispc_runtime_get
> [    8.032196] DISPC: dispc_runtime_get
> [    8.032196] DSS: set fck to 36000000
> [    8.032257] DISPC: lck = 36000000 (1)
> [    8.032257] DISPC: pck = 9000000 (4)
> [    8.034240] DISPC: channel 0 xres 480 yres 272
> [    8.034271] DISPC: pck 9000000
> [    8.034271] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
> [    8.034271] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
> de_level 1 sync_pclk_edge -1
> [    8.034271] DISPC: hsync 17077Hz, vsync 59Hz
> [    8.493347] DISPC: dispc_runtime_put
> [    8.493438] Console: switching to colour frame buffer device 60x34
> [    8.493774] DISPC: dispc_runtime_get
> [    8.493835] DISPC: dispc_ovl_setup 0, pa 0x9e900000, pa_uv
> 0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
> chan 0 repl 1
> [    8.493896] DISPC: scrw 480, width 480
> [    8.493896] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
> [    8.493927] DISPC: 0,0 480x272 -> 480x272
> [    8.493957] DISPC: dispc_enable_plane 0, 1
> [    8.493988] DISPC: GO LCD
> [    8.506774] DISPC: dispc_runtime_put
> [    8.512298] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer device
> [    8.516632] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
> [    8.581359] wlcore: WARNING Detected unconfigured mac address in
> nvs, derive from fuse instead.
> [    8.581359] wlcore: WARNING Your device performance is not optimized.
> [    8.581390] wlcore: WARNING Please use the calibrator tool to
> configure your device.
> [    8.583862] wlcore: loaded
> [    9.520355] DISPC: dispc_runtime_get
> [    9.520446] DISPC: dispc_ovl_setup 0, pa 0x9e900000, pa_uv
> 0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
> chan 0 repl 1
> [    9.520477] DISPC: scrw 480, width 480
> [    9.520507] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
> [    9.520538] DISPC: 0,0 480x272 -> 480x272
> [    9.520568] DISPC: dispc_enable_plane 0, 1
> [    9.520599] DISPC: GO LCD
> [    9.535400] DISPC: dispc_runtime_put
> 
> 
> The Non-working version with the divisor set to 0:
> 
> [   10.719512] DSS: dss_runtime_get
> [   10.723022] DSS: dss_restore_context
> [   10.726623] DSS: OMAP DSS rev 2.0
> [   10.730041] DSS: dss_runtime_put
> [   10.733306] DSS: dss_save_context
> [   10.736633] DSS: context saved
> [   10.740417] DSS: dss_restore_context
> [   10.744018] DSS: context restored
> [   10.748046] DISPC: dispc_runtime_get
> [   10.751770] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
> [   10.758514] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
> [   10.765289] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
> [   10.772033] DISPC: dispc_restore_context
> [   10.775970] DISPC: dispc_restore_gamma_tables()
> [   10.780578] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
> [   10.787322] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
> [   10.794067] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
> [   10.800842] omapdss_dispc 48050400.dispc: OMAP DISPC rev 3.0
> [   10.806518] DISPC: dispc_runtime_put
> [   10.810150] DISPC: dispc_save_context
> [   10.813873] DISPC: context saved
> [   10.817291] omapdss_dss 48050000.dss: bound 48050400.dispc (ops
> hdmi5_configure [omapdss])
> [   10.927215] DSS: dss_save_context
> [   10.930725] DSS: context saved
> [   11.097503] omapdrm omapdrm.0: DMM not available, disable DMM support
> [   11.104248] omapdss_dss 48050000.dss: connect(NULL, 48050000.dss)
> [   11.110473] omapdss_dss 48050000.dss: connect(48050000.dss, NULL)
> [   11.116729] DISPC: dispc_runtime_get
> [   11.120452] DSS: dss_restore_context
> [   11.124053] DSS: context restored
> [   11.127410] DISPC: dispc_runtime_put
> [   11.131072] DISPC: dispc_save_context
> [   11.134765] DISPC: context saved
> [   11.138092] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   11.144775] [drm] No driver support for vblank timestamp query.
> [   11.156372] DSS: dss_save_context
> [   11.159729] DSS: context saved
> 
> ** hang **
> 
> I noticed there doesn't seem to be the calculation for setting fck,
> pck or any of the timings.  Are there any more debug options I can
> enable?

The logs here look very different. The first one doesn't even show the 
DSS rev prints. Can you get full logs for both? And even better, if you 
can build omapdss as a kernel module, and load it after the boot, you 
won't have any "extra" going on at the same time.

And what is the hdmi5_configure there? I don't see anything in the 
driver that would print hdmi5_configure. And, of course, there's no 
hdmi5 on that platform. Hmm, ok... it's from component.c, using "%ps". 
Somehow that goes wrong. Which is a bit alarming, but perhaps a totally 
different issue.

The hang happens at an odd time. The last line shows that the driver has 
managed to do its work at suspend time. Afaics, the only thing the 
driver does after that is calling pinctrl_pm_select_sleep_state(). You 
could add a print after that to be sure that goes fine. But I suspect it 
does.

Which then hints that the hang is somewhere outside the driver, in 
omap_device perhaps?

You could try adding an extra call to dss_runtime_get(). Say, at the 
beginning of dss_probe_hardware(), do another dss_runtime_get(). That 
should force DSS to be always on (until reboot). runtime PM suspend 
related bugs should disappear.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
