Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFA1121B70
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 22:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfLPVEL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 16:04:11 -0500
Received: from muru.com ([72.249.23.125]:48520 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfLPVEK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 16:04:10 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 84397810D;
        Mon, 16 Dec 2019 21:04:49 +0000 (UTC)
Date:   Mon, 16 Dec 2019 13:04:07 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
Message-ID: <20191216210407.GR35479@atomide.com>
References: <9e15c170-c9fa-778c-d998-bd1111a6390d@ti.com>
 <20191119183247.GN35479@atomide.com>
 <a351461a-f6a1-334b-6bdd-a56626914fb3@ti.com>
 <20191119190721.GO35479@atomide.com>
 <7fa11037-8d33-2274-c8cc-80e9630b38b0@ti.com>
 <20191119192029.GP35479@atomide.com>
 <0ad31b32-712e-5bef-5645-0336dfec99cc@ti.com>
 <20191119194425.GQ35479@atomide.com>
 <f2f53e5e-6c95-e32f-d67a-284bb88e73e0@ti.com>
 <1ff8ae4b-5de3-4fdf-7318-d33398dc7fc8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ff8ae4b-5de3-4fdf-7318-d33398dc7fc8@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [191216 20:57]:
> Looks like the TI quirk idea is not moving forward, even the QCOM quirk
> looks like it may get kicked out. arm_smccc_smc() will remain only for
> SMCCC compliant calls, but it looks like a generic arm_smc() wouldn't be
> too opposed upstream.

Yes so it seems.

> Either way this patch would still be valid as when OP-TEE is present
> then arm_smccc_smc() will be the right call to make, how we handle the
> legacy calls can be sorted out later if a generic SMC call is implemented.

Please see my comment regarding this patch earlier in this thread
pasted below for convenience:

* Tony Lindgren <tony@atomide.com> [191119 16:22]:
> In any case, you should do the necessary checks for HAVE_ARM_SMCCC
> only once during init. I'm not sure how much checking for
> "/firmware/optee" helps here, sounds like we have a broken system
> if the firmware is not there while the arm_smccc_smc() should
> still work just fine :)

So only check once during init. And during init, you should probably
also check that arm_smccc_smc() actually infd optee if
"/firmware/optee" is set, and only then set set the right function
pointer or some flag.

Regards,

Tony
