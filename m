Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 362DA102CEF
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 20:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKSTo3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 14:44:29 -0500
Received: from muru.com ([72.249.23.125]:42974 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbfKSTo3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Nov 2019 14:44:29 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 40542809B;
        Tue, 19 Nov 2019 19:45:05 +0000 (UTC)
Date:   Tue, 19 Nov 2019 11:44:25 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
Message-ID: <20191119194425.GQ35479@atomide.com>
References: <6e009ae3-6aa2-409b-749f-4947303940d8@ti.com>
 <20191119164227.GL35479@atomide.com>
 <20191119180546.GM35479@atomide.com>
 <9e15c170-c9fa-778c-d998-bd1111a6390d@ti.com>
 <20191119183247.GN35479@atomide.com>
 <a351461a-f6a1-334b-6bdd-a56626914fb3@ti.com>
 <20191119190721.GO35479@atomide.com>
 <7fa11037-8d33-2274-c8cc-80e9630b38b0@ti.com>
 <20191119192029.GP35479@atomide.com>
 <0ad31b32-712e-5bef-5645-0336dfec99cc@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ad31b32-712e-5bef-5645-0336dfec99cc@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [191119 19:36]:
> On 11/19/19 2:20 PM, Tony Lindgren wrote:
> > * Andrew F. Davis <afd@ti.com> [191119 19:13]:
> >> On 11/19/19 2:07 PM, Tony Lindgren wrote:
> >>> * Andrew F. Davis <afd@ti.com> [191119 18:51]:
> >>>> On 11/19/19 1:32 PM, Tony Lindgren wrote:
> >>>>> It would allow us to completely change over to using
> >>>>> arm_smccc_smc() and forget the custom calls.
> >>>>
> >>>> We would need more than just the r12 quirk to replace all our custom SMC
> >>>> handlers, we would need quirks for omap_smc2 which puts process ID in r1
> >>>> and puts #0xff in r6, and omap_smc3 that uses smc #1. All of our legacy
> >>>> SMC calls also trash r4-r11, that is very non SMCCC complaint as only
> >>>> r4-r7 need be caller saved. I don't see arm_smccc_smc() working with
> >>>> legacy ROM no matter how much we hack at it :(
> >>>
> >>> We would just have omap_smc2() call arm_smccc_smc() and in that
> >>> case. And omap_smc2() would still deal with saving and restoring
> >>> the registers.
> >>
> >> Then why call arm_smccc_smc()? omap_smc2() is already an assembly
> >> function, all it needs to do after loading the registers and saving the
> >> right ones is issue an "smc #0" instruction, why would we want to
> >> instead call into some other function to re-save registers and issue the
> >> exact same instruction?
> > 
> > To use Linux generic API for smc calls where possible.
> 
> But we are not using generic API calls, we are using omap_smcx() which
> cannot call into arm_smccc_smc(). For all the above reasons plus
> arm_smccc_smc() uses r12 to save the stack pointer, our ROM expects r12
> to store the function ID.

Saving and restoring r12 could be handled by the arm_smccc_smc() quirk
for the non-optee case.

Then we could get rid of omap_smc1() and arm_smccc_smc() should work
for the optee case and non-optee case, right.

> >>> Certainly the wrapper functions calling arm_smccc_smc() can deal
> >>> with r12 too if the r12-quirk version and the plain version are
> >>> never needed the same time on a booted SoC.
> >>>
> >>> Are they ever needed the same time on a booted SoC or not?

> They should not be needed at the same time, either OP-TEE is on the
> secure side or ROM is there.

OK thanks. So we could just modify the code dynamically on boot
based on if optee is found or not. The quirk could be done along
the lines of the qcom quirk but only for the non-optee case:

$ git grep -C10 ARM_SMCCC_QUIRK_QCOM_A6

Regards,

Tony
