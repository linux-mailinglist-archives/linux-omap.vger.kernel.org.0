Return-Path: <linux-omap+bounces-4316-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F20DB33306
	for <lists+linux-omap@lfdr.de>; Mon, 25 Aug 2025 00:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12290205BDE
	for <lists+linux-omap@lfdr.de>; Sun, 24 Aug 2025 22:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC196255E26;
	Sun, 24 Aug 2025 22:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="E7Ljjykf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAA12B93;
	Sun, 24 Aug 2025 22:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756073286; cv=none; b=E0keAxxwkTTl310fAZmTda2+EBtZIDzTj0wMp8KWJKbZRZpqmkxtYGvrCZJAMOHy0tua9+ghXtCTUloL5N5z+fEyICDva49mXCxskChfa402hD36AcStrptIoA7UL8g0jBFO/SxqzYC5Jbl0CEVpWynPrrYicETHONQ0rQr1dlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756073286; c=relaxed/simple;
	bh=IjCfZDgBT49pokPk728KamIWhQEnX2ES5NjdbqpPKxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kolaxda4WRqnk3UDfFceTN/K++qPt5YTryp+etoS7/jcbew1jMLqs8A5eG+2itj9tjT998nbLvScg7Y5g0EGsQMJFlvCuc9W1/IsYaTg8V4F7DUxcigRJUUopP0Jzg+uLS75NueqMvkJc1AhmYwKtei01oRH7785Qqn0ha8h990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=E7Ljjykf; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:In-Reply-To:References:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=w017jvPUy/HjQXZT+jTEkkN0IBHkOVQKlXTzTvOdp3s=; b=E7LjjykfIisqPUp0mvAyxJX8KJ
	VhMFtT0B0IkRoJQ33mVy/H44CajZzrf8c2F2jJYAJuULX+52rxqDMQBiLf5uh5NFN1soQVc+XxSqx
	AkVaeinPqiUP3XNMZfMGrNcfHrLTocoAppJpNptBzqaYcqlSIEGOO0CKHmVojLFTU+ZdSraYWxvcF
	N6gtuyao/V5Xi3f9/cq0EhqYx9ScikSNY9GifTYfAbrcnBkZRyhA5xlQwBqhm32etEcPn/jfwHVYV
	Wy4mFqRNQc/NJpo08MGb5CLOxv8XUXZQfT91DJ+SLIfM6ppbCRWTMxwPtRqxw4D/wfzs3G8+d9oPE
	s3jguBBw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 25 Aug 2025 00:07:29 +0200
Subject: [PATCH RFC 2/3] Input: Add driver for Elan eKTP1059 Touchpad
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-ektp-submit-v1-2-1dd476c1277b@kemnade.info>
References: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
In-Reply-To: <20250825-ektp-submit-v1-0-1dd476c1277b@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Tony Lindgren <tony@atomide.com>, hns@goldelico.com
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=9434; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=IjCfZDgBT49pokPk728KamIWhQEnX2ES5NjdbqpPKxM=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBmrey22SH8/tdhzm9QsweiZWRPezgmI+Dkr1Tqz9dFbF
 +3MS4aPOkpZGMQ4GGTFFFl+WSu4fVJ5lhs8NcIeZg4rE8gQBi5OAZhI4WZGhqcGr3/dyNzOlrBY
 YL980J1FZx9N+72AbYL2tmpxb1HdlYaMDN8LT+RYHn5QbG54U+z4LafeZW+XNs8zKAvYuezHJO7
 TzQwA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add driver for Elan eKTP1059 Touchpad connected via SPI.
No information found whether it could be alternatively connected via I2C.
No details about protocol are known, the only information is found in the
vendor kernel of the Epson Moverio BT-200, drivers/input/elan
http://epsonservice.goepson.com/downloads/VI-APS/BT200_kernel.tgz

Known issues: After some time (minutes) touching it, interrupts
stop arriving. Chances are that source of this problem is outside
of the driver.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/input/mouse/Kconfig         |  10 ++
 drivers/input/mouse/Makefile        |   1 +
 drivers/input/mouse/elan_ektp1059.c | 267 ++++++++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+)

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 833b643f0616..5b197bd8863b 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -300,6 +300,16 @@ config MOUSE_ELAN_I2C_SMBUS
 
 	   If unsure, say Y.
 
+config MOUSE_ELAN_EKTP1059
+	tristate "Elan EKTP1059 Touchpad"
+	depends on SPI
+	help
+	  Say Y here if you have an Elan ETKP1059 touchpad connected
+	  via SPI.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called elan_ektp1059.
+
 config MOUSE_INPORT
 	tristate "InPort/MS/ATIXL busmouse"
 	depends on ISA
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index a1336d5bee6f..f6160a4c97c7 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_MOUSE_ATARI)		+= atarimouse.o
 obj-$(CONFIG_MOUSE_BCM5974)		+= bcm5974.o
 obj-$(CONFIG_MOUSE_CYAPA)		+= cyapatp.o
 obj-$(CONFIG_MOUSE_ELAN_I2C)		+= elan_i2c.o
