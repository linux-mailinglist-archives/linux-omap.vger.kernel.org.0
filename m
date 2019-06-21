Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF394E86C
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2019 15:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfFUNBO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Jun 2019 09:01:14 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46793 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfFUNBN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Jun 2019 09:01:13 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190621130111euoutp01c378c905f42a41064524d425522b3f24~qOEDUGW790969409694euoutp01C
        for <linux-omap@vger.kernel.org>; Fri, 21 Jun 2019 13:01:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190621130111euoutp01c378c905f42a41064524d425522b3f24~qOEDUGW790969409694euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561122071;
        bh=wtqjzC4PRlrEKSLMR0Q14owWV8QHmUGLERn0UDDbSa4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=L8r5/gVXNTFsszQgDfyf8XT3DF6uDyhCc6PA2Hqicc8vuqns3WJ9W8FU/r4lz7ACn
         6lUdarov8Fty6DO5AkD+bF/boy/PhcW/+x5Q97WcraDA0wKTvFpNbEeogCXcfO93+m
         aIb9qIusvjkxDAx8efLRmaO8Q7v0+deVR+1KEq6M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190621130111eucas1p22c391dbf28b5f1447a0a8e5cf9ecaeab~qOECuVri21716517165eucas1p2a;
        Fri, 21 Jun 2019 13:01:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 08.5A.04298.615DC0D5; Fri, 21
        Jun 2019 14:01:10 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190621130110eucas1p204a5041f91f1b52dade288e6ef137b37~qOEB8z4ae1717417174eucas1p2J;
        Fri, 21 Jun 2019 13:01:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190621130110eusmtrp178eaa4e443b6c0016fb2e172ec88f4e0~qOEBuqGve0948509485eusmtrp1X;
        Fri, 21 Jun 2019 13:01:10 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-05-5d0cd516c2c6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D1.30.04140.615DC0D5; Fri, 21
        Jun 2019 14:01:10 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190621130109eusmtip295fa88dde609e29a4546ff46c323975b~qOEBS5RU80652406524eusmtip2F;
        Fri, 21 Jun 2019 13:01:09 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: omap2: remove rfbi
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <a8779d39-7e14-6f28-6ac9-2ea0f4db2b4e@samsung.com>
Date:   Fri, 21 Jun 2019 15:01:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20180430195931.GC2456@t60.musicnaut.iki.fi>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjtvffu7rqcXafmk5rRqEhLTSq5aYhB0CiCfpYf5cqLim7KrjMt
        ghVZpis/KZ2CGqapMT8wTX/0sdFWGYZfYEpoqCkLNbUZRm15vUr+O8/znPOec+ClcFmHyIdK
        VmewGrUyVU5KiA7Lyqeg7UOucYfacyOYZzNRzKB9nmTuFdWKmXcPfoiYge5KkqmoLSCY5qoR
        knk1eDqKUizbiwlFRW65SGG21xCKsXwrprAOd2KKpTb/c2S05HgCm5qcyWpCIuMlSaZlozjd
        fAvLal3MI3VoqA/lIRcK6CMwXVMrzkMSSkY/RdCr/0UIw08ElpvtJM+S0UsI8o2BGwpreRsm
        kOoRPB7oxoVhFkHOHP+WC+VBH4U6ZyfOY096P9heFoh4Ek7rMHA6mzH+QNLhUHS3cS2IlI6E
        aVuhiMcEvRfGbSNrYi/6PIxZWkQCxx3el08SPHahj8GyvmuNg9PeMDJZhQl4F3TOVq4lAtok
        homO/PWmJ6Hf4RAL2ANs1vZ17Ac9JXpCEBgR/M2dWVd3IqgvcZACKwLM1r7VGNSqRQA0d4cI
        6xPQYJ8j+DXQbjA86y6EcIPijke4sJZC7h2ZwN4HLXUt5IZtXlcDXojkhk3VDJvqGDbVMfz3
        rUZEI/JmtZwqkeVC1ezVYE6p4rTqxOAraao2tPqbehzWxRfI3n/ZhGgKyV2lrw1b42QiZSaX
        rTIhoHC5p9Q11TVOJk1QZl9jNWmXNNpUljMhX4qQe0uvbxmPkdGJygw2hWXTWc3GFaNcfHRo
        97bWP351FQeNjUExTwqaxg+UBvgHvVlpbUwJe2jcceHD5/mxPd5hDSkzzttl9tjwnN77s4GW
        wOCkUrfvX4vtWoU+S/2tddQ2YXre9CVxihh9m/x7YeqijsMXqnY6HHMW/xLJ2Rqqqr+k0Cte
        XW0+RTjZG1PYmWi/w5qFstiPvnKCS1KGBuIaTvkPkQrvtEkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xe7piV3liDXo/cFuseeFgceXrezaL
        zolL2C1O9H1gtbi8aw6bxewl/SwW6+ffYrPYf8XLgcPj29dJLB6zO2ayehz+upDF4373cSaP
        4ze2M3l83iQXwBalZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
        llqkb5egl3Ho2zr2gsNNTBUbP3WxNTBevcjYxcjJISFgInF85iamLkYuDiGBpYwSezd3s3Yx
        cgAlZCSOry+DqBGW+HOtiw2i5jWjxJNv55lBEsICphLL/m8Hs0UENCRe7etnBSliFmhiktiy
        bSXU1B9MEn1btrKAVLEJWElMbF8FtppXwE7i+asJrCA2i4CqxINXt8AmiQpESJx5v4IFokZQ
        4uTMJ2A2p4ClxLeenWA1zALqEn/mXYKyxSVuPZnPBGHLS2x/O4d5AqPQLCTts5C0zELSMgtJ
        ywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBsbjt2M8tOxi73gUfYhTgYFTi4T0wiztW
        iDWxrLgy9xCjBAezkggvTw5PrBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA9NEXkm8oamh
        uYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxmX9Gjem+G5+KKMpcXLt4VXv
        bYVXWqV/CmGoeus888H0RPetc03lCvvmBh7xPSzi/ev377+f1p36xNTolrXNybEpYsMs6e64
        vU5/Cp3UhXvOW67vWCInfkUh/8ma/LvMkoY8uV6coevnTOnX/We7ZvuPZ6U9vDpPZ9nUmm7R
        /Cqx7G9NQVb0dyWW4oxEQy3mouJEAL99WUDbAgAA
