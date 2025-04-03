Return-Path: <linux-omap+bounces-3536-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E9A7AF90
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 22:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07F5F3BEDE1
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 20:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA9E264605;
	Thu,  3 Apr 2025 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qChnOBHX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026D2641F7;
	Thu,  3 Apr 2025 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708050; cv=none; b=XlrRdhjw0hCZnfLB+ccQDsgZDEkpbc/xtWix8QLxHOEKbwYJGpJK/BfToqWAsNf9lEhqe5YAyk1QGiVFtuMPye03vdM4wtQLEMT0F8Ij3PmXT6RBlsHNJFLsotUuQ9cGfaANulLnN2nHAJZyo/fzySSzLOjLaf4OeRkjwAUrKDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708050; c=relaxed/simple;
	bh=pCmyw+57uV8ZJYghvhdI5iLMyESg4RzTGJujrEavo5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=etKYXxUjA0C22rpJV3IASM80msBu1qgTCSot2EcPMOnSSuIAtOWiMmBe8FtC198fZp8MBpdsDP7sO7JvTyldwpeAe1L6XnKrmSDoTW5vqFiUyF4LO4bzXUkG+6WQBj+bayA/vSmNx+G2HsZvnrFRPpSSzZjErJ9n8ox1QSQ+CuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qChnOBHX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D876BC4CEE8;
	Thu,  3 Apr 2025 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708050;
	bh=pCmyw+57uV8ZJYghvhdI5iLMyESg4RzTGJujrEavo5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qChnOBHXy0Ailf/3xH6T0okQ2XKJyk5gpDvE0Rwo/9YvB2dhYhORnkj/rQfYsL7nz
	 qUiVvwPhbvg6xBaqEVOua1HvLlqryXA0rv5FTe5uRWItj+xjvP8XuhM/KQ6/KDaIFW
	 +m2+3uvSgcVNP5NSGtuFRDRcycpg41f3uE3OdzYLu80DpGrTpGqo0Pao59/6+71B32
	 U5o4BZoUQFZlRiZncP8JKNZmn5oPbi7zXiO6EN1VDK8SxxuflV3Wy0B/Mdk/SIDY9o
	 AkgWBBzLyw0NU/+pqB6AkAiZGc56SjYFX0FsYkytmC0y/nrSayfAnnaIUSHyJ7W3QB
	 VObi1tw553tpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	krzysztof.kozlowski@linaro.org,
	u.kleine-koenig@baylibre.com,
	linux@treblig.org,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 8/8] fbdev: omapfb: Add 'plane' value check
Date: Thu,  3 Apr 2025 15:20:30 -0400
Message-Id: <20250403192031.2682315-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403192031.2682315-1-sashal@kernel.org>
References: <20250403192031.2682315-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
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
index b2d6e6df21615..d852bef1d507f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2751,9 +2751,13 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
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


