Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAFE47F141
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhLXV5V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbhLXV5V (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:57:21 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0B0C061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:21 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id o6so37367855edc.4
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8SExs5MqnW1iYmYp73hdM/V09cGq8YvDMs/ITrsptY0=;
        b=bC01/raFpkGU7KlHcaPlKkslHbxnc+yWM3xwIq9fW+OwkrZs9CvKuqTl2nyVBjYbw3
         SaHQANteA2uwRBMJl3dBkJmrPKKetkNoOYDPo5ZlN2jWg1wDuhv/VoY3nlSTiUccLMVX
         TfzgPUoXNGGI9gRvPg8CrlrDM5ihDiXLCmhKGvLiCJagkcLTsAtzelRpj+vWGcY+vRgp
         1uz/enc/1AQTura52XLcWSSsX9RjcKvPClPokYA7e81hW6kER6TTUT/SJs7Zsoy2uq8r
         qvd0agzgxknwqr+fqdhgLZ9+z/DeFQPs+7CJ8whO3LXdE9xU3wEulbq+DOfUTP6BSiS0
         +7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8SExs5MqnW1iYmYp73hdM/V09cGq8YvDMs/ITrsptY0=;
        b=NM064dUTLpQYUBUJTwf2ZIeUw9kcU7EsEQFl7iEYlnm63kY7M8IWs3+tRXTVLvDrSj
         c86HHADX2mlcWYa1ZfTh+vdN8J2ZlPJ8GTI9e5dHSqzvkz65uCKHMX5AUK+G8Cq746pu
         wh+dA1KxwDdpYx3JrBnMLmban+8iS7LMugq59yEJlpF1MWrCj+Gv25sGraBMIGnUQ8F8
         JeDNkO7LlflHCB1Svzv6SSX0cDmZ8mfPMa8isUqb57CtjIrVJb7Ds8EeianyemnmAbCB
         PQJsmnDjOwsONV8LM3roGeKjfpbItVgklDGse6IXw8hpMs1W4rFmgDqsWfA2s8QRQn0e
         /o1g==
X-Gm-Message-State: AOAM532olWcJp+JBmIRboj8o/7crGTRzk/gqm+q/4Jd4AaNLxEslcutG
        YMz6Akm1/iuoLWKfPhDWRACo2YedW8Q=
X-Google-Smtp-Source: ABdhPJzF5WWOp2nw5OotBVppBEV1DdNvw80rZwGlYOteeLgHluckWtqf7G5XmuxSaORxD5pZhrXwdA==
X-Received: by 2002:a17:907:7f1d:: with SMTP id qf29mr6933134ejc.560.1640383039800;
        Fri, 24 Dec 2021 13:57:19 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id dn10sm3022476ejc.139.2021.12.24.13.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:57:19 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     linux-omap@vger.kernel.org
Cc:     peter.vasil@gmail.com
Subject: [PATCH 5/6] regulator: tahvo-vcore: Add basic Tahvo/Betty ASIC Vcore output support
Date:   Fri, 24 Dec 2021 22:56:34 +0100
Message-Id: <20211224215635.1585808-5-peter.vasil@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224215635.1585808-3-peter.vasil@gmail.com>
References: <20211224215635.1585808-3-peter.vasil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Vasil <peter.vasil@gmail.com>

Nokia Tahvo/Betty ASIC is a companion chip for mobile devices. One of
its outputs is a Vcore adjustable voltage regulator.
Register control code has been written based on original Nokia kernel
sources for N810 display driver.
Driver expects a regmap device as parent, usually retu-mfd driver bound
to the Tahvo ASIC.
---
 drivers/regulator/Kconfig                 |   8 ++
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/tahvo-vcore-regulator.c | 104 ++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/regulator/tahvo-vcore-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6be9b1c8a615..16c684c742cf 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1404,6 +1404,14 @@ config REGULATOR_WM8994
 	  This driver provides support for the voltage regulators on the
 	  WM8994 CODEC.
 
+config REGULATOR_TAHVO_VCORE
+	tristate "Tahvo/Betty Vcore regulator support"
+	depends on MFD_RETU
+	help
+	  This driver supports Vcore voltage control on Nokia's Tahvo/Betty
+	  ASIC chip. The regulator controls framebuffer supply voltage in
+	  Nokia internet tablets (for sure at least N810).
+
 config REGULATOR_QCOM_LABIBB
 	tristate "QCOM LAB/IBB regulator support"
 	depends on SPMI || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index b07d2a22df0b..ed64d2cf8a42 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -170,5 +170,6 @@ obj-$(CONFIG_REGULATOR_WM831X) += wm831x-ldo.o
 obj-$(CONFIG_REGULATOR_WM8350) += wm8350-regulator.o
 obj-$(CONFIG_REGULATOR_WM8400) += wm8400-regulator.o
 obj-$(CONFIG_REGULATOR_WM8994) += wm8994-regulator.o
+obj-$(CONFIG_REGULATOR_TAHVO_VCORE) += tahvo-vcore-regulator.o
 
 ccflags-$(CONFIG_REGULATOR_DEBUG) += -DDEBUG
diff --git a/drivers/regulator/tahvo-vcore-regulator.c b/drivers/regulator/tahvo-vcore-regulator.c
new file mode 100644
index 000000000000..a7c92aa7a148
--- /dev/null
+++ b/drivers/regulator/tahvo-vcore-regulator.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2004, 2005 Nokia Corporation
+//
+// Based on original 2.6 kernel driver for Nokia N8x0 LCD panel.
+// Rewritten in 2021 by Peter Vasil <petervasil@gmail.com>.
+//
+// Driver for Nokia Betty/Tahvo Vcore regulator
+// The only known voltages are currently 1.005V==0x0f and 1.475V==0x00 with mask 0x0f
+// Whether the sequence is actually linear is only a guess.
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+#define TAHVO_REG_VCORE		0x07
+
+// Values in this table are simply interpolated from the only known min/max.
+static const unsigned int tahvo_vcore_voltages[] = {
+	1475000, 1443667, 1412333, 1381000, 1349667, 1318333, 1287000, 1255667,
+	1224333, 1193000, 1161667, 1130333, 1099000, 1067667, 1036333, 1005000,
+};
+
+static const struct regulator_ops tahvo_vcore_regulator_voltage_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+static const struct regulator_desc vcore_regulator = {
+	.name		= "vcore",
+	.ops		= &tahvo_vcore_regulator_voltage_ops,
+	.type		= REGULATOR_VOLTAGE,
+	.owner		= THIS_MODULE,
+	.volt_table	= tahvo_vcore_voltages,
+	.n_voltages	= ARRAY_SIZE(tahvo_vcore_voltages),
+	.vsel_reg	= TAHVO_REG_VCORE,
+	.vsel_mask	= 0x0f,
+};
+
+static const struct regmap_config tahvo_vcore_regmap_config = {
+	.reg_bits	= 8,
+	.reg_stride	= 1,
+	.val_bits	= 16,
+};
+
+static int tahvo_vcore_regulator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regulator_init_data *init_data;
+	struct regulator_config cfg = {};
+	struct regulator_dev *rdev;
+
+	init_data = of_get_regulator_init_data(dev, dev->of_node,
+					       &vcore_regulator);
+	if (!init_data) {
+		dev_err(dev, "Failed to init regulator data!\n");
+		return -EINVAL;
+	}
+
+	cfg.dev = dev;
+	cfg.init_data = init_data;
+	cfg.of_node = dev->of_node;
+
+	cfg.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!cfg.regmap) {
+		dev_err(dev, "failed to locate regmap\n");
+		return -ENODEV;
+	}
+
+	rdev = devm_regulator_register(dev, &vcore_regulator, &cfg);
+	if (IS_ERR(rdev)) {
+		dev_err(dev, "Failed to register regulator: %ld\n",
+			PTR_ERR(rdev));
+		return PTR_ERR(rdev);
+	}
+	platform_set_drvdata(pdev, rdev);
+
+	return 0;
+}
+
+static const struct of_device_id regulator_tahvo_vcore_of_match[] = {
+	{ .compatible = "nokia,tahvo-vcore-regulator", },
+	{},
+};
+
+static struct platform_driver tahvo_vcore_regulator_driver = {
+	.probe = tahvo_vcore_regulator_probe,
+	.driver = {
+		.name = "tahvo-vcore-regulator",
+		.of_match_table = of_match_ptr(regulator_tahvo_vcore_of_match),
+	},
+};
+module_platform_driver(tahvo_vcore_regulator_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Peter Vasil <petervasil@gmail.com>");
+MODULE_DESCRIPTION("Tahvo/Betty Vcore voltage regulator");
-- 
2.25.1

