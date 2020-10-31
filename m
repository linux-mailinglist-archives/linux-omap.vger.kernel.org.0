Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BB02A13E9
	for <lists+linux-omap@lfdr.de>; Sat, 31 Oct 2020 08:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgJaHLt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 31 Oct 2020 03:11:49 -0400
Received: from muru.com ([72.249.23.125]:47228 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgJaHLt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 31 Oct 2020 03:11:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A9E2680A3;
        Sat, 31 Oct 2020 07:11:51 +0000 (UTC)
Date:   Sat, 31 Oct 2020 09:11:43 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] bus: ti-sysc: Fix bogus resetdone warning for cpsw
Message-ID: <20201031071143.GL5639@atomide.com>
References: <20201026105812.38418-1-tony@atomide.com>
 <20201026105812.38418-5-tony@atomide.com>
 <b8a3cfc1-f9f5-1b18-b980-e88eb8b20e43@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8a3cfc1-f9f5-1b18-b980-e88eb8b20e43@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [201030 18:15]:
> Hi Tony,
> 
> On 26/10/2020 12:58, Tony Lindgren wrote:
> > The cpsw SOFT_RESET register is cleard when out of reset so let's
> > add SYSS_QUIRK_RESETDONE_INVERTED flag for cpsw. Otherwise we will
> > get bogus "OCP softreset timed out" warnings on boot.
> 
> Not sure if this quirk based approach is right way to move forward here.
> 
> The cpsw/cpgmac is "ti,sysc-omap4-simple" which means sysc_omap4_simple, which,
> in turn, has .srst_shift = -ENODEV.
> 
> And above should be enough to avoid both sysc_reset() and sysc_wait_softreset() for such modules.

That sounds like a much better fix indeed, I'll take a look.

Thanks,

Tony
