Return-Path: <linux-omap+bounces-5109-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B474C9DAC0
	for <lists+linux-omap@lfdr.de>; Wed, 03 Dec 2025 04:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4279C3491DE
	for <lists+linux-omap@lfdr.de>; Wed,  3 Dec 2025 03:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46D42550D4;
	Wed,  3 Dec 2025 03:47:55 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E0C2AD32;
	Wed,  3 Dec 2025 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764733675; cv=none; b=N5ykwwp4A9sHFrNMVRknnEx1O+AoZm5FfWfuGGQRTPAZ3E9/q33pU+R82p/vz1kHsN4lhCUvNzkIr3TqbpO1WjGPwZNMJP4UVBYX4U+WyuZNKqdByfL+8C+Bbmw8wQ8MT5K8VQ888iY8/+zL650GrmxTrfFTuiRgnq+EeViI3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764733675; c=relaxed/simple;
	bh=uA1/e8rNSMjMiJrJI72qZLIR3Aj+8qMPowaw8XjZEMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJbwJ+G4uDg9A2g3/WgBej+L1y80JxFlkfFT8cT70KN3moFkOl5MSIFyDwDTBGGUxNeYXnEMRq8dqseKo8DCsvnbJWDsJeFL7UbeWpK9jYfNnFIAFAfqUO5PU4WHtLghM96LSue7x6ugXsWK4XwU04I9HHMlB7P6z7oYAWrn2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAA3ysnhsi9p1GTsAg--.4197S2;
	Wed, 03 Dec 2025 11:47:47 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] USB: ehci-omap: Fix missing usb_phy_init() error handling
Date: Wed,  3 Dec 2025 11:28:22 +0800
Message-ID: <20251203034741.461-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251202080027.1124-1-vulab@iscas.ac.cn>
References: <20251202080027.1124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3ysnhsi9p1GTsAg--.4197S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWfJw15AFW5Kw4DGr4xtFb_yoW5GFW5pr
	ZFqan0grWYgFZ2qrZ5tr18ZF1Fyw48try29FWxGa4fZw4rJrWqgr18tF4YyF1rZrZYka1U
	Ja4qvayruF4UWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuHq7
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoFA2kvgpG-OwAAsa

usb_phy_init() may fail if the PHY clock or regulator setup fails,
but ehci_hcd_omap_probe() does not check its return value,
potentially causing later operations to act on an uninitialized PHY.
Original cleanup also calls usb_phy_shutdown() on uninitialized
PHYs, which is unsafe.

Add proper error checking for usb_phy_init() calls. Add a new
error label to properly remove the hcd. Use local bool array to
track successfully initialized PHYs, only shutdown properly
initialized PHYs during cleanup.

Fixes: 4e5c9e6fa2d2 ("USB: ehci-omap: Tweak PHY initialization sequence")
Fixes: 49f092198f4f ("USB: ehci-omap: Fix detection in HSIC mode")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
  -Add a local bool array to track successfully initialized PHYs.
  -Check if PHY is successfully initialized before
   calling usb_phy_shutdown().
---
 drivers/usb/host/ehci-omap.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index db4a1acb27da..f36083ee317c 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -89,6 +89,7 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 	int irq;
 	int i;
 	struct omap_hcd	*omap;
+	bool phy_initialized[OMAP3_HS_USB_PORTS] = { false };
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -166,7 +167,12 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 		omap->phy[i] = phy;
 
 		if (pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY) {
-			usb_phy_init(omap->phy[i]);
+			ret = usb_phy_init(omap->phy[i]);
+			if (ret) {
+				dev_err(dev, "Failed to init PHY %d\n", i);
+				goto err_phy;
+			}
+			phy_initialized[i] = true;
 			/* bring PHY out of suspend */
 			usb_phy_set_suspend(omap->phy[i], 0);
 		}
@@ -205,20 +211,27 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 		     pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY)
 			continue;
 
-		usb_phy_init(omap->phy[i]);
+		ret = usb_phy_init(omap->phy[i]);
+		if (ret) {
+			dev_err(dev, "Failed to init PHY %d\n", i);
+			goto err_remove_hcd;
+		}
+		phy_initialized[i] = true;
 		/* bring PHY out of suspend */
 		usb_phy_set_suspend(omap->phy[i], 0);
 	}
 
 	return 0;
 
+err_remove_hcd:
+	usb_remove_hcd(hcd);
 err_pm_runtime:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
 err_phy:
 	for (i = 0; i < omap->nports; i++) {
-		if (omap->phy[i])
+		if (omap->phy[i] && phy_initialized[i])
 			usb_phy_shutdown(omap->phy[i]);
 	}
 
-- 
2.50.1.windows.1


