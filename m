Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D82750402
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jul 2023 12:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjGLKAv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jul 2023 06:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbjGLKAc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jul 2023 06:00:32 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676961711
        for <linux-omap@vger.kernel.org>; Wed, 12 Jul 2023 03:00:31 -0700 (PDT)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1Cs55wrwzrRhY;
        Wed, 12 Jul 2023 17:59:53 +0800 (CST)
Received: from [10.174.178.156] (10.174.178.156) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 18:00:28 +0800
Message-ID: <7b9d0af0-6990-9696-0dc2-acef2543b2a8@huawei.com>
Date:   Wed, 12 Jul 2023 18:00:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
To:     Tony Lindgren <tony@atomide.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <haojian.zhuang@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
References: <20230703081716.15810-1-guomengqi3@huawei.com>
 <CACRpkdaW5j0mRbwv7rvAKiwBBe_bArqCKRv+UPCPxwX8GJ3Qkg@mail.gmail.com>
 <9a490082-bc30-8a7e-2d19-fcd212771a4b@huawei.com>
 <20230706040755.GB5089@atomide.com>
From:   "guomengqi (A)" <guomengqi3@huawei.com>
In-Reply-To: <20230706040755.GB5089@atomide.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.156]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


在 2023/7/6 12:07, Tony Lindgren 写道:
> Hi,
>
> * guomengqi (A) <guomengqi3@huawei.com> [230706 03:21]:
>> 在 2023/7/4 17:18, Linus Walleij 写道:
>>> On Mon, Jul 3, 2023 at 10:24 AM Guo Mengqi <guomengqi3@huawei.com> wrote:
>>>
>>>> In a reliability test which repeatedly load and remove a module,
>>>> I found some kmalloc-256 memory leaks in pinctrl-single.
>>>>
>>>> pcs_dt_node_to_map() will recognize a dt_node and
>>>> make a mapping for it. Along the way some pinctrl functions and groups
>>>> are registered in pinctrl-single controller. These functions/groups are
>>>> registered once and not removed during the system lifetime.
>>>>
>>>> When the client module loads again, pcs_dt_node_to_map() fail to consider
>>>> this situation, create the same set of resources, and does not release or
>>>> use them.
>>>>
>>>> To fix this, add a check at the start of pcs_parse_one_pinctrl_entry/
>>>> pcs_parse_bits_in_pinctrl_entry. If the target is found,
>>>> then all the resource allocation and parsing work can be skipped,
>>>> just set the mapping with existing function/group information.
>>>>
>>>> Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree
>>>> based pinctrl driver")
>>>>
>>>> Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>
>>> Good catch!
>>>
>>> I expect Tony to review the patch in-depth.
>> Thank you :)
> Thanks for looking into it. I wonder if we can rely on naming for
> pinmux_func_name_to_selector() though. Can things change in a way where
> we need to release everything and reparse? Mostly wondering what happens
> with DT overlays?

Hi

Let me confirm, you mean when the pin controller dtsi changed at 
runtime, some functions and groups can change silently while the dt-node 
name remains same, so the old data needs to be released and reparsed, right?

I don't know much about DT overlays. I can look deeper into revelant 
codes, maybe do some experiments too.

My guess now is DT overlay will first remove the old parsed nodes, then 
create new ones. If so, the modification to pcs_dt_node_to_map() in this 
patch is not affected.


Regards,

Mengqi

>>>> -static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
>>>> +int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
>>>>                                           const char *function)
>>>>    {
>>>>           const struct pinmux_ops *ops = pctldev->desc->pmxops;
>>> It appears you need to add EXPORT_SYMBOL_GPL() for this function
>>> so the module can build. (This is why the build robot complains.)
>> Yes, it happens when config=M. I will send a v2 patch later to fix this.
> That change might be worth doing in any case if there is need for it.
>
> Regards,
>
> Tony
>
> .
