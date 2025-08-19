Return-Path: <linux-omap+bounces-4271-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD0B2CD91
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 22:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64BEE4E4BE7
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 20:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C19341ADD;
	Tue, 19 Aug 2025 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9vuPIhH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53F340DAB;
	Tue, 19 Aug 2025 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634407; cv=none; b=u9o5dtrmCXGCQVCPYzOTcBghSyPKe8cDRv/IeC+t7Wg6UN4vmpk2OCdhjzkwH0IfSjCumCJD4+bCNr9UzsIaRa3oFewuMSFLKncvK2JVV6FvTfUxomLXuadHopzl/n0nvA7ajfZA+rv1ItpzgR9LmeEt9qMg5Cn31ByVNYcRm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634407; c=relaxed/simple;
	bh=NRTK5/DdsThFsD4bQ4sKyg20FKM0kzOknPwv4hIjSq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PLOMZP0Ps0Uteca5uveb8sAtdqyF27FINI81egyfwcI9Pxvy4phnpPkZn9KkdDZ8m2pzVXfOJgdICMfwhGkrPbkKOkMqu7ius5V+e0gVTTgAf7N3DBzsFBPpaVP33+LijXs7jltUFmK0AVFkphHzf6GaPI38Ooeg9q35FQppGqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9vuPIhH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso30065315e9.0;
        Tue, 19 Aug 2025 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755634404; x=1756239204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mvrZfLsypKMiACsSNAj4UlMwJzICbqho4HfD2MSUZ4=;
        b=g9vuPIhH8d8oV8fz4ZKgYozQ+MWDamlS8Ge43DoYk4f+KDDVMap8LULOW/Ev+5bhTq
         njXi6RDwAllLe0LKzcuOyUY/xbxyaPYORJ1dxfMQLSfPpy/GJto8D3zEhRVVWY94ZPPB
         XJ5x2/csuZa674U0BjHTGWq4BP7kyb4TKUjHzvcRNuU4no43CMr/8RknPaLZ1gca+DXv
         7hCQrbOOnh0c3Kj7bc5B8mCS9BwUkm33og4hdQkksirFs7pAfD3TNOgwu9eWwSeUxT/S
         4zAJTKfiW5KrAZbKZAZbNEw24DJDlVv6lvB4kqLX/7uCcwz3ccuklTN/A4yQ5Z44AScx
         Mw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634404; x=1756239204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mvrZfLsypKMiACsSNAj4UlMwJzICbqho4HfD2MSUZ4=;
        b=Pqs6Ap26KYtgLLpvaLzvXypHM1kwCPPVgEUnCdEDyt69lz+Ez/oOugCTCiRW2uJtFH
         /QNonIMHZvMkJUtofyPUCXQb6P418XNBbjzTn/8uDJ8NkeNGrAgIcYL1piQlCdmAU/JU
         6VYvDZUGfGsBGXxLVMCHA6QWa2KQ1H4jDy9EP7GKWi8yf7YRBGlH7aRFeX4jRykBEKGs
         uiqCeRBZhypTKWWRAmzGVg7nC9ZVrz0cfMkm0ey3lHrMyWXw+silUKUyfhmj82NkPAb0
         fuaJlSPLpY/y2ck0pmFq1zY62Aaqk2tZnRH0z+QJN6N7ts3rwgVlga9Re3/indJCVmsi
         CtPA==
X-Forwarded-Encrypted: i=1; AJvYcCUxIJSPFSVh978H08H0TnLZG1DSvnTrfbHpDn0msjgqKQoPyDHT7Gp8yvrtJts6tKbApyyrRxiO1/zEw3ju@vger.kernel.org, AJvYcCV/LiOHTSdczjDFEs7jf6mVAgnBhG2n2Yxh4M+2u12zZB6c30026QSnd8vhFVjQl9T66AYDhKIVi8aTRZk=@vger.kernel.org, AJvYcCVnA+sPvBiECY26+1QArL/UxnAxo9sGSTbmVM1ndHKkBH+0nA+y7y5Y6FptDRSFqCHmzGSQgs6G6RGX@vger.kernel.org, AJvYcCXvKt9QXD8Hc44WscC+XFHdgB00A6yxoCo9OIk+fNXmSE9YnQlcDqJnpsb1o/NpSHcd5UTRfOwgoHQ1vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DusCO+mF/Co0tDXja8MfRP9fLdm/Oe9fp+iZ0CRNuzMlx9om
	NzNhXOTfH6wGDDlBajt2k49gJj5apPIYmYdCyvsoOarvqidZFrHVJi9KVuQU
X-Gm-Gg: ASbGncswN/rpVXRcTgfdBVj1id23shCAvYOBae7flVAtYaft626r2sOiheZRKA2IZY3
	1oeDXzPYpND16Gv7KFVyo1EGLQLBNngp+tcaZtAZZgEnh+fi6X+QSpryzgRG5RSj3v4+fgy2oAM
	GAZ1Sk0EbSA7l4bSwah8gcBgA9Fg0bjsWvUoi4IR5/VAc5TJVRgUgXZijjkp1oaWQpdXpenKCij
	suWCRMw4vIN+uC2c/ypdDQwtPunsrmie+XJ4Q3MsUugVuQvVQCZoUc2RCTStRvvEb+o75pO9i4U
	LnyG37dcttJDeMH18imz4zeUD+hzHFmQ3R8Lry6xoWCwyBG3uMt6LQD+i1rp1bd8SUclOyIWpAK
	kqyI1umTBVXAJEiDxwRH9GmgPGfFCn7Wj4lzyF5Mco+znkTA=
