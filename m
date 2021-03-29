Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7C834D556
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 18:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhC2QpS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 12:45:18 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:51803 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231173AbhC2QpI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Mar 2021 12:45:08 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id Quy8lKyqctpGHQuyEliOkJ; Mon, 29 Mar 2021 18:42:33 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1617036153; bh=BrNKkRQtWd5xquv9TwU2ha5NNM/KSP7ccLi3tRmSmNo=;
        h=From;
        b=X6V3ykASzNscbC0iUVXp9q9q+Y4fNLeRRvcXrndrWb123fjybiBY5SNzbfz9Y1YpV
         4sqEbhrd8O41ofW4xZhZnvZfERCszHD8brEcjzXtiZsBcaXn5SBTg/JxZmisDewzb1
         8/8dPqBEPgN21KQukPNHE8zq81dvMdsHzJ1ZDoufAbTYjp/7CChBWeXH8Sv60iIRwp
         uNoypeC98cUPkd11b9iuTUEjqrZKI9jJIRFMQxv4tWbEpi+MBJDjfxIIs4jAxXSwUJ
         V2r+N9AGW7MsEQHQXYVtxiJjV961TLU3NlwZlKedAjl1rFJ1TGQ/A0wwGyYxGsDg8f
         Lz+NInesBXSeQ==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60620379 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=IkcTkHD0fZMA:10 a=wWb8P1eRJa4rfLIeBvsA:9 a=QEXdDO2ut3YA:10
 a=fCgQI5UlmZDRPDxm0A3o:22
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
Subject: [PATCH v3 0/4] clk: ti: add am33xx spread spectrum clock support
Date:   Mon, 29 Mar 2021 18:42:17 +0200
Message-Id: <20210329164222.26794-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIn27ZCUTmtRp+5x956SWoq43721p+yw9pLk/daDddlqNQ/gz0EePul9ixgUr+xfaol7JtaGqlt16lM+6lUrob04UJPZ1187PdtRMIG9GhvLriHyJWcj
 vOaA0ECpRQE5zy06Uo1ctYjWpibCahNpI1C177MEuGwHbSKCtevpGCrT5Lg92dLHOw6YGVU9l995kCO9/oLD7tQItD2ArOvLm2VOr5kA1V3WNtXRmfHImbD2
 LYzYI9knJxkEUQizaVC6DgHwFIHIIkrXBVOc1KR9hrYMkdf5kR+GU/FO9ujMdMSs7yU5pAGIoFotkfKEv6iW6/EYcWeXf4h5J83fQhu7wOxXjiBU6F/SBQWb
 AtaSNsCZwlsVSRHe6IGY4Jh4beNn3OfZnzjBWbi8CBi1UjUzZe6EPQsPtgg4t72BXxIHE80B7UIlLM4BGw2GMPWlhHYAocy2m1HYvouRRI0dnxPw8rWzTE7b
 y79QESQJOKoYedTmHipmpznZ6r8NqfkIv09VHixSw07fdSAAawMzq3yB+EvBiF6wdoWjENuu18gaLCHm5iyLjydekC5sDezDkPFyaiK84P2UqGAGK9Xq3hfO
 p6NiE5ihyjPEnBXwMQ1b5u7faJ231nU9oiM+62QLTw8zyw==
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


Changes in v3:
- Add '-hz' suffix to "ti,ssc-modfreq" binding.
- Add Tony Lindgren acked tag.
- Use "ti,ssc-modfreq-hz" binding instead of "ti,ssc-modfreq".

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
 drivers/clk/ti/dpll.c                         | 42 +++++++++
 drivers/clk/ti/dpll3xxx.c                     | 87 ++++++++++++++++++-
 include/linux/clk/ti.h                        | 24 +++++
 5 files changed, 174 insertions(+), 3 deletions(-)

-- 
2.17.1

