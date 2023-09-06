Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1AD27936A8
	for <lists+linux-omap@lfdr.de>; Wed,  6 Sep 2023 09:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbjIFH6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Sep 2023 03:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjIFH6s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Sep 2023 03:58:48 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 176F61AB;
        Wed,  6 Sep 2023 00:58:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 32ACC8050;
        Wed,  6 Sep 2023 07:58:43 +0000 (UTC)
Date:   Wed, 6 Sep 2023 10:58:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Subject: Re: AM3517 Timer busy regression on 6.1.y branch
Message-ID: <20230906075841.GB11676@atomide.com>
References: <CAHCN7xLQH8cksj8OxpvqAF_7uk_Gn-5+ROd7MfUo75EL580+iw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLQH8cksj8OxpvqAF_7uk_Gn-5+ROd7MfUo75EL580+iw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Adam Ford <aford173@gmail.com> [230905 15:02]:
> Tony et al
> ,
> I am trying to run the 6.1.y branch on an AM3517-EVM.
> 
> There are two GPT that throw an error:
> 
>  ti-sysc: probe of 48318000.target-module failed with error -16
>  ti-sysc: probe of 49032000.target-module failed with error -16

These two timers are in use as clocksource and clockevent reserved
by timer-ti-dm-systimer.

> I did some minor investigation and found sysc_check_active_timer() is
> returning the busy condition.
> 
> I tracked this back a bit further and found that if I revert commit
> a12315d6d270  ("bus: ti-sysc: Make omap3 gpt12 quirk handling SoC
> specific"), this error condition goes away.
> 
> It almost looks to me like sysc_check_active_timer is defaulting to
> -EBUSY when the SoC is not 3430, but the sysc_soc_match[] doesn't
> appear to match to AM3517.
> 
> I think the proper solution is to treat the AM35* as 3430.  Do you
> agree with that approach?
> 
> If so, I'll submit a patch with a fixes tag. I am also wondering how
> far back I should mark the fixes tag.

Yes am3517 is very similar to 3430. Sounds like the patch would
be needed also against the current kernels, right?

Regards,

Tony
