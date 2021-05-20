Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3566338B819
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 22:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbhETUIz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 May 2021 16:08:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34784 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235135AbhETUIz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 May 2021 16:08:55 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14KK7FpX007328;
        Thu, 20 May 2021 15:07:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621541235;
        bh=RRwIajzv4yAAlv/ckHxZj9FlPsxp9JZyOw/jy+O7cSM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=g1AX/QE+sqlaNZqgeB6XWGOQ8RMj2rnkzUZmUJTzwetb8+YDbkDcrC5gBG0+k4Cja
         42LX5TWCBZsbdqLs31B4hmXEgzm6vKEo2+y00hqt13B6KhdIh+VPIa+EmYzB15OHpd
         TSGlLev8zLwKszo/0vEw+nv/YxFnEvkFSK8e2PY4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14KK7FGq036806
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 May 2021 15:07:15 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 20
 May 2021 15:07:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 20 May 2021 15:07:15 -0500
Received: from [10.250.32.40] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14KK7FVo015605;
        Thu, 20 May 2021 15:07:15 -0500
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding to
 YAML
To:     Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210518172022.10562-1-s-anna@ti.com>
 <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
 <20210520000831.GA3927464@robh.at.kernel.org>
 <f60764c8-9100-0c8d-96d6-76689ed8acc6@ti.com>
 <CAL_JsqLxmGHK_AEdth3M7Uhw4+A+2wNTzw_j74tRLjfp6z+UXg@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <5b879123-4367-ef95-3239-4549fcc24501@ti.com>
