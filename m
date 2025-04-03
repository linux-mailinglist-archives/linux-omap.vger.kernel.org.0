Return-Path: <linux-omap+bounces-3532-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D8A7AEF0
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 22:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D65B3BE220
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 20:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26D3226161;
	Thu,  3 Apr 2025 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIDNBaw8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C605225A37;
	Thu,  3 Apr 2025 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707890; cv=none; b=rseA146vJqIj86Sdlh356SCCw7hCErA02h8tWhCSfNXKm2Bkt4xpF3WzDvtWqoW9TXcfiDmRhZSpYQY7IyCLpwk5ttRybdS4c3kJ7e5KrEvzDPFO9LcDaemq1U9kd8hjWic4iEzxKLDbXlYwNdgOVXUJRUl82qvK5cgdjjeE7KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707890; c=relaxed/simple;
	bh=dKnG5qd+3/3kVo1g7Fg1kZrzyAlc8FuYugQ5qhKCPpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQvgR0FImcTD9blR6iUlVcGD1uQecsgF1OJaR0sMyFu3IZD9TsB9dQO+n55nSgCgeYFLRHoIHvwWKmHmlMxldwpZdOFD4lKYXSP1IWu8HHBNEkwHDDc07/2G3+ZKq439c4XddG+ouiynLtbBxqn/YKoZKQ6MwRK0XbAu1z2Irr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIDNBaw8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C4EC4CEE3;
	Thu,  3 Apr 2025 19:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707890;
	bh=dKnG5qd+3/3kVo1g7Fg1kZrzyAlc8FuYugQ5qhKCPpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mIDNBaw8YWZ0EpsyMz26YG4KkoaKjZAciy5UEFdU1XMHs2hyHRfS53L6OI3I+cQb/
	 59ovMtjq6jzaXDuZgcut3jiHKCpdGbIldR/KA87VoCYqks9zHzuldFMeXtF/SojdUh
	 re3ksxsfBgzPlb/M5ug6uEpMTcXqOIjfXWN5/7fGJ/I4Syirw48PFCKs8S4gnyGwNv
	 CGtEpMbjfxk91Pel0Y1AZP6iqJXfXiqI/AKuBui6gT2eqX41Zhj7BUBPbXCJcw09XY
	 rMNSAGkLGian5su7PxYeKJrBItN6PvAYTNVwjJvYmH2SYDPL0ViGHf4MaigFtyrZIG
	 HysUy/+KdFoGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	krzysztof.kozlowski@linaro.org,
	linux@treblig.org,
	u.kleine-koenig@baylibre.com,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 29/33] fbdev: omapfb: Add 'plane' value check
Date: Thu,  3 Apr 2025 15:16:52 -0400
Message-Id: <20250403191656.2680995-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191656.2680995-1-sashal@kernel.org>
References: <20250403191656.2680995-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
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
index 5832485ab998c..c29b6236952b3 100644
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


