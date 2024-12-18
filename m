Return-Path: <linux-omap+bounces-2852-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B04039F5C80
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2024 02:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C921886554
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2024 01:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E45F481B3;
	Wed, 18 Dec 2024 01:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="g/C4WVSU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5FA926;
	Wed, 18 Dec 2024 01:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734487185; cv=none; b=GbbwzXrmqXAADNcW8C70yrFTWmonK8CBruzOYWDeuYJEsHjp8HqonHfe8Xl9oXPfL3b+MXWc2lVcI2289puilL254YObCu82Ixoku+W9ttwMX4WA8/i4kur3EbUzKpj5weI2r8+TY4vsqROC4AKBU+7g/sUkz3MLGz0pC45n11M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734487185; c=relaxed/simple;
	bh=W03IX5VLQM98hWwX84tt3jf1J2lDmn9SD7vJN0A9U+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6nSKxV0YsQT15+sWYUmmzisNASm++QlKoLxjztFv2Sl3182QHT7NwchPWpWR+u4P2/irjX6Riy++JBwFuwQSMXXhhzcJZu7DP/TYQAoUzdMybim0s0kdK9K/iAUsBM+VkeATU8eEglbG03kliDX2XxZ5BE/25FCCZO2m2oLHPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=g/C4WVSU; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=fvWjV+WoCvCiUYH1QrxuKTN+iR1HO0UZuMqDsRyqOqw=; b=g/C4WVSUvDeIq7GW
	w7cysvSH60gmvv+5KYRAzatIkkHzvqaUF5zREVdCB84OlYw1lKSRBlIaWK74DSotn8/0kCNNuP8cc
	GThBcrYgZRf8v7BDHEQ0NiHYazHtDjqTtn4ckwqCc8rW34NzVXuJuL/hckWDLmKE9soDygakcGscP
	3sFdWp6B5g80DqhhJTMkxPCWdT6X41tKUj0zmrWJ+4DAZ2YJJkaSdTYqXsyRnnQvlwpbdobC+NN0F
	lwLsKEYqvW92lW5yNsAPE8HqsGiJybz1WS68rSa69eLjcEDAymgeubZGFe7/nRYalpRdEE2O5YQdh
	sv7IHIj4ctn/Zyi8og==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tNjLe-0060Ro-17;
	Wed, 18 Dec 2024 01:59:38 +0000
From: linux@treblig.org
To: deller@gmx.de,
	linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] fbdev: omapfb: Remove unused hdmi5_core_handle_irqs
Date: Wed, 18 Dec 2024 01:59:37 +0000
Message-ID: <20241218015937.278817-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hdmi5_core_handle_irqs() has been unused since
commit f5bab2229190 ("OMAPDSS: HDMI: Add OMAP5 HDMI support")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../video/fbdev/omap2/omapfb/dss/hdmi5_core.c   | 17 -----------------
 .../video/fbdev/omap2/omapfb/dss/hdmi5_core.h   |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
index b33f62c5cb22..bb7fe54dd019 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
@@ -567,23 +567,6 @@ static void hdmi_core_enable_interrupts(struct hdmi_core_data *core)
 	REG_FLD_MOD(core->base, HDMI_CORE_IH_MUTE, 0x0, 1, 0);
 }
 
-int hdmi5_core_handle_irqs(struct hdmi_core_data *core)
-{
-	void __iomem *base = core->base;
-
-	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT1, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT2, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_AS_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_PHY_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_I2CM_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_CEC_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_VP_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_I2CMPHY_STAT0, 0xff, 7, 0);
-
-	return 0;
-}
-
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 		struct hdmi_config *cfg)
 {
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
index 192c9b6e2f7b..493857374a15 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
@@ -283,7 +283,6 @@ struct csc_table {
 
 int hdmi5_read_edid(struct hdmi_core_data *core, u8 *edid, int len);
 void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s);
-int hdmi5_core_handle_irqs(struct hdmi_core_data *core);
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 			struct hdmi_config *cfg);
 int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core);
-- 
2.47.1


