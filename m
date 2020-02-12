Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8D5159E1F
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgBLAkY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:24 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45511 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgBLAkX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:23 -0500
Received: by mail-lf1-f66.google.com with SMTP id 203so248778lfa.12
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WQvwUELB2lAk2lsQtZP8H2VNrhUPibDwY83BwnWamDU=;
        b=Y9c3B+ETlvveEsikvMHolWK2+/qerHygPjGpuDcQ/n0hRzfAyVEFoaL/+IMhgVyjVI
         HSM4dTDofvtZXO9YIsDpZjF5KiyGe/KSYLfyj/lrgFAqTg+F+HhTNFs2NrR75kkH+5i2
         64dyCzKM3mBF6vbMbd2Vncx7klqcoJPcacr4uH8igr4vZLxjQlrtlVoNOeg7u+NIlwtk
         pVq8ewORb7HXwzgmwlT40EqF0U7gCwYoQsjFgOLjzKfycJ0sHNsYcAemdsvUoHssc/hV
         PR7JNdgu6aRoPkTz5Y2KhggOiVi0wF4+40UKwSDIohurcU6VjH58IHlssvFEcDYXkx3H
         wxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WQvwUELB2lAk2lsQtZP8H2VNrhUPibDwY83BwnWamDU=;
        b=hraDauQbI+XaF6opWUpgFxryrtrnRB9vDiTys9O1zkWkQQtfkCE3Ew0MSkGRRUNBRd
         fIXDnIEIaUq8Jw5TwcgGMqmwnsaoP474c0RfaYMmNEvXLC3I2mvu1V0nfwTU0yPojMHa
         ZLUnZrQTaCuxtyQ5vzEuSauS7J0aeYOzSa+czjLSubayYWoRt6nWLHrYR5GGk5pu9X9C
         ljcRD3vwwWrlELMHruV8Au6g/namGps3fZzTSH/JRqDTGsyCA1sR/b8j9ZmHQpGsRc4R
         fTlQS21BEsypzzPJwHVjdW+8k4lb7+Z7AtZlrqBNipj3ixHy7CI4VLfJEqwos9B3Xg8d
         A0Dw==
X-Gm-Message-State: APjAAAWq7cbRzqcTc+ermwf8Mrljp/CwA1SyOzrzQZBjxb+3I2U2cB46
        3Gfj6hTYRUsko08970ejT1Q=
X-Google-Smtp-Source: APXvYqzrumwlcv4WELKNafS26Pu7ImSy3VMG/Df7kdpl+EF/FXmNAxgvCTLUbWPORF6yRPXkGWwhbw==
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr5135029lfl.125.1581468021768;
        Tue, 11 Feb 2020 16:40:21 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:21 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 07/14] mtd: rawnand: ams-delta: Don't hardcode read/write pulse widths
Date:   Wed, 12 Feb 2020 01:39:22 +0100
Message-Id: <20200212003929.6682-8-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Instead of forcing Amstrad Delta specific read/write pulse widths, use
variables initialised from respective fields of chip SDR timings.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index c7aeb940accd..11689218d23a 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -40,12 +40,14 @@ struct ams_delta_nand {
 	struct gpio_desc	*gpiod_cle;
 	struct gpio_descs	*data_gpiods;
 	bool			data_in;
+	unsigned int		tRP;
+	unsigned int		tWP;
 };
 
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
 {
 	gpiod_set_value(priv->gpiod_nwe, 1);
-	ndelay(40);
+	ndelay(priv->tWP);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 }
 
@@ -82,7 +84,7 @@ static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 	DECLARE_BITMAP(values, BITS_PER_TYPE(res)) = { 0, };
 
 	gpiod_set_value(priv->gpiod_nre, 1);
-	ndelay(40);
+	ndelay(priv->tRP);
 
 	gpiod_get_raw_array_value(data_gpiods->ndescs, data_gpiods->desc,
 				  data_gpiods->info, values);
@@ -187,8 +189,31 @@ static int ams_delta_exec_op(struct nand_chip *this,
 	return ret;
 }
 
+static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
+					  const struct nand_data_interface *cf)
+{
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
+	struct device *dev = &nand_to_mtd(this)->dev;
+
+	if (IS_ERR(sdr))
+		return PTR_ERR(sdr);
+
+	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
+		return 0;
+
+	priv->tRP = DIV_ROUND_UP(sdr->tRP_min, 1000);
+	dev_dbg(dev, "using %u ns read pulse width\n", priv->tRP);
+
+	priv->tWP = DIV_ROUND_UP(sdr->tWP_min, 1000);
+	dev_dbg(dev, "using %u ns write pulse width\n", priv->tWP);
+
+	return 0;
+}
+
 static const struct nand_controller_ops ams_delta_ops = {
 	.exec_op = ams_delta_exec_op,
+	.setup_data_interface = ams_delta_setup_data_interface,
 };
 
 /*
-- 
2.24.1

