Return-Path: <linux-omap+bounces-1793-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B896693EB7A
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 04:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B96A280EC0
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 02:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800E67D09D;
	Mon, 29 Jul 2024 02:42:21 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349A7D3E3;
	Mon, 29 Jul 2024 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722220941; cv=none; b=igC8DoJewZb2Qgo3tLY7bE6GaHc9lE4Bsk4kZ5xv+VQBscvoT2iC4eCt/cwDsWLaaSnWug7Z+tXb5024EwgskR/6NMVUUo0JDBnXgKrWvvCSMq7J1c7crDrRsmY/lM1fpcn8bYyQeMlUv9nt5q46uydvhjYxz5EOhzz7cSR9zU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722220941; c=relaxed/simple;
	bh=6EyGrih+TLE1bK/ZB3qoxOGTrhbl6egCIJT0swzXEGY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lcaZuuG/7wV8oUgM0CVP4HQtVh4CCD0sPMHOP6yPoMCYQC+CR5KlrWHlJKhvM3w9nzVEJaAWHa1o99xkJFdeBe0lck9eL3hnpcL4q3NBE7H1qyUegwtFhSXS/vkJmMTZJMy+d2ZaKdvSFxUxKuL6fStoISwvCYQ5O4yNGHOY4js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WXMw83yz9z28fsx;
	Mon, 29 Jul 2024 10:37:44 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E3841A0188;
	Mon, 29 Jul 2024 10:42:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 29 Jul
 2024 10:42:14 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tglx@linutronix.de>, <maz@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<shc_work@mail.ru>, <linusw@kernel.org>, <kaloz@openwrt.org>,
	<aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
	<rogerq@kernel.org>, <tony@atomide.com>, <joey.gouly@arm.com>,
	<catalin.marinas@arm.com>, <mark.rutland@arm.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-omap@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] irqchip: Remove asmlinkage for *handle_irq() functions
Date: Mon, 29 Jul 2024 10:47:52 +0800
Message-ID: <20240729024752.1250618-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi100008.china.huawei.com (7.221.188.57)

Since commit 064dbfb41691 ("arm64: entry: convert IRQ+FIQ handlers to C"),
the gic_handle_irq() is only called by C functions.

And since commit a7b0872e964c ("irq: arm: perform irqentry in entry code"),
aic_handle(), aic5_handle(), clps711x_irqh(), davinci_cp_intc_handle_irq(),
ft010_irqchip_handle_irq(), ixp4xx_handle_irq(), omap_intc_handle_irq(),
sa1100_handle_irq() and fpga_handle_irq() are only called by C functions.

So remove the asmlinkages.

Fixes: 064dbfb41691 ("arm64: entry: convert IRQ+FIQ handlers to C")
Fixes: a7b0872e964c ("irq: arm: perform irqentry in entry code")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
---
v2:
- Also fix for arm32 irqchip as Thomas suggested.
- Add Suggested-by.
---
 drivers/irqchip/irq-atmel-aic.c       | 3 +--
 drivers/irqchip/irq-atmel-aic5.c      | 3 +--
 drivers/irqchip/irq-clps711x.c        | 2 +-
 drivers/irqchip/irq-davinci-cp-intc.c | 3 +--
 drivers/irqchip/irq-ftintc010.c       | 2 +-
 drivers/irqchip/irq-gic-v3.c          | 2 +-
 drivers/irqchip/irq-ixp4xx.c          | 3 +--
 drivers/irqchip/irq-omap-intc.c       | 3 +--
 drivers/irqchip/irq-sa11x0.c          | 3 +--
 drivers/irqchip/irq-versatile-fpga.c  | 2 +-
 10 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-aic.c
index 4631f6847953..3839ad79ad31 100644
--- a/drivers/irqchip/irq-atmel-aic.c
+++ b/drivers/irqchip/irq-atmel-aic.c
@@ -57,8 +57,7 @@
 
 static struct irq_domain *aic_domain;
 
