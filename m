Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E348627C72
	for <lists+linux-omap@lfdr.de>; Mon, 14 Nov 2022 12:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbiKNLiN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Nov 2022 06:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiKNLiM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Nov 2022 06:38:12 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A546E0E8
        for <linux-omap@vger.kernel.org>; Mon, 14 Nov 2022 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PrNFcixPn+MG01/kOkfXY15R3eqYFpWyt4XCXqLRKZw=; b=o6LrO2wEvWbArpEl35UG3pfve4
        pmgTJlph6PWlbj/TxUT9agy8bDiIJdLumoR6gkf9l4CWwa/z1KYZ+meCI0SIqEF4FjawMjFDFNRV9
        FlImaaI99FdPktA3BcEGYsubQ4vizqlYR6drGdOwDdcZS8n0ClcJG8zW7LDijJm1rNHwjRuxEVJQh
        shsiGoG22eXtuid0CPN78od/kuL86t1X+mhs0It5JHAxt+BRBfVBHV53hv+F4puRezvePLgLcxe3g
        dhVA9hu3io8Xsh/Z0r/IQcWc6vnbdFxlFyKSxEr0GAy/VH0S/8bI52wIkulDecWBx8tiRl0WX+AXG
        xTEXKmVw==;
Received: from p200300ccff0644001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:4400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ouXmx-00042k-2H; Mon, 14 Nov 2022 12:38:07 +0100
Date:   Mon, 14 Nov 2022 12:38:05 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     deffo@gmx.de, linux-omap@vger.kernel.org, aford173@gmail.com
Subject: Re: twl: not initialized and twl6030_uv_to_vsel problems
Message-ID: <20221114123805.60ada45e@aktux>
In-Reply-To: <20191230174010.GO35479@atomide.com>
References: <trinity-8c439dd8-69cc-4bbc-812f-a063b15a9369-1576233714035@3c-app-gmx-bs17>
        <20191230174010.GO35479@atomide.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

as am taming the Epson Moverio BT-200 containing
an omap 4660, I came across that this issue. The kernel hangs somewhere
after this, I am still debugging.

What is the impact of all this? Just not working cpufreq modifications?

On Mon, 30 Dec 2019 09:40:10 -0800
Tony Lindgren <tony@atomide.com> wrote:

> * deffo@gmx.de <deffo@gmx.de> [191213 10:42]:
> > Thanks for the link Adam, I fixed this on my local branch.
> > 
so, it did not went into mainline kernel? Can/did you
publish the fix?

> > Concerning the
> > 
> > [    2.318054] twl: not initialized
> > 
seen this also

> > error, this is due to the fact, that the twl itself is probed later:
> > 
> > [    3.042114] twl_probe() called
> > 
and the kernel hangs before that (probably still some other problem, still investigating)

> > So it cannot be available at this point. Might be a fundamental problem in the chronological order of init calls?  
> 
> Hmm maybe the related omap_*_initcall() needs to use *_initcall_sync()?
> 
so there is no fix yet?

Regards
Andreas
