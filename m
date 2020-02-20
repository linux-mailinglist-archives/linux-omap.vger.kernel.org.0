Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 150961667CF
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 21:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgBTT76 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 14:59:58 -0500
Received: from muru.com ([72.249.23.125]:56578 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728929AbgBTT75 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 14:59:57 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DAB1F8168;
        Thu, 20 Feb 2020 20:00:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: mfd: motmdm: Add binding for motorola-mdm
Date:   Thu, 20 Feb 2020 11:59:42 -0800
Message-Id: <20200220195943.15314-4-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200220195943.15314-1-tony@atomide.com>
References: <20200220195943.15314-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a binding document for Motorola modems controllable by
TS 27.010 UART line discipline using serdev drivers.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../mfd/motorola,mapphone-mdm6600.yaml        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml

diff --git a/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml b/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/motorola,mapphone-mdm6600.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/motorola,mapphone-mdm6600.yaml#
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
2.25.1
