Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5C02183E1
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 11:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgGHJfC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jul 2020 05:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgGHJfB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jul 2020 05:35:01 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E1DC08C5DC;
        Wed,  8 Jul 2020 02:35:00 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 9E0A5BC0E5;
        Wed,  8 Jul 2020 09:34:57 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Replace HTTP links with HTTPS ones: OMAP DEVICE TREE SUPPORT
Date:   Wed,  8 Jul 2020 11:34:51 +0200
Message-Id: <20200708093451.13623-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 arch/arm/boot/dts/am335x-baltos-ir2110.dts      | 2 +-
 arch/arm/boot/dts/am335x-baltos-ir3220.dts      | 2 +-
 arch/arm/boot/dts/am335x-baltos-ir5221.dts      | 2 +-
 arch/arm/boot/dts/am335x-baltos-leds.dtsi       | 2 +-
 arch/arm/boot/dts/am335x-baltos.dtsi            | 2 +-
 arch/arm/boot/dts/am335x-bone-common.dtsi       | 2 +-
 arch/arm/boot/dts/am335x-bone.dts               | 2 +-
 arch/arm/boot/dts/am335x-boneblack-common.dtsi  | 2 +-
 arch/arm/boot/dts/am335x-boneblack-wireless.dts | 2 +-
 arch/arm/boot/dts/am335x-boneblack.dts          | 2 +-
 arch/arm/boot/dts/am335x-boneblue.dts           | 2 +-
 arch/arm/boot/dts/am335x-bonegreen-common.dtsi  | 2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts | 2 +-
 arch/arm/boot/dts/am335x-bonegreen.dts          | 2 +-
 arch/arm/boot/dts/am335x-chiliboard.dts         | 2 +-
 arch/arm/boot/dts/am335x-chilisom.dtsi          | 2 +-
 arch/arm/boot/dts/am335x-evm.dts                | 2 +-
 arch/arm/boot/dts/am335x-evmsk.dts              | 2 +-
 arch/arm/boot/dts/am335x-guardian.dts           | 2 +-
 arch/arm/boot/dts/am335x-icev2.dts              | 2 +-
 arch/arm/boot/dts/am335x-lxm.dts                | 2 +-
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts    | 2 +-
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts    | 2 +-
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts    | 2 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts     | 4 ++--
 arch/arm/boot/dts/am335x-osd335x-common.dtsi    | 2 +-
 arch/arm/boot/dts/am335x-pdu001.dts             | 2 +-
 arch/arm/boot/dts/am335x-pocketbeagle.dts       | 2 +-
 arch/arm/boot/dts/am335x-sancloud-bbe.dts       | 2 +-
 arch/arm/boot/dts/am33xx.dtsi                   | 2 +-
 arch/arm/boot/dts/am3517-craneboard.dts         | 2 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi            | 2 +-
 arch/arm/boot/dts/am3517-evm.dts                | 2 +-
 arch/arm/boot/dts/am3517.dtsi                   | 2 +-
 arch/arm/boot/dts/am3874-iceboard.dts           | 4 ++--
 arch/arm/boot/dts/am4372.dtsi                   | 2 +-
 arch/arm/boot/dts/am437x-gp-evm.dts             | 2 +-
 arch/arm/boot/dts/am437x-idk-evm.dts            | 2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts             | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts            | 2 +-
 arch/arm/boot/dts/am57-pruss.dtsi               | 2 +-
 arch/arm/boot/dts/am5718.dtsi                   | 2 +-
 arch/arm/boot/dts/am571x-idk.dts                | 2 +-
 arch/arm/boot/dts/am5728.dtsi                   | 2 +-
 arch/arm/boot/dts/am572x-idk-common.dtsi        | 2 +-
 arch/arm/boot/dts/am572x-idk.dts                | 2 +-
 arch/arm/boot/dts/am5748.dtsi                   | 2 +-
 arch/arm/boot/dts/am574x-idk.dts                | 2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts   | 2 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revc.dts    | 2 +-
 arch/arm/boot/dts/am57xx-beagle-x15.dts         | 2 +-
 arch/arm/boot/dts/am57xx-idk-common.dtsi        | 2 +-
 arch/arm/boot/dts/dra7-dspeve-thermal.dtsi      | 2 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi          | 2 +-
 arch/arm/boot/dts/dra7-evm.dts                  | 2 +-
 arch/arm/boot/dts/dra7-iva-thermal.dtsi         | 2 +-
 arch/arm/boot/dts/dra7.dtsi                     | 2 +-
 arch/arm/boot/dts/dra71-evm.dts                 | 2 +-
 arch/arm/boot/dts/dra71x.dtsi                   | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi         | 2 +-
 arch/arm/boot/dts/dra72-evm-revc.dts            | 2 +-
 arch/arm/boot/dts/dra72-evm-tps65917.dtsi       | 4 ++--
 arch/arm/boot/dts/dra72-evm.dts                 | 2 +-
 arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi       | 2 +-
 arch/arm/boot/dts/dra72x.dtsi                   | 2 +-
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi       | 2 +-
 arch/arm/boot/dts/dra74x.dtsi                   | 2 +-
 arch/arm/boot/dts/dra76-evm.dts                 | 2 +-
 arch/arm/boot/dts/dra76x.dtsi                   | 2 +-
 arch/arm/boot/dts/omap2.dtsi                    | 2 +-
 arch/arm/boot/dts/omap2420-h4.dts               | 2 +-
 arch/arm/boot/dts/omap2420.dtsi                 | 2 +-
 arch/arm/boot/dts/omap2430-sdp.dts              | 2 +-
 arch/arm/boot/dts/omap2430.dtsi                 | 2 +-
 arch/arm/boot/dts/omap3-beagle-xm-ab.dts        | 2 +-
 arch/arm/boot/dts/omap3-beagle-xm.dts           | 2 +-
 arch/arm/boot/dts/omap3-beagle.dts              | 2 +-
 arch/arm/boot/dts/omap3-cpu-thermal.dtsi        | 2 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts            | 2 +-
 arch/arm/boot/dts/omap3-evm.dts                 | 2 +-
 arch/arm/boot/dts/omap3-ha-common.dtsi          | 2 +-
 arch/arm/boot/dts/omap3-ha-lcd.dts              | 2 +-
 arch/arm/boot/dts/omap3-ha.dts                  | 2 +-
 arch/arm/boot/dts/omap3-ldp.dts                 | 2 +-
 arch/arm/boot/dts/omap3-tao3530.dtsi            | 2 +-
 arch/arm/boot/dts/omap3-thunder.dts             | 2 +-
 arch/arm/boot/dts/omap3-zoom3.dts               | 2 +-
 arch/arm/boot/dts/omap3.dtsi                    | 2 +-
 arch/arm/boot/dts/omap3430-sdp.dts              | 2 +-
 arch/arm/boot/dts/omap34xx.dtsi                 | 2 +-
 arch/arm/boot/dts/omap36xx.dtsi                 | 2 +-
 arch/arm/boot/dts/omap4-cpu-thermal.dtsi        | 2 +-
 arch/arm/boot/dts/omap4-panda-a4.dts            | 2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi       | 2 +-
 arch/arm/boot/dts/omap4-panda-es.dts            | 2 +-
 arch/arm/boot/dts/omap4-panda.dts               | 2 +-
 arch/arm/boot/dts/omap4-sdp-es23plus.dts        | 2 +-
 arch/arm/boot/dts/omap4-sdp.dts                 | 6 +++---
 arch/arm/boot/dts/omap4-var-som-om44.dtsi       | 2 +-
 arch/arm/boot/dts/omap4.dtsi                    | 2 +-
 arch/arm/boot/dts/omap443x.dtsi                 | 2 +-
 arch/arm/boot/dts/omap4460.dtsi                 | 2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi       | 2 +-
 arch/arm/boot/dts/omap5-core-thermal.dtsi       | 2 +-
 arch/arm/boot/dts/omap5-gpu-thermal.dtsi        | 2 +-
 arch/arm/boot/dts/omap5-uevm.dts                | 2 +-
 arch/arm/boot/dts/omap5.dtsi                    | 2 +-
 arch/arm/boot/dts/twl6030_omap4.dtsi            | 2 +-
 109 files changed, 114 insertions(+), 114 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index 386d5f89978e..56915b6d818d 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index b0df7256db13..d8d60398d803 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index d6aa46e8700e..8096d459b93f 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-baltos-leds.dtsi b/arch/arm/boot/dts/am335x-baltos-leds.dtsi
