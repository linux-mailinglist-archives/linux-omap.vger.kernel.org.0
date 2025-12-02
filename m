Return-Path: <linux-omap+bounces-5096-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD1C9A995
	for <lists+linux-omap@lfdr.de>; Tue, 02 Dec 2025 09:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C64F04E3258
	for <lists+linux-omap@lfdr.de>; Tue,  2 Dec 2025 08:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C53302CAA;
	Tue,  2 Dec 2025 08:01:00 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1686521883E;
	Tue,  2 Dec 2025 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764662460; cv=none; b=ScoSICbDAlCXPSV5H0tel7culGYHf3avuqtKEZ9ZsUcWkMmWFBOLSUxdIMIhhlv8arrI1saXBdeGd9nIEATdk3XggYR/kreUqMJp353Q1GWgANpegM2yhItw9pj5r77DMmZuxiD+gh8K8DC6C1Z6IOfj8p7ON0QsfFvxVyUI7bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764662460; c=relaxed/simple;
	bh=4+3G7wgD6VoCVjoPq6TA+9JR5eXz7qy4YIhoRFijXS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9soL67lCoj7qVbDPs8k5ERoL6pnvpefid/LsZVvExDZvh6OvYixcU6BtPNTjoyHz9TZkk0TY/iEBY+DHX7LNwf4w7rsEYcJM5yqGfIfjzDWJW7iON+lpEnPCx8WHnZ33C1MDX/ahbD1IYaOrn+fACTAAtJjtyAzwFYFNk32WVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowADHXc2snC5pZarVAg--.27319S2;
	Tue, 02 Dec 2025 16:00:48 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] USB: ehci-omap: Fix missing usb_phy_init() error handling
Date: Tue,  2 Dec 2025 16:00:27 +0800
Message-ID: <20251202080027.1124-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHXc2snC5pZarVAg--.27319S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWDuryUtr1kXw4DKr4rXwb_yoW8AF1kpF
	WqqF4Ygrn3Krs7trZ8Jr18ZF1rCw48trWj9a9rGa4fuw1UJr4qgr1Uta4FkF1rZFs5Ga1U
	tas0qF95uF4UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU8PE-UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0EA2kuX3bfHQAAsg

usb_phy_init() may fail if the PHY clock or regulator setup fails,
but ehci_hcd_omap_probe() does not check its return value,
potentially causing later operations to act on an uninitialized PHY.

Add proper error checking for usb_phy_init() calls. Add a new
error label to properly remove the hcd.

Fixes: 4e5c9e6fa2d2 ("USB: ehci-omap: Tweak PHY initialization sequence")
Fixes: 49f092198f4f ("USB: ehci-omap: Fix detection in HSIC mode")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/usb/host/ehci-omap.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index db4a1acb27da..30b3586fd696 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -166,7 +166,11 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 		omap->phy[i] = phy;
 
 		if (pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY) {
-			usb_phy_init(omap->phy[i]);
+			ret = usb_phy_init(omap->phy[i]);
+			if (ret) {
+				dev_err(dev, "Failed to init PHY %d\n", i);
+				goto err_phy;
+			}
 			/* bring PHY out of suspend */
 			usb_phy_set_suspend(omap->phy[i], 0);
 		}
@@ -205,13 +209,19 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 		     pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY)
 			continue;
 
-		usb_phy_init(omap->phy[i]);
+		ret = usb_phy_init(omap->phy[i]);
+		if (ret) {
+			dev_err(dev, "Failed to init PHY %d\n", i);
+			goto err_remove_hcd;
+		}
 		/* bring PHY out of suspend */
 		usb_phy_set_suspend(omap->phy[i], 0);
 	}
 
 	return 0;
 
+err_remove_hcd:
+	usb_remove_hcd(hcd);
 err_pm_runtime:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-- 
2.50.1.windows.1


