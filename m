Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CCA30F626
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 16:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbhBDPWa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 10:22:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237198AbhBDPVH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Feb 2021 10:21:07 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A450C0617A7;
        Thu,  4 Feb 2021 07:19:21 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p20so5939071ejb.6;
        Thu, 04 Feb 2021 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQ9by59LAdcIL3bSIKYDI9kndSMy8tWgVlnC5RbynYs=;
        b=opVvsoKs6fxs4JdWQRnvYzqXR7VEn8BznKZMz4nb66HF+eQR7Ad9vgFqOydnNcedv6
         pmDir5TIfbNsZuIWs/PEKHgVU4ZF4737+NaCIJ20t5ET7qMvflHc+OpGISceSbALeGQj
         tw+BTNebvCM1dABqMGvArUy2dJ5n36P2bl4xQlkjh0vCf0GvKvsxxzBHjIeayjLk5WoJ
         HwulDd7chsaqDiAiFZEhooM/vZarpVT1MLXXv7yc4WYleKqonootEzO5VJWsqGPMDc2v
         7W9FAtLOvEW+5JNaomEEHSpxde0rpF9gRtphZUnk1xom16izZCUzxlWXaFmUUsMOmQV/
         cUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wQ9by59LAdcIL3bSIKYDI9kndSMy8tWgVlnC5RbynYs=;
        b=CvIK5z9i1xPm7XgBkeuSiGJQcl8KlFIwBqs/6Dk+TstdPbFR/R+oX+iI7AWEFqPMFe
         m8xznWERN+4rJBHNGp2eLmndv9RFpfz7o+apDV82khOJDwB26vcm4fCExoyWM8f16L/A
         C+oSbrNhOhV+MUTBx/atImL0WQVIIiIA71oOLH4A79Nh/96PhHc1EiFkKVPHTWkCY/xL
         06bSugXIp/vDvf76Fgk7H3XUQeBBm8xNHgRjFKVl6GnV6Ztj7tf9Au1RH+ZpleiP8p4A
         84sEXBg5QhevOwH70UDmnUreBFdmwdM/dyi9TCuEQBG7lJpRPQpS7nYt1bD+8aN5GGxS
         XiUw==
X-Gm-Message-State: AOAM531s1D+M6YJjBZMs54Ap7qTUwFpSxE74/m1fnhmO8DFQeKRTsOZn
        uZJdgd1/Mr1Z+zAguMbmrAN99vo/qEOHWVzc
X-Google-Smtp-Source: ABdhPJwFaB/JGlXT2+79VBkMVtisGqY3FGpuEbSmREXmKZgc98dtldXJpLHT6BqFvJKyHQjdOjcfTg==
X-Received: by 2002:a17:906:2f07:: with SMTP id v7mr8391180eji.343.1612451960424;
        Thu, 04 Feb 2021 07:19:20 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id a6sm2600001ejs.79.2021.02.04.07.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:19:19 -0800 (PST)
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
Subject: [PATCH 9/9] mmc: wbsd: Use new tasklet API
Date:   Thu,  4 Feb 2021 16:18:47 +0100
Message-Id: <20210204151847.91353-10-kernel@esmil.dk>
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
 drivers/mmc/host/wbsd.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
index cd63ea865b77..67ecd342fe5f 100644
--- a/drivers/mmc/host/wbsd.c
+++ b/drivers/mmc/host/wbsd.c
@@ -987,9 +987,9 @@ static inline struct mmc_data *wbsd_get_data(struct wbsd_host *host)
 	return host->mrq->cmd->data;
 }
 
-static void wbsd_tasklet_card(unsigned long param)
+static void wbsd_tasklet_card(struct tasklet_struct *t)
 {
-	struct wbsd_host *host = (struct wbsd_host *)param;
+	struct wbsd_host *host = from_tasklet(host, t, card_tasklet);
 	u8 csr;
 	int delay = -1;
 
@@ -1036,9 +1036,9 @@ static void wbsd_tasklet_card(unsigned long param)
 		mmc_detect_change(host->mmc, msecs_to_jiffies(delay));
 }
 
-static void wbsd_tasklet_fifo(unsigned long param)
+static void wbsd_tasklet_fifo(struct tasklet_struct *t)
 {
-	struct wbsd_host *host = (struct wbsd_host *)param;
+	struct wbsd_host *host = from_tasklet(host, t, fifo_tasklet);
 	struct mmc_data *data;
 
 	spin_lock(&host->lock);
@@ -1067,9 +1067,9 @@ static void wbsd_tasklet_fifo(unsigned long param)
 	spin_unlock(&host->lock);
 }
 
-static void wbsd_tasklet_crc(unsigned long param)
+static void wbsd_tasklet_crc(struct tasklet_struct *t)
 {
-	struct wbsd_host *host = (struct wbsd_host *)param;
+	struct wbsd_host *host = from_tasklet(host, t, crc_tasklet);
 	struct mmc_data *data;
 
 	spin_lock(&host->lock);
@@ -1091,9 +1091,9 @@ static void wbsd_tasklet_crc(unsigned long param)
 	spin_unlock(&host->lock);
 }
 
-static void wbsd_tasklet_timeout(unsigned long param)
+static void wbsd_tasklet_timeout(struct tasklet_struct *t)
 {
-	struct wbsd_host *host = (struct wbsd_host *)param;
+	struct wbsd_host *host = from_tasklet(host, t, timeout_tasklet);
 	struct mmc_data *data;
 
 	spin_lock(&host->lock);
@@ -1115,9 +1115,9 @@ static void wbsd_tasklet_timeout(unsigned long param)
 	spin_unlock(&host->lock);
 }
 
-static void wbsd_tasklet_finish(unsigned long param)
+static void wbsd_tasklet_finish(struct tasklet_struct *t)
 {
-	struct wbsd_host *host = (struct wbsd_host *)param;
+	struct wbsd_host *host = from_tasklet(host, t, finish_tasklet);
 	struct mmc_data *data;
 
 	spin_lock(&host->lock);
@@ -1449,16 +1449,11 @@ static int wbsd_request_irq(struct wbsd_host *host, int irq)
 	/*
 	 * Set up tasklets. Must be done before requesting interrupt.
 	 */
-	tasklet_init(&host->card_tasklet, wbsd_tasklet_card,
-			(unsigned long)host);
-	tasklet_init(&host->fifo_tasklet, wbsd_tasklet_fifo,
-			(unsigned long)host);
-	tasklet_init(&host->crc_tasklet, wbsd_tasklet_crc,
-			(unsigned long)host);
-	tasklet_init(&host->timeout_tasklet, wbsd_tasklet_timeout,
-			(unsigned long)host);
-	tasklet_init(&host->finish_tasklet, wbsd_tasklet_finish,
-			(unsigned long)host);
+	tasklet_setup(&host->card_tasklet, wbsd_tasklet_card);
+	tasklet_setup(&host->fifo_tasklet, wbsd_tasklet_fifo);
+	tasklet_setup(&host->crc_tasklet, wbsd_tasklet_crc);
+	tasklet_setup(&host->timeout_tasklet, wbsd_tasklet_timeout);
+	tasklet_setup(&host->finish_tasklet, wbsd_tasklet_finish);
 
 	/*
 	 * Allocate interrupt.
-- 
2.30.0

