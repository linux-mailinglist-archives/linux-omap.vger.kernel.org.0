Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DEE159E26
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 01:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgBLAkf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 19:40:35 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35173 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbgBLAke (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 19:40:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id z18so289783lfe.2
        for <linux-omap@vger.kernel.org>; Tue, 11 Feb 2020 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2UEgY4ao2+798RrC+bgRDj1MAy2fBXO4FFMvPRI1C4g=;
        b=IndtyLyVtvp5a7K9IKZkW7pCthfJxOF/LdZ+pgJGVT4Gb8u/yJr/CPU0GrYi+o44n4
         qQFeWSXzNDHCLjyQXTXq2V19GV+YjvFz4ET8lP8UsPB8zDrtpNHuoYcdhXcaYs0oBNAQ
         byexFtFsf7fcB8MYtQt0ZhrJHDg//JRBcp3BvBnYFEz3Z/TpGOSzp4epjj7OawV/xnVs
         EGUhAFMh1VVXBvkp5aJvYNPDP1fnVA0z7hc1m0yvrtfQUEX4vVKXSdimWT/zyls8CtGs
         pOCOWPA/jUJT2fa9fhzjMM45EyUqPefcJUwAvCIFN8U5pu4zLxGWwHlCxpPQUveLN8oA
         Nsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2UEgY4ao2+798RrC+bgRDj1MAy2fBXO4FFMvPRI1C4g=;
        b=NvBt4PQN7ef+RO40niM+7TJSexF1CDhP7kuWeg6g7tyhQD18zEGPFW3lcLJqE1WUXZ
         YQ4a1rIu2BtFsig75M8Sk4+BJrMvftW24sH8gKRI9ysBx0IrznwPI6VRJt1yLRPZhxlM
         HHYDWnbe2pqxqMcq9A0o7xllASj3xmKqd2MhlrbKrUH7X34Pqcc8+RIHMwfag7YrIRnT
         G1pYU0ECsh9pAchE3DasT5VmPwDZwHQUT6F0R0v5IBV5iKIugrrc1/DfAX2SZnnNX6ck
         Ru4hXeZGVqEuooSU+QWNCglS7LbYaSbQX5Frs4Q7CWWe5CoFtJy9L6olS46NY0GldgSo
         Mxrg==
X-Gm-Message-State: APjAAAVmwYSOiVDWjuSswq5mD0fVMYzTgNcMxxpNsyYAiNTGz7C9o3BS
        RS9boCFlP0LFyCt+6V2+vdw=
X-Google-Smtp-Source: APXvYqwGzDZunZ82ZiLa1YumLPIcrrgQ3aVnv5FhxhmDF3C3h64og6Ucdk0KrfRDM6DpAQfsg8Toqg==
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr5183706lfi.77.1581468030700;
        Tue, 11 Feb 2020 16:40:30 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:40:30 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 14/14] mtd: rawnand: ams-delta: Rename structures and functions to gpio_nand*
Date:   Wed, 12 Feb 2020 01:39:29 +0100
Message-Id: <20200212003929.6682-15-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Another step in preparation for merging the driver with "gpio-nand".

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 86 ++++++++++++++++----------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 9e659984bf59..6fda2979e820 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -29,7 +29,7 @@
 /*
  * MTD structure for E3 (Delta)
  */
