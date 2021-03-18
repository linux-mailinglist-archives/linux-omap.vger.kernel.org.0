Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FF2340BC7
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 18:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhCRR1H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 13:27:07 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:47190 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230353AbhCRR1C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Mar 2021 13:27:02 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id MwPulsZ9jtpGHMwQ6lfgb1; Thu, 18 Mar 2021 18:27:00 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1616088420; bh=yj+a1jaz0T1SShJsQxra1ks1sG+DRrSV4DLGd8lOu9s=;
        h=From;
        b=leBrLWXb2shmeRi3o/q/Gbfouyxfd/RERHWK0EvtA4VNnA585MFZXpgn3xtGMBd7z
         EuGXoPYLB8Cm88zee+MYAexhkyqD6FpJSU5NDfdpvnhCfmYOnRup4JeITuEM067U3O
         GIBI7KZW1IwWBAJpMdthU8Uc1HZb359Edy5FkGLJek0FY5vBPqk7vIxzHEUXq8evQd
         TMuiIklElrCzP00VjY/fmAFsFjE79wch1z8jZalQHWtcMOLarNI0nJWbVuIMI8s8e+
         GfmyE4LSz0FoOqSW4gWo0XhDHtwZlLtNqvLAEGPtEQ2xdcNb/eHQ3vPmP7BZjnDNow
         5TI1XlgzilW6w==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60538d64 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=IkcTkHD0fZMA:10 a=wWb8P1eRJa4rfLIeBvsA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v2 0/4] clk: ti: add am33xx spread spectrum clock support
Date:   Thu, 18 Mar 2021 18:26:22 +0100
Message-Id: <20210318172627.12173-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDK4Q7A05zj30Dnd5wsWaqgHe2FaIszhcG0sF0Nc6Q2eaRdpepRVILGMtNqciN7iPltx6QEa+aL18eJ1LLW0hvl3LKRp8Jz3ACW0OisqPVpUYNY8Fg2y
 APwmtA/n5STDvlked/NvnlpO5tsgYKGKkhrS9gHb3EGicLVyC/4DeYdHv66wBPgy1itn+qI35Fqk+Z+lfSleL0u3u5XXmLkpIEk43PfMW1D0kteAyWpKuAI5
 zpSynDDQQ9Cc6Swrk46h9wWqyg56gaavXjbzo5OZgpWDKDe9bTcLoCUblflNl1Dygmt276gECpWL7KkfWMhxSaBB3OstVNOhb7F7q0q2eImkoNbRSpe5xsac
 nFvLvw/nzssLFXddqPtVW2mYNVPvud5JGQjEcoPu7dFnCXZQB6Az1cbYdUQqBlW3QCDmvcgUj9/VWwx9qVoQ2IHv9t2RYN9G1NiCNavzrDJ7ezzutdQzkMlV
 ewdVPsn5I1Y8eBkqPjUACPc2NWQH9seHMgVcgV7kf2lhtvIXlqQkWO9APTnMvKgWJNrKvNkbWUbR6emjQEagjywkAfCsv+eDbkeKqolEMzfNd9iw4DLDU7w8
 +TAwA+PLHhTLySidEW1CqNwtsdHk7rSw+8ujnYLxpiVSSQ==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


As reported by the TI spruh73x RM, MPU and LCD modules support spread
spectrum clocking (SSC) on their output clocks. SSC is used to spread
the spectral peaking of the clock to reduce any electromagnetic
interference (EMI) that may be caused due to the clock’s fundamental
or any of its harmonics.
The series allows you to enable and adjust the spread spectrum clocking
for all am33xx PLLs for which it is supported.


Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.
- Move the DT changes to the previous patch in the series.

Dario Binacchi (4):
  clk: ti: fix typo in routine description
  dt-bindings: ti: dpll: add spread spectrum support
  ARM: dts: am33xx-clocks: add spread spectrum support
  clk: ti: add am33xx spread spectrum clock support

 .../devicetree/bindings/clock/ti/dpll.txt     | 20 +++++
 arch/arm/boot/dts/am33xx-clocks.dtsi          |  4 +-
 drivers/clk/ti/dpll.c                         | 41 +++++++++
 drivers/clk/ti/dpll3xxx.c                     | 87 ++++++++++++++++++-
 include/linux/clk/ti.h                        | 24 +++++
 5 files changed, 173 insertions(+), 3 deletions(-)

-- 
2.17.1

