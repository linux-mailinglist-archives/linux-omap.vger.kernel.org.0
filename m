Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90DF36362D
	for <lists+linux-omap@lfdr.de>; Sun, 18 Apr 2021 16:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhDRO5g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Apr 2021 10:57:36 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:43400 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229691AbhDRO5f (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 18 Apr 2021 10:57:35 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id Y8r3lCRdYpK9wY8rBla5VB; Sun, 18 Apr 2021 16:57:06 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618757826; bh=olZ0wz76vMXLsV08flCc5AVxfd/v9Jixr/3NXTZsFCw=;
        h=From;
        b=RdGd4yErLWJgm+vPMucdoHLq2R9gV6+eI7QD76x6MVIyx71ZvCh9dLY0Hg7nfTMc1
         HEBPVNTaAxFiKRppHRYtZd8XIkunnXReUAEvYoYBLihMU4yJe2oYVRjj4nWc8/cDm+
         7XZ/ejndk8hQpL6GbTN0M+73UGEv5TDrKu0kJq94rMKd35HxObkXuE7crYAoygtYHK
         NhXmR7b+1mbMZSD+jXlSRrkV1I6UOtPmeJ0gCT92O17/Etk2QP+gFOaSSGw9V5+47S
         3uthKTVbH6EaIMZxLis5MjFbBb6wv1Bp7ehZR5BZdhWEMvsMlTH8J+JLQfL0a3HcK0
         5F+p4GCgCQSIA==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=607c48c2 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=IkcTkHD0fZMA:10 a=7lJUY2J14ryrXklOE8AA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Tero Kristo <kristo@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v5 0/5] clk: ti: add am33xx spread spectrum clock support
Date:   Sun, 18 Apr 2021 16:56:50 +0200
Message-Id: <20210418145655.10415-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLJ32xryx0zJbSv/pCGIcH5UmtmnokARk/xsaPBFowp6UztyiGOVUTDn3mEyJIJIRdrgRjlEXJj5lsxBZWVTZpbOq4B/5/vwDnCgjTWsQgpM+VVTpESe
 Oo43KFHKLo0W2BHTDTc1WoXA96gYEf4ybTwGXu2vB8hmUUcdt9YaePpvog0BdqZiQiqD41/ZODMoLDZE0l3VaIvHZbRF8Fs5eL8VY0ryKe1OAYRGbY1EK8ST
 wT3bN5phQD2nLR9IgI2RONQ5JrPTWRQksrZ5ngoKVMJaS2Pdq8iFAvJ8fXqLlXJa5LGkxXraz0q7knCS2jk9OSsWheIPt1IQr9Yoz60MYoaid9LJlNortOXH
 XiYdH8DrbazRnDytulyAfmEPhro7nB43ZcmDs6cBBa3c3ULNasp3Gz9xQxwCT7Mbh0PHberYgrPQ3ACAU7mDIPGHOOngh2x/wFpoW8BssqV9c2KtL5wDCKgA
 f4kDy0H+70Se2OVaDlZjSKuE3KsTnsZHoBZMY3N0RWdr4TXnxfccibkcyowH+cHoSNb7K1yeqj0lxwokRWw87jzl6OZM5F6DaB42XKOj4Dw6GasghAp0WWVG
 rZ/fih0jrFb2kDnhAOAxe0DwN+AIuOBGk3z0XH2OV6gm8Q==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


As reported by the TI spruh73x/spruhl7x RM, MPU and LCD modules support
spread spectrum clocking (SSC) on their output clocks. SSC is used to
spread the spectral peaking of the clock to reduce any electromagnetic
interference (EMI) that may be caused due to the clock’s fundamental
or any of its harmonics.
The series allows you to enable and adjust the spread spectrum clocking
for all am33xx/am43xx PLLs for which it is supported. All these issues
have been fixed.


Previous versions of the series did not supported SSC for am43xx SOCs,
causing clock registration failure for DPLLs. Furthermore, for am33xx
SOCs, clock registration failed for DPLLs for which SSC is not supported.

Changes in v5:
- Remove ssc_ack_mask field from dpll_data structure. It was not used.
- Change ssc_downspread type from u8 to bool in dpll_data structure.

Changes in v4:
- Add Stephen Boyd review tag.
- Add Rob Herring review tag.
- Add SSC registers for CORE, DDR and PER PLLs.
- Update commit message.
- Update commit message.

Changes in v3:
- Add '-hz' suffix to "ti,ssc-modfreq" binding.
- Add Tony Lindgren acked tag.
- Use "ti,ssc-modfreq-hz" binding instead of "ti,ssc-modfreq".

Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.
- Move the DT changes to the previous patch in the series.

Dario Binacchi (5):
  clk: ti: fix typo in routine description
  dt-bindings: ti: dpll: add spread spectrum support
  ARM: dts: am33xx-clocks: add spread spectrum support
  ARM: dts: am43xx-clocks: add spread spectrum support
  clk: ti: add am33xx/am43xx spread spectrum clock support

 .../devicetree/bindings/clock/ti/dpll.txt     | 20 +++++
 arch/arm/boot/dts/am33xx-clocks.dtsi          | 10 +--
 arch/arm/boot/dts/am43xx-clocks.dtsi          | 12 +--
 drivers/clk/ti/dpll.c                         | 39 +++++++++
 drivers/clk/ti/dpll3xxx.c                     | 87 ++++++++++++++++++-
 include/linux/clk/ti.h                        | 22 +++++
 6 files changed, 178 insertions(+), 12 deletions(-)

-- 
2.17.1

