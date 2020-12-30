Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893D82E77FE
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 12:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgL3LUz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 06:20:55 -0500
Received: from 46-22-124-5.ip.axbyte.se ([46.22.124.5]:49386 "EHLO
        mail01.ohdata.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgL3LUy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 06:20:54 -0500
X-Greylist: delayed 879 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Dec 2020 06:20:54 EST
Received: from localhost (localhost [127.0.0.1])
        by mail01.ohdata.se (Postfix) with ESMTP id 489C96188;
        Wed, 30 Dec 2020 12:02:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail01.ohdata.se
Received: from mail01.ohdata.se ([127.0.0.1])
        by localhost (mail01.ohdata.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zJ7KQ42jE7qt; Wed, 30 Dec 2020 12:02:31 +0100 (CET)
Received: from webmail.ohdata.se (unknown [10.0.38.61])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail01.ohdata.se (Postfix) with ESMTPSA id B95C05DD0;
        Wed, 30 Dec 2020 12:02:31 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 30 Dec 2020 12:12:20 +0100
From:   Oskar Holmlund <info@ohdata.se>
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com
Subject: [am33xx-clocks.dtsi] move ieee5000 ti,gate-clock to a ti,clkctrl?
Organization: OH Data
Message-ID: <f4c28638a0c00d1ae988dbebe88a1884@ohdata.se>
X-Sender: info@ohdata.se
User-Agent: Roundcube Webmail/1.3.6
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Is it possible to move
&prcm_clocks {
...
	ieee5000_fck: ieee5000_fck@e4 {
		#clock-cells = <0>;
		compatible = "ti,gate-clock";
		clocks = <&dpll_core_m4_div2_ck>;
		ti,bit-shift = <1>;
		reg = <0x00e4>;
	};

to something like this to better correlate to the TRM 8.1.12.1.40 
CM_PER_IEEE5000_CLKCTRL Register(offset= E4h) ?
Or is there any reason the ieee5000 is a ti,gate-clock?

&prcm {
	per_cm: per-cm@0 {
		compatible = "ti,omap4-cm";
		reg = <0x0 0x400>;
		#address-cells = <1>;
		#size-cells = <1>;
		ranges = <0 0x0 0x400>;
...
                 ieee5000_clkctrl: ieee5000_clkctrl@e4 {
                         compatible = "ti,clkctrl";
                         reg = <0xe4 0x4>;
                         #clock-cells = <2>;
                 };

		pruss_ocp_clkctrl: pruss-ocp-clkctrl@e8 {
			compatible = "ti,clkctrl";
			reg = <0xe8 0x4>;
			#clock-cells = <2>;
		};

-- 
Bästa Hälsningar
Oskar Holmlund
Tel 070-3220292