index 4e11a160d88f..9a79f727baf6 100644
--- a/arch/arm/boot/dts/am335x-baltos-leds.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos-leds.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
index 04f0b1227efe..b7f64c7ba83d 100644
--- a/arch/arm/boot/dts/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/am335x-baltos.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 6c9187bc0f17..2d51d4bba6d4 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 / {
diff --git a/arch/arm/boot/dts/am335x-bone.dts b/arch/arm/boot/dts/am335x-bone.dts
index 43bfbce41049..b5d85ef51a02 100644
--- a/arch/arm/boot/dts/am335x-bone.dts
+++ b/arch/arm/boot/dts/am335x-bone.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
index dd932220a8bf..64c3e9269f40 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include <dt-bindings/display/tda998x.h>
diff --git a/arch/arm/boot/dts/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
index e07dd7979586..86cad9912906 100644
--- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index d3928662aed4..fe8c8cb5025d 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index 83f9452c9cd3..c696d57cf364 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-bonegreen-common.dtsi b/arch/arm/boot/dts/am335x-bonegreen-common.dtsi
index 7a8826633cef..9f7fb63744d0 100644
--- a/arch/arm/boot/dts/am335x-bonegreen-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bonegreen-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 &ldo3_reg {
diff --git a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
index 609c8db687ec..7615327d906a 100644
--- a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-bonegreen.dts b/arch/arm/boot/dts/am335x-bonegreen.dts
index c12bb0717779..18cc0f49e999 100644
--- a/arch/arm/boot/dts/am335x-bonegreen.dts
+++ b/arch/arm/boot/dts/am335x-bonegreen.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-chiliboard.dts b/arch/arm/boot/dts/am335x-chiliboard.dts
index b14a2759c69b..5660b5f6942d 100644
--- a/arch/arm/boot/dts/am335x-chiliboard.dts
+++ b/arch/arm/boot/dts/am335x-chiliboard.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 Jablotron s.r.o. -- http://www.jablotron.com/
+ * Copyright (C) 2015 Jablotron s.r.o. -- https://www.jablotron.com/
  * Author: Rostislav Lisovy <lisovy@jablotron.cz>
  */
 /dts-v1/;
diff --git a/arch/arm/boot/dts/am335x-chilisom.dtsi b/arch/arm/boot/dts/am335x-chilisom.dtsi
index b31e2f7a4ad9..43b61e43ed1e 100644
--- a/arch/arm/boot/dts/am335x-chilisom.dtsi
+++ b/arch/arm/boot/dts/am335x-chilisom.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 Jablotron s.r.o. -- http://www.jablotron.com/
+ * Copyright (C) 2015 Jablotron s.r.o. -- https://www.jablotron.com/
  * Author: Rostislav Lisovy <lisovy@jablotron.cz>
  */
 #include "am33xx.dtsi"
diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
index a4fc6b168a85..12dffccd1ffd 100644
--- a/arch/arm/boot/dts/am335x-evm.dts
+++ b/arch/arm/boot/dts/am335x-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index 78b6e1f594c9..b43b94122d3c 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
index 0ebe9e2c150e..1918766c1f80 100644
--- a/arch/arm/boot/dts/am335x-guardian.dts
+++ b/arch/arm/boot/dts/am335x-guardian.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2018 Robert Bosch Power Tools GmbH
  */
 /dts-v1/;
diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
index 021eb57261fe..b958ab56a412 100644
--- a/arch/arm/boot/dts/am335x-icev2.dts
+++ b/arch/arm/boot/dts/am335x-icev2.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-lxm.dts b/arch/arm/boot/dts/am335x-lxm.dts
index dbedf729205c..cd55f11260ea 100644
--- a/arch/arm/boot/dts/am335x-lxm.dts
+++ b/arch/arm/boot/dts/am335x-lxm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NovaTech LLC - http://www.novatechweb.com
+ * Copyright (C) 2014 NovaTech LLC - https://www.novatechweb.com
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
index 1e4dbc85c120..8303b832aa50 100644
--- a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
+++ b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
index 9a6cd8ef821f..f8e0e95a751f 100644
--- a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
+++ b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
index 2298563f7334..a4e137527215 100644
--- a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
+++ b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
index 1d2902083483..f841afb27844 100644
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -1,5 +1,5 @@
 //SPDX-License-Identifier: GPL-2.0
-/* Copyright (C) 2018 Octavo Systems LLC - http://www.octavosystems.com/
+/* Copyright (C) 2018 Octavo Systems LLC - https://www.octavosystems.com/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -107,7 +107,7 @@ &lcdc {
 	 * below to "crossed" and uncomment the video-ports -property
 	 * in tda19988 node.
 	 * AM335x errata for wiring:
-	 * http://www.ti.com/lit/er/sprz360i/sprz360i.pdf
+	 * https://www.ti.com/lit/er/sprz360i/sprz360i.pdf
 	 */
 
 	blue-and-red-wiring = "straight";
diff --git a/arch/arm/boot/dts/am335x-osd335x-common.dtsi b/arch/arm/boot/dts/am335x-osd335x-common.dtsi
index a8b6842489f7..2888b15999ee 100644
--- a/arch/arm/boot/dts/am335x-osd335x-common.dtsi
+++ b/arch/arm/boot/dts/am335x-osd335x-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Author: Robert Nelson <robertcnelson@gmail.com>
  */
diff --git a/arch/arm/boot/dts/am335x-pdu001.dts b/arch/arm/boot/dts/am335x-pdu001.dts
index e4dcfa087a1b..d41a5ffd83cf 100644
--- a/arch/arm/boot/dts/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/am335x-pdu001.dts
@@ -5,7 +5,7 @@
  *
  * Copyright (C) 2018 EETS GmbH - http://www.eets.ch/
  *
- * Copyright (C) 2011, Texas Instruments, Incorporated - http://www.ti.com/
+ * Copyright (C) 2011, Texas Instruments, Incorporated - https://www.ti.com/
  *
  * SPDX-License-Identifier:  GPL-2.0+
  */
diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index f0b222201b86..9e0bf5457fe0 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Author: Robert Nelson <robertcnelson@gmail.com>
  */
diff --git a/arch/arm/boot/dts/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
index e5fdb7abb0d5..275ba339adf4 100644
--- a/arch/arm/boot/dts/am335x-sancloud-bbe.dts
+++ b/arch/arm/boot/dts/am335x-sancloud-bbe.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 5fdce106edbb..5cb4cc37cb6d 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for AM33XX SoC
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/am3517-craneboard.dts b/arch/arm/boot/dts/am3517-craneboard.dts
index eb3517dabee1..3642cfc80194 100644
--- a/arch/arm/boot/dts/am3517-craneboard.dts
+++ b/arch/arm/boot/dts/am3517-craneboard.dts
@@ -2,7 +2,7 @@
 /*
  * See craneboard.org for more details
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am3517-evm-ui.dtsi b/arch/arm/boot/dts/am3517-evm-ui.dtsi
index 48631a45da51..250c40da2535 100644
--- a/arch/arm/boot/dts/am3517-evm-ui.dtsi
+++ b/arch/arm/boot/dts/am3517-evm-ui.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2018 Logic PD, Inc - http://www.logicpd.com/
+ * Copyright (C) 2018 Logic PD, Inc - https://www.logicpd.com/
  */
 
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
index 92466b9eb6ba..04f20e7680b1 100644
--- a/arch/arm/boot/dts/am3517-evm.dts
+++ b/arch/arm/boot/dts/am3517-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index dc8927f14b6c..1d88e568cfef 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for am3517 SoC
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/am3874-iceboard.dts b/arch/arm/boot/dts/am3874-iceboard.dts
index 1b4b2b0500e4..1bb57019d082 100644
--- a/arch/arm/boot/dts/am3874-iceboard.dts
+++ b/arch/arm/boot/dts/am3874-iceboard.dts
@@ -2,8 +2,8 @@
 /*
  * Device tree for Winterland IceBoard
  *
- * http://mcgillcosmology.com
- * http://threespeedlogic.com
+ * https://mcgillcosmology.com
+ * https://threespeedlogic.com
  *
  * This is an ARM + FPGA instrumentation board used at telescopes in
  * Antarctica (the South Pole Telescope), Chile (POLARBEAR), and at the DRAO
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index 51ad9e881a62..165d8174a4d4 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for AM4372 SoC
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 77378630e5ec..b28e5c8cd02a 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /* AM437x GP EVM */
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
index a958f9ee4a5a..8b986c45f09d 100644
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
index 08eabf0f3cbd..5fffdce853b1 100644
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /* AM437x SK EVM */
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 7d4e0dffde7a..de4fc78498a0 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /* AM43x EPOS EVM */
diff --git a/arch/arm/boot/dts/am57-pruss.dtsi b/arch/arm/boot/dts/am57-pruss.dtsi
index b1c583dee10b..032c1acfcda3 100644
--- a/arch/arm/boot/dts/am57-pruss.dtsi
+++ b/arch/arm/boot/dts/am57-pruss.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2020 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Common PRUSS data for TI AM57xx platforms
  */
diff --git a/arch/arm/boot/dts/am5718.dtsi b/arch/arm/boot/dts/am5718.dtsi
index a80c2e3eee2e..ebf4d3cc1cfb 100644
--- a/arch/arm/boot/dts/am5718.dtsi
+++ b/arch/arm/boot/dts/am5718.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "dra72x.dtsi"
diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index 99a408a2ec6a..391a92e24472 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am5728.dtsi b/arch/arm/boot/dts/am5728.dtsi
index 9a3810f5adcc..5e0bdf16d485 100644
--- a/arch/arm/boot/dts/am5728.dtsi
+++ b/arch/arm/boot/dts/am5728.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "dra74x.dtsi"
diff --git a/arch/arm/boot/dts/am572x-idk-common.dtsi b/arch/arm/boot/dts/am572x-idk-common.dtsi
index 37ce2d7c4173..1d66278c3a72 100644
--- a/arch/arm/boot/dts/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/am572x-idk-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm/boot/dts/am572x-idk.dts b/arch/arm/boot/dts/am572x-idk.dts
index c3d966904d64..1a3af4b54308 100644
--- a/arch/arm/boot/dts/am572x-idk.dts
+++ b/arch/arm/boot/dts/am572x-idk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /dts-v1/;
diff --git a/arch/arm/boot/dts/am5748.dtsi b/arch/arm/boot/dts/am5748.dtsi
index 2b65317b1513..2cb577432766 100644
--- a/arch/arm/boot/dts/am5748.dtsi
+++ b/arch/arm/boot/dts/am5748.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "dra76x.dtsi"
diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index 85c95cc551dd..c9275d0c62cf 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index 94135fc5dd44..b3a0206ebd6c 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts b/arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts
index 39d1c4ff5749..83e174e053c7 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "am57xx-beagle-x15-common.dtsi"
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-revc.dts b/arch/arm/boot/dts/am57xx-beagle-x15-revc.dts
index 4187a9729f96..656dd84460d2 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-revc.dts
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-revc.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "am57xx-beagle-x15-common.dtsi"
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15.dts b/arch/arm/boot/dts/am57xx-beagle-x15.dts
index a5c24ed4d12f..0a8b16505ed9 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15.dts
+++ b/arch/arm/boot/dts/am57xx-beagle-x15.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "am57xx-beagle-x15-common.dtsi"
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index 2c0aab352b44..1c77006cccd1 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2015-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "am57xx-industrial-grade.dtsi"
diff --git a/arch/arm/boot/dts/dra7-dspeve-thermal.dtsi b/arch/arm/boot/dts/dra7-dspeve-thermal.dtsi
index 1c39a8459b39..e75569383dd8 100644
--- a/arch/arm/boot/dts/dra7-dspeve-thermal.dtsi
+++ b/arch/arm/boot/dts/dra7-dspeve-thermal.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for DRA7x SoC DSPEVE thermal
  *
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 2cf6a529d4ad..0f71a9f37a72 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "dra74-ipu-dsp-common.dtsi"
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 7aeb30daf3b8..a952d934fcf2 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/dra7-iva-thermal.dtsi b/arch/arm/boot/dts/dra7-iva-thermal.dtsi
index dd74a5337d1f..a7077321613f 100644
--- a/arch/arm/boot/dts/dra7-iva-thermal.dtsi
+++ b/arch/arm/boot/dts/dra7-iva-thermal.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for DRA7x SoC IVA thermal
  *
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index 099546be5014..cca6b123856f 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Based on "omap4.dtsi"
  */
diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index a5d275ea7bd3..10da51bee42f 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "dra71x.dtsi"
diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
index 695a08ed0360..cad0e4a2bd8d 100644
--- a/arch/arm/boot/dts/dra71x.dtsi
+++ b/arch/arm/boot/dts/dra71x.dtsi
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index c84b63bf0fc8..9273a7d6fa29 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/dra72-evm-revc.dts b/arch/arm/boot/dts/dra72-evm-revc.dts
index 6e70858f6313..54dab0f212d1 100644
--- a/arch/arm/boot/dts/dra72-evm-revc.dts
+++ b/arch/arm/boot/dts/dra72-evm-revc.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include "dra72-evm-common.dtsi"
 #include "dra72x-mmc-iodelay.dtsi"
diff --git a/arch/arm/boot/dts/dra72-evm-tps65917.dtsi b/arch/arm/boot/dts/dra72-evm-tps65917.dtsi
index 5ff9c43ef30b..7b433f549239 100644
--- a/arch/arm/boot/dts/dra72-evm-tps65917.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-tps65917.dtsi
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 /*
  * Integrated Power Management Chip
- * http://www.ti.com/lit/ds/symlink/tps65917-q1.pdf
+ * https://www.ti.com/lit/ds/symlink/tps65917-q1.pdf
  */
 
 &tps65917 {
diff --git a/arch/arm/boot/dts/dra72-evm.dts b/arch/arm/boot/dts/dra72-evm.dts
index 951152fe206a..6ea9936f7d9c 100644
--- a/arch/arm/boot/dts/dra72-evm.dts
+++ b/arch/arm/boot/dts/dra72-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2016 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014-2016 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include "dra72-evm-common.dtsi"
 #include "dra72x-mmc-iodelay.dtsi"
diff --git a/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
index edad87c4292c..a9dce919d443 100644
--- a/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
@@ -1,7 +1,7 @@
 /*
  * MMC IOdelay values for TI's DRA72x, DRA71x and AM571x SoCs.
  *
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index ae23ec14e8fa..d403acc754b6 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Based on "omap4.dtsi"
  */
diff --git a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
index 214b9e6de2c3..e86da7a970b6 100644
--- a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
@@ -1,7 +1,7 @@
 /*
  * MMC IOdelay values for TI's DRA74x, DRA75x and AM572x SoCs.
  *
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
index 46d8e7615180..a4372a9b600f 100644
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Based on "omap4.dtsi"
  */
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 820a0ece20d4..803981cc762e 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index 42b8a205b64f..b69c7d40f5d8 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "dra74x.dtsi"
diff --git a/arch/arm/boot/dts/omap2.dtsi b/arch/arm/boot/dts/omap2.dtsi
index 8a5cb44bfe2f..f9c2a9938898 100644
--- a/arch/arm/boot/dts/omap2.dtsi
+++ b/arch/arm/boot/dts/omap2.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP2 SoC
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap2420-h4.dts b/arch/arm/boot/dts/omap2420-h4.dts
index 7d660271400d..af964f139abf 100644
--- a/arch/arm/boot/dts/omap2420-h4.dts
+++ b/arch/arm/boot/dts/omap2420-h4.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap2420.dtsi b/arch/arm/boot/dts/omap2420.dtsi
index 6c5c7c0e8b94..494bf6972005 100644
--- a/arch/arm/boot/dts/omap2420.dtsi
+++ b/arch/arm/boot/dts/omap2420.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP2420 SoC
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap2430-sdp.dts b/arch/arm/boot/dts/omap2430-sdp.dts
index f7e324886642..7d27e907533f 100644
--- a/arch/arm/boot/dts/omap2430-sdp.dts
+++ b/arch/arm/boot/dts/omap2430-sdp.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap2430.dtsi b/arch/arm/boot/dts/omap2430.dtsi
index 6a1f5bb3c06a..d19d8ba3b607 100644
--- a/arch/arm/boot/dts/omap2430.dtsi
+++ b/arch/arm/boot/dts/omap2430.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP243x SoC
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap3-beagle-xm-ab.dts b/arch/arm/boot/dts/omap3-beagle-xm-ab.dts
index e498495b8465..cb6968a8bce8 100644
--- a/arch/arm/boot/dts/omap3-beagle-xm-ab.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm-ab.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include "omap3-beagle-xm.dts"
diff --git a/arch/arm/boot/dts/omap3-beagle-xm.dts b/arch/arm/boot/dts/omap3-beagle-xm.dts
index 125ed933ca75..05077f3c75cd 100644
--- a/arch/arm/boot/dts/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index dfa158647d91..79bc710c05fc 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
index 235ecfd61e2d..aee46fa8c055 100644
--- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP3 SoC CPU thermal
  *
- * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2017 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap3-evm-37xx.dts b/arch/arm/boot/dts/omap3-evm-37xx.dts
index e0c0382388f0..c9332195d096 100644
--- a/arch/arm/boot/dts/omap3-evm-37xx.dts
+++ b/arch/arm/boot/dts/omap3-evm-37xx.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap3-evm.dts b/arch/arm/boot/dts/omap3-evm.dts
index 6a94815feb76..5cc0cf7cd16c 100644
--- a/arch/arm/boot/dts/omap3-evm.dts
+++ b/arch/arm/boot/dts/omap3-evm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap3-ha-common.dtsi b/arch/arm/boot/dts/omap3-ha-common.dtsi
index 33132855d517..a010585d0302 100644
--- a/arch/arm/boot/dts/omap3-ha-common.dtsi
+++ b/arch/arm/boot/dts/omap3-ha-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2014 Stefan Roese <sr@denx.de>
  */
 
diff --git a/arch/arm/boot/dts/omap3-ha-lcd.dts b/arch/arm/boot/dts/omap3-ha-lcd.dts
index c9ecbc45c8e2..b3f7f9966c3c 100644
--- a/arch/arm/boot/dts/omap3-ha-lcd.dts
+++ b/arch/arm/boot/dts/omap3-ha-lcd.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2014 Stefan Roese <sr@denx.de>
  */
 
diff --git a/arch/arm/boot/dts/omap3-ha.dts b/arch/arm/boot/dts/omap3-ha.dts
index 35c4e15abeb7..19e471eb3b4e 100644
--- a/arch/arm/boot/dts/omap3-ha.dts
+++ b/arch/arm/boot/dts/omap3-ha.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2014 Stefan Roese <sr@denx.de>
  */
 
diff --git a/arch/arm/boot/dts/omap3-ldp.dts b/arch/arm/boot/dts/omap3-ldp.dts
index ec9ba04ef43b..9c6a92724590 100644
--- a/arch/arm/boot/dts/omap3-ldp.dts
+++ b/arch/arm/boot/dts/omap3-ldp.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap3-tao3530.dtsi b/arch/arm/boot/dts/omap3-tao3530.dtsi
index f24e2326cfa7..764d6a5d49b4 100644
--- a/arch/arm/boot/dts/omap3-tao3530.dtsi
+++ b/arch/arm/boot/dts/omap3-tao3530.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2014 Stefan Roese <sr@denx.de>
  */
 /dts-v1/;
diff --git a/arch/arm/boot/dts/omap3-thunder.dts b/arch/arm/boot/dts/omap3-thunder.dts
index 64221e3b3477..f7930f198ce5 100644
--- a/arch/arm/boot/dts/omap3-thunder.dts
+++ b/arch/arm/boot/dts/omap3-thunder.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2014 Stefan Roese <sr@denx.de>
  */
 
diff --git a/arch/arm/boot/dts/omap3-zoom3.dts b/arch/arm/boot/dts/omap3-zoom3.dts
index d240e39f2151..0482676d1830 100644
--- a/arch/arm/boot/dts/omap3-zoom3.dts
+++ b/arch/arm/boot/dts/omap3-zoom3.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 1296d0643943..9f1df372cee4 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP3 SoC
  *
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap3430-sdp.dts b/arch/arm/boot/dts/omap3430-sdp.dts
index 7bfde8aac7ae..c5b903718414 100644
--- a/arch/arm/boot/dts/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/omap3430-sdp.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index c4dd9801840d..9c3ee4ac8165 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP34xx/OMAP35xx SoC
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 71f3c8f1f924..9c3beefc0fe0 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP3 SoC
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap4-cpu-thermal.dtsi b/arch/arm/boot/dts/omap4-cpu-thermal.dtsi
index ab7f87ae96f0..03d054b2bf9a 100644
--- a/arch/arm/boot/dts/omap4-cpu-thermal.dtsi
+++ b/arch/arm/boot/dts/omap4-cpu-thermal.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP4/5 SoC CPU thermal
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  * Contact: Eduardo Valentin <eduardo.valentin@ti.com>
  *
  * This file is licensed under the terms of the GNU General Public License
diff --git a/arch/arm/boot/dts/omap4-panda-a4.dts b/arch/arm/boot/dts/omap4-panda-a4.dts
index 64083075dd52..8fd076e5d1b0 100644
--- a/arch/arm/boot/dts/omap4-panda-a4.dts
+++ b/arch/arm/boot/dts/omap4-panda-a4.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 55ea8b6189af..ca58c701cfac 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011-2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include <dt-bindings/input/input.h>
 #include "elpida_ecb240abacn.dtsi"
diff --git a/arch/arm/boot/dts/omap4-panda-es.dts b/arch/arm/boot/dts/omap4-panda-es.dts
index 9dd307b52604..cfa85aa3da08 100644
--- a/arch/arm/boot/dts/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/omap4-panda-es.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap4-panda.dts b/arch/arm/boot/dts/omap4-panda.dts
index fb2f47717b45..529d5bcceaaf 100644
--- a/arch/arm/boot/dts/omap4-panda.dts
+++ b/arch/arm/boot/dts/omap4-panda.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap4-sdp-es23plus.dts b/arch/arm/boot/dts/omap4-sdp-es23plus.dts
index 42154520d383..869f6279b5be 100644
--- a/arch/arm/boot/dts/omap4-sdp-es23plus.dts
+++ b/arch/arm/boot/dts/omap4-sdp-es23plus.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include "omap4-sdp.dts"
 
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 91480ac1f328..79e7a41ecb7e 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
@@ -428,7 +428,7 @@ &i2c3 {
 
 	/*
 	 * Temperature Sensor
-	 * http://www.ti.com/lit/ds/symlink/tmp105.pdf
+	 * https://www.ti.com/lit/ds/symlink/tmp105.pdf
 	 */
 	tmp105@48 {
 		compatible = "ti,tmp105";
@@ -453,7 +453,7 @@ &i2c4 {
 
 	/*
 	 * 3-Axis Digital Compass
-	 * http://www.sparkfun.com/datasheets/Sensors/Magneto/HMC5843.pdf
+	 * https://www.sparkfun.com/datasheets/Sensors/Magneto/HMC5843.pdf
 	 */
 	hmc5843@1e {
 		compatible = "honeywell,hmc5843";
diff --git a/arch/arm/boot/dts/omap4-var-som-om44.dtsi b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
index 41de32bcf187..334cbbaa5b8b 100644
--- a/arch/arm/boot/dts/omap4-var-som-om44.dtsi
+++ b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2014 Joachim Eastwood <manabian@gmail.com>
- * Copyright (C) 2012 Variscite Ltd. - http://www.variscite.com
+ * Copyright (C) 2012 Variscite Ltd. - https://www.variscite.com
  */
 #include "omap4460.dtsi"
 #include "omap4-mcpdm.dtsi"
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 4400f5f8e099..b3db9852bb34 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #include <dt-bindings/bus/ti-sysc.h>
diff --git a/arch/arm/boot/dts/omap443x.dtsi b/arch/arm/boot/dts/omap443x.dtsi
index cbcdcb4e7d1c..8ed510ab00c5 100644
--- a/arch/arm/boot/dts/omap443x.dtsi
+++ b/arch/arm/boot/dts/omap443x.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP443x SoC
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap4460.dtsi b/arch/arm/boot/dts/omap4460.dtsi
index 2223dc0d63c0..2d3e54901b6e 100644
--- a/arch/arm/boot/dts/omap4460.dtsi
+++ b/arch/arm/boot/dts/omap4460.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP4460 SoC
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2.  This program is licensed "as is" without any warranty of any
diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
index 68ac04641bdb..edf1906016c8 100644
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include "omap5.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/arch/arm/boot/dts/omap5-core-thermal.dtsi b/arch/arm/boot/dts/omap5-core-thermal.dtsi
index de8a3d456cf7..02e76338bfbc 100644
--- a/arch/arm/boot/dts/omap5-core-thermal.dtsi
+++ b/arch/arm/boot/dts/omap5-core-thermal.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP543x SoC CORE thermal
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  * Contact: Eduardo Valentin <eduardo.valentin@ti.com>
  *
  * This file is licensed under the terms of the GNU General Public License
diff --git a/arch/arm/boot/dts/omap5-gpu-thermal.dtsi b/arch/arm/boot/dts/omap5-gpu-thermal.dtsi
index bc3090f2e84b..bf8fa9372e57 100644
--- a/arch/arm/boot/dts/omap5-gpu-thermal.dtsi
+++ b/arch/arm/boot/dts/omap5-gpu-thermal.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for OMAP543x SoC GPU thermal
  *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  * Contact: Eduardo Valentin <eduardo.valentin@ti.com>
  *
  * This file is licensed under the terms of the GNU General Public License
diff --git a/arch/arm/boot/dts/omap5-uevm.dts b/arch/arm/boot/dts/omap5-uevm.dts
index 9441e9a572ad..4203fd7bad1a 100644
--- a/arch/arm/boot/dts/omap5-uevm.dts
+++ b/arch/arm/boot/dts/omap5-uevm.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 /dts-v1/;
 
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index fb889c5b00c9..d8a3afc4778c 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2012 Texas Instruments Incorporated - https://www.ti.com/
  *
  * Based on "omap4.dtsi"
  */
diff --git a/arch/arm/boot/dts/twl6030_omap4.dtsi b/arch/arm/boot/dts/twl6030_omap4.dtsi
index fc498d0bde8b..5730e46b0067 100644
--- a/arch/arm/boot/dts/twl6030_omap4.dtsi
+++ b/arch/arm/boot/dts/twl6030_omap4.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2013 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 &twl {
-- 
2.27.0

