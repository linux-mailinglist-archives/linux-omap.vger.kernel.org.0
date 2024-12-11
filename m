Return-Path: <linux-omap+bounces-2808-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B889D9ED8E8
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 22:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EEA4166C97
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 21:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103811D90DC;
	Wed, 11 Dec 2024 21:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="g/Z/rpe8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9DC1C5CDB;
	Wed, 11 Dec 2024 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953355; cv=none; b=GCeEuXj936B2YFsqY70y/JYOiUaiqKovNOSvO9qmhAPgHAB3PB8wySy3P7j/EqP5c8dd1RxEyzstnSHICR7e0bUlgKD+qwWcNwLBDhmEnQ2iFPKrWBH52vSVOXAkiH2uRox+hnyJLkn085gZ6hNxZCnntrCha4MxqF+jbbB+uPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953355; c=relaxed/simple;
	bh=UiAELSFlAlsxwUYcZoX9iDC6MlWG0QELd22+8nBYZAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeZ29udUVWaHjxqHDu4fCXU+yn/A8bGFeLcS6rdgFR2/E0VP+lvJTVNMLGojelMJtpFYg0r9xNGiJcLt7xPugdkXLJjL6f0K3M6l7iOQ+wX/gZUOOXs8kI3WwJlu/fTg1SVSGiT+fI8dOIrBdSDWqtIguR1azpPz0TteOPxjZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=g/Z/rpe8; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Aho2c6nq9ZqrZ2tGciOBmhkUlhfT3Vjf9PraO/Wy8pM=; b=g/Z/rpe85Ojm/qZ0
	moNa6nwnDGenR5dbVILOMvBlM0rgx6bO4mDIEVOuMvuBGYqpAZYBZVRsWSDufSEX7WFoOU+n/3fMR
	ro5DHgwd99wiBPXi2GV46G60Ieg1tOrtB65kKj1N1ht1vzqe8mmY1CWUAM5EZKICZhZdeYqwqu5xM
	fWef1QbzLJI9SpivUhpRSN0Zq3sKRIutF+znN1abW3kFYWjOburWrsnBWtMo6eTheQMwTs+gzcvxy
	DJOt1adFlx89FOtZy6dmVp/CplY/S4zOwkWmPxYTtOyciMzV88K4YZMlmTtlGPfnfd5oxpC0T3D4k
	MK+2SkO8/Sg+T1yCwg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tLUTU-004rSr-0u;
	Wed, 11 Dec 2024 21:42:28 +0000
From: linux@treblig.org
To: rogerq@kernel.org,
	tony@atomide.com,
	krzk@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] memory: omap-gpmc: deadcode a pair of functions
Date: Wed, 11 Dec 2024 21:42:27 +0000
Message-ID: <20241211214227.107980-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

gpmc_get_client_irq() last use was removed by
commit ac28e47ccc3f ("ARM: OMAP2+: Remove legacy gpmc-nand.c")

gpmc_ticks_to_ns() last use was removed by
commit 2514830b8b8c ("ARM: OMAP2+: Remove gpmc-onenand")

Remove them.

gpmc_clk_ticks_to_ns() is now only used in some DEBUG
code; move inside the ifdef to avoid unused warnings.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/memory/omap-gpmc.c | 33 +++++++--------------------------
 include/linux/omap-gpmc.h  |  4 ----
 2 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 50eb9f49512b..e2a75a52563f 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -358,17 +358,6 @@ static unsigned int gpmc_ps_to_ticks(unsigned int time_ps)
 	return (time_ps + tick_ps - 1) / tick_ps;
 }
 
-static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
-					 enum gpmc_clk_domain cd)
-{
-	return ticks * gpmc_get_clk_period(cs, cd) / 1000;
-}
-
-unsigned int gpmc_ticks_to_ns(unsigned int ticks)
-{
-	return gpmc_clk_ticks_to_ns(ticks, /* any CS */ 0, GPMC_CD_FCLK);
-}
-
 static unsigned int gpmc_ticks_to_ps(unsigned int ticks)
 {
 	return ticks * gpmc_get_fclk_period();
@@ -415,6 +404,13 @@ static void gpmc_cs_bool_timings(int cs, const struct gpmc_bool_timings *p)
 }
 
 #ifdef CONFIG_OMAP_GPMC_DEBUG
+
+static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
+					 enum gpmc_clk_domain cd)
+{
+	return ticks * gpmc_get_clk_period(cs, cd) / 1000;
+}
+
 /**
  * get_gpmc_timing_reg - read a timing parameter and print DTS settings for it.
  * @cs:      Chip Select Region
@@ -1295,21 +1291,6 @@ int gpmc_omap_onenand_set_timings(struct device *dev, int cs, int freq,
 }
 EXPORT_SYMBOL_GPL(gpmc_omap_onenand_set_timings);
 
-int gpmc_get_client_irq(unsigned int irq_config)
-{
-	if (!gpmc_irq_domain) {
-		pr_warn("%s called before GPMC IRQ domain available\n",
-			__func__);
-		return 0;
-	}
-
-	/* we restrict this to NAND IRQs only */
-	if (irq_config >= GPMC_NR_NAND_IRQS)
-		return 0;
-
-	return irq_create_mapping(gpmc_irq_domain, irq_config);
-}
-
 static int gpmc_irq_endis(unsigned long hwirq, bool endis)
 {
 	u32 regval;
diff --git a/include/linux/omap-gpmc.h b/include/linux/omap-gpmc.h
index c9e3843d2dd5..263b915df1fb 100644
--- a/include/linux/omap-gpmc.h
+++ b/include/linux/omap-gpmc.h
@@ -66,10 +66,6 @@ extern int gpmc_calc_timings(struct gpmc_timings *gpmc_t,
 
 struct device_node;
 
-extern int gpmc_get_client_irq(unsigned irq_config);
-
-extern unsigned int gpmc_ticks_to_ns(unsigned int ticks);
-
 extern void gpmc_cs_write_reg(int cs, int idx, u32 val);
 extern int gpmc_calc_divider(unsigned int sync_clk);
 extern int gpmc_cs_set_timings(int cs, const struct gpmc_timings *t,
-- 
2.47.1


