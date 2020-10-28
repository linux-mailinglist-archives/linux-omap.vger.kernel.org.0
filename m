Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD0F29DCAF
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387826AbgJ1WbB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:31:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:44404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387821AbgJ1WbB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:31:01 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B23DC2070E;
        Wed, 28 Oct 2020 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924260;
        bh=isBHM4+ny8b7IJ/F7UtgN3v5rFfF9HueJMr217mfu0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fq0VbUh1BGpZL5v8S7rnDvmi6nfUO8wAu3dcVo1ZDwcGxhuW3nKgaeNqWiFglw8fO
         fSO2cxU7z1ZA/U4mBO1xvlrsOKtRVPq7sI6RTRlwHXp/6zQ+/uQY2VdinfFmfJcTUb
         5UU7ztI6SknI1JjBznGb/K/rzLvWq0VC+myUm7Ks=
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
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [RESEND PATCH 09/42] mfd: da9150: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:36 +0100
Message-Id: <20201028223009.369824-9-krzk@kernel.org>
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
Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 drivers/mfd/da9150-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 7f0aa1e8db96..e335cf718442 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -453,7 +453,7 @@ static int da9150_probe(struct i2c_client *client,
 
 	enable_irq_wake(da9150->irq);
 
-	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
+	ret = mfd_add_devices(da9150->dev, PLATFORM_DEVID_NONE, da9150_devs,
 			      ARRAY_SIZE(da9150_devs), NULL,
 			      da9150->irq_base, NULL);
 	if (ret) {
-- 
2.25.1

