Return-Path: <linux-omap+bounces-4270-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BFDB2CD8E
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 22:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3850B4E4BB7
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 20:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A0C340DA4;
	Tue, 19 Aug 2025 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMCQBojo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805DC3218CF;
	Tue, 19 Aug 2025 20:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634405; cv=none; b=geYd0T6hGFfJDun+RGSVrCwPeBE2wLy7JqhxHpkYhonBYlFQg1ahJ/yHE9LpZGRBS+XDJxjEF+ML0FkAwBfHyp3IQCciKAJdUoWxjX7V6ZzTWUsRJfttod4odnhzkXp8j9giJYhtzetR1lChhwFB+VzpKQ2jPOqPUOelL16w8uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634405; c=relaxed/simple;
	bh=+w+HSP3UQA40aT2UcHbez1EfGnbKmtzc6qH3ip2f20k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGBcQ4l9MFkxSxrpe4nJy+Op1wU1TmgZg0Ddh7Nv4mihTGB5X0jAEuA98TpJAC1aw0lPP8boaHNqn7p+ZQ3be2EzvBp7tMCmlPeOmCXD6Neg2+Vd0VD6aN2sXLvPtRHWzUZOX+FDeUtXifEw+kw2w3+wPIKZAmC0oHWY2Neu0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMCQBojo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so30758825e9.3;
        Tue, 19 Aug 2025 13:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755634401; x=1756239201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyZ0mIX3sVnB4/cfE1N439HvZz2L5PuAVQyxyZo/jGY=;
        b=dMCQBojo+T774y6llfPycpVe5aKNn0mRaSRMPQY1szxVt1X8LZojUBkm6oo/5tfpwV
         j2KboDf+ftFb00J80iDmAoxfUPTq4HujgrUPU1/23PssBIbKOsWjp9iVxCPfsJiQ+wFK
         bnYNEyZ81QUeWhvSc3ZfbiC7xBkunEJ/H0wQIS3Xy11W+L+6hZ0vcgtudET3aihVGPNk
         tGZ3cxKXcC9GnkT/4TQ1zFTcVmmbBkvIKYLQ83yuVWB50yTqqCajjBuzv6aaK+0qDpGV
         243f1cmiw4U3aYWpLxEhqfMS+PfRlHKnlpIVdx8tDAqarW15IFg108pnJszXGCLwx6qO
         5O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634401; x=1756239201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyZ0mIX3sVnB4/cfE1N439HvZz2L5PuAVQyxyZo/jGY=;
        b=ZPlhVfC82skVuxlFKeN0QuQqiY9zV0nlQhSVuko5OuEshecV0aUuvnqrctwjHvxZVZ
         VbmoEowNEvA0BeDvp2C+nSEvtnlnYTWPPsPzF3TckyWRKjAVHy9kFLaka4/r5qGJkIsw
         Lh/vV3lrBAAekdQUqJFh9gDIyDWSahqFStJDvk5Q9B5+kUrunzGszG8yI5ni+BhbK6Ol
         g/lgxvBw0RJVwf4DdxqxtwsUMlAqOXdNAETIkeLX59Ko4ANilcy/5Tbl/OVlctqTXUdq
         JgioFnbkArLOL+1GD8HOjWoNytMQa/PhU4oC1Ca3QQ277RATFSHHdM4Ncq5Ketc5xs+m
         N7tA==
X-Forwarded-Encrypted: i=1; AJvYcCUblSC1eSZUsz2fdUXe4p8YqYnM3j4Cy45nQ8rTuSZ3pN/SSXreaimRH79wyMjYrjURlZOUCJd0bCQK@vger.kernel.org, AJvYcCUefPDlS+mMDgaAV0TidusUg9LoEBlaufhjOyAbcOcr1IhLR5daBDEDG5kn6vuHDNSQFqf0VS9xFz1N2l4=@vger.kernel.org, AJvYcCVZ4uWODBfQkY7ywLBKGTs9fvX/lPbebx81D7KwgT4sVtdr4/dOhHvVD5bABhbk/1salL5NTqjsqaczTw==@vger.kernel.org, AJvYcCWMuLZ5/hLUS+VT94EZ8N+sMts1VoCJLpxry0bZczMuS4CxJyKvRcFynmjie1r/wS8YJgGxLfWkxwedHhSp@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjrWQKtn/nCX1d7MzHhzw7Wkx8l8wgdizRfpsJcgpTOoTUKt3
	t6oUyfAg34P8/tRz3EkovXqvzfK6M4CR2BY2bYFePCBN395gkD05iE9dZRsK
X-Gm-Gg: ASbGncv/zW/85Cx0l8IV5v07jYwftI529GbML5MUISkVtsPenbD6PWyRUMuAtViChvn
	b2tCzlEXW6XAQsy8X5/45LNO9/NjlONUwiqyghVhy9yFK1K12pIEsqHHdJSjPqve/jElnAnTh7Y
	LehLRoWKUdFy63BCpovGN72Ae8SnFcSrEED5P0mTPuID+vYVrLA5zjeaG4VQIL/E6p8Xpq6jPtD
	VUmFeMd7+huqTVdzEsyx6UOq7K7CHz7eT2Qv0fAjTrLrRkvIzK7yCvF0Gpg7So/yUWeRFCK+7uj
	QJUvHVflQhjdAzer4wDLT9R4pfj7gClzbrth7EcJHugw21EQzCE6shPcYcYGwa1l3UUxg0Fo4Ed
	+7AbotTcmWnbL282rT3III2iRfR6j5wU8Gu54539TC/Ra2pc=
