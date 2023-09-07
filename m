Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB72797397
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 17:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244800AbjIGP2D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 11:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjIGPV7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 11:21:59 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39EE1700;
        Thu,  7 Sep 2023 08:21:26 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 4628B3200921;
        Thu,  7 Sep 2023 06:11:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 07 Sep 2023 06:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1694081506; x=1694167906; bh=EZ
        T6EnA3YabROgKZ7V+W9exHIuOjPiCl6NxOF1soN9U=; b=xAbnZGGnS26+dKZuFM
        JJ9Q/LP83Fk2oA7vUHJgxjPuMktibog+u9gFMPqITJcZTLADYfgGjYfuyA+hIgpy
        UZ0PJ7YnaKlDjpwHqZdZipYvLmuNtiyrdBEAjyaJjqU6pTabR7ItN36z3lwhpmXs
        fvtiu0mTHRzZpFj+I45yd9bxVW5zKED/+1aCZxcyb3ZHIcAuoJ3tpNsPmKev+cCb
        yNuoZy9vW1r0nXPmLM0PNfhWBwCiMRsfOKcdCT7P3LiIwHLYXW5Qa8awoYbQu9XA
        fkpuw6HrCJhhvMXFhaZnWBSYl/eRazd8A2AkeBiJPfTx8oJgT1nYcQarGfpiUTzZ
        3nlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1694081506; x=1694167906; bh=EZT6EnA3YabRO
        gKZ7V+W9exHIuOjPiCl6NxOF1soN9U=; b=WeI7TMT0kmnj7BpJTHA+/mKJxHLnA
        OabayLtZUBFxbF1MUNKkaCwqHQoIsSRelpkuxhRSXzyOmyOkbZ8tAGBCrZXRoqsp
        KRsFDkq6APoFkXAfBI8tinW/iz8wqVUN8vjDX1Hs6wTDVnhvsZnfyiJH2IKjlZ9Z
        7geKfsxeBgrXB2KI33HelMATDyF+Cr5EZw0yAZFypceWTzdzwMwDIA6HLjME71eM
        qn3VBBhUJ0utdR6tOvutgpbDX2zNr8iWYdsHm5bw2usx2eP0EAZWHILjxaLoD9eA
        YVFGeVbkzAuynBV9RfFqV3VVpEb68L2XQCiIWoFLw0PdKu2svW34JKQuQ==
X-ME-Sender: <xms:4aH5ZHsHds3V0ipUOOV1zJyBPznKR_WsO-5nW6tiU9MGH5ewW08mPQ>
    <xme:4aH5ZIfNU11SHBEaMmaEvGDQ-BGvbuv_sEUOiV6JICfG0dgR-EQeQkgvEBa5ppOk1
    bvgIt-Fz2fu2A>
X-ME-Received: <xmr:4aH5ZKwkKolW7ggAF7C6NgoEx-SDMCFAms8NDKFUIHhALKjqoIN4NsutmNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehhedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:4aH5ZGORV396Z-xwS_71WoNaFIqg28zD8p-KPpF8Fj8skpK8C00n0Q>
    <xmx:4aH5ZH-dbwLMRZTS323_B-WH-sLWA7btzK0cRLr3vsZrnQMceLZ1yg>
    <xmx:4aH5ZGXFACVuo9kvBS59nBceVR1ZW3XNUP31J6zjtjW-2JUIN5t1Qg>
    <xmx:4qH5ZHxBMEYMGjScKU9TdoNo-gxPzpvdOYz_xoq1S84DA6O9teoiZg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Sep 2023 06:11:45 -0400 (EDT)
Date:   Thu, 7 Sep 2023 11:11:44 +0100
From:   Greg KH <greg@kroah.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     stable <stable@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: of: property: Simplify of_link_to_phandle()
Message-ID: <2023090715-charity-numerous-f6f0@gregkh>
References: <CAHCN7x+GLhYyEMq0h0Sa3m9JMuZf0g7=FpT==uFOg=w7OQ=qUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+GLhYyEMq0h0Sa3m9JMuZf0g7=FpT==uFOg=w7OQ=qUw@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 06, 2023 at 06:49:07PM -0500, Adam Ford wrote:
> Stable Group,
> 
> Please apply commit 4a032827daa8 ("of: property: Simplify of_link_to_phandle()")
> to the 6.1.y stable branch.  It was originally part of a series that
> was only partially applied to 6.1.  Being partially applied left 6.1.y
> in a state where a bunch of peripherals were deferred indefinitely on
> the am3517-evm.
> 
> wl12xx_buf platform: supplier 48002000.scm not ready
> wl12xx_vmmc2 platform: supplier wl12xx_buf not ready
> 48050000.dss platform: supplier display@0 not ready
> 48064800.ehci platform: supplier hsusb1_phy not ready
> backlight platform: supplier 48002000.scm not ready
> display@0 platform: supplier backlight not ready
> dmtimer-pwm@11 platform: supplier 48002000.scm not ready
> hsusb1_phy platform: supplier 48002000.scm not ready
> gpio-leds platform: supplier 48002000.scm not ready
> 480b4000.mmc platform: supplier wl12xx_vmmc2 not ready
> 
> With the above commit applied, it appears to address most of the
> deferred peripherals.
> 
> Fixes: eaf9b5612a47 ("driver core: fw_devlink: Don't purge child
> fwnode's consumer links")
> Signed-off-by:  Adam Ford <aford173@gmail.com>

Now queued up, thanks.

greg k-h
