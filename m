Return-Path: <linux-omap+bounces-1796-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E13C93F3D6
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 13:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 116E41F2287A
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 11:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED121465BC;
	Mon, 29 Jul 2024 11:20:30 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED814659A;
	Mon, 29 Jul 2024 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252030; cv=none; b=OH8bUSu5+Hw5SZ6eqE65kc49mKeF1N0ELxzOkZDuKMX3DiOIhXbwcgoKhN1WM5bUPfxWls5TDxbZx3MmAy/GPWAlya6fy/bj10xp5Z9ZL4DbNUqzX3yiMZz6BCoNe1IkRYaObAUgs7x47LqS0l3F82+y1JELCqpx7HJOtsvW3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252030; c=relaxed/simple;
	bh=LVJpEFw+iTXNq6RjhQO9aCqTH9U6N15FlPcyD1XU/ZE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iziMnn9Ax+6E2i++Uu4nhCE8iYdxiXRsa7Os8vBszDMmzE/H/FY+2ZliRiJ9xopOjRMnENIkMGOSpSIJuxz+Erxol1272Dzrwr+IwLubY/pTi8vu7I63VDkfOw9qvcfqE7kmN1hugj7ZemOXdsKmzj/gc3P5SOXykXDaX2JPK1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WXbTD6fzyz1xtrs;
	Mon, 29 Jul 2024 19:18:40 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 3145618001B;
	Mon, 29 Jul 2024 19:20:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 29 Jul
 2024 19:20:24 +0800
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
Subject: [PATCH v3] irqchip: Remove asmlinkage for handlers registered with set_handle_irq()
Date: Mon, 29 Jul 2024 19:26:06 +0800
Message-ID: <20240729112606.1581732-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi100008.china.huawei.com (7.221.188.57)

Currently, all architectures with set_handle_irq() call the root irqchip
handler from C code, so there's no need for these to be asmlinkage.

Remove asmlinkage for all handlers registered with set_handle_irq().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v3:
- Remove the wrong fix tag.
- Update the commit message.
- Add Acked-by.
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


