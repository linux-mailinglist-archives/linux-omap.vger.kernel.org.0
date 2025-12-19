Return-Path: <linux-omap+bounces-5230-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020BCCF832
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 12:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95F833019BC7
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85654305E2E;
	Fri, 19 Dec 2025 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5xNPvLq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509D1391;
	Fri, 19 Dec 2025 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142126; cv=none; b=Joh2vGCIoN9uQOWmxFOTQtz9yJjzJARp+QXbwXI5mj3LQ2HBVaNITOE5h6jC2YT3Y39rzDlo//JegjEPUHWsbiq9zNMPrjbljJzlqnIqbk+iKke5KsHsitStvTH0DuD+Jgy9Z7r9Ms1Op8mWTvNB1NWHU2EOXvMVfqLChWh3yn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142126; c=relaxed/simple;
	bh=WxztGDb19jBzbxzKecBYv99E5/yCIwxK/yUz4rcJwTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBJtRbfLNfkALHYG3vC8oslYsdz95pVbvcgnmh4OFLweGZLBgciKx0oxYb/mCP7UjMQZQqS+m6TelJXoYszm233vFrxINMISV0RvhODQvhc/e1QNY8v0p4RO3ANlOlA2w92ES+x0Li/jtFQapWTXkp1fUY/f/inam95IJKGr55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5xNPvLq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ECFC4CEF1;
	Fri, 19 Dec 2025 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142126;
	bh=WxztGDb19jBzbxzKecBYv99E5/yCIwxK/yUz4rcJwTY=;
	h=From:To:Cc:Subject:Date:From;
	b=Q5xNPvLq3n+1Ym2CY9z4jFzvTSBctczfcif47qZibjZ40cbjtSSjFw37l01toEYHW
	 pbGKj+OqChA5MM1LfhdkMXFZ1Wn6iHZ1yf6HykCtOBreairMdqTcvmPM/Clt2Wldph
	 UFvnLp/KdO8ocN4kJfP9fyya+7IobgGW9Ned3AG5Yw+4l3EGsvYafkQtT5Jq+SfUJU
	 5X08fXimM0/GXZH0qZ6porkNSRb1sN2xLJY520+kBFD1/y0WSbMpxx5OxNsNUHV9cA
	 +rO+/qoM9LYwM+nGxmp1G2N2gXwVq8hD5wyfe7wj42OvTxga2nxefAY2484zG6ymnt
	 wP9uz1b3y3scw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYFI-00000000683-2PGR;
	Fri, 19 Dec 2025 12:02:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] bus: omap-ocp2scp: fix OF populate on driver rebind
Date: Fri, 19 Dec 2025 12:01:19 +0100
Message-ID: <20251219110119.23507-1-johan@kernel.org>
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
Cc: stable@vger.kernel.org      # 3.16
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/bus/omap-ocp2scp.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
index e4dfda7b3b10..eee5ad191ea9 100644
--- a/drivers/bus/omap-ocp2scp.c
+++ b/drivers/bus/omap-ocp2scp.c
@@ -17,15 +17,6 @@
 #define OCP2SCP_TIMING 0x18
 #define SYNC2_MASK 0xf
 
-static int ocp2scp_remove_devices(struct device *dev, void *c)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-
-	return 0;
-}
-
 static int omap_ocp2scp_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -79,7 +70,7 @@ static int omap_ocp2scp_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 err0:
-	device_for_each_child(&pdev->dev, NULL, ocp2scp_remove_devices);
+	of_platform_depopulate(&pdev->dev);
 
 	return ret;
 }
@@ -87,7 +78,7 @@ static int omap_ocp2scp_probe(struct platform_device *pdev)
 static void omap_ocp2scp_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	device_for_each_child(&pdev->dev, NULL, ocp2scp_remove_devices);
+	of_platform_depopulate(&pdev->dev);
 }
 
 #ifdef CONFIG_OF
-- 
2.51.2


