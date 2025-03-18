Return-Path: <linux-omap+bounces-3429-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D10A67BD9
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 19:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88203189FD14
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 18:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96943207A01;
	Tue, 18 Mar 2025 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRN+8ljS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0F149DF0;
	Tue, 18 Mar 2025 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742322032; cv=none; b=X09cwxbwS2ajVCV5lM2pMfMnnDl2P9RVdDOgwuk/x0k3Rns2ushVTzgmXU/Okt6njKUa5Tbl1B+VTRPv1OiwTjiyX6XmKVtIWDirtSkaqNzSXmJKSc+RFOTkWj4Zbf2j58ewt+ST2SZeCH/yzZr5oVwznZonp5+fpSaRtMNW3VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742322032; c=relaxed/simple;
	bh=pGTw6WoeMWp6FVrMCftSryGjWpcdWINfLX4QGHiXHp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQKEt9iwExkEwV0zrUq4niOGFb9Rlm+RSHW3UqxY+JRcpu60ZWaxN5tE8YXBvoa85K/hDDjbuqf+G8YJSQ7TqjLF5ToHndfrm193nT+/RYSRCiCtamCRYEk67tofQ659bZ8x6LY0aVszZz9brBk+dssldC8y786k+FliTyHoOWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRN+8ljS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bef9b04adso64463541fa.1;
        Tue, 18 Mar 2025 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742322025; x=1742926825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBan4wol6XPgP+/yLu6aCRZmWKzav4I2GXdbdcPbMJQ=;
        b=RRN+8ljSedzyG8gb2DcVBFOBGv5tuOFuiCjA5zq0/IWi4/lCKd3hUXPuJ2ZfB9k/Gu
         aH8TgqaFOMS8DBytKulaufzEhmlB0G4x2uBjaYD40VULSBBvuhIvjCgpENhLm2h+1gg6
         bo4XV5MwfnE0W+lWfbJQ2dUMq0Qn5kuNKRO0Jm5LtltFMPjVkflv0PuTbTI5cxXQ/Hr6
         nxugDHWkf3Q+gaBPOvDTYhlr8Z6Umk3NAEnvf878wJCXz3WQLXuUWJ685MxJT3Qn97gG
         YpVG1VVUvAz+TdW49ckV+KjOJ/9xx/D6weWSgpWCutseux3d3HOnNxBwEY2yP6GJ9Pf1
         QbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742322025; x=1742926825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBan4wol6XPgP+/yLu6aCRZmWKzav4I2GXdbdcPbMJQ=;
        b=cL8dGvZwEscWH4H5LFY1p7OsA06Y+5+wisG1Gam+RDgKqIP3Kg2qoLqQCA8GUL1Ui5
         FPV2e9MmZ9kr/OEmeqRefvv2zO0rlIA/SoSqJoNTqUEB4jXq0pRqtY7aYz3hqCWQ7U3j
         y+NbCqc40VBDMjCqO0j24uI2kOxyj/uGpXS3IVyzsy+VQcIVprEGykTQvsLHJHS0vrFi
         B19KC63SLsfPiX0M1Fg0MclcqH2R33bGzoInCcSEpb5103meorOqsrWpFBDVtlGoivOt
         SgmjYaBxB2tdGE7KLZfDOpbrm1E1jlmnQFI2vyzmum2v28WLxQNakLBNwZz5+/XrnEX4
         n3ow==
X-Forwarded-Encrypted: i=1; AJvYcCUnvcB9bi8rBO3lpSDQC3vibmZjOzL++RYeo/DzxmqkpXIY3P8gQ7vJ2frp8WvG1Ja+e52hPcuadVmrsePB@vger.kernel.org, AJvYcCVs9GnLaZCkBUrZBBPrZlLbyAzoSxUQPxHL/SRz/U/IljvM03h8CFD45jMGrEep8e2pjnLA7Ka9A52VcQ==@vger.kernel.org, AJvYcCWPmZNA8K1V0oeuB3ublIsEgKkYN0ABiXpHqKulAxy3rTH4eclFYRLpNGC1ZMZ8R0HUiE5/45Yssd0CxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypCj2+zaXLTLzYHTtyY/Qh9ySg5PJLb+wc6oeDbTQZWDF4Wy4u
	erZhMpQddELym8u/hKVi7g367F9QI7BSeB0KG2y492pY/GQSY7dC
X-Gm-Gg: ASbGncuiLmiHeaXXBBkLvUro+8jBhhzmLB6hb0p08Su0ebzBkS9z3v/vqeH0Ca9icIp
	BNuaT+aZlKABbmL1wBSApPS3lLxB6sg48W0bMdEYVpQ2k/wxhSnchhfM/6UyZz/ozrxTWKW9DOb
	ImjAtJ7yVdr+Jv+IGx2WrouUAZUrXLemX5ncJhyxZLJxx14nlEkY7xuG7sHpWe3w8T1IKaYVcwj
	MKsFdby01UJrYX5zGETjsUCJDpldgKWmMWLoTDd/OKZv/p+HjIIQnaLFAZE7r323QBNHD/0LmnU
	9sPg8DI4oGyMOgBmFvQCbvO2wfrwdreznf6kelkzM1FegQ==
X-Google-Smtp-Source: AGHT+IEp41sTRtQHleO8s17cTcBz/WRGvYLMOBfDJzuipfBrbh5s+omLIFbsikMDaTnozZf+tG9gXg==
X-Received: by 2002:a05:6512:308f:b0:549:86c8:113a with SMTP id 2adb3069b0e04-54a03b8d777mr3549627e87.15.1742322024618;
        Tue, 18 Mar 2025 11:20:24 -0700 (PDT)
Received: from leo-laptop.. ([85.89.126.105])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a84desm1780577e87.46.2025.03.18.11.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:20:24 -0700 (PDT)
From: Leonid Arapov <arapovl839@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 29/29] fbdev: omapfb: Add 'plane' value check
Date: Tue, 18 Mar 2025 21:19:52 +0000
Message-ID: <20250318211959.8557-2-arapovl839@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250318211959.8557-1-arapovl839@gmail.com>
References: <20250318211959.8557-1-arapovl839@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 8db074862824..1dc70c96d813 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2733,9 +2733,13 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
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
2.45.2


