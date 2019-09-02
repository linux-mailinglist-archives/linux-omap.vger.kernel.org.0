Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE89A547E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 12:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731288AbfIBK4M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 06:56:12 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:36011 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731278AbfIBK4M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 06:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567421769;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=gh/3sTibgDq3nRs3zSWyY8xHtE864u/e8eeLmwdgoBQ=;
        b=V+4+yhjO/EZrDZa6PNvva0wq4C5ycXNhO8V9qXv+HjKkc60hTGB7l7Bg/Ob/LZYGCQ
        FYZuxlaq5bZJWYFUuLtJrZSNe+fJdaY7BWeUaHKeubrVhmWJcIKzQTibVyGbHVTYAcOl
        Ew/1uUnIk5cHO987eZKNcPGULTyARTaUmM+nlcvp9YepM/dtuJrNn61Wadmz8zr1Zfid
        OHjjsWVNczmt09ii97+g7YvZ348eiRqjISVFnbD5cF0RJodJKE/b1Xm70rnvOupv0bU5
        vmYrMdFUKuCqwhUV4tJk06pl+xKQ++1sV5dTtEweeW95hRMdTAEdKXsiERxoDCNKNZfH
        fkEg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXL8GTnvuHRT"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v82AtqPvg
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 2 Sep 2019 12:55:52 +0200 (CEST)
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
Subject: [RFC 0/5] OMAP3: convert opp-v1 to opp-v2 and read speed binned / 720MHz grade bits
Date:   Mon,  2 Sep 2019 12:55:46 +0200
Message-Id: <cover.1567421750.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch set converts the opp tables to opp-v2 format
and extends the ti-cpufreq to support omap3.

It adds 720 MHz (omap34xx) and 1 GHz (omap36xx) OPPs but
tells the ti-cpufreq driver to disable them if the speed
binned / 720MHz grade eFuse bits indicate that the chip
is not rated for that speed. 

It has been tested (for chip variant detection, not reliability
of high speed OPPs) on:
* BeagleBoard C2 (omap3430 600MHz)
* BeagleBoard XM B (dm3730 800MHz)
* GTA04A4 (dm3730 800MHz)
* GTA04A5 (dm3730 1GHz)


H. Nikolaus Schaller (5):
  cpufreq: ti-cpufreq: add support for omap34xx and omap36xx
  ARM: dts: add support for opp-v2 for omap34xx and omap36xx
  ARM: dts: omap3-evm-37xx: fix compatible from omap3630 to omap36xx
  ARM: dts: omap3-n950-n9: remove opp-v1 table
  ARM: dts: omap3-beagle: make explicitly compatible to ti,omap34xx

 arch/arm/boot/dts/omap3-beagle.dts   |  2 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts |  2 +-
 arch/arm/boot/dts/omap3-n950-n9.dtsi |  7 ---
 arch/arm/boot/dts/omap34xx.dtsi      | 59 ++++++++++++++++---
 arch/arm/boot/dts/omap36xx.dtsi      | 47 ++++++++++++---
 drivers/cpufreq/cpufreq-dt-platdev.c |  2 +-
 drivers/cpufreq/ti-cpufreq.c         | 86 +++++++++++++++++++++++++++-
 7 files changed, 176 insertions(+), 29 deletions(-)

-- 
2.19.1

