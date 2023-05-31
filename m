Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF0F7172E4
	for <lists+linux-omap@lfdr.de>; Wed, 31 May 2023 03:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbjEaBMk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 May 2023 21:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjEaBMk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 May 2023 21:12:40 -0400
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3041A102;
        Tue, 30 May 2023 18:12:27 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VjvFrGD_1685495542;
Received: from 30.97.48.48(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VjvFrGD_1685495542)
          by smtp.aliyun-inc.com;
          Wed, 31 May 2023 09:12:23 +0800
Message-ID: <970927f9-f3b8-3c92-e581-a28e3522196c@linux.alibaba.com>
Date:   Wed, 31 May 2023 09:12:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/3] hwspinlock: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
 <20230412171610.ji5czj5c77banf6d@pengutronix.de>
 <20230530135621.34psftds7ymrdvmt@pengutronix.de>
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20230530135621.34psftds7ymrdvmt@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-10.0 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 5/30/2023 9:56 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Apr 12, 2023 at 07:16:10PM +0200, Uwe Kleine-König wrote:
>> On Tue, Mar 14, 2023 at 07:00:20PM +0100, Uwe Kleine-König wrote:
>>> Hello,
>>>
>>> this patch series adapts the platform drivers below drivers/hwspinlock to use
>>> the .remove_new() callback. Compared to the traditional .remove() callback
>>> .remove_new() returns no value. This is a good thing because the driver core
>>> doesn't (and cannot) cope for errors during remove. The only effect of a
>>> non-zero return value in .remove() is that the driver core emits a warning. The
>>> device is removed anyhow and an early return from .remove() usually yields a
>>> resource leak.
>>>
>>> By changing the remove callback to return void driver authors cannot reasonably
>>> assume any more that there is some kind of cleanup later.
>>>
>>> The omap driver could return -EBUSY. This is first changed to return
>>> zero to drop the duplicated error message. I assume this error path is
>>> dangerous. For sure the platform device binding goes away and so
>>> devm_platform_ioremap_resource is undone. So probably the user of the
>>> hwspinlock that prevented its removal will soon access an unmapped
>>> virtual address resulting in an oops. This is true with and without my
>>> patch. IMHO hwspin_lock_unregister() shouldn't return an error code but
>>> care that all users go away and then return void.
>>>
>>> After this change the two platform_drivers can be trivially converted to
>>> .remove_new().
>>
>> Gentle ping!
>>
>> Who is supposed to apply this series (or point out a good reason to not
>> do that)?
> 
> Still no maintainer feedback on my series :-\ Would a resend help?

For the whole patchset,
Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>

I think Bjorn can help to apply this patchset, Bjorn?
