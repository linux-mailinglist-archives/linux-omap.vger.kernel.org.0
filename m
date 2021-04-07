Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F4B356D29
	for <lists+linux-omap@lfdr.de>; Wed,  7 Apr 2021 15:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbhDGNVi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Apr 2021 09:21:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:58292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232568AbhDGNVf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 7 Apr 2021 09:21:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B710D61394;
        Wed,  7 Apr 2021 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617801684;
        bh=XkjqB4k89kzH7Hz/pSTicftDKmq2vGrJuSRaabOHNLA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YIGYQrRhls1qWBhJpF2h801AJGrYJ9BzgoePqfEB17MimVZ+cGfm/rpA/wj7gj5aE
         DKdp36LhqKaixMTAIug0EbSLJYOyNb+yoEPLLxFe8LWrc/vsIApgl+tAwWVO9KijJf
         lQ7rMnRyvbFFtWje539jDvfKSZ+n2YuXORTnI2rfPmcfJFVK8KPMiWR0Geh222sN6b
         Z6k56d8/eCdAlRV3/p4T/CNQTegEb8worziH/rZ4iQiRcb/StBRjUfKd8bsn7mRKkH
         vhSbX3MeRSquVdrdKkPcOCSUM3n1arkrRcgLyOEbqcg2Ru9XT0khPuix5q6WjLzbu4
         sta+Imr3Klttw==
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
To:     Rob Herring <robh+dt@kernel.org>,
        Dario Binacchi <dariobin@libero.it>,
        Tony Lindgren <tony@atomide.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
References: <20210402192054.7934-1-dariobin@libero.it>
 <CAL_JsqKkpZw_BmcCXUzahF-FkQ=vb7mb_s95Lm2G7pWo0=dqNA@mail.gmail.com>
 <1727466283.11523.1617746554330@mail1.libero.it>
 <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
 <1044574275.383115.1617779265390@mail1.libero.it>
 <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <a197b5d8-621b-6655-e571-2877d007cd4c@kernel.org>
Date:   Wed, 7 Apr 2021 16:21:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/04/2021 15:52, Rob Herring wrote:
> On Wed, Apr 7, 2021 at 2:07 AM Dario Binacchi <dariobin@libero.it> wrote:
>>
>>
>>> Il 07/04/2021 03:16 Rob Herring <robh+dt@kernel.org> ha scritto:
>>>
>>>
>>> On Tue, Apr 6, 2021 at 5:02 PM Dario Binacchi <dariobin@libero.it> wrote:
>>>>
>>>>
>>>>> Il 06/04/2021 16:06 Rob Herring <robh+dt@kernel.org> ha scritto:
>>>>>
>>>>>
>>>>> On Fri, Apr 2, 2021 at 2:21 PM Dario Binacchi <dariobin@libero.it> wrote:
>>>>>>
>>>>>>
>>>>>> The series comes from my commit in U-boot
>>>>>> d64b9cdcd4 ("fdt: translate address if #size-cells = <0>")
>>>>>> and from the subsequent exchange of emails at the end of which I was
>>>>>> suggested to send the patch to the linux kernel
>>>>>> (https://patchwork.ozlabs.org/project/uboot/patch/1614324949-61314-1-git-send-email-bmeng.cn@gmail.com/).
>>>>>
>>>>> It's 'ranges' that determines translatable which is missing from the
>>>>> DT. This should have not had a 0 size either though maybe we could
>>>>> support that.
>>>>
>>>> I have replied to the email you sent to the u-boot mailing list
>>>>
>>>>>
>>>>> Does the DT have to be updated anyways for your spread spectrum support?
>>>>
>>>> The spread spectrum support patch does not need this patch to work. They belong
>>>> to two different series.
>>>
>>> That's not what I asked. Is the spread spectrum support forcing a DT
>>> update for users?
>>
>> Yes, the deltam and modfreq registers must be added to the DPLL clocks.
> 
> That's a shame given this dts has been mostly untouched since 2013.
> 

I think technically it would be possible to map these registers within 
the driver also, seeing there are like a handful of the DPLLs for both 
am3/am4 which are impacted. Just add a new compatible or something, or 
alternatively parse the register addresses and populate the 
deltam/modfreq registers based on that.

>>> If the DT has to be changed anyways (not really
>>> great policy), then you could fix this in the DT at the same time.
>>
>> I could put the fix to the device tree in that series, although I wouldn't
>> create a single patch to fix and add the SSC registers. First the size-cells = <0>
>> fix patch and then the SSC patch.
>> Do you agree?
> 
> By at the same time, I really just meant within 1 release.
> 
> But I'd like to hear TI maintainers' thoughts on this.

I did post a comment on patch #1 questioning the approach from TI clock 
driver perspective, imho I can't see why these two patches would be 
needed right now.

-Tero
