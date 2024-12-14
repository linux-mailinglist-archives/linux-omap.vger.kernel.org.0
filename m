Return-Path: <linux-omap+bounces-2823-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C79F210D
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2024 22:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABA01188752E
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2024 21:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F287F1B0F29;
	Sat, 14 Dec 2024 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc7+slfL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D1137E;
	Sat, 14 Dec 2024 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213134; cv=none; b=BSgtwLZXAEHx6Gt163eOoyPr7fAR4/9Uyt0w2uPiDAgV2AHFqM7HuliYOC5a78D6UlWb+LztWmwIkExNTRMdXQ41x23Jg4TgKc+okDKTGTJVquoq3qdtG08spsc9oPMadryEtshC/Oe0AXIh6/8goH/FNHdJgHqADOTyjKP9zlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213134; c=relaxed/simple;
	bh=WEERpUugMIVF+RpGbGa3aJw6AHnRLtvfpjRFt8LA5fc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nvGysrkBnudhaqd2+11Skr9APCtyhBbj0fx2XClbDp/lxpT/+N1Rmx7/FblXQoCmA2P14GlXjq1BKgvEiFmVpnY3K31Ixf2NCza69+BMsGxdOfKftSrxF8yvltRGnfbvgZGhFGgKkrPht910mt1Wsn1PlfqGH6Cx8bTHq0tBu+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc7+slfL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso489005666b.1;
        Sat, 14 Dec 2024 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213131; x=1734817931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/YC7qsZQDqPwi0DSerU+A2lmpctu8Ls9iP33kzH6HQ=;
        b=Jc7+slfL9agMGNYhIf/pjQ2/X8pIU3Y2CTuDquqFmfOQe9vpVveJatcTXDFJoQgjRs
         b72mHIngZpfachnjVM9xj1zkhTPi9ZmTW4+FLOBYYNhun3M4ifJdey/+CTyGdVXIw6FY
         DV2ceakCk72c2BYWezx6BNoyukOEHnHoQjPC0K6QZfANYtkIVIu9XYs1x1QXcACersc8
         uNrm8dE1ACFyKkh94i2xHSKVnws8hrDamnwmGnd7X/KCt9HMUhyKDvrlUpLlm8OoDYJj
         cxZIid0qjN4U2GviHNLduxbUeS/Dlo+/oXh+ikW4vjejeVVS1MGkrp2NuWAbFQDHnfV7
         Nq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213131; x=1734817931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/YC7qsZQDqPwi0DSerU+A2lmpctu8Ls9iP33kzH6HQ=;
        b=Sg+2sr23JiHK+2cRoYAApd/vAWzQm7uSVhJhr93+C6XWrFkEXlsmGkiuGnY9a8RNwv
         aEYRnr7gUBWKKSQ6HGPvh0Fx3t5669N013/zKRw4CFgEC9BpFTIq7JUhFrEQZdvMAnBh
         TEL1ERs9kbvy3AcS0S+9jvzq/5BGsCynjL2JQ9sjNmyzXVwxF/nID+tlNK8oOVkSof8p
         mhXbO0phN8QVdHPQ0qUGl+inWjqBMi2zx4Rd9opApXu1UfWQ7lu0N3XfEozs773DlxTY
         nyKcKDnJAtIvVS+lauwnlDl4lJBKo+o3xsz4saA6rT1vDfE6h8bh01UTPIyiYA/JorOC
         bXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNQU0IJhpi2U+/T9tS8zxPlgVRKemRzVeIJvjslt0WEyflJyQv/VvUoyi2q/Hlw6vwKHiW7W+fl83uqyE=@vger.kernel.org, AJvYcCWMxxRU71VtElyoEgKWG8G1UYrMoxIFSLOUe693zL5sy3T+jjmEE8e4sbt7PZs38z7RzfLVyGOFvl83Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3w2yxCHmQ8v9fsq+JdiGOSaGspXLEU75v0uFDCbWjSm66CeF
	cU57WFdEtMWFXpYNJED3iTuM5n4GjpHUUXks068mFIobVB5PexIi
