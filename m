Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE50A2F5C30
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 09:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbhANIJI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 03:09:08 -0500
Received: from muru.com ([72.249.23.125]:44772 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727174AbhANIJI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Jan 2021 03:09:08 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 282DA811B;
        Thu, 14 Jan 2021 08:08:26 +0000 (UTC)
Date:   Thu, 14 Jan 2021 10:08:23 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "rogerq@ti.com" <rogerq@ti.com>, "s-anna@ti.com" <s-anna@ti.com>,
        "bcousson@baylibre.com" <bcousson@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "d-gerlach@ti.com" <d-gerlach@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "t-kristo@ti.com" <t-kristo@ti.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
Message-ID: <X//799pSjH9bL39s@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
 <20201026112222.56894-14-tony@atomide.com>
 <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
 <X/8ei0o9ULpRdx7T@atomide.com>
 <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
 <X/8kDzoADvcnNHxC@atomide.com>
 <X/8tz/2v4bnbF0TZ@atomide.com>
 <X//wx/oSTpXKpY75@atomide.com>
 <1c7301145600dabbb95402c7df0cf00b7bdd7fdd.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c7301145600dabbb95402c7df0cf00b7bdd7fdd.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210114 07:58]:
> I do also experience the boot problem described by Geert.
> 
> Head being:
> b0625afe305253d0831af9289b37c906c18a781b
> ARM: OMAP2+: Drop legacy platform data for am3 mpuss
> 
> => BBB boots Ok.
> 
> Head being:
> 5a230524f87926f24d637fe62fd689f7f86f5036
> ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
> 
> => BBB boot fails. (I don't have any debug parameters => last thing I
> see in UART is from uBoot:

Looking at the .config Geert sent me, at least CONFIG_SIMPLE_PM_BUS=y
is now needed, and probably should be selected or default y for omaps.

Adding that removes the -512 errors at least that I started seeing with
Geert's config too.

Can you guys check if adding CONFIG_SIMPLE_PM_BUS=y fixes the problem?

Regards,

Tony
