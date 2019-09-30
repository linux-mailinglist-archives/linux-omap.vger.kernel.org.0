Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196B8C2AA1
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 01:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732438AbfI3XLI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 19:11:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59566 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730433AbfI3XLH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 19:11:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UNAnGS039746;
        Mon, 30 Sep 2019 18:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569885049;
        bh=OUHywMUtej7GlrP6k5IHpcQZlK4jvSX03Oy+36G5YdY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HCBY20MxGKQCMraorRHsqfQFekbPqI8q5nNNbRNw/hjMBrGrYpW8z2HmpPf9J45S9
         VkpG2EoEL+a/zFdOWbTfybj7JMVz3KRpccnUO5eoUBZbiItl1YbVt21xB9shEmROiO
         f8GoKfvVKOGm5dErjP11p5aCFYzmAtYSkH4CiY0s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UNAnBT005434
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 18:10:49 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 18:10:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 18:10:39 -0500
Received: from [10.250.197.80] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UNAkNV118782;
        Mon, 30 Sep 2019 18:10:47 -0500
Subject: Re: [PATCH v2 linux-next 4/4] arm64: configs: defconfig: Change
 CONFIG_REMOTEPROC from m to y
To:     Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>
CC:     Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        <hch@lst.de>, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190920075946.13282-1-j-keerthy@ti.com>
 <20190920075946.13282-5-j-keerthy@ti.com>
 <20190930134856.umdoeq7k6ukmajij@willie-the-truck>
 <CAOesGMgs7rKOVnimDwSpeGTAf93Er+Ymzy9-R-mKkQK6MQcF3Q@mail.gmail.com>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <0c8dcf78-6f9e-f47f-1175-90b716cdad84@ti.com>
Date:   Tue, 1 Oct 2019 04:40:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOesGMgs7rKOVnimDwSpeGTAf93Er+Ymzy9-R-mKkQK6MQcF3Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/1/2019 12:16 AM, Olof Johansson wrote:
> On Mon, Sep 30, 2019 at 6:49 AM Will Deacon <will@kernel.org> wrote:
>>
>> On Fri, Sep 20, 2019 at 01:29:46PM +0530, Keerthy wrote:
>>> Commit 6334150e9a36 ("remoteproc: don't allow modular build")
>>> changes CONFIG_REMOTEPROC to a boolean from a tristate config
>>> option which inhibits all defconfigs marking CONFIG_REMOTEPROC as
>>> a module in compiling the remoteproc and dependent config options.
>>>
>>> So fix the defconfig to have CONFIG_REMOTEPROC built in.
>>>
>>> Fixes: 6334150e9a36 ("remoteproc: don't allow modular build")
>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 8e05c39eab08..c9a867ac32d4 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -723,7 +723,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>>>   CONFIG_ARM_SMMU=y
>>>   CONFIG_ARM_SMMU_V3=y
>>>   CONFIG_QCOM_IOMMU=y
>>> -CONFIG_REMOTEPROC=m
>>> +CONFIG_REMOTEPROC=y
>>>   CONFIG_QCOM_Q6V5_MSS=m
>>>   CONFIG_QCOM_Q6V5_PAS=m
>>>   CONFIG_QCOM_SYSMON=m
>>
>> Acked-by: Will Deacon <will@kernel.org>
>>
>> This fixes the following annoying warning from "make defconfig" on arm64:
>>
>>    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for REMOTEPROC
>>
>> I'm assuming the fix will go via arm-soc, but I can take it otherwise
>> (please just let me know).
> 
> Thanks, I'll pick this up, but I'll squash the 4 one-line changes into
> one commit instead of separate patches.

Thanks Olof.

> 
> 
> -Olof
> 
