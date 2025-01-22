Return-Path: <linux-omap+bounces-3155-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A4A18D33
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 08:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E16616BB19
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 07:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1836C1C460A;
	Wed, 22 Jan 2025 07:57:05 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468DF1C1F27
	for <linux-omap@vger.kernel.org>; Wed, 22 Jan 2025 07:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737532624; cv=none; b=SKjBYLqNdEufFiswW/GtKKBuToHoXFPZAcDh1utoHac5A2vxpycTkxuLem5TG5bCS+pR6SCZNNJV2OIH73AmTqw1yCBgaB+5joTrQ0SBPQGZXFTuYgx6A+lsAw9x+YalA7VFIrwqjs5/L3HYx3wVEEla4jm6lCweuDqlMfz3sR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737532624; c=relaxed/simple;
	bh=EMBl9U46SdnSsOJvQ3xYrR+oeLUPmYIi552M+zLEwFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HwEGaCqoGrlbbsidZDqMcvxShTBWJETUqAShUSb46Hs0NzRrvDdCnu6O/Hqa2OULoYait70mLtfchk53U6eWZ41dj3o+j8343g1zGn4fo3epCVeMrK3mfoAx9/xHXRxWYdsxZBUZooqA86TpbRaSCqUzLqmfuYWB1DLVYtrC2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5400:5628:9df0:d4b4])
	by michel.telenet-ops.be with cmsmtp
	id 47ws2E0013QiWAT067wsGt; Wed, 22 Jan 2025 08:56:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taVbP-0000000E09l-2zFC;
	Wed, 22 Jan 2025 08:56:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taVbX-00000005Dfc-3Rxq;
	Wed, 22 Jan 2025 08:56:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pmdomain: ti: Use of_property_present() for non-boolean properties
Date: Wed, 22 Jan 2025 08:56:50 +0100
Message-ID: <accb12bd6d048d95bd1feea07dd1a799ad3f8b31.1737532423.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On BeagleBone Black:

    OF: /ocp: Read of boolean property 'clocks' with a value.
    OF: /ocp/interconnect@44c00000: Read of boolean property 'clocks' with a value.
    OF: /ocp/interconnect@48000000: Read of boolean property 'clocks' with a value.
    OF: /ocp/interconnect@4a000000: Read of boolean property 'clocks' with a value.

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen since commit c141ecc3cecd7647 ("of: Warn when
of_property_read_bool() is used on non-boolean properties") in
dt-rh/for-next.
---
 drivers/pmdomain/ti/omap_prm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
index b8ceb3c2b81c2510..79d165331d8c6379 100644
--- a/drivers/pmdomain/ti/omap_prm.c
+++ b/drivers/pmdomain/ti/omap_prm.c
@@ -613,7 +613,7 @@ static int omap_prm_domain_attach_clock(struct device *dev,
 	if (!of_device_is_compatible(np, "simple-pm-bus"))
 		return 0;
 
-	if (!of_property_read_bool(np, "clocks"))
+	if (!of_property_present(np, "clocks"))
 		return 0;
 
 	error = pm_clk_create(dev);
-- 
2.43.0


