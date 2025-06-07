Return-Path: <linux-omap+bounces-3770-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F91AD0FBE
	for <lists+linux-omap@lfdr.de>; Sat,  7 Jun 2025 22:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D4AA16BBA0
	for <lists+linux-omap@lfdr.de>; Sat,  7 Jun 2025 20:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0A22163BB;
	Sat,  7 Jun 2025 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="CtaAVHhb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D2214209;
	Sat,  7 Jun 2025 20:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327772; cv=none; b=T4S4hEkVw7jz8EQKqp3QfQnCfN7fpLifdzSYDxRLq786eMrZWMf4YUcnbeejW6Z6sZTm0rKN00b2DV8gXDN5yvgjmep07kfI/2WoCbpxCaHAYi8W7vQxDKikIi3+L6ysxhSrI4SM4erSvR2WQShMFUzZxCMg1XH6c29IKUbDSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327772; c=relaxed/simple;
	bh=PXVbc7qziX7wyQpmvBeHw1IEKl5BICyNV/r4zYr8Q9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJt4He8VfC6ZLqmu28gHl58ILukg7Qa7PJrw19IF2ZzsISsek/amu2tVuP/qgykWWEMJiRepZzSiEMh/mXXR6/whMS+81fg2c1sqT8jeXPDlklVyUsjafG2IlS4dbd5IDAjNx1pSuQOICknVZEVO7AKQnEwmnIq58S+i4SP7mpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=CtaAVHhb; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=9s/wfk+unWYhlmqioNR6ZlXMVZtayZqWBr1Mup2bmEk=; b=CtaAVHhb09Ewv1O2
	6pl97eyhlA1ymYbTYXshyj1iJP3LBKIykxY8FwjjF0MvfAn1A0cjdq4GyrhwTSotl2O9vOggUBBhA
	fp0bprNT86I8Ra1Nko2ycEx9sWfNbQ0MaqletVx6YyjjcE4TVoqrbj18Iq7Hroc7h/zcy635GRpks
	Kzxk8Jw9zKScf6E8vGbVL9UY54AA2OB1YYSZt17Y7idXO3oetsvbuxxHFqbJhodG7FLWUpPr9nquJ
	HG+0PG6kvjBm4TbZVM0aMyFImqEj/BToHkgsOzrT+YfugQ52NGdKUyqHNmSXqrhdrNNtZHLSGB6Xl
	MrSrjBHMQkpz/ZlP3w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uO03l-008Cy1-19;
	Sat, 07 Jun 2025 20:22:33 +0000
From: linux@treblig.org
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com
Cc: lee@kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mfd: twl6030-irq: Remove unused twl6030_mmc_card_detect*
Date: Sat,  7 Jun 2025 21:22:32 +0100
Message-ID: <20250607202232.265344-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

twl6030_mmc_card_detect() and twl6030_mmc_card_detect_config() have
been unused since 2013's
commit b2ff4790612b ("ARM: OMAP2+: Remove legacy
omap4_twl6030_hsmmc_init")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mfd/twl6030-irq.c | 74 ---------------------------------------
 include/linux/mfd/twl.h   | 21 -----------
 2 files changed, 95 deletions(-)

diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 00b14cef1dfb..ffb4b98639c7 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -256,80 +256,6 @@ int twl6030_interrupt_mask(u8 bit_mask, u8 offset)
 }
 EXPORT_SYMBOL(twl6030_interrupt_mask);
 
