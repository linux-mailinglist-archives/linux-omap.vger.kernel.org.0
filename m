Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF71B331A
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 01:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgDUX2I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 19:28:08 -0400
Received: from muru.com ([72.249.23.125]:50860 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbgDUX2H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 19:28:07 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3900A8081;
        Tue, 21 Apr 2020 23:28:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: serdev: motmdm: Add binding for motorola-mdm
Date:   Tue, 21 Apr 2020 16:27:51 -0700
Message-Id: <20200421232752.3070-4-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200421232752.3070-1-tony@atomide.com>
References: <20200421232752.3070-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a binding document for Motorola modems controllable by
TS 27.010 UART line discipline using serdev drivers.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
[tony@atomide.com: moved to live under bindings/serdev]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../serdev/motorola,mapphone-mdm6600.yaml     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml

diff --git a/Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml b/Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/serdev/motorola,mapphone-mdm6600.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serdev/motorola,mapphone-mdm6600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola Mapphone MDM6600 Modem
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    items:
+      - const: motorola,mapphone-mdm6600-serial
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb
+
+required:
+  - compatible
+  - phys
+  - phy-names
+
+examples:
+  - |
+    modem {
+        compatible = "motorola,mapphone-mdm6600-serial";
+        phys = <&fsusb1_phy>;
+        phy-names = "usb";
+    };
-- 
2.26.2