X-CMS-MailID: 20190621130110eucas1p204a5041f91f1b52dade288e6ef137b37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20180427150914eucas1p14dd8df4a215014ddac990b0ccdb1805c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180427150914eucas1p14dd8df4a215014ddac990b0ccdb1805c
References: <CGME20180427150914eucas1p14dd8df4a215014ddac990b0ccdb1805c@eucas1p1.samsung.com>
        <2238944.jilJcacc6d@amdc3058>
        <20180427174714.bdvvlljk3txwu2bo@darkstar.musicnaut.iki.fi>
        <2055912.iuafLNK0IC@amdc3058>
        <20180427181243.o7ro63l6z7yatey7@darkstar.musicnaut.iki.fi>
        <cd513378-7be2-a5eb-adc5-bf04c789f1d4@ti.com>
        <20180430195931.GC2456@t60.musicnaut.iki.fi>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi,

On 4/30/18 9:59 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Mon, Apr 30, 2018 at 10:06:11AM +0300, Tomi Valkeinen wrote:
>> On 27/04/18 21:12, Aaro Koskinen wrote:
>>>> You should be targeting omapdrm driver instead, fbdev subsystem is closed
>>>> for the new hardware support.
>>>
>>> AFAIK, based on N950 display support discussion, it's impossible to get
>>> anything new into omapdrm for a long time. And based on Tomi's comments,
>>> restoring RFBI support with omapfb should be a minor thing.
>>
>> I was perhaps a bit vague, but I didn't say it should be a minor thing.
>> I meant that there should be no architectural obstacles in omapfb, and I
>> think all the generic plumbing to enable N800 display is there in omapfb.
>>
>> That said, it still needs a real amount of work with the rfbi driver,
>> the encoder driver and the panel driver on N800 (the encoder and the
>> panel driver are not in mainline anymore).
> 
> Let's see first if I get anything working. After that we can evaluate
> the impact properly once we see the actual patches needed.
It has been over a year now and not much has happened in the case of
fixing rfbi driver so I've queued the old patch removing it (with
updated patch description, please see below) for v5.3 (please note
that it can be trivially reverted using kernel git repository if ever
needed).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: omap2: remove rfbi

Equivalent of drm's commit aa61321d4c08 ("drm/omap: remove rfbi").

The RFBI driver has been marked as BROKEN and has not been
included in the kernel build for many years. Just remove it
(it can be trivially brought back from git repository if
ever needed).

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/Kconfig  |   12 
 drivers/video/fbdev/omap2/omapfb/dss/Makefile |    1 
 drivers/video/fbdev/omap2/omapfb/dss/core.c   |    6 
 drivers/video/fbdev/omap2/omapfb/dss/dss.h    |    4 
 drivers/video/fbdev/omap2/omapfb/dss/rfbi.c   | 1078 --------------------------
 include/video/omapfb_dss.h                    |   32 
 6 files changed, 1133 deletions(-)
 delete mode 100644 drivers/video/fbdev/omap2/omapfb/dss/rfbi.c

Index: b/drivers/video/fbdev/omap2/omapfb/dss/Kconfig
===================================================================
--- a/drivers/video/fbdev/omap2/omapfb/dss/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/dss/Kconfig
@@ -39,18 +39,6 @@ config FB_OMAP2_DSS_DPI
 	help
 	  DPI Interface. This is the Parallel Display Interface.
 
