Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8706933E0
	for <lists+linux-omap@lfdr.de>; Sat, 11 Feb 2023 21:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjBKU6l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Feb 2023 15:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBKU6k (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Feb 2023 15:58:40 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC561448C
        for <linux-omap@vger.kernel.org>; Sat, 11 Feb 2023 12:58:39 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id BE4CF5C00A7;
        Sat, 11 Feb 2023 15:58:38 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 11 Feb 2023 15:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1676149118; x=1676235518; bh=G8ttt2ZefQ
        h+LMteLLvGQae3WXbU7zP6QbMsdysxRNM=; b=S2BuxEPEpSGYqwrGYs6YLVHiNn
        z+2ulbL5J3U5Trz9uhAyC+yuYxIRO9eKVBmOPxhoGTsUfBm7b6MGsuZ2eG7X8UaV
        Czp4n5cPBE4hLVjbx381F4uu+bMGoTQOYnBxAw7Gx0YvNXXr9CdpVfrZBQsw2Z/U
        GmeuZ0LiwQc91yyweeqSG7uJLv5eLpaIxqvc6WCeTN5+lGMsXA0jWLajOEYN9w0P
        KHR/jDdBw0E96fzbj4eG5B9kQplMXBZndy1vy+OkKRyzkpxCHFxusQcaaaCxZDsP
        SQnjU4BXo4T2oIkE7YoX7dM8TEvOz6V6DKcxpXLqnPELYP5ZsPmZTwsFTvEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1676149118; x=1676235518; bh=G8ttt2ZefQh+LMteLLvGQae3WXbU
        7zP6QbMsdysxRNM=; b=XHc1VAJSXLJIDcAe42y+c8s424tOr84LvJt9wbxc1szZ
        B61doQfJty6gGSVQWtd5FMd1YMpYlmYtpWIhsmSPejeKgvnZW2Z3HPIApGrVM1vf
        VmyD5HTPNDAXUpxYZA6ekqxBkUlRF467xZ2L2OwGckx6L8k3m/+y6S4VujMSnMwJ
        vEWnx29M4ecFbfsXRRiiak+jlEhEFNC0mrSJThYkWgsYk7uvs/ySPuvatmU5GI3y
        UTNuFoEu7CiFCe/v2wB/pr3jipxd3oeOXy9lZW9L2eADAHqMf0aeL2rz33ykvTjZ
        fRBTFun12VbfxA65dmtofMxp9Ac0Q2PT5fTaDmArHw==
X-ME-Sender: <xms:fQHoY5dUQHy8hUsGkbN9VM9yt1n9w8SMl0EQsh1O9P8h5SrMBb3LTA>
    <xme:fQHoY3PKjejR6A9vUu87xkdZoDKbJD7tOa7TO-1mHN2NA9_ILqLGDGvI5IHWRGmT8
    TyIIYW6fGva9l-ccCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehjedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:fQHoYyjdpruBzsqo2BvKzqJr6rDyjmVC2fVUqmvMXl1c4Iq_Jl3EAg>
    <xmx:fQHoYy-GgaYvUKlFe3tYjfln05sQ2-GjD4g2dlc0xp_UmaM6PzVr7Q>
    <xmx:fQHoY1sgTPXYokz-854_JqccKthT2_QoIjzYj1KzWMIWiMoi4uJyiA>
    <xmx:fgHoY-692tW8QBoEaFErGK9MtFMXEV0rNZ3bjyXS0QNsqHrJYKgE7A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DB6D9B60086; Sat, 11 Feb 2023 15:58:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <ce4a582e-1405-4a1e-8b8e-9f1c0a0dfc37@app.fastmail.com>
In-Reply-To: <b4f65c1f-649d-6c35-b553-15c3ed0fbfb4@roeck-us.net>
References: <20230211182408.GA898817@roeck-us.net>
 <01667a3f-4957-4bb6-a694-2e5642cb8571@app.fastmail.com>
 <b4f65c1f-649d-6c35-b553-15c3ed0fbfb4@roeck-us.net>
Date:   Sat, 11 Feb 2023 21:58:18 +0100
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

On Sat, Feb 11, 2023, at 21:44, Guenter Roeck wrote:
> On 2/11/23 12:06, Arnd Bergmann wrote:
>
> Those are not even listed as possible options. The key difference
> in defconfig is:
>
> 44a45
>  > CONFIG_IOSCHED_BFQ=y
> 79a81
>  > CONFIG_MMC_OMAP=y
>
> and the latter is now disabled because
>
> 	depends on TPS65010 || !MACH_OMAP_H2
>
> was changed to
>
> 	depends on TPS65010
>
> and TPS65010 is not enabled in my configuration.
>
> Removing the dependency of MMC_OMAP on TPS65010 fixes the problem.

Ok, I see. I even fixed the same bug in USB_OMAP already and
still didn't spot it at first. I'll add a fixup on top.

    Arnd
