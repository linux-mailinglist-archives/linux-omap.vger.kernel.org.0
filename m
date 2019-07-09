Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673A263B00
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2019 20:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbfGIScS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jul 2019 14:32:18 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53537 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfGIScS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Jul 2019 14:32:18 -0400
Received: from localhost ([62.96.34.174]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MfbwW-1iQYBn3fGi-00fx9T; Tue, 09 Jul 2019 20:32:11 +0200
Date:   Tue, 9 Jul 2019 20:32:11 +0200
From:   Andreas Klinger <ak@it-klinger.de>
To:     linux-omap@vger.kernel.org
Cc:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: am335x-wega.dtsi: fix wrong card detect pin level
Message-ID: <20190709183209.y64keopah5rkismc@arbad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Provags-ID: V03:K1:mLpKUvjdvDUhw3C0lESUlBgRztaW463jyV9JDLd5qtkB543lknY
 rIBnmPz36XRigau/3NKaC3TAsaxMDXC4NaCyqjPC8RcEXKdxhvin7U01RAqOctwMD9YZ7qa
 BSTsrY6woa0Eds6yU4hxhleCtR/u9XWRT+qJO4aa7/ugO4oBIVAe2qk+Eu0E2glhAM//uXE
 GnpmYk7Jji1o0VIr/WT5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SKpnKGbIXBI=:rcghbSGCxoLumohil+yF4H
 8lyqKSiqeOgBB8F2doLaLc/kBrfRbzdHHjTQsPpEewP+DzGYTFkKqcE8EiDpTVBZ4yiBOocXk
 wjnbiJbN1l6jEqX2vvdlhUbkQ6KCSZIaZGK0WyBcvpP7/B5O98E6ZrsT8CmtHeZnuuteGdDaW
 oT5ptLr5Aq7z6CAqHMF5HUwRzOvAy7pWyv9oGTInD2yOJWk4kJxv1cHZ+UGGPqDNiIrPjQlLH
 9tLta9HsQ9cg1gVa2k9P1+0BXh9eILXsOuMGJ5Y35R4XfAV3PNaeGI3nqyoMkJOwHBAhqkwHM
 4nxBnYv+QS/GA1M2ow1nPG11SYyRcUxyJl9GwHb/i57qaTo8+zbUJ07cTv8Tv3dXciedTyGEU
 5o5ibZzwKVPnQZuhZw7lXkUPFUGqVNhDSlBPTaNyrXpGULxxU2RY0rb5xcrElXUA4p0xSQAKJ
 qAwDVg61fQOXvrRlKNZp8v4ZTuXKmNd1buEVt3zLoGDnn6+4AX1eJsjm+f2LsOEVZClP8VbhI
 YIK9H4FBe4XgoMjPy1PAL/bwyS8DrvwmTf6wpJUz9RuPu/z+DfbWTM2VP5cbYAGKReEetqfS0
 8++qHzVBO3Nfh1XXJyR344Asf4dD4P07lIQOkTnv5rCFLYdyzEp8vz14BlF98vyUWGImOMetU
 GCulqD45dpCA7/5i9NO5WexlyX6O6R9C1Kes+LibxHO3mDvGYhZDWcEAppkns7oMyhk6Y9OW0
 dm421jvAkvj59UgWcSyx2mCPnNxHkZeS8YhnaQ==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

mmc cards on mmc1 are not detected because of wrong card detect (cd) level.

Change cd from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW.

This is necessary because of commit e63201f19438 ("mmc: omap_hsmmc:
Delete platform data GPIO CD and WP")

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 arch/arm/boot/dts/am335x-wega.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
index b7d28a20341f..84581fed3d06 100644
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -157,7 +157,7 @@
 	bus-width = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
-	cd-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-- 
2.11.0


-- 
