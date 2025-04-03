Return-Path: <linux-omap+bounces-3537-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6ADA7AF8D
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 22:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657B41892DFA
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 20:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD652E62A3;
	Thu,  3 Apr 2025 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URasdw7Y"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DA82E5DC0;
	Thu,  3 Apr 2025 19:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708071; cv=none; b=qadW/l35MQqB74QGAtRroJ552wOz0YYFEgXTWTpS723ur7nYNuVaZYP3NIgNVrLn5RQgi9ES0dCcQ45zOVb04ohlfLioik07LFLiaQzYVKKLj4XJSJWct8nq9ioqKWmct+Ed6J1ndgroadAhGlBP2duM0iMj2wQgupPFCqnrxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708071; c=relaxed/simple;
	bh=YOPuyiUY3GxPp++wU/RIprdHiMfY/V+JLjOaL0Fp508=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzu0TWehq2udE9dOlVvLK79xJCG+u0kc8S4nNGSWougnT08iLAYusNN+k51IrEjZgcIGwIZCi0hcIN3g/fVDJKEEgxXGexWnCh48MmHHchXwHHMcpZqA7m+nafrcqHuEpo8g8u81+pmpjJT6BoLEbPz9dWD1gArCgqJuftxPpbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URasdw7Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EE2C4CEE8;
	Thu,  3 Apr 2025 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708070;
	bh=YOPuyiUY3GxPp++wU/RIprdHiMfY/V+JLjOaL0Fp508=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=URasdw7YY5QDkkKjVqxn0TVsNDYvyCvfdpB81ren8r8gGMIDtZHn+p/DFxE/F/Aw6
	 /R67zYwJqgh20vk4zmCLxjFuSPbP2nvsKGw09hdy0Yco92LP89Jasf0PyDrO8lruZL
	 xVCW/jgtjGh/sp4Y/jooaexbpUorst/QAVH9wcDPvQnyejVHTYM0j3oCljUP7T3b+s
	 ZpydvHhU2KKf1CbwesfHwxBGWZ8Zd6TwAXOxVSe0zCu875W63KLbUDXgw21WZMvBMI
	 SES5S+4m5SVG+HypzE7oHCVCgaegoNwMhdzrQHkRs4mhFQPJRokGb/o792IV+q3TKj
	 9PMc3XcB8ToWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	krzysztof.kozlowski@linaro.org,
	tzimmermann@suse.de,
	u.kleine-koenig@baylibre.com,
	linux@treblig.org,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 8/9] fbdev: omapfb: Add 'plane' value check
Date: Thu,  3 Apr 2025 15:20:49 -0400
Message-Id: <20250403192050.2682427-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403192050.2682427-1-sashal@kernel.org>
References: <20250403192050.2682427-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.291
Content-Transfer-Encoding: 8bit

From: Leonid Arapov <arapovl839@gmail.com>

[ Upstream commit 3e411827f31db7f938a30a3c7a7599839401ec30 ]

Function dispc_ovl_setup is not intended to work with the value OMAP_DSS_WB
of the enum parameter plane.

The value of this parameter is initialized in dss_init_overlays and in the
current state of the code it cannot take this value so it's not a real
problem.

For the purposes of defensive coding it wouldn't be superfluous to check
the parameter value, because some functions down the call stack process
this value correctly and some not.

For example, in dispc_ovl_setup_global_alpha it may lead to buffer
overflow.

Add check for this value.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 34e8171856e95..5570f2359d073 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2787,9 +2787,13 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
 		bool mem_to_mem)
 {
 	int r;
-	enum omap_overlay_caps caps = dss_feat_get_overlay_caps(plane);
+	enum omap_overlay_caps caps;
 	enum omap_channel channel;
 
+	if (plane == OMAP_DSS_WB)
+		return -EINVAL;
+
+	caps = dss_feat_get_overlay_caps(plane);
 	channel = dispc_ovl_get_channel_out(plane);
 
 	DSSDBG("dispc_ovl_setup %d, pa %pad, pa_uv %pad, sw %d, %d,%d, %dx%d ->"
-- 
2.39.5


