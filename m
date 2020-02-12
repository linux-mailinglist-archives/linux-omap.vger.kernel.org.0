Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C47B159E1E
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgBLAkY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:24 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43386 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgBLAkX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:23 -0500
Received: by mail-lf1-f65.google.com with SMTP id 9so257836lfq.10
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcbXhKxbLXfiAbDzRSziEIn2ltFWOw8uQS3zIVYn+gg=;
        b=Q5Sp8zgS0ILV/I/WeleMtccq3UCbAnE537Le10n/7S71lcR/QnIXWrrz/FhpSuiDpe
         TyPGuMA4oBihm/7pjxNXPlwtK+y54OsOaDxOP5lBDX4BVVp/wx7q2V7fICW0cIYM9WgN
         Cl7REP3zzC9ukuTA4cXHD+qzOhsr5eMr3X2VUpjvYuBjZi9WVH3RnRA7R/X50C2eEF4g
         1/y7nw8uDN26gwQ/a9I8fjMym4EYDBjzEsXozT6SASYY6fYbrbOQ8FeJevr+yJ0B8Gzk
         OopPjxQSSW+BPfugOOXK+0Tj6rWU93XFFLrj7beOTvxv/i5Wf1CfwlubNDx7QJsic1de
         dXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcbXhKxbLXfiAbDzRSziEIn2ltFWOw8uQS3zIVYn+gg=;
        b=jvVqXD3FZABkV9OuqC/9VHYg6XNXhfKp05AGbZycsUM70zdjp/mvS6mqGhmrifGKz2
         4cL78q+90j4c50bqJa+n00WajvNtcc2Vl1W1xn2VFpv/MILvzEsJXL7lZLkULNzfK41P
         fyd4rKW9AUd3V8BRxh69IoRsc+TVibQ9dov6lwomVs7KLB+2/jxjFtpjK08XTPGSwbjN
         8jjUsMMrIC7waA5mKfhkltSAGDKSlZMGQyRgvg0Zk/JqUqbc/snOINBZlLRi2vzUaxvt
         +w2z9qReqnd7cxBLda4OCNUQIHSWHmMmYxMrsbgEy7iSktT6r4x22cihCxKMg+CEtBno
         8NLA==
X-Gm-Message-State: APjAAAX2x6HE9Vc3imfYEjJ/n4mbfwFVLfqEFOcOTLMqe96Enyfm3IpM
        2LAo/XQ1l34uNPbgXf6IPEc=
X-Google-Smtp-Source: APXvYqwodYVhDD1l/Apthg8LfXfLDg0cdZ2iqObzjbj+/p0QSGtj25rfHAqLSEKqv2DwJdUxnOeDww==
X-Received: by 2002:ac2:44d5:: with SMTP id d21mr5090125lfm.188.1581468020153;
        Tue, 11 Feb 2020 16:40:20 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:19 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 06/14] mtd: rawnand: ams-delta: Push inversion handling to gpiolib
Date:   Wed, 12 Feb 2020 01:39:21 +0100
Message-Id: <20200212003929.6682-7-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let platforms take care of declaring correct GPIO pin polarity so we
can just ask a GPIO line to be asserted or deasserted and gpiolib deals
with the rest depending on how the platform is configured.

Inspired by similar changes to regulator drivers by Linus Walleij
<linus.walleij@linaro.org>, thanks!

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 12 ++++++++----
 drivers/mtd/nand/raw/ams-delta.c      | 22 +++++++++++-----------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index f4d2ef97099e..8d32894ecd2e 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -341,10 +341,14 @@ static struct gpiod_lookup_table ams_delta_nand_gpio_table = {
 	.table = {
 		GPIO_LOOKUP(OMAP_GPIO_LABEL, AMS_DELTA_GPIO_PIN_NAND_RB, "rdy",
 			    0),
-		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NCE, "nce", 0),
-		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NRE, "nre", 0),
-		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NWP, "nwp", 0),
-		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NWE, "nwe", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NCE, "nce",
+			    GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NRE, "nre",
+			    GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NWP, "nwp",
+			    GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_NWE, "nwe",
+			    GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_ALE, "ale", 0),
 		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_NAND_CLE, "cle", 0),
 		GPIO_LOOKUP_IDX(OMAP_MPUIO_LABEL, 0, "data", 0, 0),
diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fb96f6a3b0b3..c7aeb940accd 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -44,9 +44,9 @@ struct ams_delta_nand {
 
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
 {
-	gpiod_set_value(priv->gpiod_nwe, 0);
-	ndelay(40);
 	gpiod_set_value(priv->gpiod_nwe, 1);
+	ndelay(40);
+	gpiod_set_value(priv->gpiod_nwe, 0);
 }
 
 static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
@@ -81,13 +81,13 @@ static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	DECLARE_BITMAP(values, BITS_PER_TYPE(res)) = { 0, };
 
-	gpiod_set_value(priv->gpiod_nre, 0);
+	gpiod_set_value(priv->gpiod_nre, 1);
 	ndelay(40);
 
 	gpiod_get_raw_array_value(data_gpiods->ndescs, data_gpiods->desc,
 				  data_gpiods->info, values);
 
-	gpiod_set_value(priv->gpiod_nre, 1);
+	gpiod_set_value(priv->gpiod_nre, 0);
 
 	res = values[0];
 	return res;
@@ -129,7 +129,7 @@ static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
 
 static void ams_delta_ctrl_cs(struct ams_delta_nand *priv, bool assert)
 {
-	gpiod_set_value(priv->gpiod_nce, assert ? 0 : 1);
+	gpiod_set_value(priv->gpiod_nce, assert);
 }
 
 static int ams_delta_exec_op(struct nand_chip *this,
@@ -237,28 +237,28 @@ static int ams_delta_init(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	/* Set chip enabled but write protected */
-	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_LOW);
+	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpiod_nwp)) {
 		err = PTR_ERR(priv->gpiod_nwp);
 		dev_err(&pdev->dev, "NWP GPIO request failed (%d)\n", err);
 		return err;
 	}
 
-	priv->gpiod_nce = devm_gpiod_get(&pdev->dev, "nce", GPIOD_OUT_HIGH);
+	priv->gpiod_nce = devm_gpiod_get(&pdev->dev, "nce", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nce)) {
 		err = PTR_ERR(priv->gpiod_nce);
 		dev_err(&pdev->dev, "NCE GPIO request failed (%d)\n", err);
 		return err;
 	}
 
-	priv->gpiod_nre = devm_gpiod_get(&pdev->dev, "nre", GPIOD_OUT_HIGH);
+	priv->gpiod_nre = devm_gpiod_get(&pdev->dev, "nre", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nre)) {
 		err = PTR_ERR(priv->gpiod_nre);
 		dev_err(&pdev->dev, "NRE GPIO request failed (%d)\n", err);
 		return err;
 	}
 
-	priv->gpiod_nwe = devm_gpiod_get(&pdev->dev, "nwe", GPIOD_OUT_HIGH);
+	priv->gpiod_nwe = devm_gpiod_get(&pdev->dev, "nwe", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nwe)) {
 		err = PTR_ERR(priv->gpiod_nwe);
 		dev_err(&pdev->dev, "NWE GPIO request failed (%d)\n", err);
@@ -303,7 +303,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	 * chip detection/initialization.
 	 */
 	/* Release write protection */
-	gpiod_set_value(priv->gpiod_nwp, 1);
+	gpiod_set_value(priv->gpiod_nwp, 0);
 
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
@@ -332,7 +332,7 @@ static int ams_delta_cleanup(struct platform_device *pdev)
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 
 	/* Apply write protection */
-	gpiod_set_value(priv->gpiod_nwp, 0);
+	gpiod_set_value(priv->gpiod_nwp, 1);
 
 	/* Unregister device */
 	nand_release(mtd_to_nand(mtd));
-- 
2.24.1

