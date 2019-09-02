Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75A1A5487
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731287AbfIBK4Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 06:56:25 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:8124 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731285AbfIBK4N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 06:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567421769;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iDHDcTZofAwFtKZ+JtaTo+qsb9dMO/SudfMjC+bQAcY=;
        b=cYdiNQXMOopAQSmQ6Zk3tTDwG9iRrD8vhNY3Zay2vAt3v3GgZfiwj4Eua714D/9UHp
        Rwfrbznp/GXRrgHBNMT1ESe8qPs2nxW6W9X1O/03D9wvJ9mfj/jUsPrI7cY+t8Q/brdy
        3F8/HlqwsZmY56LonAzDCXlPwvLj11p/EOQ2AjQdYIATuUawL6zATB3hV40cRecbmvXT
        X9alRVD/x3vSyVry9yz+NR0+tnQXBKlaxZDKjEiyAYqULn4kBAOwdKkTfS3nmhdJ/P9S
        M46zlEXBiL4692NVJzmDsdPO+XpLhab5KSqDH4Q/kEXtEF3btHNWOYBWq+V3nnelOmLH
        uIcw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnvuHRT"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v82AtsPvl
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
Subject: [RFC 4/5] ARM: dts: omap3-n950-n9: remove opp-v1 table
Date:   Mon,  2 Sep 2019 12:55:50 +0200
Message-Id: <2f978667c1533e46e3a5df58871e9048f3eb74e9.1567421751.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567421750.git.hns@goldelico.com>
References: <cover.1567421750.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With opp-v2 in omap36xx.dtsi and ti-cpufreq driver the
1GHz capability is automatically detected.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap3-n950-n9.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
index 5441e9ffdbb4..e98b0c615f19 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -11,13 +11,6 @@
 	cpus {
 		cpu@0 {
 			cpu0-supply = <&vcc>;
-			operating-points = <
-				/* kHz    uV */
-				300000  1012500
-				600000  1200000
-				800000  1325000
-				1000000	1375000
-			>;
 		};
 	};
 
-- 
2.19.1

