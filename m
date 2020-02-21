Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0DC168668
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 19:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgBUSYC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 13:24:02 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55774 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbgBUSYB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Feb 2020 13:24:01 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LINRiC077066;
        Fri, 21 Feb 2020 12:23:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582309407;
        bh=lchlnnPAjiiKU0zsPssvMafzXIOdA8V9mB6SQZdccDY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TcfMptJAW10/RSN9gYSAENew7FvPV1wKijAcbae0IROyrUGNJEapJoak9NxhKEX6N
         Qmov/8AsKwv1hwWMzbiQJMhUf6m1QJZtlwYszadlI0M0sS+FngBKPls6kvesiLkw6T
         PH+16H596W45mZv2RGQqhUdPKLPFdSzDy8ZZWtqw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LINR1u042631
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Feb 2020 12:23:27 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 12:23:27 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 12:23:27 -0600
Received: from [10.250.77.18] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LINQtH088349;
        Fri, 21 Feb 2020 12:23:26 -0600
Subject: Re: [PATCH] ARM: OMAP2+: Fix compile if CONFIG_HAVE_ARM_SMCCC is not
 set
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        kbuild test robot <lkp@intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Steven Price <steven.price@arm.com>,
        Will Deacon <will@kernel.org>
References: <20200221180901.15812-1-tony@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <a811c0d7-5458-ea2e-cb39-4d6aafa3df87@ti.com>
Date:   Fri, 21 Feb 2020 13:23:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221180901.15812-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/21/20 1:09 PM, Tony Lindgren wrote:
> Recent omap changes added runtime checks to use omap_smccc_smc()
> when optee is configured in dts. As the omap-secure code can be
> built for ARMv6 only without ARMv7 and use custom smc calls, we
> now get a build error:
> 
> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'
> 
> Let's just ifdef out omap_smccc_smc() unless the CPU has selected
> CONFIG_HAVE_ARM_SMCCC. The other option discussed was to add an
> inline function to arm-smccc.h, but we'd still also have to add
> ifdef around omap_smccc_smc() to avoid a warning for uninitialized
> value for struct arm_smccc_res in omap_smccc_smc(). And we probably
> should not start initializing values in arm-smccc.h if disabled.
> 
> Let's also warn on trying to use omap_smccc_smc() if disabled as
> suggested by Andrew F. Davis <afd@ti.com>.
> 
> Fixes: 48840e16c299 ("ARM: OMAP2+: Use ARM SMC Calling Convention when OP-TEE is available")
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---


Looks good to me,

Acked-by: Andrew F. Davis <afd@ti.com>


>  arch/arm/mach-omap2/omap-secure.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2/omap-secure.c
> --- a/arch/arm/mach-omap2/omap-secure.c
> +++ b/arch/arm/mach-omap2/omap-secure.c
> @@ -77,6 +77,7 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 nargs, u32 arg1, u32 arg2,
>  	return ret;
>  }
>  
> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  void omap_smccc_smc(u32 fn, u32 arg)
>  {
>  	struct arm_smccc_res res;
> @@ -85,6 +86,12 @@ void omap_smccc_smc(u32 fn, u32 arg)
>  		      0, 0, 0, 0, 0, 0, &res);
>  	WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
>  }
> +#else
> +void omap_smccc_smc(u32 fn, u32 arg)
> +{
> +	WARN_ONCE(1, "smccc is disabled\n");
> +}
> +#endif
>  
>  void omap_smc1(u32 fn, u32 arg)
>  {
> 
