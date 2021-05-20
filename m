Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FB338B6D8
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 21:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236768AbhETTOt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 15:14:49 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:36588 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236735AbhETTOs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 May 2021 15:14:48 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([82.60.150.250])
        by smtp-34.iol.local with ESMTPA
        id jo6clK7DY5WrZjo6glTD5l; Thu, 20 May 2021 21:13:20 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621538000; bh=Y/2zyqjfuNRI5Jx3EW2y4ad1bo9cdxK3OR1C81r1Ufo=;
        h=From;
        b=D5WkJ0g7AGs5nU5T6axIQiJS3x7f5bJ5zRRjgJafEei9fjhgz8evfit5cA3kLSgEe
         fwS2Si4mO8HbQxoUXHkQn7YebXeaheiCx49vkvdjXvIQsdZYS6RwnFgLn0XfrfzwHS
         /QPAw1qQJCOk5w3w1EX3N5y1Php8PH1UXbbxI/WsQo+hAJdr//EDkzVLDT2JZZSoPr
         KjrFMGIN2A1lBdcwTtTICgSD2LpznSvKegTvFXLKGcAgM5boVw5egrQPnM40MiTDDT
         0KjBcbReIkfi6gpV1URb96dSL75vU3X+74NvRGCW9K4PmikvB5tt67E27jO4t3zi3r
         NY1hhomZkNpzw==
X-CNFS-Analysis: v=2.4 cv=W4/96Tak c=1 sm=1 tr=0 ts=60a6b4d0 cx=a_exe
 a=QSJ1svMVA5tvcuOEAX2Bgw==:117 a=QSJ1svMVA5tvcuOEAX2Bgw==:17
 a=IkcTkHD0fZMA:10 a=7lJUY2J14ryrXklOE8AA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v6 0/5] clk: ti: add am33xx spread spectrum clock support
Date:   Thu, 20 May 2021 21:13:00 +0200
Message-Id: <20210520191306.21711-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJFY6Z+gKMyGS4cWSqpmroH7IXzHKbzcRZTgfOH/wQQIy/RUwB1lXt3AdJQ3Hg7/Eh9Bf7jweZ09CJfXs4PnovkvdKueCQ/QbQlAAj9vAbA+m07c3F9m
 rizEB92OIN3lr8BM0HYxVPSdgngg/kDXS/zsd7+soNHiKCI1V0VEv7fku1+yNQyGWYudkU+GtxByDRhnHWqu5YnzXyPI6z+QKanGhMizJUvk9RhX9ffIaS94
 klkpWdKqBAWaRPUg6tFcgLt/bhbbW5m08Pk0VPevzNghFAHlX/yjMQUKGRKnNOqVs1kVChYkWnlatuDheewuBYJ/LWLxPeKA4WbeVB0i/hLcseX51Zn5jQ0F
 HjMvwuRgUmYXWTIzqrUtNAQKx41tHsXz9g6udzi7/7J4kS4YzLqhqsO5c0srFuhWjwvu3JyWCC4QFKhClRsXRd15v11+Z5ku52vAHWLuFLrmGcLN2xiWYyas
 EqBGBy1FIKnG/Tjm7sbZgg1XqOhSg0L8OQrArNSDYVPdGvKJCWVGHkVqC0mpdnMpCY6gCO8BhdEuy/NASmibHTUb9hp/X7whsnA0wyUgE65r46yG+akmEWz/
 DWEyn63Ks59z5m8pcHSTiS7OlEPA5EWZJIN0i3wEX5TF0g==
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

