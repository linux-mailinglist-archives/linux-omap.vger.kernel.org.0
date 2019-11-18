Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8790B100ECB
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 23:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfKRWbe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 17:31:34 -0500
Received: from muru.com ([72.249.23.125]:42790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbfKRWbe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 17:31:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2A9FF80BF;
        Mon, 18 Nov 2019 22:32:08 +0000 (UTC)
Date:   Mon, 18 Nov 2019 14:31:28 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
Message-ID: <20191118223128.GE35479@atomide.com>
References: <20191118165236.22136-1-afd@ti.com>
 <20191118215759.GD35479@atomide.com>
 <b86e1d66-1566-521c-a445-4f0ae2fd95d6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b86e1d66-1566-521c-a445-4f0ae2fd95d6@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [191118 22:14]:
> On 11/18/19 4:57 PM, Tony Lindgren wrote:
> > Hi,
> > 
> > * Andrew F. Davis <afd@ti.com> [191118 08:53]:
> >> +#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
> >> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
> >> +	ARM_SMCCC_OWNER_SIP, (func_num))
> >> +
> >> +void omap_smc1(u32 fn, u32 arg)
> >> +{
> >> +	struct device_node *optee;
> >> +	struct arm_smccc_res res;
> >> +
> >> +	/*
> >> +	 * If this platform has OP-TEE installed we use ARM SMC calls
> >> +	 * otherwise fall back to the OMAP ROM style calls.
> >> +	 */
> >> +	optee = of_find_node_by_path("/firmware/optee");
> >> +	if (optee) {
> >> +		arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
> >> +			      0, 0, 0, 0, 0, 0, &res);
> >> +		WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
> >> +	} else {
> >> +		_omap_smc1(fn, arg);
> >> +	}
> >> +}
> > 
> > I think we're better off just making arm_smccc_smc() work properly.
> > See cat arch/arm*/kernel/smccc-call.S.
> > 
> 
> 
> arm_smccc_smc() does work properly already, I'm using it here.

OK. I guess I don't follow then why we can't use arm_smccc_smc()
for old code.

> > If quirk handling is needed, looks like ARM_SMCCC_QUIRK_STATE_OFFS
> > can be used.
> > 
> 
> 
> Tried that [0], was NAKd. Making quirk-free SMCCC calls if OP-TEE is
> detected seems to be the suggested path forward, QCOM got a pass,
> doesn't look like we will get the same.
> 
> +Mark, in case you want to comment if this patch matches what you had in
> mind.
> 
> [0] https://www.spinics.net/lists/arm-kernel/msg607263.html

Yeah I might be missing some parts here..

> > AFAIK this should work both for optee and the current use cases.

.. as I'd like to have a solution that works for both cases using
arm_smccc_smc().

If r12 is the only issue, souds like we can just use a wrapper
for the legacy calls to call arm_smccc_smc()?

Regards,

Tony
