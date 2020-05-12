Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88671D011D
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 23:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731488AbgELVra (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 17:47:30 -0400
Received: from muru.com ([72.249.23.125]:54272 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731476AbgELVra (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 17:47:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B027481BD;
        Tue, 12 May 2020 21:48:17 +0000 (UTC)
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
Subject: [PATCH 3/6] dt-bindings: serdev: ngsm: Add binding for GNSS child node
Date:   Tue, 12 May 2020 14:47:10 -0700
Message-Id: <20200512214713.40501-4-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512214713.40501-1-tony@atomide.com>
References: <20200512214713.40501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For motorola modem case, we may have a GNSS device on channel 4.
Let's add that to the binding and example.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/serdev/serdev-ngsm.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
--- a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
+++ b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
@@ -42,6 +42,10 @@ allOf:
           description: Name of the USB PHY
           const: usb
 
+        compatible:
+          description: GNSS receiver
+          const: motorola,mapphone-mdm6600-gnss
+
       required:
         - phys
         - phy-names
@@ -61,4 +65,9 @@ examples:
       phy-names = "usb";
       #address-cells = <1>;
       #size-cells = <0>;
+
+      gnss@4 {
+         compatible = "motorola,mapphone-mdm6600-gnss";
+         reg = <4>;
+      };
     };
-- 
2.26.2
