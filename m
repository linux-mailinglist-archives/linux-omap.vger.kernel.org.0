Return-Path: <linux-omap+bounces-3079-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C57A08D40
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297F43A359E
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315B7209F2E;
	Fri, 10 Jan 2025 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="q5dI8qtN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94144209F3B
	for <linux-omap@vger.kernel.org>; Fri, 10 Jan 2025 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503418; cv=none; b=q0vxJJSr+dRg/91Xagb/brdDFoZb+WO3byJtVFEB79HtFpDoB2aZmaagWibOcYlPltiH8s8PU25PvIWD0MdwnjGDdAGvvJV8ygRDRvkTUlbv/zxRIHyVM2wyRJtddaiXVtfQ4QMPn71EEQBqwPSLnp8WqtIi9E3pb789E4CjVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503418; c=relaxed/simple;
	bh=PrsrnGaR7IAfAlJDmUJjqzMt7qrU7eKWcsDpwP6FyUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mF6075vdp2/FjePmzFd3Y3zEXh3lRb3NSEXi/23NVqpFMPEhljrIFPaFOkAQ4fTNhrZV/T1Lm8d+VYUAy2w2PHDb41fxnUfLTdjiSI/e6Koqpv+eM9Z+O3GqKZiX6jQHdf4bo9a6zfJDceQgePmbIN9XzPb3GwptSXVbiAzJp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=q5dI8qtN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43624b2d453so19617425e9.2
        for <linux-omap@vger.kernel.org>; Fri, 10 Jan 2025 02:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736503415; x=1737108215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQeTqch9j+53iKjXj8MrgWaUt7dPLQ7MpkAT3KGPZVU=;
        b=q5dI8qtN1prMWsaJLJ7qpZX9wJJd3NugggWZeEOO/dPaEYYp3A3GpcJ93MC/YT7vro
         yHiwv4WKDSB9ifGypmCgSznNwVZ2zm4aX5fwgtrAZPhKPu0hQBdAYX4fo+lS1TW2sAnw
         A0+i/jrI1bnH9EceH8bk6z0dTQEhiFKbHvTXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503415; x=1737108215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQeTqch9j+53iKjXj8MrgWaUt7dPLQ7MpkAT3KGPZVU=;
        b=KNQwq6VOuGqp7VuSAVY/ukQXQkpVMd0gCDrzvYZyPg8AmP3RL0cFFbu8dBJtgGxwrY
         4ndrPYyrCyn9IrqFaIusSed7PwM7nxZaJOxQkNOGwKwKPKjOX3MVs54Ulv/PpG1RBZrM
         hQ2SX95nNKmBWy/xj7SQt6GT9ui6qcc4eaEGLoNqvv6a5D3EYH13wU5CpFK/slW5L/tA
         ZenjIHpNZXQJ9o1DfM0h+OOcKnRwH+fag1gPGNYW+JBvMkSlzd/zQ9c7sALpUOacgEMv
         z5zaOQARzobwFyR+uwNmo8VLew926qtOoOh1rsqZza2VwYLaMjBZ/q1M/BaHQ39rtiWz
         LZyA==
X-Forwarded-Encrypted: i=1; AJvYcCWA90Ljvt6UqVjcBuL5egQoYb6k/0uxVHH7+dsgWiL0xVvppw+UTD6m/UYWoRwxT1LrfrUjx5RU00BO@vger.kernel.org
X-Gm-Message-State: AOJu0YwCH9is7aXIVO7qMKU6RwoZ4I9/pvO4RXAnjbT9PlkupOmO4w0P
	yf/yMw48r+Hr48N1gcuCRQ73QeJDqCy+4D+PkpgZJfxvHFwcOetDKPPmWZ4ILC4=
X-Gm-Gg: ASbGnctgGpL8z94pGGFb+Pf+8rfqA0QBY0VAMEFqBY/zGy9X6+IeDeb3bCY7Vi7KmYb
	rxtS3bnzfE0d8tNgEVMBPgcUCvpPsX1f0E9DB4saRuxndZb2ep5FR1zf0+iVbTPDTb0PP0149FY
	DfZghbIU1x6HEKioEpNrtyUYEkc/qLR+k/0FRgwFVW80Wfaj+FjhzTBA8QBT/kulM1aA5e+WGbZ
	0ZcfvpYFcozR41mbKG7xpRiQBzRbcBA0kL5DQ9VUmRDegC1MCGo2KeEzrpgDo3wsvBHMjM1luhy
	a4hbDGiGDKBA1j951DKFZWV19rEKxl2Ck9uIDpg0GnxsT1hNovvqoQ==
X-Google-Smtp-Source: AGHT+IGV8wNb5pRGJC8CELqDHhfCA3lINL4YQa3ZSVbVGyS6LeSFPXZb6mq2DxQh1UMN01mIMAx/uA==
X-Received: by 2002:a05:600c:1d03:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-436e2697b32mr39134015e9.11.1736503414860;
        Fri, 10 Jan 2025 02:03:34 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d085sm4198483f8f.13.2025.01.10.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:03:34 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	afd@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH v5 1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
Date: Fri, 10 Jan 2025 11:03:30 +0100
Message-ID: <20250110100331.1642242-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
SoC are used to drive the reference clock to the PCIe Endpoint device via
the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
obtain the regmap for the ACSPCIE_CTRL register within the System
Controller device-tree node in order to enable the PAD IO Buffers.

Using the ti,j721e-acspcie-proxy-ctrl compatible imply to use "Proxy1"
address (1A090h) instead of "Proxy0" (18090h) to access
CTRLMMR_ACSPCIE0_CTRL register:

  CTRLMMR_ACSPCIE0_CTRL Register (Proxy0 Offset = 18090h; Proxy1 Offset = 1A090h)

"Proxy0" is used as the default access path that can be locked with the
help of "CTRLMMR_LOCK0_KICK0" and "CTRLMMR_LOCK0_KICK1" registers.

The Technical Reference Manual for J721e SoC with details of the
ASCPCIE_CTRL registers is available at:
https://www.ti.com/lit/zip/spruil1

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v5:
  - Add missing change to the J721e system controller binding
    to avoid DT check warning when the new acspcie0_proxy_ctrl (syscon)
    will be added to J721e system controller node (Andrew Davis).

  https://lore.kernel.org/linux-devicetree/90f47fae-a493-471d-8fe6-e7df741161be@ti.com/

  - Explain why "Proxy1" address (1A090h) should be used while using
    ti,j721e-acspcie-proxy-ctrl compatible (Siddharth Vadapalli).

  https://lore.kernel.org/linux-devicetree/begojbvvrpyjfr3pye7mqwiw73ucw5ynepdfujssr4jx4vs33a@pwahnph3qesl/

v4: Add missing change in the second list (From Andrew Davis) [1]
  Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
  [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
  [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/

v3: new commit
---
 Documentation/devicetree/bindings/mfd/syscon.yaml           | 2 ++
 .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0e68c69e7bc9..1f3e67f432e7 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
@@ -213,6 +214,7 @@ properties:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index 378e9cc5fac2..16929218d611 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -68,6 +68,12 @@ patternProperties:
     description:
       The node corresponding to SoC chip identification.
 
+  "^syscon@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      This is the ASPCIe control region.
+
 required:
   - compatible
   - reg
-- 
2.47.1


