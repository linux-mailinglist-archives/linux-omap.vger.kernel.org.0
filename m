Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2169612D2CA
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 18:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfL3RhD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 12:37:03 -0500
Received: from muru.com ([72.249.23.125]:49746 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfL3RhD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 12:37:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 678838027;
        Mon, 30 Dec 2019 17:37:43 +0000 (UTC)
Date:   Mon, 30 Dec 2019 09:36:59 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ARM: OMAP2+: Introduce check for OP-TEE in
 omap_secure_init()
Message-ID: <20191230173659.GN35479@atomide.com>
References: <20191217234745.4434-1-afd@ti.com>
 <20191217234745.4434-3-afd@ti.com>
 <20191218005316.GG35479@atomide.com>
 <f2efedb7-8050-2c16-02d0-a534c00a497e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2efedb7-8050-2c16-02d0-a534c00a497e@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [191218 01:01]:
> On 12/17/19 7:53 PM, Tony Lindgren wrote:
> > * Andrew F. Davis <afd@ti.com> [191217 23:48]:
> >> --- a/arch/arm/mach-omap2/omap-secure.c
> >> +++ b/arch/arm/mach-omap2/omap-secure.c
> >> @@ -20,6 +21,18 @@
> >>  
> >>  static phys_addr_t omap_secure_memblock_base;
> >>  
> >> +bool optee_available;
> > 
> > The above can be static bool optee_available?
> > 
> >> --- a/arch/arm/mach-omap2/omap-secure.h
> >> +++ b/arch/arm/mach-omap2/omap-secure.h
> >> @@ -10,6 +10,8 @@
> >>  #ifndef OMAP_ARCH_OMAP_SECURE_H
> >>  #define OMAP_ARCH_OMAP_SECURE_H
> >>  
> >> +#include <linux/types.h>
> >> +
> >>  /* Monitor error code */
> >>  #define  API_HAL_RET_VALUE_NS2S_CONVERSION_ERROR	0xFFFFFFFE
> >>  #define  API_HAL_RET_VALUE_SERVICE_UNKNWON		0xFFFFFFFF
> >> @@ -72,6 +74,7 @@ extern u32 rx51_secure_dispatcher(u32 idx, u32 process, u32 flag, u32 nargs,
> >>  extern u32 rx51_secure_update_aux_cr(u32 set_bits, u32 clear_bits);
> >>  extern u32 rx51_secure_rng_call(u32 ptr, u32 count, u32 flag);
> >>  
> >> +extern bool optee_available;
> >>  void omap_secure_init(void);
> > 
> > And then this change should not be needed, right?
> > 
> 
> 
> I have a staged change I'm about to post that makes use of this flag
> from outside of omap-secure.c, otherwise I would have left it internal
> to that file.
> 
> I could also have moved the flag in the patch that uses it, but it
> seemed like an unnecessary change given I know it will be needed here soon.

OK best to post all them together. Or initially just set it static
as otherwise people reading the patches will wonder about it with
no user. And all the automated test systems will start sending out
patches :)

Regards,

Tony