X-Google-Smtp-Source: AGHT+IHBQRn+7AkkNspRNmMVIZUw7LUkz1hAP19KGjzlnW3afXQUlqlUskBZwdiuE5pBBVIywlkkwQ==
X-Received: by 2002:a05:600c:6216:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-45b47b50207mr748305e9.4.1755634400522;
        Tue, 19 Aug 2025 13:13:20 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:216f:2f7a:74c6:177a:3b99:868c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c57d32sm4939887f8f.64.2025.08.19.13.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:13:20 -0700 (PDT)
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
Subject: [PATCH v4 1/2] ASoC: dt-bindings: ti,twl4030-audio: convert to DT schema
Date: Tue, 19 Aug 2025 22:13:01 +0200
Message-Id: <20250819201302.80712-2-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
References: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the TWL4030 audio module bindings from txt to YAML format and
move them to the sound subsystem bindings directory. This patch also
refines the schema by adding an enum constraint for ti,enable-vibra and
updates the example to remove irrelevant I2C clock-frequency property.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

---
Changes in v4:
 - No change to binding content, only updating commit message format.
 - Split from larger series per maintainer feedback.
 - v3 link:
   https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/

Changes in v3:
 - No changes.

Changes in v2:
 - Moved binding from mfd to sound directory.
 - Added enum: [0, 1] to ti,enable-vibra for stricter validation.
 - Removed clock-frequency from the example as it’s not relevant to the binding.
 - Simplified example by removing unnecessary I2C node properties.
---
 .../devicetree/bindings/mfd/twl4030-audio.txt | 46 ----------
 .../bindings/sound/ti,twl4030-audio.yaml      | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl4030-audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml

diff --git a/Documentation/devicetree/bindings/mfd/twl4030-audio.txt b/Documentation/devicetree/bindings/mfd/twl4030-audio.txt
deleted file mode 100644
index 414d2ae0a..000000000
--- a/Documentation/devicetree/bindings/mfd/twl4030-audio.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Texas Instruments TWL family (twl4030) audio module
-
-The audio module inside the TWL family consist of an audio codec and a vibra
-driver.
-
-Required properties:
-- compatible : must be "ti,twl4030-audio"
-
-Optional properties, nodes:
-
-Audio functionality:
-- codec { }: Need to be present if the audio functionality is used. Within this
-	     section the following options can be used:
-- ti,digimic_delay: Delay need after enabling the digimic to reduce artifacts
-		    from the start of the recorded sample (in ms)
--ti,ramp_delay_value: HS ramp delay configuration to reduce pop noise
--ti,hs_extmute: Use external mute for HS pop reduction
--ti,hs_extmute_gpio: Use external GPIO to control the external mute
--ti,offset_cncl_path: Offset cancellation path selection, refer to TRM for the
-		      valid values.
-
-Vibra functionality
-- ti,enable-vibra: Need to be set to <1> if the vibra functionality is used. if
-		   missing or it is 0, the vibra functionality is disabled.
-
-Example:
-&i2c1 {
-	clock-frequency = <2600000>;
-
-	twl: twl@48 {
-		reg = <0x48>;
-		interrupts = <7>; /* SYS_NIRQ cascaded to intc */
-		interrupt-parent = <&intc>;
-
-		twl_audio: audio {
-			compatible = "ti,twl4030-audio";
-
-			ti,enable-vibra = <1>;
-
-			codec {
-				ti,ramp_delay_value = <3>;
-			};
-
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
new file mode 100644
index 000000000..c9c3f7513
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,twl4030-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TWL4030-family Audio Module
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@gmail.com>
+
+description:
+  The audio module within the TWL4030-family of companion chips consists
+  of an audio codec and a vibra driver. This binding describes the parent
+  node for these functions.
+
+properties:
+  compatible:
+    const: ti,twl4030-audio
+
+  codec:
+    type: object
+    description: Node containing properties for the audio codec functionality.
+
+    properties:
+      ti,digimic_delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay in milliseconds after enabling digital microphones to reduce
+          artifacts.
+
+      ti,ramp_delay_value:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Headset ramp delay configuration to reduce pop noise.
+
+      ti,hs_extmute:
+        type: boolean
+        description:
+          Enable the use of an external mute for headset pop reduction.
+
+      ti,hs_extmute_gpio:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          The GPIO specifier for the external mute control.
+        maxItems: 1
+
+      ti,offset_cncl_path:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Offset cancellation path selection. Refer to the Technical
+          Reference Manual for valid values.
+
+  # The 'codec' node itself is optional, but if it exists, it can be empty.
+  # We don't require any of its sub-properties.
+
+  ti,enable-vibra:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      Enable or disable the vibra functionality.
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      twl: twl@48 {
+        reg = <0x48>;
+        interrupts = <7>; /* SYS_NIRQ cascaded to intc */
+        interrupt-parent = <&intc>;
+
+        twl_audio: audio {
+          compatible = "ti,twl4030-audio";
+
+          ti,enable-vibra = <1>;
+
+          codec {
+            ti,ramp_delay_value = <3>;
+          };
+
+        };
+      };
+    };
-- 
2.39.5


