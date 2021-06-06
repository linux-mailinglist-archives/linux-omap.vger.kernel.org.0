Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FC439D15A
	for <lists+linux-omap@lfdr.de>; Sun,  6 Jun 2021 22:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhFFUZH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Jun 2021 16:25:07 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:40281 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229944AbhFFUZG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 6 Jun 2021 16:25:06 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.17.119.101])
        by smtp-35.iol.local with ESMTPA
        id pzIbl3WgQsptipzIflrvS7; Sun, 06 Jun 2021 22:23:15 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1623010995; bh=GKqzetWt/dv1cWgZZ2u8XQZHK90wz4LVNGLm9kxGPI0=;
        h=From;
        b=nuc9NxlcA2SDwhLoD0OKb+e8jyK159P0Zi9CVsY2UIjuvzw4LKwBTNnTGuXJ9gt8P
         TTp30CdwibI6JLbHnDtzQk7nSo/BxnExDfKjPGPdJ/da2uNqfFO76XBcnun1qoVatc
         2fL4pah/jU07dTeXjLRGfgORufdeO2cx+ykRwNteV+E/G83VVDozfxYfF2kiNMu3B3
         NaJPT7ufcIfpDI7lLTP8icYz5Riboct5IFmipbI+AZwo1496qVrB7nDUFQM/hgnR+u
         xlowurPq/IDv/KQ9fq+YPj5Xw6UNh5UG6XWYhCZMILVgBB4VWvKXsQJkfio1qg7fu/
         ypFq/DauE4FAQ==
X-CNFS-Analysis: v=2.4 cv=Bo1Yfab5 c=1 sm=1 tr=0 ts=60bd2eb3 cx=a_exe
 a=do1bHx4A/kh2kuTIUQHSxQ==:117 a=do1bHx4A/kh2kuTIUQHSxQ==:17
 a=IkcTkHD0fZMA:10 a=7lJUY2J14ryrXklOE8AA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-clk@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dario Binacchi <dariobin@libero.it>,
        linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND PATCH v7 0/5] clk: ti: add am33xx spread spectrum clock support
Date:   Sun,  6 Jun 2021 22:22:48 +0200
Message-Id: <20210606202253.31649-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI5nRvbbCZ0v19Bu7kLVeQHrArqdPErUgcd8LsmC4639LarUVB95QxaVsA+rN0o9Ten43Cf5fO/jOoc7x+hcvpTtlqmao8mOS1AtV7TYGlivK72Rz37x
 BuhRgFbQXlkD6hhfH372yu9dpXVpigy1teVlHOJjkDL0czL354Qh23b1WetGol1AsetVdNZxsyQg9DZYSuraTBbMTfjibMAqHkAPGhYJcmbk5sKBVe5Bgggg
 vAYWd9NAmbgMhDpIHr4PRfBoidzzBHI2n+IzubLrJWu+EZB/XpX29PJzorDggQpVb3NRIpVpDr1uWeOsvTepMePC8+HMqfzGsIgo1PNM8tCalxDyDooTsVzp
 pM5UyRJZT/d7ot7NzduYudeH7x24rEzoatf9k7/TMCz0vzJCXU6S6V5SYrv1EKLWwgDZINWZEAiaU4TeiEa14g1T1H6PgsYXKr/A+9qNYgiPqS7jF4ENZCgs
 j+s7Y8JYDsEjrKo81x/NEZWM6uN1+5ScEglmVcBzbtHdZMLIwPlU4mKCv66M/TksG+ch3IM+OTEowyWYa1tQS/9uN7+B1kbFW0qT5Or0rL4nD5M39IqKlS51
 Mlg+mJMn/MgEHerj9yti5ubO7YErYv4okrel4VGWNu/LSg==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


As reported by the TI spruh73x/spruhl7x RM, MPU and LCD modules support
spread spectrum clocking (SSC) on their output clocks. SSC is used to
spread the spectral peaking of the clock to reduce any electromagnetic
interference (EMI) that may be caused due to the clock’s fundamental
or any of its harmonics.
The series allows you to enable and adjust the spread spectrum clocking
for all am33xx/am43xx PLLs for which it is supported.

As suggested by Tony Lindgren I resend the whole series to the clk tree.
For Tony the series is ok.

Changes in v7:
- Add Tony Lindgren acked tag.

Changes in v6:
- Add Tero Kristo review tag.

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

