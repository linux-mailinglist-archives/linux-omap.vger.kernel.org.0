Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6782429D864
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387986AbgJ1Wby (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:31:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387981AbgJ1Wbx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:31:53 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8926E20714;
        Wed, 28 Oct 2020 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924313;
        bh=6CTWCGbyQAtx0G1AXAZ/IGJa/HD7vtf24bL9BqFzf5M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FQI65c83B09nSK9lqYtLO1jvTzaMqwkddOL3+HCtS6EWQxWU0NW7LI3wQjsYVn4aQ
         tRpMzjyUEDjWBwqgtuz0LgjqWKX0zzJxihHLOKL1BrNspRXDUviT25PPMNFiZshDkP
         kFnJT1sV0jL3yhDzPOCcHQGQTlTsjeltTbF6G1D8=
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
Subject: [RESEND PATCH 19/42] mfd: max8907: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:46 +0100
Message-Id: <20201028223009.369824-19-krzk@kernel.org>
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
 drivers/mfd/max8907.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index d44baafd9d14..5119d4092d3d 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -257,7 +257,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c,
 
 	enable_irq(max8907->i2c_gen->irq);
 
-	ret = mfd_add_devices(max8907->dev, -1, max8907_cells,
+	ret = mfd_add_devices(max8907->dev, PLATFORM_DEVID_NONE, max8907_cells,
 			      ARRAY_SIZE(max8907_cells), NULL, 0, NULL);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "failed to add MFD devices %d\n", ret);
-- 
2.25.1

