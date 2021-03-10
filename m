Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDAF63340EF
	for <lists+linux-omap@lfdr.de>; Wed, 10 Mar 2021 15:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhCJO7K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Mar 2021 09:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbhCJO7I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Mar 2021 09:59:08 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A895CC061760;
        Wed, 10 Mar 2021 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nCSk/kTayjqMafiLa1zeviIbw4QWdPqrZ0nPieuKqrU=; b=dKb893JWFwN5M+UEgAm/8gDV9
        1QE1wWO0lfMKzS7YFXgiw70Ei2XDNMzNtOVpznLrtoQHkt4BwclB1Xj9zOd9mBoprsB5fL0XWNTrr
        mXmpK3V3bBi/sSW6Zz67AhdSu0m/d7Z8bvDXDRSZmxqgS99leZIubNv4SJEhyUz8Eq/SslLscgoo2
        1pjl3XLKtExu4JVdrL5qehzU3fP+hD2FicHQ1b1UZGaPwBXouUvhs+NxrXkJqQXjmxfabyf04IAjw
        0wzdJ2Az6nFS8Ixx01O190T9hLgF9BY1nB1z92CMsSdeEoir/E33MMurJvOuKvKfNMI+5ouvSihpk
        Z97jl+Y1A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50724)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lK0Ij-0004YW-Kk; Wed, 10 Mar 2021 14:59:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lK0Ii-0000nR-K0; Wed, 10 Mar 2021 14:59:04 +0000
Date:   Wed, 10 Mar 2021 14:59:04 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Jan Kardell <jan.kardell@telliq.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: arm: lockdep complaining about locks allocations in static memory
Message-ID: <20210310145904.GA1470@shell.armlinux.org.uk>
References: <6df24716-8b41-8e9a-f2f4-a0f5d49643bd@telliq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6df24716-8b41-8e9a-f2f4-a0f5d49643bd@telliq.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Mar 10, 2021 at 02:54:30PM +0100, Jan Kardell wrote:
> Hi,
> 
> During work lift the software and kernel versions on our custom TI am3352
> board I started to see lockdep warnings after enabling CONFIG_PREEMT.
> Lockdep seems to think the memory that previously was initmem is static
> memory. I'm using linux 5.4, as that is what is used in the next OpenWrt
> version.
> 
> [ 92.198989] WARNING: CPU: 0 PID: 2015 at kernel/locking/lockdep.c:1119
> alloc_netdev_mqs+0xb4/0x3b0
> 
> I guess CONFIG_PREEMT just changes the timing of allocations, and is
> otherwise irrelevant.
> 
> This was fixed for s390 in linux 5.2 commit
> 7a5da02de8d6eafba99556f8c98e5313edebb449 by adding the function
> arch_is_kernel_initmem_freed(). Later a very similar change was made for
> powerpc, and a different solution for x86. I now believe that is needed for
> arm as well. Though I don't know the inner workings of arm memory management
> so I don't know if an identical solution to s390 will do for arm, but my
> experiments suggests it works for am335x. The commit message for s390 says
> "virt == phys", but that seems not to be the case for my arm system.

I don't see any reason this couldn't be added to arm, but it needs
someone to create and test a patch - which implies that they need to
have a problem that needs to be solved. As you seem to be experiencing
the problem, it seems you are well suited to this. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
