Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C03D38C309
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhEUJ3a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:29:30 -0400
Received: from muru.com ([72.249.23.125]:58380 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbhEUJ3R (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:29:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4D26180C0;
        Fri, 21 May 2021 09:26:58 +0000 (UTC)
Date:   Fri, 21 May 2021 12:26:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v6 4/5] ARM: dts: am43xx-clocks: add spread spectrum
 support
Message-ID: <YKd82iRaWhydlAdx@atomide.com>
References: <20210520191306.21711-1-dariobin@libero.it>
 <20210520191306.21711-5-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520191306.21711-5-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dario Binacchi <dariobin@libero.it> [210520 19:13]:
> Registers for adjusting the spread spectrum clocking (SSC) have been
> added. As reported by the TI spruhl7x RM, SSC is supported only for LCD
> and MPU PLLs, but the PRCM_CM_SSC_DELTAMSTEP_DPLL_XXX and
> PRCM_CM_SSC_MODFREQDIV_DPLL_XXX registers, as well as the enable field
> in the PRCM_CM_CLKMODE_DPLL_XXX registers are mapped for all PLLs (CORE,
> MPU, DDR, PER, DISP, EXTDEV).

This too:

Acked-by: Tony Lindgren <tony@atomide.com>