-int twl6030_mmc_card_detect_config(void)
-{
-	int ret;
-	u8 reg_val = 0;
-
-	/* Unmasking the Card detect Interrupt line for MMC1 from Phoenix */
-	twl6030_interrupt_unmask(TWL6030_MMCDETECT_INT_MASK,
-						REG_INT_MSK_LINE_B);
-	twl6030_interrupt_unmask(TWL6030_MMCDETECT_INT_MASK,
-						REG_INT_MSK_STS_B);
-	/*
-	 * Initially Configuring MMC_CTRL for receiving interrupts &
-	 * Card status on TWL6030 for MMC1
-	 */
-	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &reg_val, TWL6030_MMCCTRL);
-	if (ret < 0) {
-		pr_err("twl6030: Failed to read MMCCTRL, error %d\n", ret);
-		return ret;
-	}
-	reg_val &= ~VMMC_AUTO_OFF;
-	reg_val |= SW_FC;
-	ret = twl_i2c_write_u8(TWL6030_MODULE_ID0, reg_val, TWL6030_MMCCTRL);
-	if (ret < 0) {
-		pr_err("twl6030: Failed to write MMCCTRL, error %d\n", ret);
-		return ret;
-	}
-
-	/* Configuring PullUp-PullDown register */
-	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &reg_val,
-						TWL6030_CFG_INPUT_PUPD3);
-	if (ret < 0) {
-		pr_err("twl6030: Failed to read CFG_INPUT_PUPD3, error %d\n",
-									ret);
-		return ret;
-	}
-	reg_val &= ~(MMC_PU | MMC_PD);
-	ret = twl_i2c_write_u8(TWL6030_MODULE_ID0, reg_val,
-						TWL6030_CFG_INPUT_PUPD3);
-	if (ret < 0) {
-		pr_err("twl6030: Failed to write CFG_INPUT_PUPD3, error %d\n",
-									ret);
-		return ret;
-	}
-
-	return irq_find_mapping(twl6030_irq->irq_domain,
-				 MMCDETECT_INTR_OFFSET);
-}
-EXPORT_SYMBOL(twl6030_mmc_card_detect_config);
-
-int twl6030_mmc_card_detect(struct device *dev, int slot)
-{
-	int ret = -EIO;
-	u8 read_reg = 0;
-	struct platform_device *pdev = to_platform_device(dev);
-
-	if (pdev->id) {
-		/* TWL6030 provide's Card detect support for
-		 * only MMC1 controller.
-		 */
-		pr_err("Unknown MMC controller %d in %s\n", pdev->id, __func__);
-		return ret;
-	}
-	/*
-	 * BIT0 of MMC_CTRL on TWL6030 provides card status for MMC1
-	 * 0 - Card not present ,1 - Card present
-	 */
-	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &read_reg,
-						TWL6030_MMCCTRL);
-	if (ret >= 0)
-		ret = read_reg & STS_MMC;
-	return ret;
-}
-EXPORT_SYMBOL(twl6030_mmc_card_detect);
-
 static int twl6030_irq_map(struct irq_domain *d, unsigned int virq,
 			      irq_hw_number_t hwirq)
 {
diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
index 85dc406173db..b31e07fa4d51 100644
--- a/include/linux/mfd/twl.h
+++ b/include/linux/mfd/twl.h
@@ -205,27 +205,6 @@ int twl_get_hfclk_rate(void);
 int twl6030_interrupt_unmask(u8 bit_mask, u8 offset);
 int twl6030_interrupt_mask(u8 bit_mask, u8 offset);
 
-/* Card detect Configuration for MMC1 Controller on OMAP4 */
-#ifdef CONFIG_TWL4030_CORE
-int twl6030_mmc_card_detect_config(void);
-#else
-static inline int twl6030_mmc_card_detect_config(void)
-{
-	pr_debug("twl6030_mmc_card_detect_config not supported\n");
-	return 0;
-}
-#endif
-
-/* MMC1 Controller on OMAP4 uses Phoenix irq for Card detect */
-#ifdef CONFIG_TWL4030_CORE
-int twl6030_mmc_card_detect(struct device *dev, int slot);
-#else
-static inline int twl6030_mmc_card_detect(struct device *dev, int slot)
-{
-	pr_debug("Call back twl6030_mmc_card_detect not supported\n");
-	return -EIO;
-}
-#endif
 /*----------------------------------------------------------------------*/
 
 /*
-- 
2.49.0


