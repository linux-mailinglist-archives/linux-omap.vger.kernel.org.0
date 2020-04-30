Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCAB1C0427
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 19:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgD3Rqc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 13:46:32 -0400
Received: from muru.com ([72.249.23.125]:52322 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbgD3Rqa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 13:46:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B47988123;
        Thu, 30 Apr 2020 17:47:17 +0000 (UTC)
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
Subject: [PATCH 4/6] dt-bindings: gnss: Add binding for Motorola Mapphone MDM6600 GNSS
Date:   Thu, 30 Apr 2020 10:46:13 -0700
Message-Id: <20200430174615.41185-5-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a binding document for Motorola Mapphone MDM6600 GNSS driver that
can be used with phones such as droid4.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/gnss/motmdm.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/motmdm.yaml

diff --git a/Documentation/devicetree/bindings/gnss/motmdm.yaml b/Documentation/devicetree/bindings/gnss/motmdm.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/gnss/motmdm.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gnss/motmdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola Mapphone MDM6600 GNSS binding
+
+maintainers:
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    const: motorola,mapphone-mdm6600-gnss
+
+  reg:
+    items:
+      description: TS 27.010 channel the GNSS device is using
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    gnss@4 {
+      compatible = "motorola,mapphone-mdm6600-gnss";
+      reg = <4>;
+    };
-- 
2.26.2
