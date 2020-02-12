Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12C3B159E20
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgBLAkZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:25 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36778 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgBLAkZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so278576ljg.3
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=caDIr3rP6oosu1+kaTV/U9Y5uOqTsEJ+evHiz9URQq4=;
        b=djVfoEvVfIrazuwClaIyoiPfUM8to2+bMx3D9Wv4DKZg4M3KNwM5B7lVFVi/ThZjuN
         D/IOBS50MpHYmJZjx/r7OSCQXr+nqh5t1B3y37b8YsbDSSJF8A9rDU5d/WrrgLcwJwdt
         rWCZkN2cP8KFl+zCY9Dv7sPv+L0id5nyDY/85pQKC4wwZZ/5gFWBmHZQAFEhFYmu8wpi
         Jtl+3z6aCj5u9e5sAJuAonl4JDHDlgevY7zh6mi0cu884C5Y7c7Ru1Aj8ctqPWwUdtHe
         ikstkQoiBMtzpL2T9jIZM75yaRcjhW5PnoJSYbEsJ8sdxcCk1jCCfszElMW+knCwvaWn
         wB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=caDIr3rP6oosu1+kaTV/U9Y5uOqTsEJ+evHiz9URQq4=;
        b=ggPilPfX3NbezDRTgsU3ysuaMhiRT/dTR/ob1Ps0Tn0AWpDPiVcWR6r375nUc1FQx5
         QWDMNzxwSWrtLxdHFkcUfP5Tdt0F/2DbrKyk/s0fXooGTn8hu71sd57/DP4lTUnehR+l
         xkZ2/ovh31lYH8Tj3/pDOd/VH14N2Tb3JfqhvfNbreJAy2CJ9A1GilRI8DiCHLaVqTj8
         2bMw9gadAR2SJU1Gx2QCHgzKUPswa5m7rEDXe8HtFxGpDy7X3BPmENw/BtpViQgemtKb
         ph0wd5g4K01vqwCs8PwsehDkUKi2eXlKPKmSDhuvo9QxJWqSbxZq2IU6cs4WGXhvYdeM
         eldw==
X-Gm-Message-State: APjAAAUmDLLdyKERa0aZvSr8D78X2gm/VJ9TMddpwHkGdl1vcqapEyRl
        hdVZTwU6mUPzUOTOaAJZieA=
X-Google-Smtp-Source: APXvYqy6JFvRC9NklpSqlYRY6lVX8UkHC9NOlwj40Nhm8KFKwboQJSVotTIA/W7iSbWh/4xCAN+43g==
X-Received: by 2002:a2e:9596:: with SMTP id w22mr5753039ljh.21.1581468022989;
        Tue, 11 Feb 2020 16:40:22 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:22 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 08/14] mtd: rawnand: ams-delta: Make read pulses optional
Date:   Wed, 12 Feb 2020 01:39:23 +0100
Message-Id: <20200212003929.6682-9-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Allow platforms to omit NRE pin from device configuration by requesting
that pin as optional.  In that case, also don't apply read pulse width
from chip SDR timings.  There should be no need for further code
adjustments as gpiolib can handle NULL GPIO descriptor pointers.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 11689218d23a..c481d73e3dcb 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -202,8 +202,10 @@ static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
 	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
 		return 0;
 
-	priv->tRP = DIV_ROUND_UP(sdr->tRP_min, 1000);
-	dev_dbg(dev, "using %u ns read pulse width\n", priv->tRP);
+	if (priv->gpiod_nre) {
+		priv->tRP = DIV_ROUND_UP(sdr->tRP_min, 1000);
+		dev_dbg(dev, "using %u ns read pulse width\n", priv->tRP);
+	}
 
 	priv->tWP = DIV_ROUND_UP(sdr->tWP_min, 1000);
 	dev_dbg(dev, "using %u ns write pulse width\n", priv->tWP);
@@ -276,7 +278,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 	}
 
-	priv->gpiod_nre = devm_gpiod_get(&pdev->dev, "nre", GPIOD_OUT_LOW);
+	priv->gpiod_nre = devm_gpiod_get_optional(&pdev->dev, "nre",
+						  GPIOD_OUT_LOW);
 	if (IS_ERR(priv->gpiod_nre)) {
 		err = PTR_ERR(priv->gpiod_nre);
 		dev_err(&pdev->dev, "NRE GPIO request failed (%d)\n", err);
-- 
2.24.1