Date:   Thu, 20 May 2021 15:07:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLxmGHK_AEdth3M7Uhw4+A+2wNTzw_j74tRLjfp6z+UXg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/20/21 2:21 PM, Rob Herring wrote:
> On Thu, May 20, 2021 at 11:45 AM Suman Anna <s-anna@ti.com> wrote:
>>
>> On 5/19/21 7:08 PM, Rob Herring wrote:
>>> On Wed, May 19, 2021 at 10:14:14AM -0500, Suman Anna wrote:
>>>> On 5/18/21 12:20 PM, Suman Anna wrote:
>>>>> Convert the current OMAP Mailbox binding from text format to YAML
>>>>> format/DT schema, and delete the legacy text binding file.
>>>>>
>>>>> The new YAML binding conversion is an updated version compared to
>>>>> the original. The descriptions for certain properties have been
>>>>> improved to provide more clarity. Constraints are added to the
>>>>> properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
>>>>> The 'ti,hwmods' is a legacy property and is retained only to reflect
>>>>> the existing usage on some older OMAP2 and OMAP3 platforms.
>>>>>
>>>>> All the existing examples have also been updated to reflect the
>>>>> latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
>>>>> and interrupts value updated for AM65x SoCs).
>>>>>
>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>> ---
>>>>> Hi,
>>>>>
>>>>> This patch does fix a number of dtbs_check warnings seen around OMAP Mailbox
>>>>> nodes with the latest kernel. There are few left-over warnings when just
>>>>> this patch is used on v5.13-rc1 or next-20210518. I have posted a separate
>>>>> fix for a warning on TI K3 SoCs [1], and will be posting a separate cleanup
>>>>> series for OMAP2+ SoCs. The dts patches can be picked up independently
>>>>> of this patch.
>>>>
>>>> FYI, All the dtbs_check warnings will be gone with [1] and the OMAP2+ cleanup
>>>> series [2].
>>>
>>> Nice, though it is a moving target. :) Is that still true with the
>>> undocumented compatible checks that's been added?
>>
>> [1] is acked, so will definitely get picked up for the next merge window. Should
>> hit next sometime in the next couple of days.
>>
>> I didn't exactly understand your second comment, but no new compatibles were
>> added. The existing nodes are already in compliance with the constraints I added
>> (so that's strictly binding enforcements). These constraints are almost all on
>> legacy SoCs, so these do not pose any issues.
> 
> When you say 'All the dtbs_check warnings', you mean *all* or just all
> the mailbox ones. I read as the former, but I guess from the prior
> paragraph and the links you are talking about, it's just mailbox
> warnings.

Yeah, sorry about the confusion. It is indeed just the mailbox ones, whatever is
showing up in the build log for this patch on the devicetree patchworks.

https://gitlab.com/robherring/linux-dt-review/-/jobs/1274246349/artifacts/file/build-dtbs-1480365.log

> 
> Overall, this is what TI 32-bit warnings look like:
> 
> Processing (am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motorola-cpcap|twl|da|dm):
> warnings: 60358
> undocumented compat: 3195

Yeah, we have many derivative boards on each of the SoC families.

> 
> This comes from my CI job[1]. The warnings aren't deduplicated, so 1
> SoC warning expands to N board warnings. Only 3879 unique warnings. :)
> 
> The top warnings are:
> 
> arch/arm/boot/dts/(am3|am4|am5|dra|keystone|omap|compulab|logicpd|elpida|motorola-cpcap|twl|da|dm):60358:3879:3195
>     253  segment@0: 'anyOf' conditional failed, one must be fixed:
>     253  segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
>     140  segment@200000: 'anyOf' conditional failed, one must be fixed:
>     140  segment@200000: $nodename:0: 'segment@200000' does not match
> '^bus(@[0-9a-f]+)?$'
>     128 0:0: /ocp/target-module@56000000: failed to match any schema
> with compatible: ['ti,sysc-omap4', 'ti,sysc']
>     128 0:0: /ocp/target-module@50000000: failed to match any schema
> with compatible: ['ti,sysc-omap2', 'ti,sysc']
>     128 0:0: /ocp/interconnect@48000000/segment@0/target-module@60000:
> failed to match any schema with compatible: ['ti,sysc-omap2',
> 'ti,sysc']
>     114 0:0: /ocp@68000000/target-module@49032000: failed to match any
> schema with compatible: ['ti,sysc-omap2-timer', 'ti,sysc']
>     114 0:0: /ocp@68000000/target-module@48320000: failed to match any
> schema with compatible: ['ti,sysc-omap2', 'ti,sysc']
>     114 0:0: /ocp@68000000/target-module@48318000: failed to match any
> schema with compatible: ['ti,sysc-omap2-timer', 'ti,sysc']
>     114 0:0: /ocp@68000000/target-module@48304000: failed to match any
> schema with compatible: ['ti,sysc-omap2-timer', 'ti,sysc']
>     114 0:0: /ocp@68000000/target-module@480a0000: failed to match any
> schema with compatible: ['ti,sysc-omap2', 'ti,sysc']
>     114 0:0: /ocp@68000000/target-module@48056000: failed to match any
> schema with compatible: ['ti,sysc-omap2', 'ti,sysc']
>     114 0:0: /ocp@68000000/l4@48000000/scm@2000/scm_conf@270/pbias_regulator@2b0:
> failed to match any schema with compatible: ['ti,pbias-omap3',
> 'ti,pbias-omap']
>     114 0:0: /ocp@68000000/l4@48000000/scm@2000/pinmux@a00: failed to
> match any schema with compatible: ['ti,omap3-padconf',
> 'pinctrl-single']
>     114 0:0: /ocp@68000000/l4@48000000/scm@2000/pinmux@30: failed to
> match any schema with compatible: ['ti,omap3-padconf',
> 'pinctrl-single']
>     112 0:0: /opp-table: failed to match any schema with compatible:
> ['operating-points-v2-ti-cpu']
>     111  segment@100000: 'anyOf' conditional failed, one must be fixed:
>     111  segment@100000: $nodename:0: 'segment@100000' does not match
> '^bus(@[0-9a-f]+)?$'
>     108 0:0: /soc: failed to match any schema with compatible: ['ti,omap-infra']

Tony,

Any chance you can add a 'ti-sysc' binding and address the 'segment' warnings
for 5.14? Those alone should bring the warning numbers down drastically.

regards
Suman

> 
> Rob
> 
> [1] https://gitlab.com/robherring/linux-dt/-/jobs/1261951514
> 

