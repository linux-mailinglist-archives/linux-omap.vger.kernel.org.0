Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A922E39B3CA
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 09:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhFDHZ6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 03:25:58 -0400
Received: from muru.com ([72.249.23.125]:36134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230049AbhFDHZ6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 03:25:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2DABC8167;
        Fri,  4 Jun 2021 07:24:18 +0000 (UTC)
Date:   Fri, 4 Jun 2021 10:24:07 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tero Kristo <kristo@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 0/5] clk: ti: add am33xx spread spectrum clock support
Message-ID: <YLnVF6owlhZu6JU6@atomide.com>
References: <20210602150009.17531-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602150009.17531-1-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Dario Binacchi <dariobin@libero.it> [210602 15:00]:
> 
> As reported by the TI spruh73x/spruhl7x RM, MPU and LCD modules support
> spread spectrum clocking (SSC) on their output clocks. SSC is used to
> spread the spectral peaking of the clock to reduce any electromagnetic
> interference (EMI) that may be caused due to the clock’s fundamental
> or any of its harmonics.
> The series allows you to enable and adjust the spread spectrum clocking
> for all am33xx/am43xx PLLs for which it is supported. All these issues
> have been fixed.
> 
> 
> Previous versions of the series did not supported SSC for am43xx SOCs,
> causing clock registration failure for DPLLs. Furthermore, for am33xx
> SOCs, clock registration failed for DPLLs for which SSC is not supported.

Looks good to me, probably best to queue this all via the clock tree.

Regards,

Tony
