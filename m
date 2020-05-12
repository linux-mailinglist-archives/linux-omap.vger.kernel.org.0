Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021E81D012D
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 23:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731445AbgELVr2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 17:47:28 -0400
Received: from muru.com ([72.249.23.125]:54252 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731415AbgELVr1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 17:47:27 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9029E81C1;
        Tue, 12 May 2020 21:48:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: serdev: ngsm: Add binding for serdev-ngsm
Date:   Tue, 12 May 2020 14:47:09 -0700
Message-Id: <20200512214713.40501-3-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512214713.40501-1-tony@atomide.com>
References: <20200512214713.40501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a binding document for a generic serdev-ngsm driver that can be
used to bring up TS 27.010 line discipline with Linux n_gsm support
on a serial port.

As the Motorola Mapphone modems require some custom handling, they
are handled with a separate compatible.

Let's also add vendor string for ETSI as we're using a ETSI 3GPP
TS 27.010 standard.

Reviewed-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../bindings/serdev/serdev-ngsm.yaml          | 64 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml

diff --git a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serdev/serdev-ngsm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic serdev-ngsm TS 27.010 driver
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    enum:
+      - etsi,3gpp-ts27010-adaption1
+      - motorola,mapphone-mdm6600-serial
+
+  ttymask:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description: Mask of the TS 27.010 channel TTY interfaces to start (64 bit)
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: motorola,mapphone-mdm6600-serial
+    then:
+      properties:
+        phys:
+          $ref: /schemas/types.yaml#/definitions/phandle-array
+          description: USB PHY needed for shared GPIO PM wake-up pins
+          maxItems: 1
+
+        phy-names:
+          description: Name of the USB PHY
+          const: usb
+
+      required:
+        - phys
+        - phy-names
+
+required:
+  - compatible
+  - ttymask
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    modem {
+      compatible = "motorola,mapphone-mdm6600-serial";
+      ttymask = <0 0x00001fee>;
+      phys = <&fsusb1_phy>;
+      phy-names = "usb";
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -323,6 +323,8 @@ patternProperties:
     description: Espressif Systems Co. Ltd.
   "^est,.*":
     description: ESTeem Wireless Modems
+  "^etsi,.*":
+    description: ETSI
   "^ettus,.*":
     description: NI Ettus Research
   "^eukrea,.*":
-- 
2.26.2
