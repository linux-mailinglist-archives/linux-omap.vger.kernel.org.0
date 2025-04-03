Return-Path: <linux-omap+bounces-3534-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 698CDA7AF60
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 22:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0CD3A631C
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 20:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E892561A2;
	Thu,  3 Apr 2025 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z20biPVu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD5B255241;
	Thu,  3 Apr 2025 19:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707998; cv=none; b=t8SkkjfiDXZkis6tU6ZYnX/G37h5slu5CatIa/O0vJkMSS2ObJqn//5sZdaqjCM9q7G5a2jcHSfiJm5sRRvnahSnBJPR9XTmXqHDChqI8tK4Or6VVdOKPdzJucH8GY4aqmji3eiIYitio5INiWAUHLRz9/tcZHQablWhk5diuj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707998; c=relaxed/simple;
	bh=Gow6IuClrqGagVkV5rrqj44wwyG2SuQAjyOARluPy+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQfkw47fZ4BRAlM+5PgVPZ90R1wK9pYGvl+i5ui6YWkZSWemgHLOB9+/57kwS9U7DfofVZQvd4M6Hdg4uW1bwpWUAXYn00nJ2jjGRFrjLmOXW/zMQlCrR9C8H2w0ie/B4l87BQ8nKz5/8w9gyzKXC7dwZves3QY8guspUjUOL8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z20biPVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11477C4CEE8;
	Thu,  3 Apr 2025 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707998;
	bh=Gow6IuClrqGagVkV5rrqj44wwyG2SuQAjyOARluPy+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z20biPVucO4gpIoSoMDJhr9zamCuqILHaqp8fbJYj9//3BPOggKSFpGEmA1vL6NiV
	 WBGW+yPwDYuJbg/c9I9yuz1AKoHu5p0MUWBmVkKM/glYs8V2gEKtjSPohwViNZryaZ
	 ISTUuj6cajWZ8FJvajgvcqOtDPVULNibhfX0/p8DcOxSElQMeZmfZMz2SNrNcY6HLb
	 3HkBkJPszO3nQHb9BrNo5CVOFGbkESWmIsJ6hwLtVcsNdTXSclEFCWnEL5+hLVIyIw
	 l9otl4p3ZfQWv1LrWBJIeyVHMTeA/PfzESlWfDlrBXfKVx/M2iYFEsOwVkh4I9DD04
	 d3C0o17hXo0OA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	krzysztof.kozlowski@linaro.org,
	u.kleine-koenig@baylibre.com,
	tzimmermann@suse.de,
	linux@treblig.org,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 18/20] fbdev: omapfb: Add 'plane' value check
Date: Thu,  3 Apr 2025 15:19:11 -0400
Message-Id: <20250403191913.2681831-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191913.2681831-1-sashal@kernel.org>
References: <20250403191913.2681831-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.132
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
index 92fb6b7e1f681..a6225f9621902 100644
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


