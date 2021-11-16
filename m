Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C9B453A8D
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 21:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhKPUJs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 15:09:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbhKPUJq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Nov 2021 15:09:46 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCFFC061570
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 12:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6UtycufX3/huPXihxdrXM9vDKWY/pC3UaEVeBhqAA4Y=; b=D5nzpdrhn2H/ITqWlJqbzT+KcK
        +ta7U9rPuc3zLHafS3gZxKdP3IomKOMdu3lcZYb9ex7XIYKZxj5Leu5a7S1s6JwsfTRFC7zJhn4nW
        F9Z+EGqKzwpznfCb08V0FbxoTG0g2110JS9N73W8j8NcwstyyhKSu4zBNgI6DIuwp6ypwxqk7vb+q
        KF8N8vs97Up+2Y7/q7va/VHMpg8WsGysWR7xiNmpaUpkwc8cfzi2MaLf3Bc5Vzc1Dzo0Z2jsJQi/o
        utRw47Vkn38+tX2wlGqMmWG7KMBxwIsmN7/+fDmiJ7QNxHgTO9jr9KxNDS1OVScfojnHeRJeOPsbW
        JZUdZCEA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55666)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1mn4j5-00011N-Eh; Tue, 16 Nov 2021 20:06:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1mn4j0-0002FT-Nk; Tue, 16 Nov 2021 20:06:38 +0000
Date:   Tue, 16 Nov 2021 20:06:38 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "kernelci@groups.io" <kernelci@groups.io>
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
Message-ID: <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
References: <20211115111816.3911213-1-ardb@kernel.org>
 <20211115111816.3911213-8-ardb@kernel.org>
 <d73b25ec-7ade-2090-9ab4-df4ff8d7db94@collabora.com>
 <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 16, 2021 at 08:28:02PM +0100, Ard Biesheuvel wrote:
> (+ Tony and linux-omap@)
> 
> On Tue, 16 Nov 2021 at 10:23, Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> >
> > Hi Ard,
> >
> > Please see the bisection report below about a boot failure on
> > omap4-panda which is pointing to this patch.
> >
> > Reports aren't automatically sent to the public while we're
> > trialing new bisection features on kernelci.org but this one
> > looks valid.
> >
> > Some more details can be found here:
> >
> >   https://linux.kernelci.org/test/case/id/6191b1b97c175a5ade335948/
> >
> > It seems like the kernel just froze after about 3 seconds without
> > any obvious errors in the log.
> >
> > Please let us know if you need any help debugging this issue or
> > if you have a fix to try.
> >
> 
> Thanks for the report.
> 
> I wonder if this might be related to low level platform code running
> off a different stack (maybe in SRAM?) when an interrupt is taken? Or
> using a different set of page tables that are out of sync in terms of
> VMALLOC space mappings?
> 
> Could anyone who speaks OMAP please take a look at the linked boot
> log, and hopefully make sense of it?
> 
> For background, this series enables vmap'ed stacks support for ARMv7,
> which means that the entry code checks whether the stack pointer may
> be pointing into the guard region before the vmalloc'ed stack, and
> kills the task if it looks like the kernel stack overflowed.
> 
> Here's another instance:
> https://linux.kernelci.org/build/id/6193fa5c6c4e1d02bd3358ff/
> 
> Everything builds and boots happily, but odd things happen on OMAP
> based devices: Panda just gives up right after discovering the USB
> controller, and Beagle-XM just starts showing all kinds of weird
> crashes at roughly the same point in the boot.

I haven't looked at the logs yet... but there may be a more
fundamental reason that it may be stalling.

vmalloc space is lazily mapped to process page tables that the
allocation did not happen inside - specifically the L1 entries.

When a new thread is created, you're vmalloc()ing a kernel stack.
This is done in the parent task for the child task. If the child
task doesn't contain the L1 entry for its vmalloc'd stack, then
the first stack access by the child will fault.

The fault processing will be done in the child's context, so we
immediately try to save the state to the child's kernel stack,
which is not yet mapped. The result is another fault, which
triggers yet another fault, etc.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
