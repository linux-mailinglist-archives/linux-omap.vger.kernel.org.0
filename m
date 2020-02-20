Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1713B16624F
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 17:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbgBTQXZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 11:23:25 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60872 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgBTQXY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 11:23:24 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KGNG9I086746;
        Thu, 20 Feb 2020 10:23:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582215796;
        bh=5k4n8OW5FfzWwH0LvpBRJ6sAEgOZzL5nL58JyY0CWoA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Bl2pUaijnjIGKdf0dstj1cYaG51cqVF0s/s4M52HaZeyPfxqmFVg1YI2keb/gU8kS
         sv8WJzEw8aDsH1qqksBcbNs2dnlRQ/ARKbIJo8GXGWNKnHp9HAvpD5OIYV0I1xlP+F
         f0GVw6nLN+PY9T1zlJ3zf/udhE/1OVSnYspayIiE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KGNGOG102855
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Feb 2020 10:23:16 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 10:23:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 10:23:15 -0600
Received: from [10.250.77.18] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KGNFv8017772;
        Thu, 20 Feb 2020 10:23:15 -0600
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
To:     Tony Lindgren <tony@atomide.com>
CC:     <kbuild-all@lists.01.org>, <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>,
        <linux-omap@vger.kernel.org>
References: <202002131856.VeW4PhBJ%lkp@intel.com>
 <20200220155429.GH37466@atomide.com>
 <55ddcd29-ed8b-529e-dd54-cbac5cf74e42@ti.com>
 <20200220162012.GI37466@atomide.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <d7b685b6-16a2-3743-1786-a5240726ed9c@ti.com>
Date:   Thu, 20 Feb 2020 11:23:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220162012.GI37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/20/20 11:20 AM, Tony Lindgren wrote:
> * Andrew F. Davis <afd@ti.com> [200220 16:04]:
>> On 2/20/20 10:54 AM, Tony Lindgren wrote:
>>> Andrew,
>>>
>>> * kbuild test robot <lkp@intel.com> [200213 10:27]:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>>> head:   0bf999f9c5e74c7ecf9dafb527146601e5c848b9
>>>> commit: c37baa06f8a970e4a533d41f7d33e5e57de5ad25 ARM: OMAP2+: Fix undefined reference to omap_secure_init
>>>> date:   3 weeks ago
>>>> config: arm-randconfig-a001-20200213 (attached as .config)
>>>> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
>>>> reproduce:
>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>         chmod +x ~/bin/make.cross
>>>>         git checkout c37baa06f8a970e4a533d41f7d33e5e57de5ad25
>>>>         # save the attached .config to linux build tree
>>>>         GCC_VERSION=7.5.0 make.cross ARCH=arm 
>>>>
>>>> If you fix the issue, kindly add following tag
>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>    arch/arm/mach-omap2/omap-secure.o: In function `omap_smccc_smc':
>>>>>> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'
>>>
>>> Have you looked at this one? Looks like there's still an unhandled
>>> randconfig build case.
>>>
>>
>>
>> I've had a quick look, all the ARM config does:
>>
>> select HAVE_ARM_SMCCC if CPU_V7
>>
>> so I don't think this will happen in any real config, but if we want to
>> prevent randconfig issue this we could force ARCH_OMAP2PLUS to "depend"
>> on it.
> 
> Seems to happen at least with omap2 only config where we don't have
> CPU_V7. Something like below seems to fix it.
> 
> If that looks OK to you, I'll send out a proper fix.
> 


This looks fine to me.

A better later fix might be to later stub out the actual __arm_smccc_smc
in common code if CONFIG_HAVE_ARM_SMCCC is not set, so any platform will
get the fix.

Andrew


> Regards,
> 
> Tony
> 
> 8< -----------------------
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
> @@ -85,6 +86,11 @@ void omap_smccc_smc(u32 fn, u32 arg)
>  		      0, 0, 0, 0, 0, 0, &res);
>  	WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
>  }
> +#else
> +void omap_smccc_smc(u32 fn, u32 arg)
> +{
> +}
> +#endif
>  
>  void omap_smc1(u32 fn, u32 arg)
>  {
> 