-config FB_OMAP2_DSS_RFBI
-	bool "RFBI support"
-	depends on BROKEN
-	help
-	  MIPI DBI support (RFBI, Remote Framebuffer Interface, in Texas
-	  Instrument's terminology).
-
-	  DBI is a bus between the host processor and a peripheral,
-	  such as a display or a framebuffer chip.
-
-	  See http://www.mipi.org/ for DBI specifications.
-
 config FB_OMAP2_DSS_VENC
 	bool "VENC support"
 	default y
Index: b/drivers/video/fbdev/omap2/omapfb/dss/Makefile
===================================================================
--- a/drivers/video/fbdev/omap2/omapfb/dss/Makefile
+++ b/drivers/video/fbdev/omap2/omapfb/dss/Makefile
@@ -8,7 +8,6 @@ omapdss-y := core.o dss.o dss_features.o
 omapdss-y += manager.o manager-sysfs.o overlay.o overlay-sysfs.o apply.o \
 	dispc-compat.o display-sysfs.o
 omapdss-$(CONFIG_FB_OMAP2_DSS_DPI) += dpi.o
-omapdss-$(CONFIG_FB_OMAP2_DSS_RFBI) += rfbi.o
 omapdss-$(CONFIG_FB_OMAP2_DSS_VENC) += venc.o
 omapdss-$(CONFIG_FB_OMAP2_DSS_SDI) += sdi.o
 omapdss-$(CONFIG_FB_OMAP2_DSS_DSI) += dsi.o
Index: b/drivers/video/fbdev/omap2/omapfb/dss/core.c
===================================================================
--- a/drivers/video/fbdev/omap2/omapfb/dss/core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/core.c
@@ -218,9 +218,6 @@ static int (*dss_output_drv_reg_funcs[])
 #ifdef CONFIG_FB_OMAP2_DSS_SDI
 	sdi_init_platform_driver,
 #endif
-#ifdef CONFIG_FB_OMAP2_DSS_RFBI
-	rfbi_init_platform_driver,
-#endif
 #ifdef CONFIG_FB_OMAP2_DSS_VENC
 	venc_init_platform_driver,
 #endif
@@ -242,9 +239,6 @@ static void (*dss_output_drv_unreg_funcs
 #ifdef CONFIG_FB_OMAP2_DSS_VENC
 	venc_uninit_platform_driver,
 #endif
-#ifdef CONFIG_FB_OMAP2_DSS_RFBI
-	rfbi_uninit_platform_driver,
-#endif
 #ifdef CONFIG_FB_OMAP2_DSS_SDI
 	sdi_uninit_platform_driver,
 #endif
Index: b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
===================================================================
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
@@ -472,10 +472,6 @@ void hdmi4_uninit_platform_driver(void);
 int hdmi5_init_platform_driver(void) __init;
 void hdmi5_uninit_platform_driver(void);
 
-/* RFBI */
-int rfbi_init_platform_driver(void) __init;
-void rfbi_uninit_platform_driver(void);
-
 
 #ifdef CONFIG_FB_OMAP2_DSS_COLLECT_IRQ_STATS
 static inline void dss_collect_irq_stats(u32 irqstatus, unsigned *irq_arr)
Index: b/drivers/video/fbdev/omap2/omapfb/dss/rfbi.c
===================================================================
--- a/drivers/video/fbdev/omap2/omapfb/dss/rfbi.c
+++ /dev/null
@@ -1,1078 +0,0 @@
-/*
- * linux/drivers/video/omap2/dss/rfbi.c
- *
- * Copyright (C) 2009 Nokia Corporation
- * Author: Tomi Valkeinen <tomi.valkeinen@nokia.com>
- *
- * Some code and ideas taken from drivers/video/omap/ driver
- * by Imre Deak.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published by
- * the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#define DSS_SUBSYS_NAME "RFBI"
-
-#include <linux/kernel.h>
-#include <linux/dma-mapping.h>
-#include <linux/export.h>
-#include <linux/vmalloc.h>
-#include <linux/clk.h>
-#include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/kfifo.h>
-#include <linux/ktime.h>
-#include <linux/hrtimer.h>
-#include <linux/seq_file.h>
-#include <linux/semaphore.h>
-#include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-#include <linux/component.h>
-
-#include <video/omapfb_dss.h>
-#include "dss.h"
-
-struct rfbi_reg { u16 idx; };
-
-#define RFBI_REG(idx)		((const struct rfbi_reg) { idx })
-
-#define RFBI_REVISION		RFBI_REG(0x0000)
-#define RFBI_SYSCONFIG		RFBI_REG(0x0010)
-#define RFBI_SYSSTATUS		RFBI_REG(0x0014)
-#define RFBI_CONTROL		RFBI_REG(0x0040)
-#define RFBI_PIXEL_CNT		RFBI_REG(0x0044)
-#define RFBI_LINE_NUMBER	RFBI_REG(0x0048)
-#define RFBI_CMD		RFBI_REG(0x004c)
-#define RFBI_PARAM		RFBI_REG(0x0050)
-#define RFBI_DATA		RFBI_REG(0x0054)
-#define RFBI_READ		RFBI_REG(0x0058)
-#define RFBI_STATUS		RFBI_REG(0x005c)
-
-#define RFBI_CONFIG(n)		RFBI_REG(0x0060 + (n)*0x18)
-#define RFBI_ONOFF_TIME(n)	RFBI_REG(0x0064 + (n)*0x18)
-#define RFBI_CYCLE_TIME(n)	RFBI_REG(0x0068 + (n)*0x18)
-#define RFBI_DATA_CYCLE1(n)	RFBI_REG(0x006c + (n)*0x18)
-#define RFBI_DATA_CYCLE2(n)	RFBI_REG(0x0070 + (n)*0x18)
-#define RFBI_DATA_CYCLE3(n)	RFBI_REG(0x0074 + (n)*0x18)
-
-#define RFBI_VSYNC_WIDTH	RFBI_REG(0x0090)
-#define RFBI_HSYNC_WIDTH	RFBI_REG(0x0094)
-
-#define REG_FLD_MOD(idx, val, start, end) \
-	rfbi_write_reg(idx, FLD_MOD(rfbi_read_reg(idx), val, start, end))
-
-enum omap_rfbi_cycleformat {
-	OMAP_DSS_RFBI_CYCLEFORMAT_1_1 = 0,
-	OMAP_DSS_RFBI_CYCLEFORMAT_2_1 = 1,
-	OMAP_DSS_RFBI_CYCLEFORMAT_3_1 = 2,
-	OMAP_DSS_RFBI_CYCLEFORMAT_3_2 = 3,
-};
-
-enum omap_rfbi_datatype {
-	OMAP_DSS_RFBI_DATATYPE_12 = 0,
-	OMAP_DSS_RFBI_DATATYPE_16 = 1,
-	OMAP_DSS_RFBI_DATATYPE_18 = 2,
-	OMAP_DSS_RFBI_DATATYPE_24 = 3,
-};
-
-enum omap_rfbi_parallelmode {
-	OMAP_DSS_RFBI_PARALLELMODE_8 = 0,
-	OMAP_DSS_RFBI_PARALLELMODE_9 = 1,
-	OMAP_DSS_RFBI_PARALLELMODE_12 = 2,
-	OMAP_DSS_RFBI_PARALLELMODE_16 = 3,
-};
-
-static int rfbi_convert_timings(struct rfbi_timings *t);
-static void rfbi_get_clk_info(u32 *clk_period, u32 *max_clk_div);
-
-static struct {
-	struct platform_device *pdev;
-	void __iomem	*base;
-
-	unsigned long	l4_khz;
-
-	enum omap_rfbi_datatype datatype;
-	enum omap_rfbi_parallelmode parallelmode;
-
-	enum omap_rfbi_te_mode te_mode;
-	int te_enabled;
-
-	void (*framedone_callback)(void *data);
-	void *framedone_callback_data;
-
-	struct omap_dss_device *dssdev[2];
-
-	struct semaphore bus_lock;
-
-	struct omap_video_timings timings;
-	int pixel_size;
-	int data_lines;
-	struct rfbi_timings intf_timings;
-
-	struct omap_dss_device output;
-} rfbi;
-
-static inline void rfbi_write_reg(const struct rfbi_reg idx, u32 val)
-{
-	__raw_writel(val, rfbi.base + idx.idx);
-}
-
-static inline u32 rfbi_read_reg(const struct rfbi_reg idx)
-{
-	return __raw_readl(rfbi.base + idx.idx);
-}
-
-static int rfbi_runtime_get(void)
-{
-	int r;
-
-	DSSDBG("rfbi_runtime_get\n");
-
-	r = pm_runtime_get_sync(&rfbi.pdev->dev);
-	WARN_ON(r < 0);
-	return r < 0 ? r : 0;
-}
-
-static void rfbi_runtime_put(void)
-{
-	int r;
-
-	DSSDBG("rfbi_runtime_put\n");
-
-	r = pm_runtime_put_sync(&rfbi.pdev->dev);
-	WARN_ON(r < 0 && r != -ENOSYS);
-}
-
-static void rfbi_bus_lock(void)
-{
-	down(&rfbi.bus_lock);
-}
-
-static void rfbi_bus_unlock(void)
-{
-	up(&rfbi.bus_lock);
-}
-
-static void rfbi_write_command(const void *buf, u32 len)
-{
-	switch (rfbi.parallelmode) {
-	case OMAP_DSS_RFBI_PARALLELMODE_8:
-	{
-		const u8 *b = buf;
-		for (; len; len--)
-			rfbi_write_reg(RFBI_CMD, *b++);
-		break;
-	}
-
-	case OMAP_DSS_RFBI_PARALLELMODE_16:
-	{
-		const u16 *w = buf;
-		BUG_ON(len & 1);
-		for (; len; len -= 2)
-			rfbi_write_reg(RFBI_CMD, *w++);
-		break;
-	}
-
-	case OMAP_DSS_RFBI_PARALLELMODE_9:
-	case OMAP_DSS_RFBI_PARALLELMODE_12:
-	default:
-		BUG();
-	}
-}
-
-static void rfbi_read_data(void *buf, u32 len)
-{
-	switch (rfbi.parallelmode) {
-	case OMAP_DSS_RFBI_PARALLELMODE_8:
-	{
-		u8 *b = buf;
-		for (; len; len--) {
-			rfbi_write_reg(RFBI_READ, 0);
-			*b++ = rfbi_read_reg(RFBI_READ);
-		}
-		break;
-	}
-
-	case OMAP_DSS_RFBI_PARALLELMODE_16:
-	{
-		u16 *w = buf;
-		BUG_ON(len & ~1);
-		for (; len; len -= 2) {
-			rfbi_write_reg(RFBI_READ, 0);
-			*w++ = rfbi_read_reg(RFBI_READ);
-		}
-		break;
-	}
-
-	case OMAP_DSS_RFBI_PARALLELMODE_9:
-	case OMAP_DSS_RFBI_PARALLELMODE_12:
-	default:
-		BUG();
-	}
-}
-
-static void rfbi_write_data(const void *buf, u32 len)
-{
-	switch (rfbi.parallelmode) {
-	case OMAP_DSS_RFBI_PARALLELMODE_8:
-	{
-		const u8 *b = buf;
-		for (; len; len--)
-			rfbi_write_reg(RFBI_PARAM, *b++);
-		break;
-	}
-
-	case OMAP_DSS_RFBI_PARALLELMODE_16:
-	{
-		const u16 *w = buf;
-		BUG_ON(len & 1);
-		for (; len; len -= 2)
-			rfbi_write_reg(RFBI_PARAM, *w++);
-		break;
-	}
-
-	case OMAP_DSS_RFBI_PARALLELMODE_9:
-	case OMAP_DSS_RFBI_PARALLELMODE_12:
-	default:
-		BUG();
-
-	}
-}
-
-static void rfbi_write_pixels(const void __iomem *buf, int scr_width,
-		u16 x, u16 y,
-		u16 w, u16 h)
-{
-	int start_offset = scr_width * y + x;
-	int horiz_offset = scr_width - w;
-	int i;
-
-	if (rfbi.datatype == OMAP_DSS_RFBI_DATATYPE_16 &&
-	   rfbi.parallelmode == OMAP_DSS_RFBI_PARALLELMODE_8) {
-		const u16 __iomem *pd = buf;
-		pd += start_offset;
-
-		for (; h; --h) {
-			for (i = 0; i < w; ++i) {
-				const u8 __iomem *b = (const u8 __iomem *)pd;
-				rfbi_write_reg(RFBI_PARAM, __raw_readb(b+1));
-				rfbi_write_reg(RFBI_PARAM, __raw_readb(b+0));
-				++pd;
-			}
-			pd += horiz_offset;
-		}
-	} else if (rfbi.datatype == OMAP_DSS_RFBI_DATATYPE_24 &&
-	   rfbi.parallelmode == OMAP_DSS_RFBI_PARALLELMODE_8) {
-		const u32 __iomem *pd = buf;
-		pd += start_offset;
-
-		for (; h; --h) {
-			for (i = 0; i < w; ++i) {
-				const u8 __iomem *b = (const u8 __iomem *)pd;
-				rfbi_write_reg(RFBI_PARAM, __raw_readb(b+2));
-				rfbi_write_reg(RFBI_PARAM, __raw_readb(b+1));
-				rfbi_write_reg(RFBI_PARAM, __raw_readb(b+0));
-				++pd;
-			}
-			pd += horiz_offset;
-		}
-	} else if (rfbi.datatype == OMAP_DSS_RFBI_DATATYPE_16 &&
-	   rfbi.parallelmode == OMAP_DSS_RFBI_PARALLELMODE_16) {
-		const u16 __iomem *pd = buf;
-		pd += start_offset;
-
-		for (; h; --h) {
-			for (i = 0; i < w; ++i) {
-				rfbi_write_reg(RFBI_PARAM, __raw_readw(pd));
-				++pd;
-			}
-			pd += horiz_offset;
-		}
-	} else {
-		BUG();
-	}
-}
-
-static int rfbi_transfer_area(struct omap_dss_device *dssdev,
-		void (*callback)(void *data), void *data)
-{
-	u32 l;
-	int r;
-	struct omap_overlay_manager *mgr = rfbi.output.manager;
-	u16 width = rfbi.timings.x_res;
-	u16 height = rfbi.timings.y_res;
-
-	/*BUG_ON(callback == 0);*/
-	BUG_ON(rfbi.framedone_callback != NULL);
-
-	DSSDBG("rfbi_transfer_area %dx%d\n", width, height);
-
-	dss_mgr_set_timings(mgr, &rfbi.timings);
-
-	r = dss_mgr_enable(mgr);
-	if (r)
-		return r;
-
-	rfbi.framedone_callback = callback;
-	rfbi.framedone_callback_data = data;
-
-	rfbi_write_reg(RFBI_PIXEL_CNT, width * height);
-
-	l = rfbi_read_reg(RFBI_CONTROL);
-	l = FLD_MOD(l, 1, 0, 0); /* enable */
-	if (!rfbi.te_enabled)
-		l = FLD_MOD(l, 1, 4, 4); /* ITE */
-
-	rfbi_write_reg(RFBI_CONTROL, l);
-
-	return 0;
-}
-
-static void framedone_callback(void *data)
-{
-	void (*callback)(void *data);
-
-	DSSDBG("FRAMEDONE\n");
-
-	REG_FLD_MOD(RFBI_CONTROL, 0, 0, 0);
-
-	callback = rfbi.framedone_callback;
-	rfbi.framedone_callback = NULL;
-
-	if (callback != NULL)
-		callback(rfbi.framedone_callback_data);
-}
-
-#if 1 /* VERBOSE */
-static void rfbi_print_timings(void)
-{
-	u32 l;
-	u32 time;
-
-	l = rfbi_read_reg(RFBI_CONFIG(0));
-	time = 1000000000 / rfbi.l4_khz;
-	if (l & (1 << 4))
-		time *= 2;
-
-	DSSDBG("Tick time %u ps\n", time);
-	l = rfbi_read_reg(RFBI_ONOFF_TIME(0));
-	DSSDBG("CSONTIME %d, CSOFFTIME %d, WEONTIME %d, WEOFFTIME %d, "
-		"REONTIME %d, REOFFTIME %d\n",
-		l & 0x0f, (l >> 4) & 0x3f, (l >> 10) & 0x0f, (l >> 14) & 0x3f,
-		(l >> 20) & 0x0f, (l >> 24) & 0x3f);
-
-	l = rfbi_read_reg(RFBI_CYCLE_TIME(0));
-	DSSDBG("WECYCLETIME %d, RECYCLETIME %d, CSPULSEWIDTH %d, "
-		"ACCESSTIME %d\n",
-		(l & 0x3f), (l >> 6) & 0x3f, (l >> 12) & 0x3f,
-		(l >> 22) & 0x3f);
-}
-#else
-static void rfbi_print_timings(void) {}
-#endif
-
-
-
-
-static u32 extif_clk_period;
-
-static inline unsigned long round_to_extif_ticks(unsigned long ps, int div)
-{
-	int bus_tick = extif_clk_period * div;
-	return (ps + bus_tick - 1) / bus_tick * bus_tick;
-}
-
-static int calc_reg_timing(struct rfbi_timings *t, int div)
-{
-	t->clk_div = div;
-
-	t->cs_on_time = round_to_extif_ticks(t->cs_on_time, div);
-
-	t->we_on_time = round_to_extif_ticks(t->we_on_time, div);
-	t->we_off_time = round_to_extif_ticks(t->we_off_time, div);
-	t->we_cycle_time = round_to_extif_ticks(t->we_cycle_time, div);
-
-	t->re_on_time = round_to_extif_ticks(t->re_on_time, div);
-	t->re_off_time = round_to_extif_ticks(t->re_off_time, div);
-	t->re_cycle_time = round_to_extif_ticks(t->re_cycle_time, div);
-
-	t->access_time = round_to_extif_ticks(t->access_time, div);
-	t->cs_off_time = round_to_extif_ticks(t->cs_off_time, div);
-	t->cs_pulse_width = round_to_extif_ticks(t->cs_pulse_width, div);
-
-	DSSDBG("[reg]cson %d csoff %d reon %d reoff %d\n",
-	       t->cs_on_time, t->cs_off_time, t->re_on_time, t->re_off_time);
-	DSSDBG("[reg]weon %d weoff %d recyc %d wecyc %d\n",
-	       t->we_on_time, t->we_off_time, t->re_cycle_time,
-	       t->we_cycle_time);
-	DSSDBG("[reg]rdaccess %d cspulse %d\n",
-	       t->access_time, t->cs_pulse_width);
-
-	return rfbi_convert_timings(t);
-}
-
-static int calc_extif_timings(struct rfbi_timings *t)
-{
-	u32 max_clk_div;
-	int div;
-
-	rfbi_get_clk_info(&extif_clk_period, &max_clk_div);
-	for (div = 1; div <= max_clk_div; div++) {
-		if (calc_reg_timing(t, div) == 0)
-			break;
-	}
-
-	if (div <= max_clk_div)
-		return 0;
-
-	DSSERR("can't setup timings\n");
-	return -1;
-}
-
-
-static void rfbi_set_timings(int rfbi_module, struct rfbi_timings *t)
-{
-	int r;
-
-	if (!t->converted) {
-		r = calc_extif_timings(t);
-		if (r < 0)
-			DSSERR("Failed to calc timings\n");
-	}
-
-	BUG_ON(!t->converted);
-
-	rfbi_write_reg(RFBI_ONOFF_TIME(rfbi_module), t->tim[0]);
-	rfbi_write_reg(RFBI_CYCLE_TIME(rfbi_module), t->tim[1]);
-
-	/* TIMEGRANULARITY */
-	REG_FLD_MOD(RFBI_CONFIG(rfbi_module),
-		    (t->tim[2] ? 1 : 0), 4, 4);
-
-	rfbi_print_timings();
-}
-
-static int ps_to_rfbi_ticks(int time, int div)
-{
-	unsigned long tick_ps;
-	int ret;
-
-	/* Calculate in picosecs to yield more exact results */
-	tick_ps = 1000000000 / (rfbi.l4_khz) * div;
-
-	ret = (time + tick_ps - 1) / tick_ps;
-
-	return ret;
-}
-
-static void rfbi_get_clk_info(u32 *clk_period, u32 *max_clk_div)
-{
-	*clk_period = 1000000000 / rfbi.l4_khz;
-	*max_clk_div = 2;
-}
-
-static int rfbi_convert_timings(struct rfbi_timings *t)
-{
-	u32 l;
-	int reon, reoff, weon, weoff, cson, csoff, cs_pulse;
-	int actim, recyc, wecyc;
-	int div = t->clk_div;
-
-	if (div <= 0 || div > 2)
-		return -1;
-
-	/* Make sure that after conversion it still holds that:
-	 * weoff > weon, reoff > reon, recyc >= reoff, wecyc >= weoff,
-	 * csoff > cson, csoff >= max(weoff, reoff), actim > reon
-	 */
-	weon = ps_to_rfbi_ticks(t->we_on_time, div);
-	weoff = ps_to_rfbi_ticks(t->we_off_time, div);
-	if (weoff <= weon)
-		weoff = weon + 1;
-	if (weon > 0x0f)
-		return -1;
-	if (weoff > 0x3f)
-		return -1;
-
-	reon = ps_to_rfbi_ticks(t->re_on_time, div);
-	reoff = ps_to_rfbi_ticks(t->re_off_time, div);
-	if (reoff <= reon)
-		reoff = reon + 1;
-	if (reon > 0x0f)
-		return -1;
-	if (reoff > 0x3f)
-		return -1;
-
-	cson = ps_to_rfbi_ticks(t->cs_on_time, div);
-	csoff = ps_to_rfbi_ticks(t->cs_off_time, div);
-	if (csoff <= cson)
-		csoff = cson + 1;
-	if (csoff < max(weoff, reoff))
-		csoff = max(weoff, reoff);
-	if (cson > 0x0f)
-		return -1;
-	if (csoff > 0x3f)
-		return -1;
-
-	l =  cson;
-	l |= csoff << 4;
-	l |= weon  << 10;
-	l |= weoff << 14;
-	l |= reon  << 20;
-	l |= reoff << 24;
-
-	t->tim[0] = l;
-
-	actim = ps_to_rfbi_ticks(t->access_time, div);
-	if (actim <= reon)
-		actim = reon + 1;
-	if (actim > 0x3f)
-		return -1;
-
-	wecyc = ps_to_rfbi_ticks(t->we_cycle_time, div);
-	if (wecyc < weoff)
-		wecyc = weoff;
-	if (wecyc > 0x3f)
-		return -1;
-
-	recyc = ps_to_rfbi_ticks(t->re_cycle_time, div);
-	if (recyc < reoff)
-		recyc = reoff;
-	if (recyc > 0x3f)
-		return -1;
-
-	cs_pulse = ps_to_rfbi_ticks(t->cs_pulse_width, div);
-	if (cs_pulse > 0x3f)
-		return -1;
-
-	l =  wecyc;
-	l |= recyc    << 6;
-	l |= cs_pulse << 12;
-	l |= actim    << 22;
-
-	t->tim[1] = l;
-
-	t->tim[2] = div - 1;
-
-	t->converted = 1;
-
-	return 0;
-}
-
-/* xxx FIX module selection missing */
-static int rfbi_setup_te(enum omap_rfbi_te_mode mode,
-			     unsigned hs_pulse_time, unsigned vs_pulse_time,
-			     int hs_pol_inv, int vs_pol_inv, int extif_div)
-{
-	int hs, vs;
-	int min;
-	u32 l;
-
-	hs = ps_to_rfbi_ticks(hs_pulse_time, 1);
-	vs = ps_to_rfbi_ticks(vs_pulse_time, 1);
-	if (hs < 2)
-		return -EDOM;
-	if (mode == OMAP_DSS_RFBI_TE_MODE_2)
-		min = 2;
-	else /* OMAP_DSS_RFBI_TE_MODE_1 */
-		min = 4;
-	if (vs < min)
-		return -EDOM;
-	if (vs == hs)
-		return -EINVAL;
-	rfbi.te_mode = mode;
-	DSSDBG("setup_te: mode %d hs %d vs %d hs_inv %d vs_inv %d\n",
-		mode, hs, vs, hs_pol_inv, vs_pol_inv);
-
-	rfbi_write_reg(RFBI_HSYNC_WIDTH, hs);
-	rfbi_write_reg(RFBI_VSYNC_WIDTH, vs);
-
-	l = rfbi_read_reg(RFBI_CONFIG(0));
-	if (hs_pol_inv)
-		l &= ~(1 << 21);
-	else
-		l |= 1 << 21;
-	if (vs_pol_inv)
-		l &= ~(1 << 20);
-	else
-		l |= 1 << 20;
-
-	return 0;
-}
-
-/* xxx FIX module selection missing */
-static int rfbi_enable_te(bool enable, unsigned line)
-{
-	u32 l;
-
-	DSSDBG("te %d line %d mode %d\n", enable, line, rfbi.te_mode);
-	if (line > (1 << 11) - 1)
-		return -EINVAL;
-
-	l = rfbi_read_reg(RFBI_CONFIG(0));
-	l &= ~(0x3 << 2);
-	if (enable) {
-		rfbi.te_enabled = 1;
-		l |= rfbi.te_mode << 2;
-	} else
-		rfbi.te_enabled = 0;
-	rfbi_write_reg(RFBI_CONFIG(0), l);
-	rfbi_write_reg(RFBI_LINE_NUMBER, line);
-
-	return 0;
-}
-
-static int rfbi_configure_bus(int rfbi_module, int bpp, int lines)
-{
-	u32 l;
-	int cycle1 = 0, cycle2 = 0, cycle3 = 0;
-	enum omap_rfbi_cycleformat cycleformat;
-	enum omap_rfbi_datatype datatype;
-	enum omap_rfbi_parallelmode parallelmode;
-
-	switch (bpp) {
-	case 12:
-		datatype = OMAP_DSS_RFBI_DATATYPE_12;
-		break;
-	case 16:
-		datatype = OMAP_DSS_RFBI_DATATYPE_16;
-		break;
-	case 18:
-		datatype = OMAP_DSS_RFBI_DATATYPE_18;
-		break;
-	case 24:
-		datatype = OMAP_DSS_RFBI_DATATYPE_24;
-		break;
-	default:
-		BUG();
-		return 1;
-	}
-	rfbi.datatype = datatype;
-
-	switch (lines) {
-	case 8:
-		parallelmode = OMAP_DSS_RFBI_PARALLELMODE_8;
-		break;
-	case 9:
-		parallelmode = OMAP_DSS_RFBI_PARALLELMODE_9;
-		break;
-	case 12:
-		parallelmode = OMAP_DSS_RFBI_PARALLELMODE_12;
-		break;
-	case 16:
-		parallelmode = OMAP_DSS_RFBI_PARALLELMODE_16;
-		break;
-	default:
-		BUG();
-		return 1;
-	}
-	rfbi.parallelmode = parallelmode;
-
-	if ((bpp % lines) == 0) {
-		switch (bpp / lines) {
-		case 1:
-			cycleformat = OMAP_DSS_RFBI_CYCLEFORMAT_1_1;
-			break;
-		case 2:
-			cycleformat = OMAP_DSS_RFBI_CYCLEFORMAT_2_1;
-			break;
-		case 3:
-			cycleformat = OMAP_DSS_RFBI_CYCLEFORMAT_3_1;
-			break;
-		default:
-			BUG();
-			return 1;
-		}
-	} else if ((2 * bpp % lines) == 0) {
-		if ((2 * bpp / lines) == 3)
-			cycleformat = OMAP_DSS_RFBI_CYCLEFORMAT_3_2;
-		else {
-			BUG();
-			return 1;
-		}
-	} else {
-		BUG();
-		return 1;
-	}
-
-	switch (cycleformat) {
-	case OMAP_DSS_RFBI_CYCLEFORMAT_1_1:
-		cycle1 = lines;
-		break;
-
-	case OMAP_DSS_RFBI_CYCLEFORMAT_2_1:
-		cycle1 = lines;
-		cycle2 = lines;
-		break;
-
-	case OMAP_DSS_RFBI_CYCLEFORMAT_3_1:
-		cycle1 = lines;
-		cycle2 = lines;
-		cycle3 = lines;
-		break;
-
-	case OMAP_DSS_RFBI_CYCLEFORMAT_3_2:
-		cycle1 = lines;
-		cycle2 = (lines / 2) | ((lines / 2) << 16);
-		cycle3 = (lines << 16);
-		break;
-	}
-
-	REG_FLD_MOD(RFBI_CONTROL, 0, 3, 2); /* clear CS */
-
-	l = 0;
-	l |= FLD_VAL(parallelmode, 1, 0);
-	l |= FLD_VAL(0, 3, 2);		/* TRIGGERMODE: ITE */
-	l |= FLD_VAL(0, 4, 4);		/* TIMEGRANULARITY */
-	l |= FLD_VAL(datatype, 6, 5);
-	/* l |= FLD_VAL(2, 8, 7); */	/* L4FORMAT, 2pix/L4 */
-	l |= FLD_VAL(0, 8, 7);	/* L4FORMAT, 1pix/L4 */
-	l |= FLD_VAL(cycleformat, 10, 9);
-	l |= FLD_VAL(0, 12, 11);	/* UNUSEDBITS */
-	l |= FLD_VAL(0, 16, 16);	/* A0POLARITY */
-	l |= FLD_VAL(0, 17, 17);	/* REPOLARITY */
-	l |= FLD_VAL(0, 18, 18);	/* WEPOLARITY */
-	l |= FLD_VAL(0, 19, 19);	/* CSPOLARITY */
-	l |= FLD_VAL(1, 20, 20);	/* TE_VSYNC_POLARITY */
-	l |= FLD_VAL(1, 21, 21);	/* HSYNCPOLARITY */
-	rfbi_write_reg(RFBI_CONFIG(rfbi_module), l);
-
-	rfbi_write_reg(RFBI_DATA_CYCLE1(rfbi_module), cycle1);
-	rfbi_write_reg(RFBI_DATA_CYCLE2(rfbi_module), cycle2);
-	rfbi_write_reg(RFBI_DATA_CYCLE3(rfbi_module), cycle3);
-
-
-	l = rfbi_read_reg(RFBI_CONTROL);
-	l = FLD_MOD(l, rfbi_module+1, 3, 2); /* Select CSx */
-	l = FLD_MOD(l, 0, 1, 1); /* clear bypass */
-	rfbi_write_reg(RFBI_CONTROL, l);
-
-
-	DSSDBG("RFBI config: bpp %d, lines %d, cycles: 0x%x 0x%x 0x%x\n",
-	       bpp, lines, cycle1, cycle2, cycle3);
-
-	return 0;
-}
-
-static int rfbi_configure(struct omap_dss_device *dssdev)
-{
-	return rfbi_configure_bus(dssdev->phy.rfbi.channel, rfbi.pixel_size,
-			rfbi.data_lines);
-}
-
-static int rfbi_update(struct omap_dss_device *dssdev, void (*callback)(void *),
-		void *data)
-{
-	return rfbi_transfer_area(dssdev, callback, data);
-}
-
-static void rfbi_set_size(struct omap_dss_device *dssdev, u16 w, u16 h)
-{
-	rfbi.timings.x_res = w;
-	rfbi.timings.y_res = h;
-}
-
-static void rfbi_set_pixel_size(struct omap_dss_device *dssdev, int pixel_size)
-{
-	rfbi.pixel_size = pixel_size;
-}
-
-static void rfbi_set_data_lines(struct omap_dss_device *dssdev, int data_lines)
-{
-	rfbi.data_lines = data_lines;
-}
-
-static void rfbi_set_interface_timings(struct omap_dss_device *dssdev,
-		struct rfbi_timings *timings)
-{
-	rfbi.intf_timings = *timings;
-}
-
-static void rfbi_dump_regs(struct seq_file *s)
-{
-#define DUMPREG(r) seq_printf(s, "%-35s %08x\n", #r, rfbi_read_reg(r))
-
-	if (rfbi_runtime_get())
-		return;
-
-	DUMPREG(RFBI_REVISION);
-	DUMPREG(RFBI_SYSCONFIG);
-	DUMPREG(RFBI_SYSSTATUS);
-	DUMPREG(RFBI_CONTROL);
-	DUMPREG(RFBI_PIXEL_CNT);
-	DUMPREG(RFBI_LINE_NUMBER);
-	DUMPREG(RFBI_CMD);
-	DUMPREG(RFBI_PARAM);
-	DUMPREG(RFBI_DATA);
-	DUMPREG(RFBI_READ);
-	DUMPREG(RFBI_STATUS);
-
-	DUMPREG(RFBI_CONFIG(0));
-	DUMPREG(RFBI_ONOFF_TIME(0));
-	DUMPREG(RFBI_CYCLE_TIME(0));
-	DUMPREG(RFBI_DATA_CYCLE1(0));
-	DUMPREG(RFBI_DATA_CYCLE2(0));
-	DUMPREG(RFBI_DATA_CYCLE3(0));
-
-	DUMPREG(RFBI_CONFIG(1));
-	DUMPREG(RFBI_ONOFF_TIME(1));
-	DUMPREG(RFBI_CYCLE_TIME(1));
-	DUMPREG(RFBI_DATA_CYCLE1(1));
-	DUMPREG(RFBI_DATA_CYCLE2(1));
-	DUMPREG(RFBI_DATA_CYCLE3(1));
-
-	DUMPREG(RFBI_VSYNC_WIDTH);
-	DUMPREG(RFBI_HSYNC_WIDTH);
-
-	rfbi_runtime_put();
-#undef DUMPREG
-}
-
-static void rfbi_config_lcd_manager(struct omap_dss_device *dssdev)
-{
-	struct omap_overlay_manager *mgr = rfbi.output.manager;
-	struct dss_lcd_mgr_config mgr_config;
-
-	mgr_config.io_pad_mode = DSS_IO_PAD_MODE_RFBI;
-
-	mgr_config.stallmode = true;
-	/* Do we need fifohandcheck for RFBI? */
-	mgr_config.fifohandcheck = false;
-
-	mgr_config.video_port_width = rfbi.pixel_size;
-	mgr_config.lcden_sig_polarity = 0;
-
-	dss_mgr_set_lcd_config(mgr, &mgr_config);
-
-	/*
-	 * Set rfbi.timings with default values, the x_res and y_res fields
-	 * are expected to be already configured by the panel driver via
-	 * omapdss_rfbi_set_size()
-	 */
-	rfbi.timings.hsw = 1;
-	rfbi.timings.hfp = 1;
-	rfbi.timings.hbp = 1;
-	rfbi.timings.vsw = 1;
-	rfbi.timings.vfp = 0;
-	rfbi.timings.vbp = 0;
-
-	rfbi.timings.interlace = false;
-	rfbi.timings.hsync_level = OMAPDSS_SIG_ACTIVE_HIGH;
-	rfbi.timings.vsync_level = OMAPDSS_SIG_ACTIVE_HIGH;
-	rfbi.timings.data_pclk_edge = OMAPDSS_DRIVE_SIG_RISING_EDGE;
-	rfbi.timings.de_level = OMAPDSS_SIG_ACTIVE_HIGH;
-	rfbi.timings.sync_pclk_edge = OMAPDSS_DRIVE_SIG_FALLING_EDGE;
-
-	dss_mgr_set_timings(mgr, &rfbi.timings);
-}
-
-static int rfbi_display_enable(struct omap_dss_device *dssdev)
-{
-	struct omap_dss_device *out = &rfbi.output;
-	int r;
-
-	if (out->manager == NULL) {
-		DSSERR("failed to enable display: no output/manager\n");
-		return -ENODEV;
-	}
-
-	r = rfbi_runtime_get();
-	if (r)
-		return r;
-
-	r = dss_mgr_register_framedone_handler(out->manager,
-			framedone_callback, NULL);
-	if (r) {
-		DSSERR("can't get FRAMEDONE irq\n");
-		goto err1;
-	}
-
-	rfbi_config_lcd_manager(dssdev);
-
-	rfbi_configure_bus(dssdev->phy.rfbi.channel, rfbi.pixel_size,
-			rfbi.data_lines);
-
-	rfbi_set_timings(dssdev->phy.rfbi.channel, &rfbi.intf_timings);
-
-	return 0;
-err1:
-	rfbi_runtime_put();
-	return r;
-}
-
-static void rfbi_display_disable(struct omap_dss_device *dssdev)
-{
-	struct omap_dss_device *out = &rfbi.output;
-
-	dss_mgr_unregister_framedone_handler(out->manager,
-			framedone_callback, NULL);
-
-	rfbi_runtime_put();
-}
-
-static int rfbi_init_display(struct omap_dss_device *dssdev)
-{
-	rfbi.dssdev[dssdev->phy.rfbi.channel] = dssdev;
-	return 0;
-}
-
-static void rfbi_init_output(struct platform_device *pdev)
-{
-	struct omap_dss_device *out = &rfbi.output;
-
-	out->dev = &pdev->dev;
-	out->id = OMAP_DSS_OUTPUT_DBI;
-	out->output_type = OMAP_DISPLAY_TYPE_DBI;
-	out->name = "rfbi.0";
-	out->dispc_channel = OMAP_DSS_CHANNEL_LCD;
-	out->owner = THIS_MODULE;
-
-	omapdss_register_output(out);
-}
-
-static void rfbi_uninit_output(struct platform_device *pdev)
-{
-	struct omap_dss_device *out = &rfbi.output;
-
-	omapdss_unregister_output(out);
-}
-
-/* RFBI HW IP initialisation */
-static int rfbi_bind(struct device *dev, struct device *master, void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	u32 rev;
-	struct resource *rfbi_mem;
-	struct clk *clk;
-	int r;
-
-	rfbi.pdev = pdev;
-
-	sema_init(&rfbi.bus_lock, 1);
-
-	rfbi_mem = platform_get_resource(rfbi.pdev, IORESOURCE_MEM, 0);
-	if (!rfbi_mem) {
-		DSSERR("can't get IORESOURCE_MEM RFBI\n");
-		return -EINVAL;
-	}
-
-	rfbi.base = devm_ioremap(&pdev->dev, rfbi_mem->start,
-				 resource_size(rfbi_mem));
-	if (!rfbi.base) {
-		DSSERR("can't ioremap RFBI\n");
-		return -ENOMEM;
-	}
-
-	clk = clk_get(&pdev->dev, "ick");
-	if (IS_ERR(clk)) {
-		DSSERR("can't get ick\n");
-		return PTR_ERR(clk);
-	}
-
-	rfbi.l4_khz = clk_get_rate(clk) / 1000;
-
-	clk_put(clk);
-
-	pm_runtime_enable(&pdev->dev);
-
-	r = rfbi_runtime_get();
-	if (r)
-		goto err_runtime_get;
-
-	msleep(10);
-
-	rev = rfbi_read_reg(RFBI_REVISION);
-	dev_dbg(&pdev->dev, "OMAP RFBI rev %d.%d\n",
-	       FLD_GET(rev, 7, 4), FLD_GET(rev, 3, 0));
-
-	rfbi_runtime_put();
-
-	dss_debugfs_create_file("rfbi", rfbi_dump_regs);
-
-	rfbi_init_output(pdev);
-
-	return 0;
-
-err_runtime_get:
-	pm_runtime_disable(&pdev->dev);
-	return r;
-}
-
-static void rfbi_unbind(struct device *dev, struct device *master, void *data)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	rfbi_uninit_output(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-
-	return 0;
-}
-
-static const struct component_ops rfbi_component_ops = {
-	.bind	= rfbi_bind,
-	.unbind	= rfbi_unbind,
-};
-
-static int rfbi_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &rfbi_component_ops);
-}
-
-static int rfbi_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &rfbi_component_ops);
-	return 0;
-}
-
-static int rfbi_runtime_suspend(struct device *dev)
-{
-	dispc_runtime_put();
-
-	return 0;
-}
-
-static int rfbi_runtime_resume(struct device *dev)
-{
-	int r;
-
-	r = dispc_runtime_get();
-	if (r < 0)
-		return r;
-
-	return 0;
-}
-
-static const struct dev_pm_ops rfbi_pm_ops = {
-	.runtime_suspend = rfbi_runtime_suspend,
-	.runtime_resume = rfbi_runtime_resume,
-};
-
-static struct platform_driver omap_rfbihw_driver = {
-	.probe		= rfbi_probe,
-	.remove         = rfbi_remove,
-	.driver         = {
-		.name   = "omapdss_rfbi",
-		.pm	= &rfbi_pm_ops,
-		.suppress_bind_attrs = true,
-	},
-};
-
-int __init rfbi_init_platform_driver(void)
-{
-	return platform_driver_register(&omap_rfbihw_driver);
-}
-
-void rfbi_uninit_platform_driver(void)
-{
-	platform_driver_unregister(&omap_rfbihw_driver);
-}
Index: b/include/video/omapfb_dss.h
===================================================================
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -114,11 +114,6 @@ enum omap_dss_trans_key_type {
 	OMAP_DSS_COLOR_KEY_VID_SRC = 1,
 };
 
