Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38419BB5AB
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730987AbfIWNpP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:45:15 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38587 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfIWNpP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:45:15 -0400
Received: by mail-io1-f68.google.com with SMTP id u8so12196196iom.5;
        Mon, 23 Sep 2019 06:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6KEVbOMgmT7rRfn/GiQXZyuHVfsA7+ZXr3TLsE1ZKxg=;
        b=apaI9MYT4uF2EnxCrwNl6kE1+1obRxTSGNBCmUc1fv82RV20hwMgb0DelnRGQBg/0r
         /eUkkz48X0hfIPKZ2N2DmbN5oKZobno+nbjeT4eeskVcepR8ap4NOLPh5/jA0JggX023
         xvJlUduAlc51f9v/RV2Bus8bcJJDY9yzItUSL7KWtJoJ/CObfC3BXBagk07kE4SAp7lX
         oU1df9YcLYKKdlWkMv+q5oms96DMigH/BvWFYs4/vFBV65Fq4vJ42EPFpG6DLEPcXP2L
         pRleMG7p84G+AXDbphrjFJl4MKLA9TSjeWjZu8plF4AKoet8cbrxTyq459qEcWKEXVH4
         FE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6KEVbOMgmT7rRfn/GiQXZyuHVfsA7+ZXr3TLsE1ZKxg=;
        b=nS9hkI703DPHKBowwMUEFqJwgtcmCtZQ/9uk8sN1gH+AkA+2OCkg97tfpYoPjo47a6
         G+aD3CrTKKw8pmPbnsbNcr/saGiErbG1sp6e+sZPr7/FnFidTwMScpvuCRXbHU4btSpu
         DmOMAVl+386vcydFoXcZPR7zqQmhXGoPHs23pC5ZIDf4sfBFs+2hpmTnzNpDzKbmqc8I
         TYBBLI921WvLEFaRTh4G2ef/r8htkuedGOvcb7PVtUedeRsHw2Z0vdhSdxgikeg/8HcI
         nWaOsAWZd0yPQiYmnzJt/8foHAxXIPwELE8/w72LRFnI4HBQ65D9pPAtfdNmZGpQlIFu
         +G/Q==
X-Gm-Message-State: APjAAAW9DiPI7vIKv7etiR/F8ZI3dUsk6V8FrfwWdbWvQSefkXhR30xz
        WTdj/SDjxsE8wWvoc/0gR4c=
X-Google-Smtp-Source: APXvYqyRhc1UYpQc17s5gFWSBKWFMsHMrfOoJgvXh4s0LmVVLySIdfue6aQFT09HebdqP+/6iH4Gzw==
X-Received: by 2002:a6b:e302:: with SMTP id u2mr2267525ioc.135.1569246313939;
        Mon, 23 Sep 2019 06:45:13 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x2sm8844474iob.74.2019.09.23.06.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 06:45:08 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/3] dt-bindings: Add Logic PD Type 28 display panel
Date:   Mon, 23 Sep 2019 08:44:48 -0500
Message-Id: <20190923134449.22326-2-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923134449.22326-1-aford173@gmail.com>
References: <20190923134449.22326-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds documentation of device tree bindings for the WVGA panel
Logic PD Type 28 display.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Use YAML instead of TXT for binding

diff --git a/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
new file mode 100644
index 000000000000..707e2a17c8c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/logicpd,type28.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ronbo,rb070d30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Logic PD Type 28 4.3" WQVGA TFT LCD panel
+
+properties:
+  compatible:
+    const: logicpd,type28
+
+  power-supply:
+    description: Regulator to provide the supply voltage
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO pin to enable or disable the panel
+    maxItems: 1
+
+  backlight:
+    description: Backlight used by the panel
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+	lcd0: display {
+		compatible = "logicpd,type28";
+		enable-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
+		port {
+			lcd_in: endpoint {
+				remote-endpoint = <&dpi_out>;
+			};
+		};
+	};
-- 
2.17.1

