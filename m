Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA3230F620
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237275AbhBDPWR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbhBDPVA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:21:00 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5393C06178C;
        Thu,  4 Feb 2021 07:19:15 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id c6so4637393ede.0;
        Thu, 04 Feb 2021 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LhxDawnboy/GOphLJPpwmu1nF8PhAWga8yWTDRyj8XA=;
        b=HHM0tu+en/eiYDTTVtlaIPgY73OWrtR8jXN3A7v8VdCMFu1WCO03MK1uu37ltdUyrA
         baMzWM5FUOYzCHmVv1foThsw0iwyok9Di2vg8TVPZCSoYgIZ/OOfY4v/goTOE4Uwyowt
         1/H6erNXJWEtOO51eDB/c5tk8X71qffK22OUmXK6QpB06rQZaRPWikOqL7+GfFrb2kTw
         0DJAtUb2WywdQwU6wsik3h4AGOQsCgMXUGK0a/W9woFfU3o81A7ZA6pFdC0B4vo6yRnR
         rSd5+O35CW3dhOpbtztWWKHdc7kPaqFC1MgvlOrF6Yut0roaByCX79cLY6SPZ/Z63tsr
         26mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LhxDawnboy/GOphLJPpwmu1nF8PhAWga8yWTDRyj8XA=;
        b=V5Cpn8w4a2yL+WYvsqhwQ4GQe+uQk5ovqTr7qpB9I8rKEcL6l3y8wjUYDlfyg+6rjz
         46t0ZmZEwmurc1OFohLmXZWW+dEYdm2ax3rC8HSLzEnsSlupBalkij09ZF15Nd7pxhq+
         LLsmu9O0eUA++kxpDGS4j/1I0j3ZmUyKS30VXYZL+EKwPhSweuB01CpCCWz8YoXSMmWA
         hcKbwu/i6KUSDBvJ05IhxvWJDzeJ8dyIXAWNOamvZ9ZLH1CR22zvFypd8IaQsXBarCHW
         cqxygr/06OTObHkmICDSVY6xN/bh1bZRY1LbcmdXG8aA+GnD+w1HMG7Mva3Qe1yDldhY
         F3+w==
X-Gm-Message-State: AOAM533aVo3ivKn/cP+izMUthOoQM7zpKskwTuL0ZNydudhYRQzQBL/L
        1xnaKDhi0haa6qCyCRfCBSUjCjwZc74J81BJ
X-Google-Smtp-Source: ABdhPJwKity2jdws4yrIx+7J7mgQzjqxjDjle4kCJ+oulDjfv3k5nDcDMydPchdLcweT589z7HQq1Q==
X-Received: by 2002:a05:6402:1484:: with SMTP id e4mr1079509edv.104.1612451954704;
        Thu, 04 Feb 2021 07:19:14 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:14 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Ben Dooks <ben-linux@fluff.org>, Alex Dubov <oakad@yahoo.com>,
        Bruce Chang <brucechang@via.com.tw>,
        Harald Welte <HaraldWelte@viatech.com>,
        Pierre Ossman <pierre@ossman.eu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] mmc: s3cmci: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:43 +0100
Message-Id: <20210204151847.91353-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204151847.91353-1-kernel@esmil.dk>
References: <20210204151847.91353-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This converts the driver to use the new tasklet API introduced in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/mmc/host/s3cmci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/s3cmci.c b/drivers/mmc/host/s3cmci.c
index a33a7823c265..0ca6f6d30b75 100644
--- a/drivers/mmc/host/s3cmci.c
+++ b/drivers/mmc/host/s3cmci.c
@@ -540,9 +540,9 @@ static void do_pio_write(struct s3cmci_host *host)
 	enable_imask(host, S3C2410_SDIIMSK_TXFIFOHALF);
 }
 
-static void pio_tasklet(unsigned long data)
+static void pio_tasklet(struct tasklet_struct *t)
 {
-	struct s3cmci_host *host = (struct s3cmci_host *) data;
+	struct s3cmci_host *host = from_tasklet(host, t, pio_tasklet);
 
 	s3cmci_disable_irq(host, true);
 
@@ -1532,7 +1532,7 @@ static int s3cmci_probe(struct platform_device *pdev)
 	host->pdata = pdev->dev.platform_data;
 
 	spin_lock_init(&host->complete_lock);
-	tasklet_init(&host->pio_tasklet, pio_tasklet, (unsigned long) host);
+	tasklet_setup(&host->pio_tasklet, pio_tasklet);
 
 	if (host->is2440) {
 		host->sdiimsk	= S3C2440_SDIIMSK;
-- 
2.30.0

