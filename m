Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C6C73CB81
	for <lists+linux-omap@lfdr.de>; Sat, 24 Jun 2023 17:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbjFXPCJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sat, 24 Jun 2023 11:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjFXPCJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 24 Jun 2023 11:02:09 -0400
Received: from unicorn.mansr.com (unicorn.mansr.com [IPv6:2001:8b0:ca0d:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF7E10DB;
        Sat, 24 Jun 2023 08:02:08 -0700 (PDT)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
        by unicorn.mansr.com (Postfix) with ESMTPS id 1FD1D15360;
        Sat, 24 Jun 2023 16:02:07 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
        id 1230F219FD1; Sat, 24 Jun 2023 16:02:07 +0100 (BST)
From:   =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Jeroen Hofstee <jhofstee@victronenergy.com>,
        Tony Lindgren <tony@atomide.com>, netdev@vger.kernel.org,
        Mugunthan V N <mugunthanvnm@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] net: cpsw: fix obtaining mac address for am3517
References: <1477668756-2651-1-git-send-email-jhofstee@victronenergy.com>
        <20161028155213.2t3nwwe3lqaynaer@atomide.com>
        <d8ad5cab-5183-cddf-fa9a-4e7b9b8c9377@victronenergy.com>
        <20161028181914.mskebckucukzhxhz@atomide.com>
        <yw1x7cru445g.fsf@mansr.com> <ZJX9FBBvOTv10IO4@corigine.com>
        <de546232-0638-318a-535f-169184933a20@victronenergy.com>
        <675a346b-faed-4e86-87e7-b332da540055@lunn.ch>
        <ZJcD4sqqzZCq7Fww@corigine.com>
Date:   Sat, 24 Jun 2023 16:02:07 +0100
In-Reply-To: <ZJcD4sqqzZCq7Fww@corigine.com> (Simon Horman's message of "Sat,
        24 Jun 2023 16:55:30 +0200")
Message-ID: <yw1xttuw3nv4.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simon Horman <simon.horman@corigine.com> writes:

> On Fri, Jun 23, 2023 at 11:41:10PM +0200, Andrew Lunn wrote:
>> > > I feel like I am missing something here.
>> > 
>> > That is a weird response, you feel like something is missing
>> 
>> There is. The patch.
>> 
>> Maintainers have a slightly better memory than a goldfish, but given
>> the high volume of patches, we don't remember threads from 2016. Also,
>> all our infrastructure has limited memory, this patch is not in lore,
>> and it is not in patchworks. So in terms of getting merged, it does
>> not exist.
>> 
>> We do however recommend that if a patch has not been merged within 2
>> weeks, it is rebased, any Acked-by: etc tags are added and the patch
>> reposted.
>
> Thanks Andrew, that is also my position.
>
> A ping for a multi-year old patch is unusual (for me).
> I was wondering if there was a back story. I guess not.

The only story here is that I was reviewing the set of patches we apply
to our kernels, and I noticed that this one, judging by the discussion,
should have been applied to some tree or other ages ago.

Now if it takes 6 years to get a one-line patch (a fix for a regression,
no less) accepted, I have better things to spend my time on.

-- 
M�ns Rullg�rd
