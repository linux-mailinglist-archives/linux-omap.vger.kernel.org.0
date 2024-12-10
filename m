Return-Path: <linux-omap+bounces-2801-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AED9EBD7B
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2024 23:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04EF2286B22
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2024 22:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB0A23F9FA;
	Tue, 10 Dec 2024 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="VFPapy/4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307123A566;
	Tue, 10 Dec 2024 22:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733868397; cv=none; b=vGFs+FcRl8xMDJOkPMO4oba7X3QPCjo7FhFSEu5ucZANibglDCObShRs4ypycSsuq+6nUfCBJtd6Mhnw+joBueEYlLqLQUJUiVsusOquMdyAm5ePm+fZHz9QUkP/qah1Xt0dUPxt4cSrhQRrMYNJCsfObgIGJu/cDirmzL1UnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733868397; c=relaxed/simple;
	bh=ncIqpPZya/TXWoopDaHFUdestRVYRZs7odUJTTe3Xlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bn9Tzn64saex1Diu+9yBvcf3TjP2fv4bldkQ6olhg1RvfZk8JvH8AGC8noZD36gcPSboNRfQwf76+d/pBnG/Ay1O/FpdzsxFPpEm/WeEoOU/85ePlIgjN3mkr3ijJqrLZwgvUpnGpjn9+eexGkI7kObb3U4YRICHJcTZ7x9Whik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=VFPapy/4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=9tWD1xMRpiLjRra+9YFo+krQWdvFYqzGf7KvSAf8HBw=; b=VFPapy/4RMt0824F
	cGNrUhU7YsStbfUppwo8/UBUFe8V9GippvwDB1poxnMKtt/N7of2YO5d5RwDsggojhafCptbt1QGa
	hjA8DEq6Qg9JVHkQi4fww7d4LAIilmC9wpqofJHplMbWfsKepB+imovYy2zcpyeFyAYsSd8mrMGl5
	zFsyg6txYvPIcm1H7ukA9CI9kYK7L9ahA53XF6zBunCQ1sivQ4bsiKiMuLSrmIKtoK7uUQFfJ+S88
	7pjbP4YUofPALsSJOlbDMP3Zk2Go6g8o/5qfj9DusEinlhGljGB50IQEbJCJGKlvea9YumcN1FPfV
	GMm+SZlK8zL6XceIQg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tL8NB-004cTz-2Y;
	Tue, 10 Dec 2024 22:06:29 +0000
From: linux@treblig.org
To: rogerq@kernel.org,
	tony@atomide.com,
	krzk@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] memory: omap-gpmc: deadcode a pair of functions
Date: Tue, 10 Dec 2024 22:06:28 +0000
Message-ID: <20241210220628.237604-1-linux@treblig.org>
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

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/memory/omap-gpmc.c | 20 --------------------
 include/linux/omap-gpmc.h  |  4 ----
 2 files changed, 24 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 50eb9f49512b..3922cf775da6 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -364,11 +364,6 @@ static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
 	return ticks * gpmc_get_clk_period(cs, cd) / 1000;
 }
 
-unsigned int gpmc_ticks_to_ns(unsigned int ticks)
-{
-	return gpmc_clk_ticks_to_ns(ticks, /* any CS */ 0, GPMC_CD_FCLK);
-}
-
 static unsigned int gpmc_ticks_to_ps(unsigned int ticks)
 {
 	return ticks * gpmc_get_fclk_period();
@@ -1295,21 +1290,6 @@ int gpmc_omap_onenand_set_timings(struct device *dev, int cs, int freq,
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


