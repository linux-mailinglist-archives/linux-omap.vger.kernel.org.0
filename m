Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDEA25952
	for <lists+linux-omap@lfdr.de>; Tue, 21 May 2019 22:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfEUUnK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 May 2019 16:43:10 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51967 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfEUUnK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 May 2019 16:43:10 -0400
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 456A9240004;
        Tue, 21 May 2019 20:43:06 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] mfd: menelaus: Remove superfluous error message
Date:   Tue, 21 May 2019 22:43:04 +0200
Message-Id: <20190521204304.21295-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The RTC core already has error messages in case of failure, there is no
need to have another message in the driver.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/mfd/menelaus.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index d28ebe7ecd21..91c568ef5857 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -1138,8 +1138,6 @@ static inline void menelaus_rtc_init(struct menelaus_chip *m)
 			menelaus_remove_irq_work(MENELAUS_RTCALM_IRQ);
 			device_init_wakeup(&m->client->dev, 0);
 		}
-		dev_err(&m->client->dev, "can't register RTC: %d\n",
-				(int) PTR_ERR(m->rtc));
 		the_menelaus->rtc = NULL;
 	}
 }
-- 
2.21.0

