Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2337830F624
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbhBDPW1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237230AbhBDPVD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:21:03 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039C1C061794;
        Thu,  4 Feb 2021 07:19:19 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id c6so4637593ede.0;
        Thu, 04 Feb 2021 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oEFEAmIXC+si+Rsqnq5kk8ZiqPQSzbKTorEVbnyUtrQ=;
        b=Hfqb1+4R1GUz/Fq49+JCqN+pc8rKpE2gGtfvjDDmxll15xVwGMrHW+vIvMUrM/X/ZV
         AXGGEWknQyVw6tbyUbuUiekt+svajALlZW/cFplCV9Q9gPEp2myYaVaHYcnMsoUNAbMg
         LMLH+hB3PsItBvcL3c8lar4QvYq+1hyuGBhyGCg1oPOZHP+3t3qT6+aaPA1++GN/1ucO
         QEsCbOAmgNwpxkvLV/w6ZP7VxH5jvEe9T20N2tIu/0QzCyuI042GlnNBpBxz8AolrID/
         t7rdr8OXwjjWmQJyzK9ciOrFMpECdBAkZRPAS+iY+Ui/+Wu15KuaeHiZVjSGp8ytLoEO
         NoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=oEFEAmIXC+si+Rsqnq5kk8ZiqPQSzbKTorEVbnyUtrQ=;
        b=iVjFtsSY7JqVapFIZG82qM7OVFcxpUJh/A6dnkYao0fFRldQSnenS73o5suG8ZprLp
         A52mksG5QtjEOCZcjVM8AnEd91mulRRsRparaxOFs//uLOhj58tK9Eglxl6EkO4zkSMB
         rEnAzVhJnNhktnx6t31lu9gsh/kE2qEvfp5wTf7vluxu0wCkdrDCWwv/tq8BBK7So+mn
         WuqJaLQXCZhwC76M3E9MK79jGpqf6DaL9WCRoYtXDx8x6nJdVIv1UqJzyFBjR4cQeVsy
         AdN/eJUVaHTlOMHeKfxgSVBQX8slkQOFVeIdpBLFiXL5M5829TliifL5VgmdAPZsmFu1
         qjAQ==
X-Gm-Message-State: AOAM530RP4zhBqfIUWzSv8SG73U2HkmFQjbEy6jkjiI0QibfCI91UMqb
        M7ny9D5EKww63Ai0kM6YI14sm6OIWST7/Wbo
X-Google-Smtp-Source: ABdhPJx/K6k06YoQR/hwfftcPlygX5tTSIxSg+9Is6MP8I2y+HmHxOno8nh+obmf63KnWwXXtRF/9A==
X-Received: by 2002:aa7:de10:: with SMTP id h16mr8440874edv.385.1612451957817;
        Thu, 04 Feb 2021 07:19:17 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:17 -0800 (PST)
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
Subject: [PATCH 7/9] mmc: uniphier-sd: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:45 +0100
Message-Id: <20210204151847.91353-8-kernel@esmil.dk>
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
 drivers/mmc/host/uniphier-sd.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index a6cd16771d4e..2413b6750cec 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -81,9 +81,9 @@ static void uniphier_sd_dma_endisable(struct tmio_mmc_host *host, int enable)
 }
 
 /* external DMA engine */
-static void uniphier_sd_external_dma_issue(unsigned long arg)
+static void uniphier_sd_external_dma_issue(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (void *)arg;
+	struct tmio_mmc_host *host = from_tasklet(host, t, dma_issue);
 	struct uniphier_sd_priv *priv = uniphier_sd_priv(host);
 
 	uniphier_sd_dma_endisable(host, 1);
@@ -190,8 +190,7 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	host->chan_rx = chan;
 	host->chan_tx = chan;
 
-	tasklet_init(&host->dma_issue, uniphier_sd_external_dma_issue,
-		     (unsigned long)host);
+	tasklet_setup(&host->dma_issue, uniphier_sd_external_dma_issue);
 }
 
 static void uniphier_sd_external_dma_release(struct tmio_mmc_host *host)
@@ -228,9 +227,9 @@ static const struct tmio_mmc_dma_ops uniphier_sd_external_dma_ops = {
 	.dataend = uniphier_sd_external_dma_dataend,
 };
 
-static void uniphier_sd_internal_dma_issue(unsigned long arg)
+static void uniphier_sd_internal_dma_issue(struct tasklet_struct *t)
 {
-	struct tmio_mmc_host *host = (void *)arg;
+	struct tmio_mmc_host *host = from_tasklet(host, t, dma_issue);
 	unsigned long flags;
 
 	spin_lock_irqsave(&host->lock, flags);
@@ -309,8 +308,7 @@ static void uniphier_sd_internal_dma_request(struct tmio_mmc_host *host,
 
 	host->chan_tx = (void *)0xdeadbeaf;
 
-	tasklet_init(&host->dma_issue, uniphier_sd_internal_dma_issue,
-		     (unsigned long)host);
+	tasklet_setup(&host->dma_issue, uniphier_sd_internal_dma_issue);
 }
 
 static void uniphier_sd_internal_dma_release(struct tmio_mmc_host *host)
-- 
2.30.0

