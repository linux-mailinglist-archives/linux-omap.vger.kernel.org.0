Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E9727345F
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgIUUyh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:54:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:32768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbgIUUyd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:54:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E17423A59;
        Mon, 21 Sep 2020 20:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721673;
        bh=F6cOtWeGn0mxayABknOKeGdwp5N8qh+emK6KTJA1ZSE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ydaBtJcuMZ/qOVb+Af7D+CiD0bOmctQ01XRCj4XsOvNoythCcJ9Pu2S+e300mDVqP
         F9rzp9au851T2DC3sbvtRn/QeHy3dHfJ9a0mqWMx1DNAxrwj4ZhdSXWYHMR6FsZCjk
         v2VfL7f2DWubt8PdtRPwTF3a27xwbrS14gAAIR3k=
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
Subject: [PATCH 41/42] mfd: wm8400: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:15 +0200
Message-Id: <20200921205016.20461-41-krzk@kernel.org>
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
 drivers/mfd/wm8400-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
index 0fe32a05421b..9efca6f3fbb2 100644
--- a/drivers/mfd/wm8400-core.c
+++ b/drivers/mfd/wm8400-core.c
@@ -38,7 +38,8 @@ static int wm8400_register_codec(struct wm8400 *wm8400)
 		.pdata_size = sizeof(*wm8400),
 	};
 
-	return devm_mfd_add_devices(wm8400->dev, -1, &cell, 1, NULL, 0, NULL);
+	return devm_mfd_add_devices(wm8400->dev, PLATFORM_DEVID_NONE, &cell, 1,
+				    NULL, 0, NULL);
 }
 
 /*
-- 
2.17.1

