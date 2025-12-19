Return-Path: <linux-omap+bounces-5232-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578ECCF88F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 12:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DA9C3037897
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 11:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B1C308F05;
	Fri, 19 Dec 2025 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7fe9Rgd"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC0306B3E;
	Fri, 19 Dec 2025 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142513; cv=none; b=gn7bAWuM5PLICJbkumYLW+t7Q21HlI3RXpN+0gb6TXP17G4Gij+o2FRz3yL66urf4hXYx9aYR1j93A1yHjErRNncbu/5JaxZtPt7Ph0/lpO5iyreWiIqmbGW+6njcmAHcjPcwEgrC6Nqmkl6n+cNVbaExfMs88x+tXA/ERUAamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142513; c=relaxed/simple;
	bh=sKAiRQgbNh6DubSpf0Ek/qtbAQMYnVH/c3Drf/wAKtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fyIOQ0b3juIRF6d7qZ4Lm6dsHYy9yLI03CQ0dBdpfuQ53cPj2CvVb+fiRAa+e5UNzXzqmZYDY9x4GmTfuFLgtMgqyVJCYzq5sRSrQXYsz/B8gNUI3UTTlJAxxU79+W4yOPl3y3W9NULwKV5dgsk+/Gbx1hc8Wz0/B7heSBws18A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7fe9Rgd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE0EC4CEF1;
	Fri, 19 Dec 2025 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142513;
	bh=sKAiRQgbNh6DubSpf0Ek/qtbAQMYnVH/c3Drf/wAKtA=;
	h=From:To:Cc:Subject:Date:From;
	b=R7fe9RgdM0+IzE4FM649eayf822BbSRC0mOLMg8I7n0AjLerSrbcnzHh/KBb1PNkm
	 BdMX3PicJxspIEUspplMWHazgBw9m8ZbmDEC8ufGxVxQVHfwLveYcL+meElTFN58Sw
	 CW9G4Ovblbe7kwm3M4jKVNf/fxs28/1XnupK7QrOhrt6/w2/DJ+g1x9vG/PXubfhVf
	 Z+lJIKmKFE88CLboIKUip9Q4u24TnoiqnQu2Y/eAZzAhjZjbuRx/EDixCPdY+UAtIJ
	 mks3jbJAOVh3cpfXKDXkwK5XwwWFj6xxS4x2dvmgoirws6+g4KT7zX/hMW6HzoXg/Z
	 KuMwHKlx1GT7A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYLX-000000006Ex-3uvx;
	Fri, 19 Dec 2025 12:08:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: omap-usb-host: fix OF populate on driver rebind
Date: Fri, 19 Dec 2025 12:07:14 +0100
Message-ID: <20251219110714.23919-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c6e126de43e7 ("of: Keep track of populated platform
devices") child devices will not be created by of_platform_populate()
if the devices had previously been deregistered individually so that the
OF_POPULATED flag is still set in the corresponding OF nodes.

Switch to using of_platform_depopulate() instead of open coding so that
the child devices are created if the driver is rebound.

Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
Cc: stable@vger.kernel.org	# 3.16
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/mfd/omap-usb-host.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index a77b6fc790f2..4d29a6e2ed87 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -819,8 +819,10 @@ static void usbhs_omap_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
-	/* remove children */
-	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
+	if (pdev->dev.of_node)
+		of_platform_depopulate(&pdev->dev);
+	else
+		device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
 }
 
 static const struct dev_pm_ops usbhsomap_dev_pm_ops = {
-- 
2.51.2


