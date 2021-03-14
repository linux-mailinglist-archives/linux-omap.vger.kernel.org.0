Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5432D33A54F
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 16:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbhCNPMp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 11:12:45 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:40445 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232662AbhCNPMn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 11:12:43 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id LSPzlDn2etpGHLSQ4lAQ7n; Sun, 14 Mar 2021 16:12:41 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1615734762; bh=vK2OqpNKI0QYjQGKvHcbMxiP1d3Brqyh44o5DIEI8Ow=;
        h=From;
        b=HBuaLkW/tose/cwtAbyUkyv/BwmNKTCFUpz/t0pW5LntaoxhS7pYaJd4iK6crhPnx
         Gnnm10R9BEVELbcy3kaPiiKNtnOj3iJgnTgmzOwn1NdsM8dp98P6fynv6Okp14GRjk
         ykYO/WlB22GiyN8zN5AT6Gnigc9Hh4rHHE0QV+nO+qVmOc9qytmCCy01hvqbXda/sb
         5auNgN9+nMzon2zMmnwuyvEWRjas1v1k2+W3J3NoEYnqtu6F4J1N1cppK7B/Y7v9eG
         M6IgWNiINO5cN0rmk0mRkVkmw3lqEIe+BLhIl3lDP+DPGCPsf+6ifQ6xLiWksl0fXb
         Yxh71mssG1Bgw==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=604e27ea cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=IkcTkHD0fZMA:10 a=wWb8P1eRJa4rfLIeBvsA:9 a=QEXdDO2ut3YA:10
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 0/4] clk: ti: add am33xx spread spectrum clock support
Date:   Sun, 14 Mar 2021 16:12:29 +0100
Message-Id: <20210314151233.23243-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfN6fGTPEh5gLyghbn1eIfsPmGzVXQ4yPJN4J8eWOvCIqGJParrQEOl8NkmMBDQDwIa5sOlkRZdxhbuiSdvWALn0NBqdWNbqUZuJxJVP0MMsp+m4E+4Wc
 CeD8l4VH6m1a3BGwbhZC7iqzILXBK1q5/pDivY/mY0Ro1L+r3vZDd6UdtyGwj5pvDa9o4H4vF2vCrf7SpAl+6g4I1OXjLuIcAz9mGP4taXb+ZkQwR3bYUdup
 DZFmjLf1oUYmGjFXnsdo+gnTIPN9XOVrBIgH7DvNfRRmmenTZFXqf3BXosfMCupq4jo+s6w8oKV4RyJ/xcmIgkJBEuUlTn5q4WbrWkWyyanUZ7n88Lh5n5c4
 vf6cV028umxKbqGlMoipxq7Gb6F7PzW+ODp7e4lY9vdKLy4nOnir8DATD8VCjImW1QEE/pUV0EbhPXLPCV69I5NnYAMrWRLPAX7qdvmObls/RzAb19U+5i6+
 GH2H76QExocE3e+of+uekXOjn7e3+kFZL3coNGGKcdPqRr52/kkDJKYKw0bcGDG8AezcAEZRo42N/oB3famMb5X2HGLxuxSiRaRncSbfbWp3PKHWJcICNMoX
 +t285rYK11v/UEZrNK7UovBQ
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

