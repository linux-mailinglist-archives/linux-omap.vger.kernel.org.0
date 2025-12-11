Return-Path: <linux-omap+bounces-5179-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB0CB68A0
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 17:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61B303077E7F
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 16:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1750314A7E;
	Thu, 11 Dec 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bbJAY3x7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA928C009
	for <linux-omap@vger.kernel.org>; Thu, 11 Dec 2025 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471219; cv=none; b=os0BzMkpRXvYXq2N7uPC6JfiBVaM0CrlHMgcJ2BTxwHWJtZzAoU/mRpSqrQu8QTheZrn/s9dwnVZRkj6VcT5nh23b7kpoipx2nxpQSpWJrhalBEG5CYOBkEKekWdPlT3bqXR5SqKnJ0sHBwa5AtNneVHxo/9LI1lgaE5Q3ziYtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471219; c=relaxed/simple;
	bh=R2ozZyameZR8yNERVvn+fDB8DQCf25gtzZUsLJMbSfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUci+tkBhjWkrBuW23+WADBu3uZ7obE5vbBxPw80wm+VU6JV8SFScOxxGq95ctzl1VOdCYtLVHVpooVkEv9fglOgUgKIZn3+XJWHjgkcUlQn7JXAgRfybIY7JBY6XUhuZQTwGJ9Vc6YGqxg280aCGLCBvhJ78U/TcuXg1xSglUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bbJAY3x7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86308C1934D;
	Thu, 11 Dec 2025 16:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42BA960738;
	Thu, 11 Dec 2025 16:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9690C103C8E02;
	Thu, 11 Dec 2025 17:40:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MS4b7veCYN3tYDfz/s9LxcL0AfieJWRhqqzkQWfhAqQ=;
	b=bbJAY3x7JC9zvbF72HehgjE2uBmtCiIl/RjavgKbbW4A63NrEtYVDKBIEx+EIQ5gVRn7iz
	2xWoaBIJ/+p0ITIcyTdKNcH3vtOcPxFwB1L2RyGSFVPrCly7fis7UQB3KRbkjGOYIHQAaV
	zZS8qWp9hj1i76meKW5CsoIMGdDY9Ka9CQLAZQGmzPXy8LQ/TV6mRk7qJIUVomqw/HA0D9
	a4kTYeFSbIGVhCjJzx54Oa9F1fEvQRw5TciCfQ9Fv+1sHap3nnQ6mjVCuLIB8YzYB0+rCc
	j+rxSFWsDCMO9knPeggDl2mRuD2qfyaLlIwxbWaKsonD4UYrGDVl0THIubMaiA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:53 +0100
Subject: [PATCH v2 09/20] drm/tilcdc: Remove redundant #endif/#ifdef in
 debugfs code
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-9-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
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
index 9b3a0435a8d2d..d2aae731b72c6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -438,9 +438,6 @@ static const struct {
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