-static asmlinkage void __exception_irq_entry
-aic_handle(struct pt_regs *regs)
+static void __exception_irq_entry aic_handle(struct pt_regs *regs)
 {
 	struct irq_domain_chip_generic *dgc = aic_domain->gc;
 	struct irq_chip_generic *gc = dgc->gc[0];
diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index 145535bd7560..c0f55dc7b050 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -67,8 +67,7 @@
 
 static struct irq_domain *aic5_domain;
 
-static asmlinkage void __exception_irq_entry
-aic5_handle(struct pt_regs *regs)
+static void __exception_irq_entry aic5_handle(struct pt_regs *regs)
 {
 	struct irq_chip_generic *bgc = irq_get_domain_generic_chip(aic5_domain, 0);
 	u32 irqnr;
diff --git a/drivers/irqchip/irq-clps711x.c b/drivers/irqchip/irq-clps711x.c
index e731e0784f7e..806ebb1de201 100644
--- a/drivers/irqchip/irq-clps711x.c
+++ b/drivers/irqchip/irq-clps711x.c
@@ -69,7 +69,7 @@ static struct {
 	struct irq_domain_ops	ops;
 } *clps711x_intc;
 
-static asmlinkage void __exception_irq_entry clps711x_irqh(struct pt_regs *regs)
+static void __exception_irq_entry clps711x_irqh(struct pt_regs *regs)
 {
 	u32 irqstat;
 
diff --git a/drivers/irqchip/irq-davinci-cp-intc.c b/drivers/irqchip/irq-davinci-cp-intc.c
index 7482c8ed34b2..f4f8e9fadbbf 100644
--- a/drivers/irqchip/irq-davinci-cp-intc.c
+++ b/drivers/irqchip/irq-davinci-cp-intc.c
@@ -116,8 +116,7 @@ static struct irq_chip davinci_cp_intc_irq_chip = {
 	.flags		= IRQCHIP_SKIP_SET_WAKE,
 };
 
-static asmlinkage void __exception_irq_entry
-davinci_cp_intc_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry davinci_cp_intc_handle_irq(struct pt_regs *regs)
 {
 	int gpir, irqnr, none;
 
diff --git a/drivers/irqchip/irq-ftintc010.c b/drivers/irqchip/irq-ftintc010.c
index 359efc1d1be7..b91c358ea6db 100644
--- a/drivers/irqchip/irq-ftintc010.c
+++ b/drivers/irqchip/irq-ftintc010.c
@@ -125,7 +125,7 @@ static struct irq_chip ft010_irq_chip = {
 /* Local static for the IRQ entry call */
 static struct ft010_irq_data firq;
 
-static asmlinkage void __exception_irq_entry ft010_irqchip_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry ft010_irqchip_handle_irq(struct pt_regs *regs)
 {
 	struct ft010_irq_data *f = &firq;
 	int irq;
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index c19083bfb943..0efa3443c323 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -930,7 +930,7 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 	__gic_handle_nmi(irqnr, regs);
 }
 
-static asmlinkage void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
 	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
index 5fba907b9052..f23b02f62a5c 100644
--- a/drivers/irqchip/irq-ixp4xx.c
+++ b/drivers/irqchip/irq-ixp4xx.c
@@ -105,8 +105,7 @@ static void ixp4xx_irq_unmask(struct irq_data *d)
 	}
 }
 
-static asmlinkage void __exception_irq_entry
-ixp4xx_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry ixp4xx_handle_irq(struct pt_regs *regs)
 {
 	struct ixp4xx_irq *ixi = &ixirq;
 	unsigned long status;
diff --git a/drivers/irqchip/irq-omap-intc.c b/drivers/irqchip/irq-omap-intc.c
index dc82162ba763..ad84a2f03368 100644
--- a/drivers/irqchip/irq-omap-intc.c
+++ b/drivers/irqchip/irq-omap-intc.c
@@ -325,8 +325,7 @@ static int __init omap_init_irq(u32 base, struct device_node *node)
 	return ret;
 }
 
-static asmlinkage void __exception_irq_entry
-omap_intc_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry omap_intc_handle_irq(struct pt_regs *regs)
 {
 	extern unsigned long irq_err_count;
 	u32 irqnr;
diff --git a/drivers/irqchip/irq-sa11x0.c b/drivers/irqchip/irq-sa11x0.c
index 31c202a1ae62..9d0b80271949 100644
--- a/drivers/irqchip/irq-sa11x0.c
+++ b/drivers/irqchip/irq-sa11x0.c
@@ -127,8 +127,7 @@ static int __init sa1100irq_init_devicefs(void)
 
 device_initcall(sa1100irq_init_devicefs);
 
-static asmlinkage void __exception_irq_entry
-sa1100_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry sa1100_handle_irq(struct pt_regs *regs)
 {
 	uint32_t icip, icmr, mask;
 
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 5018a06060e6..ca471c6fee99 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -128,7 +128,7 @@ static int handle_one_fpga(struct fpga_irq_data *f, struct pt_regs *regs)
  * Keep iterating over all registered FPGA IRQ controllers until there are
  * no pending interrupts.
  */
-static asmlinkage void __exception_irq_entry fpga_handle_irq(struct pt_regs *regs)
+static void __exception_irq_entry fpga_handle_irq(struct pt_regs *regs)
 {
 	int i, handled;
 
-- 
2.34.1


