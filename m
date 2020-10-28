Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58EB29DCBB
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbgJ2Abx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 20:31:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387875AbgJ1Wb2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:31:28 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49D4A2076C;
        Wed, 28 Oct 2020 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924287;
        bh=AZNzKh2ohpoO/6BLcNnlJmCZPDIsCIceLmT2SxtgDgQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jwYZkbV3CnGTLtMW6jM8EzQr6Qj8mvQSGelKKJOQ6/JJLjyHPLFvksVH5Q/c47hI5
         e23/aMDvQ62OqwUXyx2dh0RX+dSrT1U6F2lrNLs51l1EXM5DMu2JO1E0fmXIut+AzP
         sX4OcswHO/H7yWr6qdq6KhZheEU+6oOLbKLuQ2ME=
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
Subject: [RESEND PATCH 14/42] mfd: lp3943: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:41 +0100
Message-Id: <20201028223009.369824-14-krzk@kernel.org>
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
 drivers/mfd/lp3943.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/lp3943.c b/drivers/mfd/lp3943.c
index 13cb89be3d66..3e5d7336f59b 100644
--- a/drivers/mfd/lp3943.c
+++ b/drivers/mfd/lp3943.c
@@ -120,9 +120,8 @@ static int lp3943_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	lp3943->mux_cfg = lp3943_mux_cfg;
 	i2c_set_clientdata(cl, lp3943);
 
-	return devm_mfd_add_devices(dev, -1, lp3943_devs,
-				    ARRAY_SIZE(lp3943_devs),
-				    NULL, 0, NULL);
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, lp3943_devs,
+				    ARRAY_SIZE(lp3943_devs), NULL, 0, NULL);
 }
 
 static const struct i2c_device_id lp3943_ids[] = {
-- 
2.25.1

