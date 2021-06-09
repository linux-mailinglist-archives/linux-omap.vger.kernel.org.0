Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0593A0C4F
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 08:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbhFIGWg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Jun 2021 02:22:36 -0400
Received: from muru.com ([72.249.23.125]:39774 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231685AbhFIGWg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Jun 2021 02:22:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4CFF08061;
        Wed,  9 Jun 2021 06:20:50 +0000 (UTC)
Date:   Wed, 9 Jun 2021 09:20:39 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Woodruff, Richard" <r-woodruff2@ti.com>
Cc:     David Russell <david.russell73@gmail.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
Message-ID: <YMBdt8dDdvySofuC@atomide.com>
References: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
 <cb562f9f798d4431a09f19e8efd24727@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb562f9f798d4431a09f19e8efd24727@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Woodruff, Richard <r-woodruff2@ti.com> [210607 15:40]:
> Guess: this bit in JTAG script used for IVA tests probably is missing and needs to be worked in.  The generic linux-omap clock code probably handles the IVA clock but maybe not the resets.
> 
>    /*  Enable IVA-ss functional clock (set bit 0) */
>    (*(int*)0x49006800) |= 0x1;
> 
>    /* Release l3s_idle_req  */
>    (*(int*)0x49006810) |= (1 << 1);
> 
>    /* Release L3S reset and power-on reset (clear bit 1) at the same time */
>    (*(int*)0x49006850) &= ~(( 1 << 1));

Heh and I thought nobody is using 2430 any longer :)

FYI, the current mainline kernel actually can deal with all that using
reset driver and genpd, see for example commits:

ae57d1558908 ("ARM: dts: Configure interconnect target module for dra7 iva")
effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva")

Similar setup should also work for 2430 but needs the power domains
configured for drivers/soc/ti/omap_prm.c at least for iva.

David, I think what you're seeing is iva getting released from reset with
an unconfigured MMU, and then the system will hang.

Regards,

Tony