X-Google-Smtp-Source: AGHT+IE9G1eLKA6vQ6mXiMEYJDsNN7NkjG3lAgp3pl5kUZ4GhDYIow0VvLG4OUA1b4PHu+fmg6SB1Q==
X-Received: by 2002:a05:600c:1c12:b0:456:3b21:ad1e with SMTP id 5b1f17b1804b1-45b479e949dmr1776775e9.17.1755634403743;
        Tue, 19 Aug 2025 13:13:23 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:216f:2f7a:74c6:177a:3b99:868c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c57d32sm4939887f8f.64.2025.08.19.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:13:23 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org
Cc: peter.ujfalusi@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v4 2/2] ASoC: dt-bindings: omap-twl4030: convert to DT schema
Date: Tue, 19 Aug 2025 22:13:02 +0200
Message-Id: <20250819201302.80712-3-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
References: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the legacy TXT binding for the OMAP TWL4030 sound card
to the modern YAML DT schema format. This adds formal validation
and improves documentation.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
Changes in v4:
 - Deleted redundant pins list.
 - Split from larger series per maintainer feedback.
 - v3 link:
   https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/

Changes in v3:
 - No change to binding content, only updating commit message format.

Changes in v2:
 - Fixed comment formatting (added spaces for better alignment).
 - Updated commit subject to align with subsystem style.
 - Retained Acked-by from v1 as changes are cosmetic.
---
 .../bindings/sound/omap-twl4030.txt           | 62 ------------
 .../bindings/sound/ti,omap-twl4030.yaml       | 98 +++++++++++++++++++
 2 files changed, 98 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-twl4030.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml

diff --git a/Documentation/devicetree/bindings/sound/omap-twl4030.txt b/Documentation/devicetree/bindings/sound/omap-twl4030.txt
deleted file mode 100644
index f6a715e4e..000000000
--- a/Documentation/devicetree/bindings/sound/omap-twl4030.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* Texas Instruments SoC with twl4030 based audio setups
-
-Required properties:
-- compatible: "ti,omap-twl4030"
-- ti,model: Name of the sound card (for example "omap3beagle")
-- ti,mcbsp: phandle for the McBSP node
-
-Optional properties:
-- ti,codec: phandle for the twl4030 audio node
-- ti,mcbsp-voice: phandle for the McBSP node connected to the voice port of twl
-- ti, jack-det-gpio: Jack detect GPIO
-- ti,audio-routing: List of connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source.
-  If the routing is not provided all possible connection will be available
-
-Available audio endpoints for the audio-routing table:
-
-Board connectors:
- * Headset Stereophone
- * Earpiece Spk
- * Handsfree Spk
- * Ext Spk
- * Main Mic
- * Sub Mic
- * Headset Mic
- * Carkit Mic
- * Digital0 Mic
- * Digital1 Mic
- * Line In
-
-twl4030 pins:
- * HSOL
- * HSOR
- * EARPIECE
- * HFL
- * HFR
- * PREDRIVEL
- * PREDRIVER
- * CARKITL
- * CARKITR
- * MAINMIC
- * SUBMIC
- * HSMIC
- * DIGIMIC0
- * DIGIMIC1
- * CARKITMIC
- * AUXL
- * AUXR
-
- * Headset Mic Bias
- * Mic Bias 1 /* Used for Main Mic or Digimic0 */
- * Mic Bias 2 /* Used for Sub Mic or Digimic1 */
-
-Example:
-
-sound {
-	compatible = "ti,omap-twl4030";
-	ti,model = "omap3beagle";
-
-	ti,mcbsp = <&mcbsp2>;
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml b/Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml
new file mode 100644
index 000000000..27c7019bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap-twl4030.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments SoC with twl4030 based audio setups
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@gmail.com>
+
+description:
+  Audio setups on TI OMAP SoCs using TWL4030-family
+  audio codec connected via a McBSP port.
+
+properties:
+  compatible:
+    const: ti,omap-twl4030
+
+  ti,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the sound card (for example "omap3beagle").
+
+  ti,mcbsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle for the McBSP node.
+
+  ti,codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle for the twl4030 audio node.
+
+  ti,mcbsp-voice:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the McBSP node connected to the voice port.
+
+  ti,jack-det-gpio:
+    description: GPIO specifier for jack detection.
+    maxItems: 1
+
+  ti,audio-routing:
+    description: |
+      A list of audio routing connections. Each entry is a pair of strings,
+      with the first being the connection's sink and the second being the
+      source. If not provided, all possible connections are available.
+
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    items:
+      enum:
+        # Board Connectors
+        - Headset Stereophone
+        - Earpiece Spk
+        - Handsfree Spk
+        - Ext Spk
+        - Main Mic
+        - Sub Mic
+        - Headset Mic
+        - Carkit Mic
+        - Digital0 Mic
+        - Digital1 Mic
+        - Line In
+
+        # CODEC Pins
+        - HSOL
+        - HSOR
+        - EARPIECE
+        - HFL
+        - HFR
+        - PREDRIVEL
+        - PREDRIVER
+        - CARKITL
+        - CARKITR
+        - MAINMIC
+        - SUBMIC
+        - HSMIC
+        - DIGIMIC0
+        - DIGIMIC1
+        - CARKITMIC
+        - AUXL
+        - AUXR
+
+        # Headset Mic Bias
+        - Mic Bias 1   # Used for Main Mic or Digimic0
+        - Mic Bias 2   # Used for Sub Mic or Digimic1
+
+required:
+  - compatible
+  - ti,model
+  - ti,mcbsp
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "ti,omap-twl4030";
+        ti,model = "omap3beagle";
+        ti,mcbsp = <&mcbsp2>;
+    };
-- 
2.39.5


