Return-Path: <linux-omap+bounces-5508-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FACBD33A99
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8421C3026977
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A43E3A0B07;
	Fri, 16 Jan 2026 17:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rUqlArWC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8134B1AB
	for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768582989; cv=none; b=Hk3El9VsU+bY++Yvbh8ZfjOLamKlLYM/lW5Dfv+1lSZCgu94benetpCzB63IUdZy98BLA8YOQpQ0vAKhwfVsYKtnSeKWOxR5l3ohpjEQYTofQ2XCNb4GXwuCPQnG+ZCitpIQx5fc9GUQMYZft93WKkfZ2XnktmQcxNnCtL3cwew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768582989; c=relaxed/simple;
	bh=anGOjvXR2sBBPtdkToB8G08+cDbS6A1JOlVxqn5NMo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n33YEVMN2Ke47taFH3ivmKYVYLhS/XVdi5vdMtqIN82jgc2mtRX5GfXEzfwyKwLM0VgjuqOBdml3E+/kufA+TzG4O6RM9LiKFQwEnVlqjAxqCZFgRvVoxJ+ok6pyvCPRcZKJonBeFqaLK9D1ap+/19W2sAeUiKZGgAg0vRNJO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rUqlArWC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 631144E42113;
	Fri, 16 Jan 2026 17:03:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33FA4606F9;
	Fri, 16 Jan 2026 17:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B72710B68C84;
	Fri, 16 Jan 2026 18:02:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768582983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VSTYR5rD8uZJr/69XSbhWZhicV+2XxA/spuf43LjPJU=;
	b=rUqlArWCwupXKrZ9N1lQ/M7zROVpenx1ul+15yNLKUzVK89M2WBFDpvHuMItic13QMMoxO
	4NBICKXWNSYMiKT46vd33bZ7asBG1pdCqhQOSUPNVzcWjdOVfaNvBvZNULYdU/hU7S7g8C
	KV0cUEr2Mv53z5M589vsA0R7Knh+vb/h2XW0+O4bjjlJD5Q4DZt/kbHSrFJ4iPXQchKcDn
	z4xXY465hcRZB+J7Jcy0Hby74QXE7cSYQMki0XCfQTx/pdcGQUkiyCuMWayQW3jKHPDHu3
	Ed2URk7IENKbx+ipNZL71kqTTlv46WgVp1vKl9RKGmvJYe+l+d5CukB2MKQFeA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:09 +0100
Subject: [PATCH v4 09/25] drm/tilcdc: Remove redundant #endif/#ifdef in
 debugfs code
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-9-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Remove the unnecessary #endif/#ifdef CONFIG_DEBUG_FS pair that splits
the debugfs code section. This keeps all debugfs-related code within a
single preprocessor conditional block, improving code readability.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index f865c131dae66..fd6764ce80afa 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -429,9 +429,6 @@ static const struct {
 #undef REG
 };
 
-#endif
-
-#ifdef CONFIG_DEBUG_FS
 static int tilcdc_regs_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;

-- 
2.43.0