-enum omap_rfbi_te_mode {
-	OMAP_DSS_RFBI_TE_MODE_1 = 1,
-	OMAP_DSS_RFBI_TE_MODE_2 = 2,
-};
-
 enum omap_dss_signal_level {
 	OMAPDSS_SIG_ACTIVE_LOW,
 	OMAPDSS_SIG_ACTIVE_HIGH,
@@ -189,27 +184,6 @@ enum omap_dss_output_id {
 	OMAP_DSS_OUTPUT_HDMI	= 1 << 6,
 };
 
-/* RFBI */
-
-struct rfbi_timings {
-	int cs_on_time;
-	int cs_off_time;
-	int we_on_time;
-	int we_off_time;
-	int re_on_time;
-	int re_off_time;
-	int we_cycle_time;
-	int re_cycle_time;
-	int cs_pulse_width;
-	int access_time;
-
-	int clk_div;
-
-	u32 tim[5];             /* set by rfbi_convert_timings() */
-
-	int converted;
-};
-
 /* DSI */
 
 enum omap_dss_dsi_trans_mode {
@@ -641,11 +615,6 @@ struct omap_dss_device {
 		} dpi;
 
 		struct {
-			u8 channel;
-			u8 data_lines;
-		} rfbi;
-
-		struct {
 			u8 datapairs;
 		} sdi;
 
@@ -668,7 +637,6 @@ struct omap_dss_device {
 
 	struct {
 		u8 pixel_size;
-		struct rfbi_timings rfbi_timings;
 	} ctrl;
 
 	const char *name;


