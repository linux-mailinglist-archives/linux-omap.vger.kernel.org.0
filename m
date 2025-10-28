Return-Path: <linux-omap+bounces-4804-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE39FC15985
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 16:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893704051F2
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 15:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E18343D8C;
	Tue, 28 Oct 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrI2aTcl"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A633DEFF
	for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 15:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666174; cv=none; b=bRc5v3Lu75RmxzRtCMoir5OfezJLpm1chpiJRUalIAkaZuoMLf7JhFn7udz1E5heIB9SUoT0wcV4C6CLy/H0u/aBc/W/wUutmucZ4mnxPz9jiy99n6BpBJxJzSiwKmIsbxStsgYV3H1pg4iECjwdZUUGlgBNLDiBXe5pzqbjIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666174; c=relaxed/simple;
	bh=OI3lu8B52L8q6L1vFOQdjWWy8M0I5zST9cEyiMD60xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qk+c64/B9IZJmS3Hxm4Kfz1s9PWYKj0qessdjZTTyrbzdVLvJmVosk00MWZiiVGx1fG9iw3I45oxL6//nCTfxFIUh7UKwvDG2x8WoaGuNwBX1MjrxENQTvmKreWrLUfIp7StaHRU1bOs+38QHftJs6guYoei1EToPwPISsARnU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrI2aTcl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-290d4d421f6so57691695ad.2
        for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666171; x=1762270971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLSaa6PcadKxSJGpM5AYmWJ5bCIVBLv3q1JgPY8IHz0=;
        b=QrI2aTclbYq0rfsjN9ycJmngTtFlr0AradMDCAKvIVjxw2AaOVeBt3jmOYpq2axXxx
         K1c6uUyyXfbrQj0YWiZI/0DbD2pVpHkwGytyNb1pRGTm9SzvPViA0TMMGrdMjggGOLPz
         Y5UZNwWpHMXKRlRWz78I9CSxvIXuOi7ts/oBGhW9ue5jvJNdoFZLr5kZy+wHG+Ft6t0S
         6kHCBDATWCXXXvAaNSa+w1AKB1hjF+hoWZlD0pMYV43HkmHbrQVj1F2/UoVg1bMgIk1d
         Ep5eibff3VSADIv88mZCJ2Om9YwaR6QilSJr3yVNT7RcvRtj4jOyKU187qTQ8dRag5Mt
         0CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666171; x=1762270971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLSaa6PcadKxSJGpM5AYmWJ5bCIVBLv3q1JgPY8IHz0=;
        b=Blw/4CozrPyWG4mqttS+gmzTcbnyQPsWC75J3zU49j32fsCPzki7ORWli/vpF9kMka
         q1Q5C17KhdRbrpL9v9i08pwuKoyl6vVE11KpP1x4yq3+QE+jSKAj7iIhoB01r87OaX6Y
         MHubSmUVZS9PkghsDjg4u3bxg/XWC/NwNYhHZw1ke/oKE1sH6Q80E2NP/JWcI1CI/REG
         UgakFsXSnmSR1EMqlhcyhWqSUZ2swNOmVHnnNENPJivoe8IG3OIYRU+gB3cohb4JLa8Q
         oNSA3OZuNXSRNPE0Uo5RSCJaAW3E/DPSKaouqZT3t67EZgUE8KmX4wf5nc253kh8Ivz2
         et2w==
X-Forwarded-Encrypted: i=1; AJvYcCUxW4MpY8RCcTtdYuTY1r3d0/LRCeWs9wArvggsOYo+eRcnFJokRTzEY9IShCTetDYyqAcVVGMdl8Ob@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvxanokhb/70n9R7mMLrs4o/YY5iZwOI+kpAXjKVIxTypRu4pO
	LA0XSCSXXYtbujmFIHY+vWvTxFi0zZd/Y477EqfUVCCKxfN5/QrPiG8v
X-Gm-Gg: ASbGncvD7JaA38YLltpyZx6OwpnelP5JgJHrk6UAP8+fAMolIOiYSLTuTJvFt99yhH3
	HyvXCcHodEi9Xwwf/gB9zR0lqRIBjNHgnTozxUWq7yyUAETFGEcIRTm4HyDZ9jATR2Mk0vMvpnT
	xFDSfNB+ioPHHsEl3tjtgQhuYdCQL7Ekb6KmjPkBG7446Rt2icuavH5+HXJyFB9J/8F1p/L33p+
	VoguOOv3itVJLWcmwh6v825RLf3n9v32+xYY+kJl7H84ySO2Px7a2uDTrIjriQtlG7WgN/y4cRE
	VN08P/L7hQVMYvP2lY0oTPcKG/82DHV3DL952C2+V1rARHUoFw5WCB2dEagKx3YAcqpWdY7uh07
	KCIHXwrNdN6Q6ug1MB+SOkm2n9zrL2reBqufhEFT2sD4y00eQpPZbafDZ51GO5JTVGRaa1z4pfR
	+nob3wHn9X
X-Google-Smtp-Source: AGHT+IFtaSkAiKKcd2pcmpO8llRHe3kknOAIp2k2H7U83BZTPQHu+FuTy+qLrHQP9UKuG8qf//3qLQ==
X-Received: by 2002:a17:902:da8f:b0:26d:353c:75cd with SMTP id d9443c01a7336-294cb381901mr58454085ad.21.1761666170702;
        Tue, 28 Oct 2025 08:42:50 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a4d9sm119815145ad.37.2025.10.28.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:42:50 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
Date: Tue, 28 Oct 2025 21:12:24 +0530
Message-ID: <20251028154229.6774-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
References: <20251028154229.6774-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign the result of devm_gpiod_get_optional() directly to pcie->reset_gpio.
Thus removes a superfluous local variable, which simplifies control flow
and improves code clarity without affecting functional behavior.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: Improve the commit message
---
 drivers/pci/controller/cadence/pci-j721e.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index a88b2e52fd78..ecd1b0312400 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -477,7 +477,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 	struct j721e_pcie *pcie;
 	struct cdns_pcie_rc *rc = NULL;
 	struct cdns_pcie_ep *ep = NULL;
-	struct gpio_desc *gpiod;
 	void __iomem *base;
 	u32 num_lanes;
 	u32 mode;
@@ -589,12 +588,12 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 
 	switch (mode) {
 	case PCI_MODE_RC:
-		gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-		if (IS_ERR(gpiod)) {
-			ret = dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get reset GPIO\n");
+		pcie->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+		if (IS_ERR(pcie->reset_gpio)) {
+			ret = dev_err_probe(dev, PTR_ERR(pcie->reset_gpio),
+					    "Failed to get reset GPIO\n");
 			goto err_get_sync;
 		}
-		pcie->reset_gpio = gpiod;
 
 		ret = cdns_pcie_init_phy(dev, cdns_pcie);
 		if (ret) {
@@ -616,9 +615,9 @@ static int j721e_pcie_probe(struct platform_device *pdev)
 		 * This shall ensure that the power and the reference clock
 		 * are stable.
 		 */
-		if (gpiod) {
+		if (pcie->reset_gpio) {
 			msleep(PCIE_T_PVPERL_MS);
-			gpiod_set_value_cansleep(gpiod, 1);
+			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
 		}
 
 		ret = cdns_pcie_host_setup(rc);
-- 
2.50.1


