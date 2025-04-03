Return-Path: <linux-omap+bounces-3530-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7DA7ADF7
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 22:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D7617CC75
	for <lists+linux-omap@lfdr.de>; Thu,  3 Apr 2025 20:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6852D1DFD96;
	Thu,  3 Apr 2025 19:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W29lUZ9v"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD11DBB13;
	Thu,  3 Apr 2025 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707707; cv=none; b=X6k4m1k4H5smHb5y58tILp+qkHW3eu+KelqHAF7OruUQIFMF95w1beYXwFY4q8nNp8pO7L1eW80AuLdPSNBGUfPz0ABF24vptIrD6HgxVSe78z7m6JbclKU8A8uqHhmb6CY/qAbspgvKsUl8vrTBhSwEnulQIttOSzR8D/Zilpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707707; c=relaxed/simple;
	bh=u0zW9PD+fB/FpI5XciLwh5vH0OQS0J9qDGBpyQcD3Gc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBnWc0YKIvn0HADmKchFa2wAzgbwbC/FWgsjcOQa0McFvsHKhElq2DQg6hUi6SL7sAgUrcOMJTDQQngfrfS6o82uApt0SrId/Yj0Gw/80pOPQRRj2F37iIZ/wEiutD6GrSefNG8NHPXQJSNsWjPwc/jRrVZvX+YNpcVkHBdj5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W29lUZ9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2044AC4CEE8;
	Thu,  3 Apr 2025 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707706;
	bh=u0zW9PD+fB/FpI5XciLwh5vH0OQS0J9qDGBpyQcD3Gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W29lUZ9vspFTNgE8U120ZofUZdwOJksceoQp5IRZzqmL4ETPjvC93j7Zc3WO8SkGb
	 fpqyMJ5EXqtxzc7QD/OmFYyHKYOFQj7Rfo+uWO46uEiwHJ1eIEzPcn1s7hXTduhVMM
	 6lStYzRPCVTqluDOfmBI7DWsFjd802n1El7gUoW6mkQ0jZ0XD+PUiTTn/uJPDb1Lew
	 G8MpzLMmiWEn7a9nFQJwac9gFMwx75PsXMCOvLf5mM8EYCoASP0Bb1+D8RqCfvzxNa
	 ND1cjcDoi1yy1yL+h6dJJXuvKLbbRGHnegwLLHJKIsHc/Y5YG7GsGIDzfLFMoGUVBp
	 jpnTyANYeEBXQ==
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
Subject: [PATCH AUTOSEL 6.14 39/44] fbdev: omapfb: Add 'plane' value check
Date: Thu,  3 Apr 2025 15:13:08 -0400
Message-Id: <20250403191313.2679091-39-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
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
index ccb96a5be07e4..139476f9d9189 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2738,9 +2738,13 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
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


