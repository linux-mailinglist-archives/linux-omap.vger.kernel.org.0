Return-Path: <linux-omap+bounces-2812-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B69EEC52
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2024 16:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D860E1883FD0
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2024 15:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B96217F26;
	Thu, 12 Dec 2024 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwMMp2Da"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4D212F9E;
	Thu, 12 Dec 2024 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017503; cv=none; b=mgSLBv6N6/XBmAgjA6iGtReDySpoEIDBAJmnBvr1wGA0BDXg8HDcPO0Za2KVArhEe1xBu6hjakNQ8nFrlIhGqHMz1kJ0JZvIJGr/B6SirrE/qZiHrTnTUsD7cqCM4mISuU208RPLeHkoQOJaf+L0R77C+8DHKtn4Ilyn3tAQ5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017503; c=relaxed/simple;
	bh=q1dc8Dt0cKtNCTV+mFc8Aw6w784D6QIr4l89OC5gXGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bWPIIAXe3USj7zEiKLT49zwkSQMdpjl5QTQNDJKG2bLI3MI92C7C8iWwUEJ/Vll6sHQt7yk7/sEIYB81e8U3++oaIBEiBMIC7kp8B6Snah01EzObo0BUKC0VpeLJF7ZMfh55SA+OymxmkwnXdyPQaa5N4VmmrVw9MTXIllzgomc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwMMp2Da; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so3665354a12.1;
        Thu, 12 Dec 2024 07:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734017500; x=1734622300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQAH1ha0soBxIuENIBbCMfyr0YHcwaA/9Qw0+QVF+AY=;
        b=fwMMp2DaE7/J2l4Fb41aOlu9XLuLGep+vF4J7uHpAyomhs6DSyUF07i2YygP+cbCJO
         Sr4GLBtecOHJO0i2kCXkdOQougJ7LUzPGG5aghOWUBO51YcyN19Un4W+WtmnwiRfojtm
         oqUdMg+AmYCH7yszj4lC1/bl+jcijdqyiSmUKCf7ZSf7U3fb+K2kAPFJhrcfJn+EKdmi
         zqMpKxO5KIpt10nQ8faOqzy6w13wPQusUxNOu/aFWjOo0B/QACznfDem3AvTscHD4ox5
         4P0/B84Q5qAedSgyHzIxyqYSnw+hqWkIISVnus0h/E4sLBIgnMjRyIw6GfWNoxL+GYq+
         rkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017500; x=1734622300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQAH1ha0soBxIuENIBbCMfyr0YHcwaA/9Qw0+QVF+AY=;
        b=ZpSLnGWXcPl3uvZN+lrf7MSMYutwcmcHKdBuGKFW68bIeFlXqILBBA4FFfkC1Jq751
         mxrVmyvJD9NCIKcblSYGFLTVdAz/AMWaqDnUmx/yPtM+xBLTpBmWhVg/gRtHMcISXXvb
         eN+dUZo/cD2a5AK53fKPXe1LykUEV/OaqX2zLuocZFM80FnI2HbqGl8zoPERSthN9lL4
         4zU6YMHBQkvuM7sG8lZCnAYtPLPSp8OuPHVgB3TGGaY1HkUtOnj2vIIn8qez0q3AWbRC
         aRFrJi8tiJBASuL2TALQlJ26UvTxQsXtP8X4Sspt/+dR3AJ29STcSy9Nez/zDTdDoG5B
         iGqg==
X-Forwarded-Encrypted: i=1; AJvYcCVmEmX4tOjqWsUL2SY6EPX7B9Kj5ji3wpYL4VLuIAwJFCXNfDK/sZqNpCpfaVMA1h/3EWSuSsCuolfTVHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXyhGPBrs5OCbrezPqc0W4MPoFJUETAMzaA/ytJxPVNj8gJXfh
	9EKoQcyFMPx+1BmpSDBMSvu8kuVra2Lac6V9rg1uiY100NZp2VYb
X-Gm-Gg: ASbGncvER+0k97Haf8Koh4Z4GMgg1wQl7sCgCy5+G7MsPO37DfoOvS50cScB5trbabd
	U5kDl/QMspNcjD6YTUsdd0M75JLfdVBaJAn67JPb6C3Z41k0xa0E6RraCy8zf7BttBcb+Z5L5Xe
	ZYUNmmbLBq2nyi8Nqwiqha6HmO8a1BTM3/WaCVeDWR2Y0OeOlekPebn1vWCZ9D84wR6R5MnzPMI
	2Wg0Y9fBrMy4vT7e9XjR+pcCuHPRyjEpSUC3jmnLnSap2AsYVOgsVDN0bT6eRv7AaM=
X-Google-Smtp-Source: AGHT+IEbTP24qHze6HMCEiG37n2mIahxgfgBPey4ZBn6n0RwZGHGxfQvB13R/zAZu+EEw56lYf3qnA==
X-Received: by 2002:a17:906:9d2:b0:aa6:88a2:cfbd with SMTP id a640c23a62f3a-aa6c416fcebmr373299366b.22.1734017500193;
        Thu, 12 Dec 2024 07:31:40 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6696acc74sm777647566b.134.2024.12.12.07.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:31:39 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: andreas@kemnade.info,
	rogerq@kernel.org,
	karprzy7@gmail.com,
	lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCHv2] dt-bindings: mfd: omap-usb-tll: convert to YAML
Date: Thu, 12 Dec 2024 16:31:38 +0100
Message-Id: <20241212153138.368086-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conversion of omap-usb-tll.txt into yaml format, inspired by discussion in [1]

Changes after v1:
Added Roger Quadros as maintainer
Removed deprecated property 'ti,hwmod'
Renamed .yaml file

1 - https://lore.kernel.org/all/cd915c18-7230-4c38-a860-d2a777223147@kernel.org/

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 -----------
 .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 27 deletions(-)
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
index 000000000..d666d3e23
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,usbhs-tll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP HS USB Host TLL (Transceiver-Less Interface)
+
+maintainers:
+  - <rogerq@kernel.org>
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
+
+  clock-names:
+    items:
+      - const: usb_tll_hs_usb_ch0_clk
+      - const: usb_tll_hs_usb_ch1_clk
+      - const: usb_tll_hs_usb_ch2_clk
+    minItems: 2
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


