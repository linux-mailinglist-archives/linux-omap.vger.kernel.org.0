Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561CC310EFA
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 18:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbhBEQBH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 11:01:07 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44634 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233423AbhBEP7C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Feb 2021 10:59:02 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115EPLm6123576;
        Fri, 5 Feb 2021 08:25:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1612535121;
        bh=5FM3Yf4UT46TMm+k4JbZC5P2k1tGAqKHE0JXglNP/Qg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=A0tceVBU6YyU5Twd5rY4uYL5Qq3DtTjidTVpjUE8XKA0DSdkpEjYpFb3SQGOK1wlx
         Q7pAbwFlzQLKr+yhzPvxGuYZPKta2+RQQeYTMTV0my+kfw6gyEahvC2aqcuAAB5enk
         +8GHLof1ZTFhd+tbsNMobcUYOR5EuHCIJFgMcvbY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115EPLFN083919
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Feb 2021 08:25:21 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 08:25:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 08:25:21 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115EPJ23002894;
        Fri, 5 Feb 2021 08:25:20 -0600
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
To:     Tony Lindgren <tony@atomide.com>, "Ivan J." <parazyd@dyne.org>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org> <YBuankYwwMsG4MN9@atomide.com>
 <4b32f566-92ad-3c49-0453-b44df23f1384@ti.com>
 <20210205131736.3jivrc5lln4t2onr@fq> <YB1Ib41trny2JFDv@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <8ab86ccf-7568-c173-75f6-0d572fd43fec@ti.com>
Date:   Fri, 5 Feb 2021 16:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YB1Ib41trny2JFDv@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 05/02/2021 15:30, Tony Lindgren wrote:
> * Ivan J. <parazyd@dyne.org> [210205 13:18]:
>> On Fri, Feb 05, 2021 at 03:15:00PM +0200, Grygorii Strashko wrote:
>>>
>>>
>>> On 04/02/2021 08:56, Tony Lindgren wrote:
>>>> * Ivan Jelincic <parazyd@dyne.org> [210203 13:35]:
>>>>> Update omap2plus_defconfig for options that have been dropped:
>>>>>
>>>>> - SIMPLE_PM_BUS no longer selected.
>>>>
>>>> Oh right, we now need to always select it. Will queue this for
>>>> fixes after the merge window. The other one I'll be queueing
>>>> for v5.13 as the merge window is about to open and I'll only
>>>> queue fixes for the next few weeks :)
>>>
>>> "- MICREL_PHY no longer selected."
>>>
>>> I do not agree with above as MICREL_PHY is selected by KS8851, but on many boards there is no
>>> explicit dependency from KS8851, but MICREL PHYs are in use.
>>> So, I'd prefer to have it enabled explicitly in omap2plus_defconfig.
>>>
>>> And not sure what exactly "no longer selected" means.
>>
>> "no longer selected" means it went away after `make savedefconfig`.
> 
> Grgorii, maybe send a patch selecting MICREL_PHY in the Kconfig
> for the other cases that do not use KS8851?

The KS8851 config was added like 10years ago and is used on some omap4 platforms,
it does select MICREL_PHY.

 From other side, *some* am57x, am437 platforms uses MICREL PHYs with no dependency from KS8851.

The omap2plus_defconfig is also used as base for custom configs and first thing people are doing -
remove not needed options. As result, removal of KS8851 plus this patch will immediately
cause MICREL_PHY=n and so breakage on existing and custom platforms.

I do not see how it can be resolved by using Kconfig changes within much-omap2.

So, sry, but NACK for this patch as it is.

if some Kconfig dependencies need to be sorted out - probably the best way might be
to get rid of select MICREL_PHY in KS8851/KS8851_MLL.

-- 
Best regards,
grygorii
