Return-Path: <linux-omap+bounces-3533-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6ADA7AF1B
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 22:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149F93BACE3
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 20:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30B122F160;
	Thu,  3 Apr 2025 19:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGdiyoCh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B7522E015;
	Thu,  3 Apr 2025 19:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707949; cv=none; b=dAxTIH+Vl0JP1oKN8sHfFVC996Q+rKVdxER00a0riKyDo72dL7B9dvDrFFla0ml0yxQufato+J/kvDyoHasV8oyiKOb2vnBAAOfgV+dfq8Ze4Al29gPerAn1W4ZSzZ6gcR2ajciVb/JwL1IB/VydrVWMmRrx6qs2HpI8PxphWHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707949; c=relaxed/simple;
	bh=ZW6nkTxeTi7AM/XCNK9IYLEj3DtDQTUlapMmAPUPR88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mebIP7AyJLGvLtF93XaBSV2vjY7ZVAKL5kIB93t8Cjf4cEnkadZsT9FYFvQnZJvXqmSefJEwkdonIhRG42e4ni+mSWH7Q4laLgC3eSF5UGKMAVOzfY92DfndTxKg7JXEXwf+8QYV4N9URy5j7TY+513O6KRAzxX4CbGg09VF5So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGdiyoCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9237C4CEEB;
	Thu,  3 Apr 2025 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707949;
	bh=ZW6nkTxeTi7AM/XCNK9IYLEj3DtDQTUlapMmAPUPR88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lGdiyoChgRev+1agK6BDJJFGTNU+0IF2H59BrloMckmfT1CvZ8BJQv+bJ1wJoqDoM
	 boOSeEf2cTJbG52lesOaRs6NStvD1BD3t3jz7biNKK+UneX/NyfYVTc0040ANwaeXd
	 d6xvDdpXcptoX03HUmHpwKlYEFVznHLrzKZdKylzfljaT7vqWTyIjUbWeTdeFizXsD
	 RTEAHQpBG16ti+Plf5eoYVaWTjyjvg5RnHbnqOzzbgCyfj+D1UPSqobsLcXfOaaoBJ
	 te3xfbbE6IN2+KcnYRkatk1MNUP7sYDiTOKlRV/JhbdSs4x3Onjh74JHJrHEEadBfT
	 s/WvKxetfZyww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	krzysztof.kozlowski@linaro.org,
	linux@treblig.org,
	tzimmermann@suse.de,
	u.kleine-koenig@baylibre.com,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 20/23] fbdev: omapfb: Add 'plane' value check
Date: Thu,  3 Apr 2025 15:18:13 -0400
Message-Id: <20250403191816.2681439-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191816.2681439-1-sashal@kernel.org>
References: <20250403191816.2681439-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
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
index 21fef9db90d26..4f09111f8b57e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2749,9 +2749,13 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
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


