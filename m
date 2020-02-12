Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D1D159E21
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgBLAk1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:27 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37841 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgBLAk1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:27 -0500
Received: by mail-lj1-f193.google.com with SMTP id v17so272166ljg.4
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FJYKPthvZIFedIlxbcTRXaWUixnzV1+Q9RiZEPYQb/8=;
        b=XRUOYw1FAkTzb6oW3oIsS8OrrN+JDesE+lr0Eg5RKKCAGYyMWyjwLUo6beSeizUGhq
         RgMChJuxxMdMfwy1UX/UAcxmGlSym9l2K/JYczKwDWXjgaogauFOflQwjP50YXIlTZiU
         DGMYFyU/qb0xujibkcIeA8KYFLwPt+VWN6Linlz47TdJyttGzGCM4BOVECZKTJ+CMfq+
         /tlh+vLf+ycG/NXi3N+RgYjSn7A/7iUsj9CjpcboM+B6OvgvJCuXjwk6Fpzu2QVyTMLD
         s1pInl6rcIeUO+t+aqUYwJ5g2apQ2wlLtneq1wUdwlH7CIlILApyrZMC+5NKd9QKyApy
         TlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJYKPthvZIFedIlxbcTRXaWUixnzV1+Q9RiZEPYQb/8=;
        b=SJW8KJBFRTe4jH/oImeLgiSAe7i0totLP2gwePxuYT4evp7pJaxn23CD34tf1Xn7oG
         qzfDgz5YGMve6Wdt3f1Nw7dWxvatOmMPpJ1r8wipM5apkqMHjQ1GqFEqngVUR8mlssjP
         k0moNKCpPm4E69LYjRrz9U52PPEPCrtiAQj/fdR+U1LrtGnsEgRXSUh/dPO75v83jWLs
         UxOD8EJ3ZDL58RQusgenTX+GZ7B2k+W99t9yJwoWDyMLKoMvxYMCPRPDdA0no0gcyfIX
         hU3lKb+PhvpHXmWFva8r+2F1txqxzM5rX30ySWoQZu9rkDto/3ctzCzxynw2ZpRPgGgE
         9sZQ==
X-Gm-Message-State: APjAAAWQsqgEmob+iDlDWlx/TlihZ0BeRVL1NoXT4ffB1w7IZK6RHrZl
        XGTta6x30X4AT3UgVhfbE6I9LLvc
X-Google-Smtp-Source: APXvYqw8vOkP/end+TVMFx46dyQcENtXIweuu3keRWt1h/CrKYtPMYiEk3ELj0Qt93lVXrk/HH4MXg==
X-Received: by 2002:a2e:b4e7:: with SMTP id s7mr6220313ljm.58.1581468024270;
        Tue, 11 Feb 2020 16:40:24 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:23 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 09/14] mtd: rawnand: ams-delta: Handle more GPIO pins as optional
Date:   Wed, 12 Feb 2020 01:39:24 +0100
Message-Id: <20200212003929.6682-10-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to make the driver more useful on platforms other than Amstrad
Delta, allow GPIO descriptor pointers of possibly non-critical NWP and
NCE pins to be initialised as NULL.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index c481d73e3dcb..0c88e94e9b71 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -264,14 +264,16 @@ static int ams_delta_init(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	/* Set chip enabled but write protected */
-	priv->gpiod_nwp = devm_gpiod_get(&pdev->dev, "nwp", GPIOD_OUT_HIGH);
+	priv->gpiod_nwp = devm_gpiod_get_optional(&pdev->dev, "nwp",
+						  GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpiod_nwp)) {
 		err = PTR_ERR(priv->gpiod_nwp);
 		dev_err(&pdev->dev, "NWP GPIO request failed (%d)\n", err);
 		return err;
 	}
 
-	priv->gpiod_nce = devm_gpiod_get(&pdev->dev, "nce", GPIOD_OUT_LOW);
+	priv->gpiod_nce = devm_gpiod_get_optional(&pdev->dev, "nce",
+						  GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nce)) {
 		err = PTR_ERR(priv->gpiod_nce);
 		dev_err(&pdev->dev, "NCE GPIO request failed (%d)\n", err);
-- 
2.24.1

