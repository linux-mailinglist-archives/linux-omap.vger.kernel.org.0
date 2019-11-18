Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98B67100E7A
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 22:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfKRV6C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 16:58:02 -0500
Received: from muru.com ([72.249.23.125]:42764 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbfKRV6C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 16:58:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6AE9F80BF;
        Mon, 18 Nov 2019 21:58:39 +0000 (UTC)
Date:   Mon, 18 Nov 2019 13:57:59 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
Message-ID: <20191118215759.GD35479@atomide.com>
References: <20191118165236.22136-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118165236.22136-1-afd@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Andrew F. Davis <afd@ti.com> [191118 08:53]:
> +#define OMAP_SIP_SMC_STD_CALL_VAL(func_num) \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL, ARM_SMCCC_SMC_32, \
> +	ARM_SMCCC_OWNER_SIP, (func_num))
> +
> +void omap_smc1(u32 fn, u32 arg)
> +{
> +	struct device_node *optee;
> +	struct arm_smccc_res res;
> +
> +	/*
> +	 * If this platform has OP-TEE installed we use ARM SMC calls
> +	 * otherwise fall back to the OMAP ROM style calls.
> +	 */
> +	optee = of_find_node_by_path("/firmware/optee");
> +	if (optee) {
> +		arm_smccc_smc(OMAP_SIP_SMC_STD_CALL_VAL(fn), arg,
> +			      0, 0, 0, 0, 0, 0, &res);
> +		WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
> +	} else {
> +		_omap_smc1(fn, arg);
> +	}
> +}

I think we're better off just making arm_smccc_smc() work properly.
See cat arch/arm*/kernel/smccc-call.S.

If quirk handling is needed, looks like ARM_SMCCC_QUIRK_STATE_OFFS
can be used.

AFAIK this should work both for optee and the current use cases.

Regards,

Tony
