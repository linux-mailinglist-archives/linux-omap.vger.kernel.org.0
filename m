Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE4159E1B
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgBLAkS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:18 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33819 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728070AbgBLAkS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:18 -0500
Received: by mail-lj1-f196.google.com with SMTP id x7so285899ljc.1
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jY/whPnhAuxzTC/NjaKtmOflD4QjDSvq1sNUEMZh1qc=;
        b=XlSNMXMomGlL98MVH2Y38zJT3ch0ovUnYddswlRj7u5ofxM1PB+ri+IOw8xvPX4+cW
         zpqqrQCEBXvephKadYoAWUNAB0t79nwBfEr/CM7bkwJcIrj6/EM+t5DLuJu1P2URhzNl
         IpWbcXL/MfGXqrXPUalE/E1qu8Vbirx3jkfZxzj/DWddR1CI/BoH9S7h5TCWPL4i1SRP
         Qew5KonrCxJbbetz5dLhj/79jC8qxtYICANMMs5VLxPHZCKINfLQaq21y/Nu2HIFfPD7
         3qIl93NiAVU1oqeHJdRRXSLtdQeCeTxCKVb2wgaS9ey5OXNYq1o5Ss+G+6did3W0pMIv
         eRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jY/whPnhAuxzTC/NjaKtmOflD4QjDSvq1sNUEMZh1qc=;
        b=n3pwPXqHVhCaAzPs1pF4aFqobpXw2V1m5HK6ZF7RHrkI9j9yh6XpcoEYww9j0XDQdq
         NyuD3lZ7MP0q1/VbglG3pDPTrbB4se7/COFYXriLhPpV0utAlFnBNBbJMHfor46t6q1y
         +20AbkGCWRC8ZiHlKe4g1qdTwFXfxa//KVx4vYgEIHOLItpScF8iPKkBd8NoS7DtHUpj
         TT494U94CiJ+0daVgO39K/UGKVGVAYzJtOEDHzPYzS029ulaUc8NJ/iUlNUSNDxA2Mjy
         oyBMQhyEujQtW+QKGt9wDv+OadkPsW+IM1WiyEVBG+tVPOJbONHfTXRYKEOLULV4Euzq
         593g==
X-Gm-Message-State: APjAAAUIqudi13C0ob8T8+idUb1+kPgqHoJiPitmxiXwgHdgTOmGDt6N
        IccV8I0bq6gIzJmw/ciTUgU=
X-Google-Smtp-Source: APXvYqxe6yfLSQK+5DB76pAsO2JVz92J7q3+56L6/lV9a5KfPuaDfJSuV5dzIjVYQ/fXZ7JXD9vMcg==
X-Received: by 2002:a05:651c:321:: with SMTP id b1mr5965696ljp.62.1581468016319;
        Tue, 11 Feb 2020 16:40:16 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:15 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific partition info
Date:   Wed, 12 Feb 2020 01:39:18 +0100
Message-Id: <20200212003929.6682-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Now as the Amstrad Delta NAND driver supports fetching information on
MTD partitions from device platform data, add partition info to the
NAND device configuration.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index a2aa7a12b374..f4d2ef97099e 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -17,6 +17,8 @@
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/leds.h>
+#include <linux/mtd/nand-gpio.h>
+#include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/fixed.h>
@@ -294,9 +296,42 @@ struct modem_private_data {
 
 static struct modem_private_data modem_priv;
 
+/*
+ * Define partitions for flash device
+ */
+
+static struct mtd_partition partition_info[] = {
+	{ .name		= "Kernel",
+	  .offset	= 0,
+	  .size		= 3 * SZ_1M + SZ_512K },
+	{ .name		= "u-boot",
+	  .offset	= 3 * SZ_1M + SZ_512K,
+	  .size		= SZ_256K },
+	{ .name		= "u-boot params",
+	  .offset	= 3 * SZ_1M + SZ_512K + SZ_256K,
+	  .size		= SZ_256K },
+	{ .name		= "Amstrad LDR",
+	  .offset	= 4 * SZ_1M,
+	  .size		= SZ_256K },
+	{ .name		= "File system",
+	  .offset	= 4 * SZ_1M + 1 * SZ_256K,
+	  .size		= 27 * SZ_1M },
+	{ .name		= "PBL reserved",
+	  .offset	= 32 * SZ_1M - 3 * SZ_256K,
+	  .size		=  3 * SZ_256K },
+};
+
+static struct gpio_nand_platdata nand_platdata = {
+	.parts		= partition_info,
+	.num_parts	= ARRAY_SIZE(partition_info),
+};
+
 static struct platform_device ams_delta_nand_device = {
 	.name	= "ams-delta-nand",
 	.id	= -1,
+	.dev	= {
+		.platform_data = &nand_platdata,
+	},
 };
 
 #define OMAP_GPIO_LABEL		"gpio-0-15"
-- 
2.24.1

