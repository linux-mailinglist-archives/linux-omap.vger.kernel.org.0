Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFB31EFF58
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jun 2020 19:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgFERpj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Jun 2020 13:45:39 -0400
Received: from 46-22-124-5.ip.axbyte.se ([46.22.124.5]:14712 "EHLO
        mail01.ohdata.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgFERpi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Jun 2020 13:45:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail01.ohdata.se (Postfix) with ESMTP id 22B8411947;
        Fri,  5 Jun 2020 19:23:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail01.ohdata.se
Received: from mail01.ohdata.se ([127.0.0.1])
        by localhost (mail01.ohdata.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aKYjnco2swyn; Fri,  5 Jun 2020 19:23:03 +0200 (CEST)
Received: from webmail.ohdata.se (unknown [10.0.38.61])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail01.ohdata.se (Postfix) with ESMTPSA id AD5E95DE8;
        Fri,  5 Jun 2020 19:23:03 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 05 Jun 2020 19:49:23 +0200
From:   Oskar Holmlund <info@ohdata.se>
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, bcousson@baylibre.com
Subject: PATCH: ARM: am33xx.dtsi USB ranges length
Organization: OH Data
Message-ID: <d22deb609cf4678d569928f4a48cb409@ohdata.se>
X-Sender: info@ohdata.se
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

AM335x TRM: Table 2-1 defines USBSS - USB Queue Manager in memory region
0x4740 0000 to 0x4740 7FFF.

Diff created from am33xx.dtsi commit 
e20ef23dd6937c38df2cfddf15270668153c8177

Signed-off-by: Oskar Holmlund <oskar@ohdata.se>
--- arch/arm/boot/dts/am33xx.dtsi.orig	2020-06-05 18:58:39.720383275 
+0200
+++ arch/arm/boot/dts/am33xx.dtsi	2020-06-05 19:01:32.974619980 +0200
@@ -347,7 +347,7 @@
  			clock-names = "fck";
  			#address-cells = <1>;
  			#size-cells = <1>;
-			ranges = <0x0 0x47400000 0x5000>;
+			ranges = <0x0 0x47400000 0x8000>;

  			usb0_phy: usb-phy@1300 {
  				compatible = "ti,am335x-usb-phy";

-- 
Bästa Hälsningar
Oskar Holmlund
Tel 070-3220292
