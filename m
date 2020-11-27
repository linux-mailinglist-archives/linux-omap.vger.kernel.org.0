Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F672C6DAA
	for <lists+linux-omap@lfdr.de>; Sat, 28 Nov 2020 00:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgK0X26 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 18:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731430AbgK0UFN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Nov 2020 15:05:13 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C981C0613D4
        for <linux-omap@vger.kernel.org>; Fri, 27 Nov 2020 12:05:12 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 13F9A1F465A8
Received: by jupiter.universe (Postfix, from userid 1000)
        id C796D4800D9; Fri, 27 Nov 2020 21:05:07 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-omap@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
Date:   Fri, 27 Nov 2020 21:04:29 +0100
Message-Id: <20201127200429.129868-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
afterwards it calls acx565akm_detect(), which sets the GPIO value to
HIGH. If the bootloader initialized the GPIO to HIGH before the probe
routine was called, there is only a very short time period of a few
instructions where the reset signal is LOW. Exact time depends on
compiler optimizations, kernel configuration and alignment of the stars,
but I expect it to be always way less than 10us. There are no public
datasheets for the panel, but acx565akm_power_on() has a comment with
timings and reset period should be at least 10us. So this potentially
brings the panel into a half-reset state.

The result is, that panel may not work after boot and can get into a
working state by re-enabling it (e.g. by blanking + unblanking), since
that does a clean reset cycle. This bug has recently been hit by Ivaylo
Dimitrov, but there are some older reports which are probably the same
bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
experienced it in 2017 describing the blank/unblank procedure as
possible workaround.

Note, that the bug really goes back in time. It has originally been
introduced in the predecessor of the omapfb driver in 3c45d05be382
("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
That driver eventually got replaced by a newer one, which had the bug
from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
driver") and still exists in fbdev world. That driver has later been
copied to omapdrm and then was used as a basis for this driver. Last
but not least the omapdrm specific driver has been removed in
45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").

Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Reported-by: Tony Lindgren <tony@atomide.com>
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index e95fdfb16b6c..ba0b3ead150f 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
 	lcd->spi = spi;
 	mutex_init(&lcd->mutex);
 
-	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(lcd->reset_gpio)) {
 		dev_err(&spi->dev, "failed to get reset GPIO\n");
 		return PTR_ERR(lcd->reset_gpio);
-- 
2.29.2

