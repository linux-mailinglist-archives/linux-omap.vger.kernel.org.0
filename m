Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C986102933
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbfKSQWB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 11:22:01 -0500
Received: from muru.com ([72.249.23.125]:42904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfKSQWB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Nov 2019 11:22:01 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 47F57809B;
        Tue, 19 Nov 2019 16:22:37 +0000 (UTC)
Date:   Tue, 19 Nov 2019 08:21:57 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
Message-ID: <20191119162157.GJ35479@atomide.com>
References: <20191118165236.22136-1-afd@ti.com>
 <20191118215759.GD35479@atomide.com>
 <b86e1d66-1566-521c-a445-4f0ae2fd95d6@ti.com>
 <20191118223128.GE35479@atomide.com>
 <29db708e-119e-8a89-7d43-e38e2a10dc07@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29db708e-119e-8a89-7d43-e38e2a10dc07@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [191119 01:14]:
> On 11/18/19 5:31 PM, Tony Lindgren wrote:
> > * Andrew F. Davis <afd@ti.com> [191118 22:14]:
> >> On 11/18/19 4:57 PM, Tony Lindgren wrote:
> >>> Hi,
> >>>
> >>> * Andrew F. Davis <afd@ti.com> [191118 08:53]:
> >>>> +#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
> >>>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
> >>>> +	ARM_SMCCC_OWNER_SIP, (func_num))
> >>>> +
> >>>> +void omap_smc1(u32 fn, u32 arg)
> >>>> +{
> >>>> +	struct device_node *optee;
> >>>> +	struct arm_smccc_res res;
> >>>> +
> >>>> +	/*
> >>>> +	 * If this platform has OP-TEE installed we use ARM SMC calls
> >>>> +	 * otherwise fall back to the OMAP ROM style calls.
> >>>> +	 */
> >>>> +	optee = of_find_node_by_path("/firmware/optee");
> >>>> +	if (optee) {
> >>>> +		arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
> >>>> +			      0, 0, 0, 0, 0, 0, &res);
> >>>> +		WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
> >>>> +	} else {
> >>>> +		_omap_smc1(fn, arg);
> >>>> +	}
> >>>> +}
> >>>
> >>> I think we're better off just making arm_smccc_smc() work properly.
> >>> See cat arch/arm*/kernel/smccc-call.S.
> >>>
> >>
> >>
> >> arm_smccc_smc() does work properly already, I'm using it here.
> > 
> > OK. I guess I don't follow then why we can't use arm_smccc_smc()
> > for old code.
> > 
> 
> 
> Our ROM code needs r12 to have the function code in it, where as the ARM
> SMC calling convention standard requires that (plus some other
> information) stored in r0. Our ROM doesn't know anything about the that
> standard that came out years after we shipped these devices. And as such
> is not complaint.

Right.

> A generic smc() call would be nice, but arm_smccc_smc() is specifically
> for SMCCC.

To me it seeems that HAVE_ARM_SMCCC is a generic feature though.
It's not limited to OPTEE. We have select HAVE_ARM_SMCCC if CPU_V7
in arch/arm/Kconfig, and OPTEE depends on HAVE_ARM_SMCCC.

From that point of view it seems that we could have HAVE_ARM_SMCCC
enabled also for v6 and use it for all mach-omap2 with a wrapper.

So I'd like to have our smc callers eventually just call generic
generic arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn)...) rather
than the custom calls. And we want to update to using the generic
functions one case at a time as the features get tested :)

In any case, you should do the necessary checks for HAVE_ARM_SMCCC
only once during init. I'm not sure how much checking for
"/firmware/optee" helps here, sounds like we have a broken system
if the firmware is not there while the arm_smccc_smc() should
still work just fine :)

Regards,

Tony