-struct ams_delta_nand {
+struct gpio_nand {
 	struct nand_controller	base;
 	struct nand_chip	nand_chip;
 	struct gpio_desc	*gpiod_rdy;
@@ -43,19 +43,18 @@ struct ams_delta_nand {
 	bool			data_in;
 	unsigned int		tRP;
 	unsigned int		tWP;
-	u8			(*io_read)(struct ams_delta_nand *this);
-	void			(*io_write)(struct ams_delta_nand *this,
-					    u8 byte);
+	u8			(*io_read)(struct gpio_nand *this);
+	void			(*io_write)(struct gpio_nand *this, u8 byte);
 };
 
-static void ams_delta_write_commit(struct ams_delta_nand *priv)
+static void gpio_nand_write_commit(struct gpio_nand *priv)
 {
 	gpiod_set_value(priv->gpiod_nwe, 1);
 	ndelay(priv->tWP);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 }
 
-static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
+static void gpio_nand_io_write(struct gpio_nand *priv, u8 byte)
 {
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	DECLARE_BITMAP(values, BITS_PER_TYPE(byte)) = { byte, };
@@ -63,10 +62,10 @@ static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
 	gpiod_set_raw_array_value(data_gpiods->ndescs, data_gpiods->desc,
 				  data_gpiods->info, values);
 
-	ams_delta_write_commit(priv);
+	gpio_nand_write_commit(priv);
 }
 
-static void ams_delta_dir_output(struct ams_delta_nand *priv, u8 byte)
+static void gpio_nand_dir_output(struct gpio_nand *priv, u8 byte)
 {
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	DECLARE_BITMAP(values, BITS_PER_TYPE(byte)) = { byte, };
@@ -76,12 +75,12 @@ static void ams_delta_dir_output(struct ams_delta_nand *priv, u8 byte)
 		gpiod_direction_output_raw(data_gpiods->desc[i],
 					   test_bit(i, values));
 
-	ams_delta_write_commit(priv);
+	gpio_nand_write_commit(priv);
 
 	priv->data_in = false;
 }
 
-static u8 ams_delta_io_read(struct ams_delta_nand *priv)
+static u8 gpio_nand_io_read(struct gpio_nand *priv)
 {
 	u8 res;
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
@@ -99,7 +98,7 @@ static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 	return res;
 }
 
-static void ams_delta_dir_input(struct ams_delta_nand *priv)
+static void gpio_nand_dir_input(struct gpio_nand *priv)
 {
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	int i;
@@ -110,68 +109,67 @@ static void ams_delta_dir_input(struct ams_delta_nand *priv)
 	priv->data_in = true;
 }
 
-static void ams_delta_write_buf(struct ams_delta_nand *priv, const u8 *buf,
-				int len)
+static void gpio_nand_write_buf(struct gpio_nand *priv, const u8 *buf, int len)
 {
 	int i = 0;
 
 	if (len > 0 && priv->data_in)
-		ams_delta_dir_output(priv, buf[i++]);
+		gpio_nand_dir_output(priv, buf[i++]);
 
 	while (i < len)
 		priv->io_write(priv, buf[i++]);
 }
 
-static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
+static void gpio_nand_read_buf(struct gpio_nand *priv, u8 *buf, int len)
 {
 	int i;
 
 	if (priv->data_gpiods && !priv->data_in)
-		ams_delta_dir_input(priv);
+		gpio_nand_dir_input(priv);
 
 	for (i = 0; i < len; i++)
 		buf[i] = priv->io_read(priv);
 }
 
-static void ams_delta_ctrl_cs(struct ams_delta_nand *priv, bool assert)
+static void gpio_nand_ctrl_cs(struct gpio_nand *priv, bool assert)
 {
 	gpiod_set_value(priv->gpiod_nce, assert);
 }
 
-static int ams_delta_exec_op(struct nand_chip *this,
+static int gpio_nand_exec_op(struct nand_chip *this,
 			     const struct nand_operation *op, bool check_only)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	struct gpio_nand *priv = nand_get_controller_data(this);
 	const struct nand_op_instr *instr;
 	int ret = 0;
 
 	if (check_only)
 		return 0;
 
-	ams_delta_ctrl_cs(priv, 1);
+	gpio_nand_ctrl_cs(priv, 1);
 
 	for (instr = op->instrs; instr < op->instrs + op->ninstrs; instr++) {
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
 			gpiod_set_value(priv->gpiod_cle, 1);
-			ams_delta_write_buf(priv, &instr->ctx.cmd.opcode, 1);
+			gpio_nand_write_buf(priv, &instr->ctx.cmd.opcode, 1);
 			gpiod_set_value(priv->gpiod_cle, 0);
 			break;
 
 		case NAND_OP_ADDR_INSTR:
 			gpiod_set_value(priv->gpiod_ale, 1);
-			ams_delta_write_buf(priv, instr->ctx.addr.addrs,
+			gpio_nand_write_buf(priv, instr->ctx.addr.addrs,
 					    instr->ctx.addr.naddrs);
 			gpiod_set_value(priv->gpiod_ale, 0);
 			break;
 
 		case NAND_OP_DATA_IN_INSTR:
-			ams_delta_read_buf(priv, instr->ctx.data.buf.in,
+			gpio_nand_read_buf(priv, instr->ctx.data.buf.in,
 					   instr->ctx.data.len);
 			break;
 
 		case NAND_OP_DATA_OUT_INSTR:
-			ams_delta_write_buf(priv, instr->ctx.data.buf.out,
+			gpio_nand_write_buf(priv, instr->ctx.data.buf.out,
 					    instr->ctx.data.len);
 			break;
 
@@ -188,15 +186,15 @@ static int ams_delta_exec_op(struct nand_chip *this,
 			break;
 	}
 
-	ams_delta_ctrl_cs(priv, 0);
+	gpio_nand_ctrl_cs(priv, 0);
 
 	return ret;
 }
 
-static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
+static int gpio_nand_setup_data_interface(struct nand_chip *this, int csline,
 					  const struct nand_data_interface *cf)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	struct gpio_nand *priv = nand_get_controller_data(this);
 	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
 	struct device *dev = &nand_to_mtd(this)->dev;
 
@@ -217,23 +215,23 @@ static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
 	return 0;
 }
 
-static const struct nand_controller_ops ams_delta_ops = {
-	.exec_op = ams_delta_exec_op,
-	.setup_data_interface = ams_delta_setup_data_interface,
+static const struct nand_controller_ops gpio_nand_ops = {
+	.exec_op = gpio_nand_exec_op,
+	.setup_data_interface = gpio_nand_setup_data_interface,
 };
 
 /*
  * Main initialization routine
  */
-static int ams_delta_init(struct platform_device *pdev)
+static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
 	const struct mtd_partition *partitions = NULL;
 	int num_partitions = 0;
-	struct ams_delta_nand *priv;
+	struct gpio_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
-	int (*probe)(struct platform_device *pdev, struct ams_delta_nand *priv);
+	int (*probe)(struct platform_device *pdev, struct gpio_nand *priv);
 	int err = 0;
 
 	if (pdata) {
@@ -242,7 +240,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct ams_delta_nand),
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
 			    GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -329,8 +327,8 @@ static int ams_delta_init(struct platform_device *pdev)
 			return -ENODEV;
 		}
 
-		priv->io_read = ams_delta_io_read;
-		priv->io_write = ams_delta_io_write;
+		priv->io_read = gpio_nand_io_read;
+		priv->io_write = gpio_nand_io_write;
 		priv->data_in = true;
 	}
 
@@ -348,8 +346,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* Initialize the NAND controller object embedded in ams_delta_nand. */
-	priv->base.ops = &ams_delta_ops;
+	/* Initialize the NAND controller object embedded in gpio_nand. */
+	priv->base.ops = &gpio_nand_ops;
 	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
@@ -385,9 +383,9 @@ static int ams_delta_init(struct platform_device *pdev)
 /*
  * Clean up routine
  */
-static int ams_delta_cleanup(struct platform_device *pdev)
+static int gpio_nand_remove(struct platform_device *pdev)
 {
-	struct ams_delta_nand *priv = platform_get_drvdata(pdev);
+	struct gpio_nand *priv = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 
 	/* Apply write protection */
@@ -415,9 +413,9 @@ static const struct platform_device_id gpio_nand_plat_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_plat_id_table);
 
-static struct platform_driver ams_delta_nand_driver = {
-	.probe		= ams_delta_init,
-	.remove		= ams_delta_cleanup,
+static struct platform_driver gpio_nand_driver = {
+	.probe		= gpio_nand_probe,
+	.remove		= gpio_nand_remove,
 	.id_table	= gpio_nand_plat_id_table,
 	.driver		= {
 		.name	= "ams-delta-nand",
@@ -425,7 +423,7 @@ static struct platform_driver ams_delta_nand_driver = {
 	},
 };
 
-module_platform_driver(ams_delta_nand_driver);
+module_platform_driver(gpio_nand_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Jonathan McDowell <noodles@earth.li>");
-- 
2.24.1

