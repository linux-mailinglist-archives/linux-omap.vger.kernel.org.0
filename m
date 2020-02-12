Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2BF159E25
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgBLAkb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:31 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40280 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbgBLAkb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:31 -0500
Received: by mail-lf1-f65.google.com with SMTP id c23so269449lfi.7
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTf58YpqwaY9/ZfsDIcfANNUH88w2zXw+jSn3ywd04g=;
        b=dAoEyqxeOjz7A2KEREadDZ6VqZVRMhPyaTDrRZZW+C4fdJOBFYiwcabV31xKiYs8bs
         mD9PWUrXqqx+/EQndIe89NMR2DuQUpfkDvTc41UXohGgHD2WxHOLebxME02T0EJtVuXH
         GMgf9JRWjf8ZUjhbow6HqVrrIh9gPsTKmIhprve6OB9y5PBjyLKHQ+2i6K7h7M3H1RJ1
         qTxRPYWYbmLnsz14c6lefULFIeaC15ufIop7jj1xvILyxanpeE8APDDXMfZirs59IHsI
         hb3tVfXPr39bHqvSOFoBkktCHplzqz796hsWSbczDlQTOMbLKv9zKJHGPSrtAA9JUsk1
         HCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTf58YpqwaY9/ZfsDIcfANNUH88w2zXw+jSn3ywd04g=;
        b=MDPoXovfZ7QU0+/kznygWxrCRWEUki15cqfA1hXE78VC/G2xPa1TCa6PvU/T95cnR5
         3iQmfNLUUvh95CQIF4/rgnY1mlXByUVrSXs+4F5pR5n0GEOeEVKkaI85Xb/DnJ2lkKNX
         dTaUQeejAUq8Wa+DcbI6i+j5jphxRrWHUQ+EqatyeXiQAtBZZIKhtpKG5P9TAMswC+05
         38WM0CnNFRJc2pCaBdfSw2MenuTwo78r02d2fMWPH6zN0WtxvumxOsGXT724hJ2PvoL3
         zlY1ADiOgffD7IlpEQJkc2LphnJ73CqQb7Akvuk4UUttKV+cQ43yLG5hrxV1Se5Tg6T6
         DBdQ==
X-Gm-Message-State: APjAAAUQIudIGbJW52hKAK3X5HaW1bHxvVjNB4j5imK/NC5oDxZW/+hX
        hmmcdCYWbOthp/+E93x579k=
X-Google-Smtp-Source: APXvYqwwX3ih/dlP/s6h+fr2ICYq2BrPHs02sfYs8lBXyp00LNq1eN3hIoCLnQCndwzdhNiBZFV+jA==
X-Received: by 2002:a19:748:: with SMTP id 69mr5238603lfh.40.1581468029430;
        Tue, 11 Feb 2020 16:40:29 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:28 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 13/14] mtd: rawnand: ams-delta: Make the driver custom I/O ready
Date:   Wed, 12 Feb 2020 01:39:28 +0100
Message-Id: <20200212003929.6682-14-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to be merged with "gpio-nand", the driver must support custom
(non-GPIO) I/O accessors.

Allow platforms to omit data GPIO port as well as NWE pin info from
device setup.  For the driver to still work on such platform, custom
I/O accessors as well as a custom probe function which initialises the
driver private structure with those accessors must be added to the
driver.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index a68b7006ed69..9e659984bf59 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -43,6 +43,9 @@ struct ams_delta_nand {
 	bool			data_in;
 	unsigned int		tRP;
 	unsigned int		tWP;
+	u8			(*io_read)(struct ams_delta_nand *this);
+	void			(*io_write)(struct ams_delta_nand *this,
+					    u8 byte);
 };
 
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
@@ -116,18 +119,18 @@ static void ams_delta_write_buf(struct ams_delta_nand *priv, const u8 *buf,
 		ams_delta_dir_output(priv, buf[i++]);
 
 	while (i < len)
-		ams_delta_io_write(priv, buf[i++]);
+		priv->io_write(priv, buf[i++]);
 }
 
 static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
 {
 	int i;
 
-	if (!priv->data_in)
+	if (priv->data_gpiods && !priv->data_in)
 		ams_delta_dir_input(priv);
 
 	for (i = 0; i < len; i++)
-		buf[i] = ams_delta_io_read(priv);
+		buf[i] = priv->io_read(priv);
 }
 
 static void ams_delta_ctrl_cs(struct ams_delta_nand *priv, bool assert)
@@ -289,7 +292,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 	}
 
-	priv->gpiod_nwe = devm_gpiod_get(&pdev->dev, "nwe", GPIOD_OUT_LOW);
+	priv->gpiod_nwe = devm_gpiod_get_optional(&pdev->dev, "nwe",
+						  GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nwe)) {
 		err = PTR_ERR(priv->gpiod_nwe);
 		dev_err(&pdev->dev, "NWE GPIO request failed (%d)\n", err);
@@ -311,13 +315,24 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	/* Request array of data pins, initialize them as input */
-	priv->data_gpiods = devm_gpiod_get_array(&pdev->dev, "data", GPIOD_IN);
+	priv->data_gpiods = devm_gpiod_get_array_optional(&pdev->dev, "data",
+							  GPIOD_IN);
 	if (IS_ERR(priv->data_gpiods)) {
 		err = PTR_ERR(priv->data_gpiods);
 		dev_err(&pdev->dev, "data GPIO request failed: %d\n", err);
 		return err;
 	}
-	priv->data_in = true;
+	if (priv->data_gpiods) {
+		if (!priv->gpiod_nwe) {
+			dev_err(&pdev->dev,
+				"mandatory NWE pin not provided by platform\n");
+			return -ENODEV;
+		}
+
+		priv->io_read = ams_delta_io_read;
+		priv->io_write = ams_delta_io_write;
+		priv->data_in = true;
+	}
 
 	if (pdev->id_entry)
 		probe = (void *) pdev->id_entry->driver_data;
@@ -328,6 +343,11 @@ static int ams_delta_init(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (!priv->io_read || !priv->io_write) {
+		dev_err(&pdev->dev, "incomplete device configuration\n");
+		return -ENODEV;
+	}
+
 	/* Initialize the NAND controller object embedded in ams_delta_nand. */
 	priv->base.ops = &ams_delta_ops;
 	nand_controller_init(&priv->base);
-- 
2.24.1

