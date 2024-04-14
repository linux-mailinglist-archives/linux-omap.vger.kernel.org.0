Return-Path: <linux-omap+bounces-1186-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C78A442D
	for <lists+linux-omap@lfdr.de>; Sun, 14 Apr 2024 18:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77BB21C21C1B
	for <lists+linux-omap@lfdr.de>; Sun, 14 Apr 2024 16:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC49139CF8;
	Sun, 14 Apr 2024 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWKsnU0z"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579DA1369AB;
	Sun, 14 Apr 2024 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713112677; cv=none; b=kKNCayFOzvmY0/CYOAvole8N24osi7RlYykmCWnu32QoALN3KWJr6r2noZY3OJPphKRL/dS8pa3TER1qMUdaRtgBuu7y6svml+4W3sBCGMw+dX2I4WAQF4Sw1+39Vase/phcWzon5rlPuuryCoOBHiilRuBUf++CIrUJtkAS3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713112677; c=relaxed/simple;
	bh=jfkmf/5bR8Pn7Nt417Wdx1kiNblxSBy4jfnOmUNCNk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INmtvnTB2SoclBmjWS2i1rmAlAkAm1vJCKQYCQAz1KRkxF8SWyh9qqE9ETpmsfOkgTQmQVkKuFZjvdsj77fQrDQ2XhuJZGHml0xPSsC8MdbZmsZmCAPKI3gei597xyK2zYg0IhI6Y4yQ/iPqiHQwDlJxLO/C508ELZrZuJPUW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWKsnU0z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9138AC32783;
	Sun, 14 Apr 2024 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713112677;
	bh=jfkmf/5bR8Pn7Nt417Wdx1kiNblxSBy4jfnOmUNCNk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZWKsnU0z0X7LJIBSdWsfkWglKQ3Y6hQ6N4u703hB8loVzvK8vdBlvkGEZkmicggra
	 zYi9k87HU/wUadpTGg4E5y9Hvlgl7vM6EgTc0MUURqljKIUvvrTZhIh8XparKquTwA
	 VROCAMiyqE8RpBzLa8SQXX1l+3NCdOZKpJ6ruUnQ/uGsrcUI2qnldMVYGwHmS7WzUJ
	 sipz3lKodrK0erPw9YDeh11Yk+Xcz7i6iuw5PdTabH7jqkwFuLwqBnPaypSlStXB++
	 KXderH27S1d466W+7onSZhdQgB90hhkqlbjau6UtEmtW/qGrAh/kgh7GmlrvNwwkoL
	 sq1ApYKneLFNA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:16 +0200
Subject: [PATCH 18/18] fbdev: omap: lcd_ams_delta: Constify lcd_ops
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-18-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=krzk@kernel.org;
 h=from:subject:message-id; bh=jfkmf/5bR8Pn7Nt417Wdx1kiNblxSBy4jfnOmUNCNk0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAYCjHH0Cx1DCGwjeQ5m9nnsg2hCJnBhK6Mq1
 fVWf+PJIyqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwGAgAKCRDBN2bmhouD
 13f6D/9zghLij+lmC0ML/pi92moHzAOeagWtT20rHWv7zIwh8jkggvAqmqsmai6Q75+bNS986sV
 ogKmNtLnpMkPFhfuJ8Woq/DMF3hUNGs3KrMZAflCff/Play1FATCi1xMxdI894OomgNJNmLcbN2
 +iaqYMm/cnyfQd83jrsuX9cjkD1MO+upTIygA6ClXTaHbKLziQ0dzQcFhAjZOmDfW6vDHohzCU/
 vInc34ipNfYbw+qkeYWtbwm/tdfEEFAhpwS8D5pq0AaMlrVGYrAsB+C58lrU/aj3sz1jnZOTwPx
 nOrFBdSmiz08v+eX74Dot8/+uLE+/DWcrocEOHCc4EBPVULolt7u0q8Zsc8JAUsQcjqc8VNiRG7
 MncqHSrwGPiT+E2GsDK3KWNzChoceOvW91EPWTBg8OG+CBErnyrv+QXpJX6Nn0yP1Gfz+cR5SIW
 BvOWYZXFM/Pympaqrh5EXydi1qBGaxKyc1REALSG3a3cUmIPieyICtwOTvfrSehghsBCkcX3Dtk
 46IcVS6CS2FVMKpeE71ZXjfrB/jwnrqWYtMsh0qHJQ0P6kFgQSoglazclEIr2Gxrkc21Ozaa6bz
 PJk/1g9MhmqfhXzHLacAmzYumlsV+XINjIuHDG2Fj+SNYcK/A1tP7JCHwBMrAjvJP0EN1aeKbDE
 gNAgVkhlzyAFAng==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct lcd_ops' is not modified by core backlight code, so it can be
made const for increased code safety.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Depends on the first patch in the series.
---
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 6f860c814d2c..97e2b71b64d7 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -76,7 +76,7 @@ static int ams_delta_lcd_get_contrast(struct lcd_device *dev)
 	return ams_delta_lcd & AMS_DELTA_MAX_CONTRAST;
 }
 
-static struct lcd_ops ams_delta_lcd_ops = {
+static const struct lcd_ops ams_delta_lcd_ops = {
 	.get_power = ams_delta_lcd_get_power,
 	.set_power = ams_delta_lcd_set_power,
 	.get_contrast = ams_delta_lcd_get_contrast,

-- 
2.34.1


