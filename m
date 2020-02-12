Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 978B9159E24
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgBLAka (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:30 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39799 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728141AbgBLAka (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:30 -0500
Received: by mail-lf1-f65.google.com with SMTP id t23so269789lfk.6
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v/6tTpO3ty9Ickxrg60llaPHKJlLlwszXGl2q4ZEWdA=;
        b=XXy+baYR3VmU8+0MGUBmeB6Ufp/HhTXjpTNcm302ZvTcMx1EevlSI36N7AfkUkFY+L
         hikN/KF45d4Z3VpgD4ep9+f5bnN6R9yOvtZD6IKtW6JF30+QsQdYKL6ANu3J23pA2zPC
         vMQdRiXUl7QMICn0fkSYS4MjnkQ9yGjELAbk761xAGcGiTv5ew4ysYqRn60qsjpToxZp
         LdP4g+dkLb2RagCz7Srr7VCQBngZBot1UyOaQ/WSyyXpNmSVXCy6qUaKuJrhOHfOetnx
         +nI6CWdxR8IatlCyIFlRpeJ+xQEWEj9sCVcSc1FKF4cqaFeyYI/kEQKixttD8PiMxyIe
         HjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v/6tTpO3ty9Ickxrg60llaPHKJlLlwszXGl2q4ZEWdA=;
        b=NGBdM/sSXeNsycoO0GnmwEdVLAD6j5fs3DD0mjtrrDIB8o2QUDXJIRqwtIfdtBarfa
         pzHoOJGvzqoyqfUVzlQVr2oE39k+754YOrWkScbQz/Ovu/8v/79GJM/mpSNVau6IrEfU
         eO0mN2RzLPt0YIz+0PTsASPQxHHjNFYisGkDNxe9v3Bim74CnjMyPejdpQYz48cjR958
         2Sf+trb6GCjli1K/VXXUeBiakCxnaL/ym8k/hTSPA7D+FKoOD7qVmDAKDc/F0A0cv+bX
         uKKqFnH78JRKKUsaRrit+vhTxKqA11nAGOXhF4/pLM3vcodDbBOPAovR8flMOgTuTRM6
         BwNg==
X-Gm-Message-State: APjAAAXkeZ0/vb60sh6/1xtkXsOCiruiTrAr3D3IlyyivxuNGfMojLii
        KRV19lY+ptx2DBN5H1oiTCs=
X-Google-Smtp-Source: APXvYqzJQMZWjP7I8oQrWw3hIto+GJNhsSDnYXYqbb56cNLMkwksMbMcf+Z2BxWEJFVtQsbKN+icfg==
X-Received: by 2002:ac2:5f74:: with SMTP id c20mr5161323lfc.15.1581468026840;
        Tue, 11 Feb 2020 16:40:26 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:26 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 11/14] mtd: rawnand: ams-delta: Support custom driver initialisation
Date:   Wed, 12 Feb 2020 01:39:26 +0100
Message-Id: <20200212003929.6682-12-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In preparation for extending the driver with custom I/O support, try to
obtain device specific initialisation routine from a matching device
table entry and run it as an additional step of device probe.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 9857ce25debf..97e3b6629c72 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 
@@ -230,6 +231,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	struct nand_chip *this;
 	struct mtd_info *mtd;
 	struct gpio_descs *data_gpiods;
+	int (*probe)(struct platform_device *pdev, struct ams_delta_nand *priv);
 	int err = 0;
 
 	if (pdata) {
@@ -319,6 +321,15 @@ static int ams_delta_init(struct platform_device *pdev)
 	priv->data_gpiods = data_gpiods;
 	priv->data_in = true;
 
+	if (pdev->id_entry)
+		probe = (void *) pdev->id_entry->driver_data;
+	else
+		probe = of_device_get_match_data(&pdev->dev);
+	if (probe)
+		err = probe(pdev, priv);
+	if (err)
+		return err;
+
 	/* Initialize the NAND controller object embedded in ams_delta_nand. */
 	priv->base.ops = &ams_delta_ops;
 	nand_controller_init(&priv->base);
-- 
2.24.1

