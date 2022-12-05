Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E953264285F
	for <lists+linux-omap@lfdr.de>; Mon,  5 Dec 2022 13:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiLEMZ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Dec 2022 07:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbiLEMZ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Dec 2022 07:25:57 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5297363AB
        for <linux-omap@vger.kernel.org>; Mon,  5 Dec 2022 04:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1670243155; x=1701779155;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=neMU4Ok0awO5Rq5skIsVHn5TxIHDupVu3e9O7MCpojQ=;
  b=XoZt7TS+c3+PcbLmgBNGyT17QeoHX83Et8fdOHWy5m3+HD0MZ7ylL4nq
   ob6uykKbKrJXJP1KWSzdAMKy8ySg5mwqfwt5/B0+wKr0KkyVIgtY3FqxI
   ECBVY0qGsCoY1F0939IiLMHofHqHfrMkn9ZbFDdejZavLROqt6gUuv4Wi
   5sXM8G2tg14dgfJqzXUiMFvV9qaD692Dg1pZQhiD4lqz0jb3UVJ/X6XGl
   z3wtmHFCxJF9rY2b/SkbxLY+aYzwUKk2OTfRUGsQnFm0rmCQ5KR+QZbNW
   Dxh9Blqmhfvv/dpXXretgkMD3mpPZzMNCsYo4/s8fUaT+ePOS6Y4gIiW8
   A==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665417600"; 
   d="scan'208";a="330010008"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 05 Dec 2022 20:25:55 +0800
IronPort-SDR: /CpwERxQrjgGo8M9GCcVkXDIyIeioazGZkvG+8vAf6pvtwOtcOR1rlV9tVIFL1LpbH3YQY79nC
 ev5KSs6lv9Y+WjlMF2jniPhCi1kHOenXlC6sNUY6bBtMiIoRhvZxf/1KonmJJIgrP0N0QWNO6/
 1v7LFNx3ou/kIR/ph+eb9iVKKXJMRZo9EhwdAVbpqVanFnvGpnL4HUiTklY/aXY6oA4ABAJJyy
 4EAx7zYXYml/6ssZ0xaQ34AT6zGRS7QuSx5U/JmdMZw6jl0eENY25GOIfwUny0Dq/eylSaxq5E
 vgU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 03:38:44 -0800
IronPort-SDR: QKipDJ8/6aANyAwK/ZeM0u2LIpOI0Fq26sHHVXY0eU7t5oKbbK7e0MgNpBszT+pHLpxdchGgh7
 ocIEMuYqVg2fkuW0y+G8I01eMwodPxtqM+C7rNgr53vD7ZYcRvc02pKUMknyKrgwm0pVR8q9AB
 7RoAPUZCuM3NvfRBpzq2rJ+EGpDRkZqyCa08vUlvDUJLenll2uVUIBhWJMjzeHGgXLuxvGMF5d
 NzlYGrgkxt0joMNCX0K6Fu71E6K+Mettjy5FEphj8QAJjmqpnw87xzJfjVKlaXCmVAFvi9K+9T
 nYE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2022 04:25:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NQjSf6s4zz1RWxq
        for <linux-omap@vger.kernel.org>; Mon,  5 Dec 2022 04:25:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:content-language:references:to
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1670243154; x=1672835155; bh=neMU4Ok0awO5Rq5skIsVHn5TxIHDupVu3e9
        O7MCpojQ=; b=gTyQiIEtSVqvwVxAB8CGYS4bn2kbh+onxccWNV2pvnEJ+s1MACa
        HasKpuudsHW2I0jpWQdI60uCpE7syCOp5DmV8WeF6T6GDyzSPOBIxbLb7JDtpHL5
        z5WMuG/3pXadnoyPHiZTHDyRqi/tbpww8Sg/bIzhlqIcBH2f6rEuO69h9qEgK0Il
        YwwhRbfChGSHLra69SncbFAS7Oz90ikKUlvaT+EUgBl6anL+lhhs3zTcrxrzs8j8
        bdXdPtuE1b0NNsUMqYgYuSIBtAeQCvvpiy0EXzJwyjPKIe9SCPH9nwmayNXQzf2K
        BYgRH3gvTis3DJ01W8qmCcKom9ZOBBUx1mw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id iX2kpa9VNQYI for <linux-omap@vger.kernel.org>;
        Mon,  5 Dec 2022 04:25:54 -0800 (PST)
Received: from [10.225.163.74] (unknown [10.225.163.74])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NQjSW6BW3z1RvLy;
        Mon,  5 Dec 2022 04:25:47 -0800 (PST)
Message-ID: <e62bc865-3b6f-2790-3dbf-6485cb233c4e@opensource.wdc.com>
Date:   Mon, 5 Dec 2022 21:25:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 12/12] mm, slob: rename CONFIG_SLOB to
 CONFIG_SLOB_DEPRECATED
To:     Palmer Dabbelt <palmer@dabbelt.com>, vbabka@suse.cz
Cc:     cl@linux.com, rientjes@google.com, iamjoonsoo.kim@lge.com,
        penberg@kernel.org, 42.hyeyoo@gmail.com, roman.gushchin@linux.dev,
        akpm@linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        willy@infradead.org, patches@lists.linux.dev, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
        aaro.koskinen@iki.fi, jmkrzyszt@gmail.com, tony@atomide.com,
        jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
        shorne@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org,
        Arnd Bergmann <arnd@arndb.de>, josh@joshtriplett.org,
        Conor Dooley <conor@kernel.org>, christophe.leroy@csgroup.eu,
        geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, openrisc@lists.librecores.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org
References: <mhng-b0214281-7ee5-4698-a158-980427a97472@palmer-ri-x1c9a>
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <mhng-b0214281-7ee5-4698-a158-980427a97472@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/3/22 02:59, Palmer Dabbelt wrote:
[...]
>> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
>> index 1a56eda5ce46..4cf0f297091e 100644
>> --- a/arch/riscv/configs/nommu_virt_defconfig
>> +++ b/arch/riscv/configs/nommu_virt_defconfig
>> @@ -22,7 +22,8 @@ CONFIG_EXPERT=y
>>  # CONFIG_KALLSYMS is not set
>>  # CONFIG_VM_EVENT_COUNTERS is not set
>>  # CONFIG_COMPAT_BRK is not set
>> -CONFIG_SLOB=y
>> +CONFIG_SLUB=y
>> +CONFIG_SLUB_TINY=y
>>  # CONFIG_MMU is not set
>>  CONFIG_SOC_VIRT=y
>>  CONFIG_NONPORTABLE=y
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Though I don't have a K210 to test against, maybe Damien still does?

I did test and it is OK.

-- 
Damien Le Moal
Western Digital Research