X-Gm-Gg: ASbGnctZrMDnNdPZxZL5+WIuiUJMuYT4by9SFt0TEEiNtBBo8gbwmdrmVdC6LvBtA7n
	uBFLFz9IvCPFzcG2pjpnwtoeuHV6boku3ovFYVnph+LWkQBrPI/3D/gGbYGosJAomYnuVlcdrBW
	jUmTx+jKP1xuI9tLLUfgx8LFTDL3U+hcccTAc/JY3dXUd7nB07SeYmfHTqDB8O0VwC0J3Jw/vRQ
	H7c2Lq3JxcNA3/BXgnGt9f9r/qEh33WJNDDK6oQVZKy76Lj56CGVSz1NKhWoaF57Vk=
X-Google-Smtp-Source: AGHT+IHRglX6dcJH31gxHa/6wW1mMpn14tLgw9bFgX7WVXdACNj1C6kigUNQFnSR4vD5o8uj+wrjog==
X-Received: by 2002:a17:907:c24:b0:aa6:7662:c56e with SMTP id a640c23a62f3a-aab77ec4181mr832539766b.55.1734213130370;
        Sat, 14 Dec 2024 13:52:10 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9606839csm139090266b.61.2024.12.14.13.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 13:52:10 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: andreas@kemnade.info,
	rogerq@kernel.org,
	karprzy7@gmail.com,
	lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCHv3] dt-bindings: mfd: omap-usb-tll: convert to YAML
Date: Sat, 14 Dec 2024 22:52:07 +0100
Message-Id: <20241214215207.842765-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conversion of omap-usb-tll.txt into yaml format, inspired by discussion in
lore.kernel.org/all/cd915c18-7230-4c38-a860-d2a777223147@kernel.org/

Changes made to the binding during conversion:
- Added Roger Quadros as maintainer
- Removed deprecated ti,hwmod
- Renamed .yaml file to ti,usbhs-tll.yaml

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 -----------
 .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml

diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt b/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
deleted file mode 100644
index c58d70437..000000000
--- a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-OMAP HS USB Host TLL (Transceiver-Less Interface)
-
-Required properties:
-
-- compatible : should be "ti,usbhs-tll"
-- reg : should contain one register range i.e. start and length
-- interrupts : should contain the TLL module's interrupt
-- ti,hwmod : must contain "usb_tll_hs"
-
-Optional properties:
-
-- clocks: a list of phandles and clock-specifier pairs, one for each entry in
-  clock-names.
-
-- clock-names: should include:
-  * "usb_tll_hs_usb_ch0_clk" - USB TLL channel 0 clock
-  * "usb_tll_hs_usb_ch1_clk" - USB TLL channel 1 clock
-  * "usb_tll_hs_usb_ch2_clk" - USB TLL channel 2 clock
-
-Example:
-
-	usbhstll: usbhstll@4a062000 {
-		compatible = "ti,usbhs-tll";
-		reg = <0x4a062000 0x1000>;
-		interrupts = <78>;
-		ti,hwmods = "usb_tll_hs";
-	  };
diff --git a/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
new file mode 100644
index 000000000..aa4edc51d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,usbhs-tll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP HS USB Host TLL (Transceiver-Less Interface)
+
+maintainers:
+  - Roger Quadros <rogerq@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - ti,usbhs-tll
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: usb_tll_hs_usb_ch0_clk
+      - const: usb_tll_hs_usb_ch1_clk
+      - const: usb_tll_hs_usb_ch2_clk
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    usbhstll@4a062000 {
+      compatible = "ti,usbhs-tll";
+      reg = <0x4a062000 0x1000>;
+      interrupts = <78>;
+    };
-- 
2.34.1


