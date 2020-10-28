Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891CD29DC5E
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388388AbgJ1Wdd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:33:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:47482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388384AbgJ1Wdc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:32 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43DE620731;
        Wed, 28 Oct 2020 22:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924411;
        bh=eWfEGkJKN4hzXyneYZiCS7LVfHIUvAWEodm+KnOsw1s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eziRXj/TqKh0LCKY1nYiZuc40F5ZBBFCBXPWHn3BalNDmKLPxrFvlOkifQKSVdctN
         wZ0wSvafWdHebDr7LJWQwtghun+MGwEwObjVDwaUeggWxT2KxmeOcvRTT+8H+R8G3W
         MT0PyZgNvdttSo7FdaR6XoumWnL3j6p4xhEnWp9w=
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
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [RESEND PATCH 37/42] mfd: tps80031: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:04 +0100
Message-Id: <20201028223009.369824-37-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028223009.369824-1-krzk@kernel.org>
References: <20201028223009.369824-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/tps80031.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps80031.c b/drivers/mfd/tps80031.c
index 907452b86e32..c8ea8fbae281 100644
--- a/drivers/mfd/tps80031.c
+++ b/drivers/mfd/tps80031.c
@@ -488,7 +488,7 @@ static int tps80031_probe(struct i2c_client *client,
 
 	tps80031_init_ext_control(tps80031, pdata);
 
-	ret = mfd_add_devices(tps80031->dev, -1,
+	ret = mfd_add_devices(tps80031->dev, PLATFORM_DEVID_NONE,
 			tps80031_cell, ARRAY_SIZE(tps80031_cell),
 			NULL, 0,
 			regmap_irq_get_domain(tps80031->irq_data));
-- 
2.25.1

