Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD345273462
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgIUUyk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:32884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727805AbgIUUyk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:54:40 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D69D423A51;
        Mon, 21 Sep 2020 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721679;
        bh=+j1NMQRXfo7WK2NT2Ni/FTUg+lHn9ZbPIBnsqtPzjOw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gRJdut3DApPeUrKiEj68rx3t6kxSWjs0SuxElp0OIzIdcYqCpKysvAy9sf9T4Hh+1
         PywkBXNNVMFMe0QfYyNunt9yjEj00M3L4qEPg2J/ONVwP7z1e7aYwNQg9MdZZ+Zf+P
         ghm7Sk5YGXhv4A7ZDI4EYl5awplpf4JmRIiNfiFE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 42/42] mfd: wm8994: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:16 +0200
Message-Id: <20200921205016.20461-42-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921205016.20461-1-krzk@kernel.org>
References: <20200921205016.20461-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/wm8994-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 3b2b93c5bbcb..5a8d4cc00cc1 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -578,7 +578,7 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 
 	wm8994_irq_init(wm8994);
 
-	ret = mfd_add_devices(wm8994->dev, -1,
+	ret = mfd_add_devices(wm8994->dev, PLATFORM_DEVID_NONE,
 			      wm8994_devs, ARRAY_SIZE(wm8994_devs),
 			      NULL, 0, NULL);
 	if (ret != 0) {
-- 
2.17.1