+obj-$(CONFIG_MOUSE_ELAN_EKTP1059)	+= elan_ektp1059.o
 obj-$(CONFIG_MOUSE_GPIO)		+= gpio_mouse.o
 obj-$(CONFIG_MOUSE_INPORT)		+= inport.o
 obj-$(CONFIG_MOUSE_LOGIBM)		+= logibm.o
diff --git a/drivers/input/mouse/elan_ektp1059.c b/drivers/input/mouse/elan_ektp1059.c
new file mode 100644
index 000000000000..a8ed7ba20e64
--- /dev/null
+++ b/drivers/input/mouse/elan_ektp1059.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Elantech eKTP1059 SPI Touchpad
+ * Copyright (C) 2025 Andreas Kemnade <andreas@kemnade.info>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/spi/spi.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/kthread.h>
+
+#define TOUCHPAD_WIDTH		4000
+#define TOUCHPAD_HEIGHT		2426
+#define TOUCH_AREA		20
+#define PRESSURE_MAX 256
+
+struct elan_tp_spi {
+	struct input_dev *input_touch;
+	struct spi_device *spi;
+};
+
+static int elan_spi_write(struct elan_tp_spi *elanspi, const void *buf, size_t len)
+{
+	/*
+	 * running this as single transfer with word_delay set
+	 * results in an irq storm. Epson vendor kernel uses a single spi_sync
+	 * multiple 1 byte transfers.
+	 */
+	size_t i;
+	int err;
+
+	for (i = 0 ; i < len; i++) {
+		err = spi_write(elanspi->spi, buf, 1);
+		if (err)
+			return err;
+
+		udelay(100);
+	}
+	return 0;
+}
+
+static int elan_spi_read(struct elan_tp_spi *elanspi, void *buf, size_t len)
+{
+	/* reads 0x51 on sync */
+	struct spi_transfer t = { 0 };
+	int err;
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		u8 dummy = 0xff;
+
+		t.len = 1;
+		t.tx_buf = &dummy;
+		t.rx_buf = buf + i;
+		err = spi_sync_transfer(elanspi->spi, &t, 1);
+		if (err)
+			return err;
+
+		udelay(80);
+	}
+	return 0;
+}
+
+static irqreturn_t elan_tp_irq_handler(int irq, void *dev_id)
+{
+	struct elan_tp_spi *elanspi = dev_id;
+	u8 buf[14];
+	int fingercnt = 0;
+	int x, y, pres, width;
+
+	if (elan_spi_read(elanspi, buf, 14))
+		return IRQ_HANDLED;
+
+	if (buf[13] != 0x1)
+		return IRQ_HANDLED;
+
+	fingercnt = (buf[1] & 0xC0) >> 6;
+	input_report_key(elanspi->input_touch, BTN_TOUCH, fingercnt != 0);
+	input_report_key(elanspi->input_touch, BTN_TOOL_FINGER, fingercnt == 1);
+	input_report_key(elanspi->input_touch, BTN_TOOL_DOUBLETAP, fingercnt == 2);
+	input_report_key(elanspi->input_touch, BTN_TOOL_TRIPLETAP, fingercnt == 3);
+
+	x = buf[2] & 0xf;
+	x = x << 8;
+	x |= buf[3];
+	y = buf[5] & 0xf;
+	y = y << 8;
+	y |= buf[6];
+
+	pres = (buf[2] & 0xf0) | ((buf[5] & 0xf0) >> 4);
+	width = ((buf[1] & 0x30) >> 2) | ((buf[4] & 0x30) >> 4);
+
+	input_report_abs(elanspi->input_touch, ABS_PRESSURE, pres);
+	input_report_abs(elanspi->input_touch, ABS_TOOL_WIDTH, width);
+
+	if (fingercnt != 0) {
+		input_report_abs(elanspi->input_touch, ABS_X, x);
+		input_report_abs(elanspi->input_touch, ABS_Y, y);
+	}
+
+	input_mt_slot(elanspi->input_touch, 0);
+	input_mt_report_slot_state(elanspi->input_touch, MT_TOOL_FINGER, fingercnt == 1);
+
+	if (fingercnt != 0) {
+		input_report_abs(elanspi->input_touch, ABS_MT_POSITION_X, x);
+		input_report_abs(elanspi->input_touch, ABS_MT_POSITION_Y, y);
+	}
+	dev_dbg(&elanspi->spi->dev, "1: X: %d Y: %d pres: %d width: %d\n",
+		x, y, pres, width);
+
+	if (fingercnt >= 2) {
+		x = buf[8] & 0xf;
+		x = x << 8;
+		x |= buf[9];
+		y = buf[11] & 0xf;
+		y = y << 8;
+		y |= buf[12];
+		input_mt_slot(elanspi->input_touch, 1);
+		input_mt_report_slot_state(elanspi->input_touch, MT_TOOL_FINGER, 1);
+		input_report_abs(elanspi->input_touch, ABS_MT_POSITION_X, x);
+		input_report_abs(elanspi->input_touch, ABS_MT_POSITION_Y, y);
+		dev_dbg(&elanspi->spi->dev, "2: X: %d Y: %d\n", x, y);
+	} else {
+		input_mt_slot(elanspi->input_touch, 1);
+		input_mt_report_slot_state(elanspi->input_touch, MT_TOOL_FINGER, 0);
+	}
+
+	input_sync(elanspi->input_touch);
+
+	return IRQ_HANDLED;
+}
+
+static int handle_hello_package(struct elan_tp_spi *elanspi)
+{
+	u8 buf_recv[4];
+	int rc;
+
+	rc = elan_spi_read(elanspi, buf_recv, 4);
+	if (rc != 0)
+		return rc;
+
+	/* 0xa0, 0x7, 0x0, 0x0 after boot */
+	dev_dbg(&elanspi->spi->dev,
+		"dump hello packet: %x, %x, %x, %x\n",
+		buf_recv[0], buf_recv[1], buf_recv[2], buf_recv[3]);
+
+	return 0;
+}
+
+static int init_touchpad(struct elan_tp_spi *elanspi)
+{
+	u8 buf_cmd[4] = {0x5B, 0x10, 0xC, 0x1};
+	u8 buf[14];
+	int ret;
+
+	ret = elan_spi_write(elanspi, buf_cmd, 4);
+
+	if (ret != 0)
+		return ret;
+
+	msleep(20);
+	elan_spi_read(elanspi, buf, 14);
+
+	return 0;
+}
+
+static int elan_ektp1059_probe(struct spi_device *spi)
+{
+	int status = 0;
+	struct elan_tp_spi *elanspi;
+	struct input_dev *input_touch;
+
+	spi->bits_per_word = 8;
+	status = spi_setup(spi);
+
+	elanspi = devm_kzalloc(&spi->dev,
+			       sizeof(struct elan_tp_spi), GFP_KERNEL);
+	if (!elanspi)
+		return -ENOMEM;
+
+	input_touch = devm_input_allocate_device(&spi->dev);
+	if (!input_touch)
+		return dev_err_probe(&spi->dev, PTR_ERR(input_touch),
+				     "create input touch device failed\n");
+
+	elanspi->input_touch = input_touch;
+
+	elanspi->spi = spi;
+	spi_set_drvdata(spi, elanspi);
+
+	input_touch->name = "elan-touchpad";
+	input_set_abs_params(input_touch, ABS_MT_POSITION_X, 0, TOUCHPAD_WIDTH, 0, 0);
+	input_set_abs_params(input_touch, ABS_MT_POSITION_Y, 0, TOUCHPAD_HEIGHT, 0, 0);
+	input_set_abs_params(input_touch, ABS_MT_PRESSURE, 0, PRESSURE_MAX, 0, 0);
+	input_set_abs_params(input_touch, ABS_TOOL_WIDTH, 0, TOUCH_AREA, 0, 0);
+	input_mt_init_slots(input_touch, 3, INPUT_MT_POINTER | INPUT_MT_SEMI_MT);
+	input_set_drvdata(input_touch, elanspi);
+
+	status = input_register_device(input_touch);
+	if (status < 0)
+		return dev_err_probe(&elanspi->spi->dev, status, "input_register_device failed\n");
+
+	status = handle_hello_package(elanspi);
+	if (status < 0)
+		return dev_err_probe(&elanspi->spi->dev, status, "handle hello package failed\n");
+
+	status = init_touchpad(elanspi);
+	if (status < 0)
+		return dev_err_probe(&spi->dev, status, "init touchpad failed!\n");
+
+	status = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
+					   elan_tp_irq_handler, IRQF_ONESHOT,
+					   spi->dev.driver->name, elanspi);
+	if (status < 0)
+		return dev_err_probe(&spi->dev, status, "request_irq failed\n");
+
+	return 0;
+}
+
+static int elan_ektp1059_suspend(struct device *dev)
+{
+	disable_irq(to_spi_device(dev)->irq);
+	return 0;
+}
+
+static int elan_ektp1059_resume(struct device *dev)
+{
+	enable_irq(to_spi_device(dev)->irq);
+	return 0;
+}
+
+static const struct spi_device_id elan_ektp1059_id[] = {
+	{ "ektp1059", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, elan_ektp1059_id);
+
+static const struct of_device_id elan_ektp1059_of_spi_match[] = {
+	{ .compatible = "elan,ektp1059" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, elan_ektp1059_of_spi_match);
+
+static SIMPLE_DEV_PM_OPS(elan_ektp1059_pm, elan_ektp1059_suspend, elan_ektp1059_resume);
+
+static struct spi_driver elan_ektp1059_driver = {
+	.driver	= {
+		.name	 = "elan_ektp1059",
+		.of_match_table = elan_ektp1059_of_spi_match,
+		.pm = pm_ptr(&elan_ektp1059_pm),
+	},
+	.id_table = elan_ektp1059_id,
+	.probe	= elan_ektp1059_probe,
+};
+
+module_spi_driver(elan_ektp1059_driver);
+
+MODULE_DESCRIPTION("Elan eKTP1059 SPI touch pad");
+MODULE_LICENSE("GPL");

-- 
2.39.5


