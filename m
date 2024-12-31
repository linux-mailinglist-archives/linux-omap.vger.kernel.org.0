Return-Path: <linux-omap+bounces-2929-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B28419FF0BF
	for <lists+linux-omap@lfdr.de>; Tue, 31 Dec 2024 17:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 968EE7A1394
	for <lists+linux-omap@lfdr.de>; Tue, 31 Dec 2024 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901DC19A2A2;
	Tue, 31 Dec 2024 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObqeFPM2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382F381C4;
	Tue, 31 Dec 2024 16:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735663532; cv=none; b=IEKY+jKuJ41PSDQbkg8To7NwhvBrtPXEjo63j1KxZNZHh6sdRC5GjeM7WKDNoCHAcLInMO9AtazZQDfChxLI5TQAtnygVuxz4Vg+ay93usDwNTaMQoSIai+iUk7I6C3yzLXOgmzgUaQG8p+Nc5HKO39BDqeNcCWtf+vT02vgeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735663532; c=relaxed/simple;
	bh=8NnqnWytKG3r22OyhJdUIwAsQP/nguK3WAknLIs4u6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4c9uwtgBfjO+FZzzy43pXaKXIhbfchQ41XyRMxzmndhQaLI30fUp0Fh35foYOm4uxXPj9vwnq8UJjlGKsRbwJeuycrIXHfsaTWUqPPDKSVBRZ0ICdGiH+bbWKaWHFyRxfed1k2Ufv2yN8EC9l0hxc6fpDzIMWj+e4/rIebwRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObqeFPM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDC6C4CED2;
	Tue, 31 Dec 2024 16:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735663531;
	bh=8NnqnWytKG3r22OyhJdUIwAsQP/nguK3WAknLIs4u6k=;
	h=From:To:Cc:Subject:Date:From;
	b=ObqeFPM23XooO1Oeeljm58y4d9RzR54rEZ/BVpPCm7etT1Z3fiTx8V+UEtwI2ZQaC
	 GFZmrHJ3FVNiitg1yqXvloodGAl5hRhMdS7AQRdbLcTqQIaOPu3q15zLE8dmEqhHrd
	 xgL8cMHyJxaOgyQamCx43Kvwh9ngiHhKGdBNd62nX/cwXO7wmBTQqylm3foVCP2m4m
	 hMTMaCMQsroMgI8HA16GBr3rpiVvLq/IAMvjZnPvVcWWccW0cPUQereWTOptMmGInm
	 ScdTXpXnr7BPhCwo3XfaKjgiE4TH/++poNKu5qjgvRjlScaLqqKzuM/lj134fzflNy
	 wLhkFOsNWDuYQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: omap: Use devm_regulator_get_optional()
Date: Tue, 31 Dec 2024 10:44:56 -0600
Message-ID: <20241231164456.262581-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'vbus-supply' regulator is optional, so use
devm_regulator_get_optional() instead of checking for property presence
first.

While here, rework the error handling to use dev_err_probe() which
handles deferred probe correctly without an error message.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/usb/dwc3/dwc3-omap.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index b261c46124c6..9b1d10ac33c1 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -457,7 +457,7 @@ static int dwc3_omap_probe(struct platform_device *pdev)
 
 	struct dwc3_omap	*omap;
 	struct device		*dev = &pdev->dev;
-	struct regulator	*vbus_reg = NULL;
+	struct regulator	*vbus_reg;
 
 	int			ret;
 	int			irq;
@@ -483,13 +483,9 @@ static int dwc3_omap_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	if (of_property_read_bool(node, "vbus-supply")) {
-		vbus_reg = devm_regulator_get(dev, "vbus");
-		if (IS_ERR(vbus_reg)) {
-			dev_err(dev, "vbus init failed\n");
-			return PTR_ERR(vbus_reg);
-		}
-	}
+	vbus_reg = devm_regulator_get_optional(dev, "vbus");
+	if (IS_ERR(vbus_reg))
+		return dev_err_probe(dev, PTR_ERR(vbus_reg), "vbus init failed\n");
 
 	omap->dev	= dev;
 	omap->irq	= irq;
-- 
2.45.2


