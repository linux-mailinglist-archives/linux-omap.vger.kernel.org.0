Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C7A224AED
	for <lists+linux-omap@lfdr.de>; Sat, 18 Jul 2020 13:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGRLYO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Jul 2020 07:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgGRLYO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 18 Jul 2020 07:24:14 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE53C0619D2;
        Sat, 18 Jul 2020 04:24:13 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id C090ABC07E;
        Sat, 18 Jul 2020 11:24:09 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     peter.ujfalusi@ti.com, jarkko.nikula@bitmer.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] ASoC: omap: Replace HTTP links with HTTPS ones
Date:   Sat, 18 Jul 2020 13:24:03 +0200
Message-Id: <20200718112403.13709-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 sound/soc/ti/omap-hdmi.c    | 2 +-
 sound/soc/ti/omap-twl4030.c | 2 +-
 sound/soc/ti/sdma-pcm.c     | 2 +-
 sound/soc/ti/sdma-pcm.h     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index def2a0ce8886..3328c02f93c7 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -2,7 +2,7 @@
 /*
  * omap-hdmi-audio.c -- OMAP4+ DSS HDMI audio support library
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Jyri Sarha <jsarha@ti.com>
  */
diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 92dbe2c67290..4b408cec7a90 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -2,7 +2,7 @@
 /*
  * omap-twl4030.c  --  SoC audio for TI SoC based boards with twl4030 codec
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com
  * All rights reserved.
  *
  * Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
diff --git a/sound/soc/ti/sdma-pcm.c b/sound/soc/ti/sdma-pcm.c
index 2b0bc234e1b6..9e7691103f05 100644
--- a/sound/soc/ti/sdma-pcm.c
+++ b/sound/soc/ti/sdma-pcm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- *  Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com
+ *  Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
diff --git a/sound/soc/ti/sdma-pcm.h b/sound/soc/ti/sdma-pcm.h
index cb0627c8dd34..c19efb4c043d 100644
--- a/sound/soc/ti/sdma-pcm.h
+++ b/sound/soc/ti/sdma-pcm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- *  Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com
+ *  Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
-- 
2.27.0

