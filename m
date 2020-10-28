Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF68E29D85F
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387947AbgJ1Wbo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:31:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387942AbgJ1Wbn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:31:43 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40E082070E;
        Wed, 28 Oct 2020 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924302;
        bh=PMT6Yq++u6+k16t+jLOuqtCaw1TT08QCkW6o0KDU9nA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=wXLZmhzepsq46MsnhnKI34ii7It/DZXNfVpOHa5HEU2eyr6B55aWrGkSZx3M9ZNhA
         yRS/vEmsPvblm/3j6qklA+9rZ+Y2oabmAgXAHO+brk7YAqfqHX0SJnFHzYC2RJAo8D
         EPkrf5boNeNri9/casGQXIBr8VKnOCLKLEeDOSVA=
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
Subject: [RESEND PATCH 17/42] mfd: max77693: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:44 +0100
Message-Id: <20201028223009.369824-17-krzk@kernel.org>
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
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/mfd/max77693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 596ed85cab3b..02fbdf0a66c3 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -274,7 +274,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
 
 	pm_runtime_set_active(max77693->dev);
 
-	ret = mfd_add_devices(max77693->dev, -1, max77693_devs,
+	ret = mfd_add_devices(max77693->dev, PLATFORM_DEVID_NONE, max77693_devs,
 			      ARRAY_SIZE(max77693_devs), NULL, 0, NULL);
 	if (ret < 0)
 		goto err_mfd;
-- 
2.25.1

