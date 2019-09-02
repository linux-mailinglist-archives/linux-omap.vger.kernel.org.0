Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35732A5484
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 12:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731478AbfIBK4U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 06:56:20 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:14946 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731287AbfIBK4O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 06:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567421770;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gyaJxhpKOrJkSBef5H5LmgKUYEaxN9j94o+XGsFhaN0=;
        b=b2uv6Ph+Hyo7biLYyQZ9hSuNeyIbJUCTvcYDNXSrUf34fd0BCg1Lggv9szi2v+XEl6
        GMPfF+BTJBZaxFH7RFI3EWCSF01+PDHbOcN8Vtp3LyXea9jZvne+j06s2KV4pV1jxEZ0
        EB3lZHySjp/Vv8fkL+7NTVfPAlUMW3vKpOl76nlIMmiHia2ZB26Hg942hhM9bl8B/WOq
        LALbTRIV9DQSJqAdm4Dx0t009cqVnJoDrJrRe37ibB3shp2Fkznv88BzlR54Z7JViXTt
        pt0IcjSgEnkiRDbzBXJSWGwI+X/+3nWsSoVeW5eywqljr60cFF1coz1eqN8UA/jRCeP5
        /ELA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnvuHRT"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v82AtsPvm
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 2 Sep 2019 12:55:54 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Roth?= <neolynx@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [RFC 5/5] ARM: dts: omap3-beagle: make explicitly compatible to ti,omap34xx
Date:   Mon,  2 Sep 2019 12:55:51 +0200
Message-Id: <150eb34a95b2e7ead8ac81a9ab275592ea31595b.1567421751.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567421750.git.hns@goldelico.com>
References: <cover.1567421750.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Matching the ti-cpufreq driver needs to specify explicitly if
a board uses an omap34xx or omap36xx chip.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap3-beagle.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index e3df3c166902..d47213c7a4d0 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "TI OMAP3 BeagleBoard";
-	compatible = "ti,omap3-beagle", "ti,omap3";
+	compatible = "ti,omap3-beagle", "ti,omap34xx", "ti,omap3";
 
 	cpus {
 		cpu@0 {
-- 
2.19.1

