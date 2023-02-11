Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3061769337F
	for <lists+linux-omap@lfdr.de>; Sat, 11 Feb 2023 21:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjBKUHH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Feb 2023 15:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjBKUHG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Feb 2023 15:07:06 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9491D16AD6
        for <linux-omap@vger.kernel.org>; Sat, 11 Feb 2023 12:06:59 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 9601E5C00BC;
        Sat, 11 Feb 2023 15:06:58 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 11 Feb 2023 15:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676146018; x=1676232418; bh=QJ2XgrjJ7u
        Y7PrviCnmokBtymQuwJLxfLTRGPwp/54E=; b=TsqwjTc3YQloW/Dg+HK16RCJR7
        33k8XsLI8k2dVCnHhMkRfhA/M8tsh8pVK0OSHgkbHiZQDz2P3XXfbE9zB0A4PbTq
        Wln9T/n5jz+dE3/FBcKIfZnzd+uvO4bxwLxYxoM3T4XKCyL5dJzqH7l+tyJRlTkL
        mUpRTNrQcTGXDJqbrAUvidIO0hieTCAsMMFXjScBmBpmYsCHIO7GqQB4od963az9
        GbBNh2bB4KDXeNO43tc7vpKZ8DGmbhG6+ajVYJetaFsJXEFvctvE+9svJiriMf4g
        ctSIPRIvH5rKLzzr2TDPuy2+pT4Dhrnd1cTo39GjbgzfVLkpOXZq18jPiktg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676146018; x=1676232418; bh=QJ2XgrjJ7uY7PrviCnmokBtymQuw
        JLxfLTRGPwp/54E=; b=WL6F6+Goe2P0vTKiJyUGErqa4J7aL77Yh3lu4X1TPeuh
        GpsnCzZaDXaE3saoiHHa2ZLaOarXOe38X2CaMy+piYwpgvHbiK8yHXLQLahX8dli
        Vujond2/OPS8ub2I8smHv81F2FVvxVydGpugQWxejjifsySL4O3UInTrt2aAD04S
        +aim2uI541TGJrvL8UQ3902sx/1wnlf5hgGqcpUPws/424z/7PAdkRkPHtuDWBNy
        V5vbsOCWQvcjcY8DvZdBmxj08O2OK3FSIjlHKGz3t6aAOjXygLvdN3vXKAituPPj
        w5qhU2Ewe3uV+jR3NxxoptpHyS6AqGH8Gv0e1Zx/DA==
X-ME-Sender: <xms:YfXnY0YuV_ahSpHLg1HNvouCba-DiRYlVvEaN9rrkOLA8EnGARzU7Q>
    <xme:YfXnY_azL9tgyOUY-AOowkmgHqBkPbK6T7PKYOdS9CbEUvke_mH8-4gGwc0bdCRNP
    BcalTUsSx0mOAxRHbc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehjedgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:YfXnY-_7JmEF7x3tryP44i_I4rT8AReftkIyCX7cCHee-GN2bRxWXQ>
    <xmx:YfXnY-pqKSs9wCySpY0-OOtpeo6VTYj9pu2M0_WPvzQqAXdvwkW4lQ>
    <xmx:YfXnY_qFrE4lZdZup-bnoeJ31tchYfPH0CyAB9DnEKdodJ8kVHVAbw>
    <xmx:YvXnY22YYKvImZDLzED6meNCI-PrqvAN4Nexrf821XuR4kvn9cL_Yg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B7DF6B60086; Sat, 11 Feb 2023 15:06:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <01667a3f-4957-4bb6-a694-2e5642cb8571@app.fastmail.com>
In-Reply-To: <20230211182408.GA898817@roeck-us.net>
References: <20230211182408.GA898817@roeck-us.net>
Date:   Sat, 11 Feb 2023 21:06:40 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "Tony Lindgren" <tony@atomide.com>,
        "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] ARM: omap1: remove unused board files
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Feb 11, 2023, at 19:24, Guenter Roeck wrote:
> On Thu, Sep 29, 2022 at 03:38:56PM +0200, Arnd Bergmann wrote:
>> All board support that was marked as 'unused' earlier can
>> now be removed, leaving the five machines that that still
>> had someone using them in 2022, or that are supported in
>> qemu.
>> 
>> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
>> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Cc: linux-omap@vger.kernel.org
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> After this patch I can no longer boot the qemu sx1 emulation from mmc.
> Is this on purpose ?

Thanks a lot for the report and for tracking it down to this commit!

This is not intentional and I don't see what is going on exactly.
I had another look at the patch but don't see anything wrong with
it, as it should only removed files that are dead code after the
unused boards started depending on CONFIG_EXPERT.

I never managed to get sx1 to boot in qemu in the first place, so
unfortunately I can't reproduce this here. Are you able to
narrow it down a little further? My first guess was that
something inadvertently changed in the output of 'make defconfig',
but the only symbols I see there are CONFIG_ARCH_OMAP730 and
CONFIG_ARCH_OMAP850, and I don't see any effect that they would
have on an OMAP310/1510.

What happens if you disable those options manually on a working kernel?

    Arnd
