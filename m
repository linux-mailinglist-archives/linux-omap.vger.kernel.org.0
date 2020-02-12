Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1363B159E1C
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgBLAkU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:20 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38328 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgBLAkU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id w1so267927ljh.5
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKDP1hyiuSxJLJzh6PxtETHxlHhTQ3RNvBVBm9ROckc=;
        b=TWER0fxRPSTs5r+v24XbrG3jeVC7fikohs6urpewgZ329P+lFVUPmGspl4I5MUzM76
         XyA9DhMCVkyg6gxFfiOuRN8tviL6kEP9U4TpAoAZ79CQOuDU4tyOYwkPMHjhh7GAgkHy
         xS2AH5iaJxI+IR0DStViI6ZqLf6n7fwHMes7KfTavO20xrces1xeWPi1ajjwNUdREz8/
         PcqJevItqEi8/PB+RPGD2Qf6sQOwATSUy8J+hcoy/OyVF5bgZef6ZTQ6egA0T8Avn4/u
         27aArAd4t87sKe+Dd6a2ApCQNEV2agN2JeOk+TXpdTsu8g75dHO82T+suDHD8lgTH1tA
         I68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKDP1hyiuSxJLJzh6PxtETHxlHhTQ3RNvBVBm9ROckc=;
        b=s9oruJWV/aCgJ/XhwyWzLkN3YEkbrdnX3IBPb3sjCLCtad/esQ3yszsamIn/yxgFxT
         boOiMzuDb7OsnMA9FQRu9m8CL3bAyCqgRRNOequfdfq7rvSJv9NlnyUokRxYaG1VKhkQ
         SHVFuD1wuKLw8mQ3y6SygzyBYrhoSi11PC9BTSnrw324tPaMkdGN9WRqGTHLqfBYJZVd
         iBwjXZw+Obgib2sVJMREw0MuclYuLLFaTsUd9SO7BbC1VcR8RM9zIZdx6RLzuh9HFtqW
         yPOyKdZ1Gh5uNSBCe7YYByKFn6dfX/mdk/NuNBm8RkOP94zQJ55cS2EyzKD0Y1RYrb3R
         2yGw==
X-Gm-Message-State: APjAAAX8g5MZ0fDciDA3ANLR0fqo8dDaNEadTifkfuXrZy/SNkM5luuZ
        AjNKlAQg8tEFwE4VjGPe36M=
X-Google-Smtp-Source: APXvYqzpKF76+7JafsOPb+hJUBKmkk6qQI4meZuR66EOWTQPQWrs9dxfJECmmgTjt7dnRy0P3ahykw==
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr5871701ljj.241.1581468017616;
        Tue, 11 Feb 2020 16:40:17 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:17 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 04/14 v4] mtd: rawnand: ams-delta: Drop board specific partition info
Date:   Wed, 12 Feb 2020 01:39:19 +0100
Message-Id: <20200212003929.6682-5-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now as we support fetching partition info from device platform data and
the Amstrad Delta board file provides that info, drop it from the
driver code.

v2: rebase on top of gpio_nand_platdata extension

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changelog:
v4: rebase on top of gpio_nand_platdata driver/board extensions,
  - drop no longer required command line parser related bits,
  - adjust commit description,
  - move OF fix to a separate patch.
v3: add information on the requirement for passing partition info via
    kernel command line to the board Kconfig entry help text.
v2: fix a typo poitned out by Aaro - thanks!,
  - fix device_node not passed to OF parser via mtd_info,
  - commit message reworded and reformatted a bit for better
    readability.

 drivers/mtd/nand/raw/ams-delta.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fbab7cc14607..25f121adea6f 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -42,31 +42,6 @@ struct ams_delta_nand {
 	bool			data_in;
 };
 
-/*
- * Define partitions for flash devices
- */
-
-static const struct mtd_partition partition_info[] = {
-	{ .name		= "Kernel",
-	  .offset	= 0,
-	  .size		= 3 * SZ_1M + SZ_512K },
-	{ .name		= "u-boot",
-	  .offset	= 3 * SZ_1M + SZ_512K,
-	  .size		= SZ_256K },
-	{ .name		= "u-boot params",
-	  .offset	= 3 * SZ_1M + SZ_512K + SZ_256K,
-	  .size		= SZ_256K },
-	{ .name		= "Amstrad LDR",
-	  .offset	= 4 * SZ_1M,
-	  .size		= SZ_256K },
-	{ .name		= "File system",
-	  .offset	= 4 * SZ_1M + 1 * SZ_256K,
-	  .size		= 27 * SZ_1M },
-	{ .name		= "PBL reserved",
-	  .offset	= 32 * SZ_1M - 3 * SZ_256K,
-	  .size		=  3 * SZ_256K },
-};
-
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
 {
 	gpiod_set_value(priv->gpiod_nwe, 0);
@@ -222,8 +197,8 @@ static const struct nand_controller_ops ams_delta_ops = {
 static int ams_delta_init(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
-	const struct mtd_partition *partitions = partition_info;
-	int num_partitions = ARRAY_SIZE(partition_info);
+	const struct mtd_partition *partitions = NULL;
+	int num_partitions = 0;
 	struct ams_delta_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
-- 
2.24.1

