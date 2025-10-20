Return-Path: <linux-omap+bounces-4721-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1EBF13E0
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 14:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0325E189ED5B
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE0731D73F;
	Mon, 20 Oct 2025 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ti/jR0Vx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79980313267;
	Mon, 20 Oct 2025 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963536; cv=none; b=rY5R2vrh/tQA3gEj8Jhg5PsNAzfUf3ySS+2aVciSO8rwnsr5OuYIbT0YEN43xLjtniA2F7TxeQHdBU8nHsdqfc2SRg5B7AjxhkOK3o1eVOdi7xWjsoAPUC8BYLBq65VqbpWZ5NBXm9enfnuSMf8uRZNUUtxJaIJMwekSDaltYq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963536; c=relaxed/simple;
	bh=4Az0RmeGplalZ9eht2c+C57JdAyT5N1+B/wTasFWVlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qz8gJjKRTIQT6hEb9Exh2/1l/UJsJ9HdEyJwRfpdZthHqurh5jDwmX5mBSzvxcolcdihjh7e6OlMow40mthAdL8TCJ6XBvwVf1i/NVQt6GrVsYievHoCw7USQTHIbZG0PHzIwGrhksZfHoKkLV/vSoU60SkP2s5TZsn6hDK2EOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ti/jR0Vx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B839FC19421;
	Mon, 20 Oct 2025 12:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963536;
	bh=4Az0RmeGplalZ9eht2c+C57JdAyT5N1+B/wTasFWVlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ti/jR0Vx+uDRQ0bsWxknvxWmmK/3uoTTNK3zLLP7t+iJCUvyVuHw0V+oP/fpPm0Kq
	 aF7kU17muUNdvBW/sUHOprVRZ0r0rLLjB9pXK9urAnqb9O88yCzkyUo9718m//0zOj
	 7G7xC4xo59TrENbrKJJezZlVbHv7fxEKtRMUDIqJa1rZQ5n0oejifNHhzCMGWgce2S
	 9amv2Bd+s36sMEOkAH8dFSijmY0BOdIsoiBm0CuHuqY1iRyJOIRrIOISfuQzb98J/O
	 Dqys20+gqLeZrOcsUu8eRrYzv0/GcZo6CXG1pt8kjQXyS1cbVUCjaCVEIcACXIIX3p
	 L7Mgd7YeUyX9Q==
From: akemnade@kernel.org
Date: Mon, 20 Oct 2025 14:31:59 +0200
Subject: [PATCH 2/3] Input: add TWL603x power button
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
In-Reply-To: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=4978; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=e303O4GGtezsM8shUqvPqzZkAq5B2GTXOvham2sBuVw=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDBnftI99DjXl01ec9bY38XhsdA/vjIgENduY3xJHW0zf+
 lRe2Hmuo5SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIkw32X4pyffGnw+b6LD4ygD
 mRT/MGUzf9UpDnl7CoQihKbtiy69xvBP/7uyXkLWiylX3D9weK+p3HW8Okto6d+0PyZCOwTkn7K
 yAwA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

Like the TWL4030, these PMICs also have a power button feature, so add
a driver for it.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/input/misc/Kconfig             |  10 +++
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/twl6030-pwrbutton.c | 111 +++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index cc2558630797e..5e2d1a5116502 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -569,6 +569,16 @@ config INPUT_TWL4030_VIBRA
 	  To compile this driver as a module, choose M here. The module will
 	  be called twl4030_vibra.
 
+config INPUT_TWL6030_PWRBUTTON
+	tristate "TWL6030 Power button Driver"
+	depends on TWL4030_CORE
+	help
+	  Say Y here if you want to enable power key reporting via the
+	  TWL6030 family of chips.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called twl4030_pwrbutton.
+
 config INPUT_TWL6040_VIBRA
 	tristate "Support for TWL6040 Vibrator"
 	depends on TWL6040_CORE
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index f5ebfa9d99831..596c013261f44 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_INPUT_TPS65219_PWRBUTTON)	+= tps65219-pwrbutton.o
 obj-$(CONFIG_INPUT_TPS6594_PWRBUTTON)	+= tps6594-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_PWRBUTTON)	+= twl4030-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_VIBRA)	+= twl4030-vibra.o
