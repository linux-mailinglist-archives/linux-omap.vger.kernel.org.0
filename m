Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A90351FE9
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhDAThw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:37:52 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:37368 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234453AbhDAThw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 15:37:52 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id S38SlkFJgtpGHS38Wly34z; Thu, 01 Apr 2021 21:37:50 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617305870; bh=YQB7g1tisjsO2/drdzJfID05HXMNLmMVG06wPqjwn88=;
        h=From;
        b=bqHrWqGHQHCwRxWwIwip8RK7Moc2HaHTTEil/uUqh+ipY0d43VmtwGRzQoAENdjXf
         cvIKiXFiZfJhxf/GlhkLU1qCB/Lnun1pB9HugdgWawQZSr9siJg45Lilo7wWJ6KE9x
         TX8TvzGOGFaO2PmC8TIY5hP0lqvXp7rdwWnQRc+Y1Gh3BGxfckF7hcJL+kbJYvbRYw
         hf0+1h0cpxDtyDyPHiTrbQj6DRh+UKsGyPmtNT5QVNJkctmieynMTxbOXk90cdo9Tk
         fPPWlGWot4+3kuAfBqBEG28uQVCOrLSUGvj2mET1xFe/mOCEIXJo9J5ubZ39DCEbDd
         x2QSS3kfeNVYg==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=6066210e cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=IkcTkHD0fZMA:10 a=1Ew--PDDX9GlwpKbZyQA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v4 0/5] clk: ti: add am33xx spread spectrum clock support
Date:   Thu,  1 Apr 2021 21:37:36 +0200
Message-Id: <20210401193741.24639-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDiLzMti9f+2PiHEAAsu6xn+rVDM+lPnGENoR6zBoMCDhuA17etv25hLQb5jrSKjuAcMphCH4j+8tg/G5wT4AC9Exakc0HQKI9oab86fVstoTZdlfS6G
 9WoiF3Qx5zZx1dyZ07esTdm9XgZdhVG4puKiW+Rg8HcJg84o7ivevZa6Juoj9t7AVQFtkHok8+4O+SJ+B9bMjxJqC/q2bIePtlFAMN/z/nIem8dtpiFv2Lcy
 pjFZJg98+FtwBAxf6cao3tiraGuo3pQ/vY63V4TsYHC8OVVYyVwRaUVx3XDmcWsQTcICWrC6oWN+TssYh9LdJMI2x5YbucWIEUw2LaDU6bN04ADkMGkocuTr
 athPYBqo3jlp48xTGV+0Q67qnFPghdwkAeEAfQkeWZZhkSQRWJEREoMea1XJjyR9p7fuZFYBp/wP/0SdlnMjGGWnp3kHisPO+Rf6WmNNqs4WO31Kcxo1Xy7k
 NFWPETc5yBfr5bOguHIJJrCLUU4PKymgrYJzW0ryrs+Sk7YE1JjUBZRvT050XUWfjINrHJMlV2BpS/6x9/daF/KNYdKzTe73lfASYrj6op7Hwe9wqmS1WYge
 zzlcXVQHbvFX+6zqXpBCyrWXWfSmO6NuGErygIrguoISIA==
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
 drivers/clk/ti/dpll.c                         | 42 +++++++++
 drivers/clk/ti/dpll3xxx.c                     | 87 ++++++++++++++++++-
 include/linux/clk/ti.h                        | 24 +++++
 6 files changed, 183 insertions(+), 12 deletions(-)

-- 
2.17.1

