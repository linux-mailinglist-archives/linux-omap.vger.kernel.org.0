Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C884159E23
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgBLAka (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:30 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46659 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgBLAka (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:30 -0500
Received: by mail-lj1-f193.google.com with SMTP id x14so229912ljd.13
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MI8IwajWT07hW6m+MFtO1fPhFSGD1JYkNnYkoSytSKc=;
        b=YWg2OvsH2to00WRX7NfJntW4eAb2zKY0qAiylXWiL6ZildFFKYBp35EXPz7SVkaYoA
         4d3ihI0V/aicsYnxtQcEA9+Q/2PBQRVpsLA1HJujelWKhXa9B+zey+cBX4OAOTpE/BwV
         Aq+lEz5gy6gHgu9PkvuLehTvHC9DiDI7B8WLVXH6VLK0gDSxO7p+fz5FKm89TsMbeoN1
         j0sBFp5YFndDdDKok18ADRMS1np2wnfEczINAR53elAWZUF27AHVPC3Y/vNJ/SgXlACP
         /trmBymxegXrQ+S0OHMbtuBqcaiVFthb7jDomTu72LkpFSHgjw5sNeUVJoVbRgJm/wQ9
         C5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MI8IwajWT07hW6m+MFtO1fPhFSGD1JYkNnYkoSytSKc=;
        b=XN7AHz4S0Nf76t3DuIjxqqWa0gECzCUxfZN1TcWdYkRjNmzjlujyFVLhJBfa99LKnI
         obKjXoI3v9tot/MKhSkSMAz3JdS7qcWnLT0rwuQ+O7ak8L0Sreiy+8X73xSP72K4yHbJ
         /JedqeEp+yoeOemZH1Y31g8qz+hzG+ejxICkw5KF+ukqT2hvIGfRIpDadol7uNaPRsHH
         /NugQgnDXGalXfDys1L2Vc3/Hf29rHJioyamVTQbSMs+g6u7DKnDuLQjEO2+3PJzwhiz
         BNMyKdgPGtyghp04NfaKNVxmziF4KDsvbG7hxRw9XlZf2KZ1Pz66ortGlJgtTTUSau7b
         g3vg==
X-Gm-Message-State: APjAAAWjYLlSNoYKDzlmNPWcMsNgj7aq4sM6cOLptSBplvJ2ClFk5VkJ
        xfUKhCHP3SrxfIs9G9udomU=
X-Google-Smtp-Source: APXvYqyw9cES/t4KUWxceUrhVRQz3XjbJMfNBnzNSkul+f1nDJk/BoJXNmhZyOTTwNPwsD5WWLqySA==
X-Received: by 2002:a2e:6817:: with SMTP id c23mr5818737lja.263.1581468028067;
        Tue, 11 Feb 2020 16:40:28 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:27 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 12/14] mtd: rawnand: ams-delta: Drop useless local variable
Date:   Wed, 12 Feb 2020 01:39:27 +0100
Message-Id: <20200212003929.6682-13-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For consistency with adjacent code patterns used in the driver probe
function, store data GPIO array pointer directly in a respective field
of the driver private structure instead of storing it intermediately
in a local variable for error checking.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 97e3b6629c72..a68b7006ed69 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -230,7 +230,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	struct ams_delta_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
-	struct gpio_descs *data_gpiods;
 	int (*probe)(struct platform_device *pdev, struct ams_delta_nand *priv);
 	int err = 0;
 
@@ -312,13 +311,12 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	/* Request array of data pins, initialize them as input */
-	data_gpiods = devm_gpiod_get_array(&pdev->dev, "data", GPIOD_IN);
-	if (IS_ERR(data_gpiods)) {
-		err = PTR_ERR(data_gpiods);
+	priv->data_gpiods = devm_gpiod_get_array(&pdev->dev, "data", GPIOD_IN);
+	if (IS_ERR(priv->data_gpiods)) {
+		err = PTR_ERR(priv->data_gpiods);
 		dev_err(&pdev->dev, "data GPIO request failed: %d\n", err);
 		return err;
 	}
-	priv->data_gpiods = data_gpiods;
 	priv->data_in = true;
 
 	if (pdev->id_entry)
-- 
2.24.1