+obj-$(CONFIG_INPUT_TWL6030_PWRBUTTON)	+= twl6030-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL6040_VIBRA)	+= twl6040-vibra.o
 obj-$(CONFIG_INPUT_UINPUT)		+= uinput.o
 obj-$(CONFIG_INPUT_WISTRON_BTNS)	+= wistron_btns.o
diff --git a/drivers/input/misc/twl6030-pwrbutton.c b/drivers/input/misc/twl6030-pwrbutton.c
new file mode 100644
index 0000000000000..fb3d8dcc9088a
--- /dev/null
+++ b/drivers/input/misc/twl6030-pwrbutton.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * TWL603x power button input driver
+ *
+ * Copyright (C) 2024 Andreas Kemnade <andreas@kemnade.info>
+ *
+ * based on older 6030 driver found in a v3.0 vendor kernel
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/twl.h>
+
+#define PWR_PWRON_IRQ BIT(0)
+
+#define STS_HW_CONDITIONS 0x2
+
+static irqreturn_t powerbutton_irq(int irq, void *_pwr)
+{
+	struct input_dev *pwr = _pwr;
+	int err;
+	u8 value;
+
+	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &value, STS_HW_CONDITIONS);
+	if (err)
+		return IRQ_HANDLED;
+
+	pm_wakeup_event(pwr->dev.parent, 0);
+	input_report_key(pwr, KEY_POWER, value & PWR_PWRON_IRQ);
+	input_sync(pwr);
+
+	return IRQ_HANDLED;
+}
+
+static int twl6030_pwrbutton_probe(struct platform_device *pdev)
+{
+	struct input_dev *pwr;
+	int irq = platform_get_irq(pdev, 0);
+	int err;
+
+	pwr = devm_input_allocate_device(&pdev->dev);
+	if (!pwr) {
+		dev_err(&pdev->dev, "Can't allocate power button\n");
+		return -ENOMEM;
+	}
+
+	input_set_capability(pwr, EV_KEY, KEY_POWER);
+	pwr->name = "twl6030_pwrbutton";
+	pwr->phys = "twl6030_pwrbutton/input0";
+	pwr->dev.parent = &pdev->dev;
+
+	err = devm_request_threaded_irq(&pdev->dev, irq, NULL, powerbutton_irq,
+			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING |
+			IRQF_ONESHOT,
+			"twl6030_pwrbutton", pwr);
+	if (err < 0) {
+		dev_err(&pdev->dev, "Can't get IRQ for pwrbutton: %d\n", err);
+		return err;
+	}
+
+	err = input_register_device(pwr);
+	if (err) {
+		dev_err(&pdev->dev, "Can't register power button: %d\n", err);
+		return err;
+	}
+
+	err = twl6030_interrupt_unmask(0x01, REG_INT_MSK_LINE_A);
+	if (err < 0)
+		return err;
+
+	err = twl6030_interrupt_unmask(0x01, REG_INT_MSK_STS_A);
+	if (err < 0)
+		return err;
+
+	device_init_wakeup(&pdev->dev, true);
+
+	return 0;
+}
+
+static void twl6030_pwrbutton_remove(struct platform_device *pdev)
+{
+	twl6030_interrupt_mask(0x01, REG_INT_MSK_LINE_A);
+	twl6030_interrupt_mask(0x01, REG_INT_MSK_STS_A);
+}
+
+static const struct of_device_id twl6030_pwrbutton_dt_match_table[] = {
+	{ .compatible = "ti,twl6030-pwrbutton" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, twl6030_pwrbutton_dt_match_table);
+
+static struct platform_driver twl6030_pwrbutton_driver = {
+	.probe		= twl6030_pwrbutton_probe,
+	.remove		= twl6030_pwrbutton_remove,
+	.driver		= {
+		.name	= "twl6030_pwrbutton",
+		.of_match_table = of_match_ptr(twl6030_pwrbutton_dt_match_table),
+	},
+};
+module_platform_driver(twl6030_pwrbutton_driver);
+
+MODULE_ALIAS("platform:twl6030_pwrbutton");
+MODULE_DESCRIPTION("Phoenix Power Button");
+MODULE_LICENSE("GPL");

-- 
2.47.3


