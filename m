Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01CED159E19
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgBLAkP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:15 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35401 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728073AbgBLAkP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:15 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so281837ljb.2
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gTk0y+Tu/ho+sT5UGEydRAB4Ni1w6qYJfckfOq/GHOY=;
        b=PJMbw2yP5vepLZAHEHLf5YyuNbxRFBJ+Egu8gubKnwV1+VNtB+MuREb7ARBAFx6Frp
         HUAMMDoidNWpA4m0S2u23Kt/9EuZewUVDme2/WregRLAMoinIx8uwRgoGN7+KdZ6F8vI
         CNdsbtwlOFIUUdD40lCreH2f1rZ21xLnB4KhWs86tlIvlZqlz0+QKIgbZ82B4iz0E6kU
         lb9xM/rHOv5ISDn+w6tZeHZyTe6FvrMkvl2+VneTH/7F93LTMqt/hfYwJLGvZ73lhhdQ
         Eh/SqZxp2Bfwi143TMuXlnuzLR+o1OlDR+tuSLdA3yi+9t8IOuTer4sTxSl8keMsw1L8
         RSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gTk0y+Tu/ho+sT5UGEydRAB4Ni1w6qYJfckfOq/GHOY=;
        b=B+bhxX3OAMuzBxNyxskvKN5cxKgDSH2FRqaAAhsTvRj2yZ3Vyao9GKkaVOd6kECWYO
         jXUD2GqzZdOHvCY2Ty5/7nxDzrYAe2CRH++08DkRCvkfWGrBG3n2lzlobkqXAkSk2Z58
         Q/IAocdyl22CnElQqBkSqgfI6o7Mis4ec2keq8Gfb4Fe44z6RvSs6RMFepcasbOKvwLL
         6G50eRvpMP2w9b1CaxEbrjE9kLhkocxFWh3w7BRkqOnwTWBrMAZgLKlcmN3d1dYM0Me2
         K6H8/sGoPlm1L7mSjLm6GcIKWoMfe2xji0LLkFEJcc2qtasD6NeHTka5Ca/b4bSc/09s
         pJDw==
X-Gm-Message-State: APjAAAV1ZYM8Cimp4kEbYipqt0eeRh/3n2ZP7ghDrrPhjNUMkl5t0PeG
        qXhjPtlwJploWeY/LfZWiv4=
X-Google-Smtp-Source: APXvYqxOlD/PlMVdsxwg/tO3eQ2ldw5JbL3TvOKRqRg5kuCKvfoFE1wmf6aj9BVWpeyX9mnmVZ1tfQ==
X-Received: by 2002:a2e:880a:: with SMTP id x10mr6200191ljh.211.1581468013645;
        Tue, 11 Feb 2020 16:40:13 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:13 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 01/14 v2] mtd: rawnand: ams-delta: Write protect device during probe
Date:   Wed, 12 Feb 2020 01:39:16 +0100
Message-Id: <20200212003929.6682-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Initialise NWP GPIO pin as asserted to protect the device from hazard
during setup of other GPIO pins.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
v2: release write protection before calling nand_scan()

 drivers/mtd/nand/raw/ams-delta.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 8312182088c1..2501cfe00f43 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -251,8 +251,8 @@ static int ams_delta_init(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	/* Set chip enabled, but  */
-	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_HIGH);
+	/* Set chip enabled but write protected */
+	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nwp)) {
 		err = PTR_ERR(priv->gpiod_nwp);
 		dev_err(&pdev->dev, "NWP GPIO request failed (%d)\n", err);
@@ -309,6 +309,17 @@ static int ams_delta_init(struct platform_device *pdev)
 	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
+	/*
+	 * FIXME: We should release write protection only after nand_scan() to
+	 * be on the safe side but we can't do that until we have a generic way
+	 * to assert/deassert WP from the core.  Even if the core shouldn't
+	 * write things in the nand_scan() path, it should have control on this
+	 * pin just in case we ever need to disable write protection during
+	 * chip detection/initialization.
+	 */
+	/* Release write protection */
+	gpiod_set_value(priv->gpiod_nwp, 1);
+
 	/* Scan to find existence of the device */
 	err = nand_scan(this, 1);
 	if (err)
@@ -336,6 +347,9 @@ static int ams_delta_cleanup(struct platform_device *pdev)
 	struct ams_delta_nand *priv = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 
+	/* Apply write protection */
+	gpiod_set_value(priv->gpiod_nwp, 0);
+
 	/* Unregister device */
 	nand_release(mtd_to_nand(mtd));
 
-- 
2.24.1

