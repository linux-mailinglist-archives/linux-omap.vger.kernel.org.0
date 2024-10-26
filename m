Return-Path: <linux-omap+bounces-2489-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194A9B1B29
	for <lists+linux-omap@lfdr.de>; Sun, 27 Oct 2024 00:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24ADF1C20C33
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2024 22:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A7B1D618C;
	Sat, 26 Oct 2024 22:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="NDQeZixg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C05101C8;
	Sat, 26 Oct 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980100; cv=none; b=dMvyzRHRzaKIZAarle6NtrVJifbEWIrok1SARYrD+KDn52VOo82QWmyvynUcM4ssgkKrErZc0Zsnc/l5i44nVIiyqDr1ARQlJBITZzDyEAgEHiwH3JjwQ70hCEJzzleSTjmCEp02tW7E/2WOPMxjwv7fLcS4EURg8S2RN5zAfG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980100; c=relaxed/simple;
	bh=8fJQz/BTb7TRwut177m4y48AxV7cHhFaHMeQ+gl+11s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8OZXXLY4GWsYfQpEneX+X/zNmf3kcN+8uZwtqWKz7dP8pujlYa1DSew5qlhoDIyMf8oanIYDMk/1qMQCeg4RyYG4eXfFl7GjNOEO4vXT0wl4F2iL0ubblaQx5tNvZeN/x0+yFc2glQ9sfXDMtGymh5a7yhNG/1WpvKR8Lk8v4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=NDQeZixg; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=qhyyxt3+fwlP6e+aCR51ac6iwRI01AJeU0CzuMQ+1V8=; b=NDQeZixgWW/MNKeP
	JOK07FjY++WDNsSZcBbAjcMBeO8tihqOmUKK/lwiKy/ZS+OK9uUO8dFYvjvhkNLbFW5e5XLT01+XX
	kGaA6ZC8I/24mdRKvX/w8Jylrsk5YLQKRatTb9IFSALwOo/dG4+N4ZthpHGsA7FOndSRss4DdgZc+
	q4cqpDUKxrFcU/Ndw4kxUXLMXohu3Hq/BZI3ujxKwO/ggudZPvfUSQImCqkRraCZM7to8dUG/Gcm5
	jnqz9eYcUSxc0CAkXO4W/MsiKw0FRNRdxeQPq4p3vTbmpSO8ahVvUs+9e8pEH9h1p7dG3BUOqYcav
	1FI/6zthyEsOYjNokg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1t4oqk-00Djna-2u;
	Sat, 26 Oct 2024 22:01:34 +0000
From: linux@treblig.org
To: deller@gmx.de,
	u.kleine-koenig@baylibre.com,
	linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] fbdev: omapfb: Remove some deadcode
Date: Sat, 26 Oct 2024 23:01:33 +0100
Message-ID: <20241026220133.93956-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

commit f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
took a copy of the omapdrm code into omapfb, however at that point
a couple of functions were already unused at that point.

Remove dispc_mgr_get_clock_div() and dispc_enable_fifomerge() from
the omapfb copy.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 27 --------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  3 ---
 2 files changed, 30 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 5832485ab998..c3329c8b4c16 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -1230,17 +1230,6 @@ void dispc_ovl_set_fifo_threshold(enum omap_plane plane, u32 low, u32 high)
 		dispc_write_reg(DISPC_OVL_PRELOAD(plane), min(high, 0xfffu));
 }
 
-void dispc_enable_fifomerge(bool enable)
-{
-	if (!dss_has_feature(FEAT_FIFO_MERGE)) {
-		WARN_ON(enable);
-		return;
-	}
-
-	DSSDBG("FIFO merge %s\n", enable ? "enabled" : "disabled");
-	REG_FLD_MOD(DISPC_CONFIG, enable ? 1 : 0, 14, 14);
-}
-
 void dispc_ovl_compute_fifo_thresholds(enum omap_plane plane,
 		u32 *fifo_low, u32 *fifo_high, bool use_fifomerge,
 		bool manual_update)
@@ -3656,22 +3645,6 @@ void dispc_mgr_set_clock_div(enum omap_channel channel,
 	dispc_mgr_set_lcd_divisor(channel, cinfo->lck_div, cinfo->pck_div);
 }
 
-int dispc_mgr_get_clock_div(enum omap_channel channel,
-		struct dispc_clock_info *cinfo)
-{
-	unsigned long fck;
-
-	fck = dispc_fclk_rate();
-
-	cinfo->lck_div = REG_GET(DISPC_DIVISORo(channel), 23, 16);
-	cinfo->pck_div = REG_GET(DISPC_DIVISORo(channel), 7, 0);
-
-	cinfo->lck = fck / cinfo->lck_div;
-	cinfo->pck = cinfo->lck / cinfo->pck_div;
-
-	return 0;
-}
-
 u32 dispc_read_irqstatus(void)
 {
 	return dispc_read_reg(DISPC_IRQSTATUS);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.h b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
index 21cfcbf74a6d..a33a43f26829 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
@@ -366,7 +366,6 @@ void dispc_disable_sidle(void);
 
 void dispc_lcd_enable_signal(bool enable);
 void dispc_pck_free_enable(bool enable);
-void dispc_enable_fifomerge(bool enable);
 void dispc_enable_gamma_table(bool enable);
 
 typedef bool (*dispc_div_calc_func)(int lckd, int pckd, unsigned long lck,
@@ -388,8 +387,6 @@ void dispc_ovl_compute_fifo_thresholds(enum omap_plane plane,
 
 void dispc_mgr_set_clock_div(enum omap_channel channel,
 		const struct dispc_clock_info *cinfo);
-int dispc_mgr_get_clock_div(enum omap_channel channel,
-		struct dispc_clock_info *cinfo);
 void dispc_set_tv_pclk(unsigned long pclk);
 
 u32 dispc_read_irqstatus(void);
-- 
2.47.0


