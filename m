Return-Path: <linux-omap+bounces-3062-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7C7A07E58
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 18:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD9FB18877EF
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 17:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE3E18A6AD;
	Thu,  9 Jan 2025 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhBtdoar"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B4F510;
	Thu,  9 Jan 2025 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442478; cv=none; b=NdDgz9Eab19sSwrzoEv0aiYsm/qhPEMakw31hW///K05+1RzBsmJJC5rzu3a+cuiyPCklAci0410yMDful2iTlwQhSWooGq9IaFVqFMSRER/1YiibCPG3Vh4K7fEydWgfMSB5+utuQuLcT+CTYnTHWSHJaKcqqVPINgo7e+WJc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442478; c=relaxed/simple;
	bh=Alqyd2iwsoCD0Oj/gAXfcn7AATkiQdOhl45eWdofVdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXp1um6USRyMvKsCbnsAiB5H/bhSVj0jum7C18Jpu1S9b2ZBCIGPbjDZZfbwz5jOtIc4ridSrBbjviYlCVp1xQM2RUFOQ5L3FASySVZ/C4+rQ5sx7u+0gxxWMKbo1RaS+IAhr0ZE+HrJFm8PWWQyFHKDz36h+6z4cCjyiS2aNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhBtdoar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A485C4CED2;
	Thu,  9 Jan 2025 17:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736442478;
	bh=Alqyd2iwsoCD0Oj/gAXfcn7AATkiQdOhl45eWdofVdk=;
	h=From:To:Cc:Subject:Date:From;
	b=OhBtdoarIfU5AQKrPGqRSFu4j96VjQyGT3lIFkJyvfbgVHGNlef3YThbc/rYz3lxL
	 dUtN67k90W+Vl5SgSa0sUq654tijcNe5NdSMjNuleOorfQSdWI+p3y1Ch5yqaJClkJ
	 /iZOcTJK6mcZ9UTckmRC6Q7sxIQu2dXlUY2srMPaD7jgyziWVHKCa8uWBya9bC+hAu
	 FHcnWIbK0oGYMNdsQ9kjxP3tShIl8KeVr+ES5z/xphHYpqEGUjzDjH7W1Z2DH7/gTv
	 gpx+rGDX4rMlQ4g1cLmMS1dHLE1TrG+N6w6NdVoB0z6YrWACQ4Hw6kvw0lMYHN0k4K
	 CANNLw5uVAkLg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: omap: Fix devm_regulator_get_optional() error handling
Date: Thu,  9 Jan 2025 11:07:47 -0600
Message-ID: <20250109170748.3852439-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 533561a8aad5 ("usb: dwc3: omap: Use
devm_regulator_get_optional()") assumed NULL was returned, but
devm_regulator_get_optional() returns -ENODEV rather than NULL like
other *_get_optional() functions.

Fixes: 533561a8aad5 ("usb: dwc3: omap: Use devm_regulator_get_optional()")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/usb/dwc3/dwc3-omap.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 9b1d10ac33c1..fe74d11bb629 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -484,8 +484,11 @@ static int dwc3_omap_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	vbus_reg = devm_regulator_get_optional(dev, "vbus");
-	if (IS_ERR(vbus_reg))
-		return dev_err_probe(dev, PTR_ERR(vbus_reg), "vbus init failed\n");
+	if (IS_ERR(vbus_reg)) {
+		if (PTR_ERR(vbus_reg) != -ENODEV)
+			return dev_err_probe(dev, PTR_ERR(vbus_reg), "vbus init failed\n");
+		vbus_reg = NULL;
+	}
 
 	omap->dev	= dev;
 	omap->irq	= irq;
-- 
2.45.2


