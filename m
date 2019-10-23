Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77FFE1AAC
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 14:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390041AbfJWMfG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 08:35:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:48818 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390039AbfJWMfF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Oct 2019 08:35:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NCZ3r4112103;
        Wed, 23 Oct 2019 07:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571834104;
        bh=dTVCATdc6pJt52c1RbShuYo6eulnkbgK4qRYqMp9s4A=;
        h=To:CC:From:Subject:Date;
        b=fjB02Gl5hTw6WbXOmKbsr6s+X4w8FXWuD0alG1FFPN/MhAIrPGx4dvL8wjofa0yBe
         E1By8yE5cokiCugvTEwqHPt/pHBgnEYgQHQTq1pJ8Kr0RnZDVHDTBhb2LtQeNmZVj8
         qR/ZQA2qo5Ae/dMdDpOR+1plYqnmViUPuuN9d5/k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NCZ3h9010118
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 07:35:03 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 07:34:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 07:34:53 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NCZ1pS044602;
        Wed, 23 Oct 2019 07:35:02 -0500
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: ti: fixes for v5.4
Message-ID: <fc8fa6fe-5050-ec41-6fdc-c8b726255860@ti.com>
Date:   Wed, 23 Oct 2019 15:35:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Stephen,

Please pull these fixes for 5.4.

Thanks,
Tero

---

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/ti-clk-fixes-for-5.4

for you to fetch changes up to 1c7630688a0fa0738688f987c48b6be412e200dd:

   clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call (2019-10-23 
12:14:06 +0300)

----------------------------------------------------------------
TI clock driver fixes for 5.4

- Divider clock fixes to accommodate max divider values properly
- Fix for certain clkctrl clocks failing to enable due to timeout
- Remove duplicate clock aliases for dra7-atl-clocks

----------------------------------------------------------------
Peter Ujfalusi (1):
       clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call

Tero Kristo (4):
       clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table
       clk: ti: divider: cleanup ti_clk_parse_divider_data API
       clk: ti: divider: convert to use min,max,mask instead of width
       ARM: dts: omap3: fix DPLL4 M4 divider max value

Tony Lindgren (1):
       clk: ti: clkctrl: Fix failed to enable error with double udelay 
timeout

  arch/arm/boot/dts/omap36xx-clocks.dtsi |   4 +
  arch/arm/boot/dts/omap3xxx-clocks.dtsi |   2 +-
  drivers/clk/ti/clk-dra7-atl.c          |   6 -
  drivers/clk/ti/clkctrl.c               |   7 +-
  drivers/clk/ti/clock.h                 |   7 +-
  drivers/clk/ti/divider.c               | 282 
+++++++++++++--------------------
  6 files changed, 127 insertions(+), 181 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
