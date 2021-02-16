Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3309B31C76E
	for <lists+linux-omap@lfdr.de>; Tue, 16 Feb 2021 09:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhBPIgk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Feb 2021 03:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhBPIfp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Feb 2021 03:35:45 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0FEC061574;
        Tue, 16 Feb 2021 00:35:03 -0800 (PST)
Date:   Tue, 16 Feb 2021 09:35:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1613464501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=70lHKWgGoo6VhWpcJ2+NWE0z9250K2X/fg1wAF15xQY=;
        b=VWc85enQJ61K6OOs/SQq/iNUmiLwb6Dc7J87qef8XIH6433NQrGrEMuKkiEYLAYZMM96oy
        uJlPxQUzSmZQKMngJzvDvL6a7KsiaYHX41TZYeBCPqtTueGstCWopPnpjEGyFsQbI+ZGvc
        mEXLCwAmHQRWEJ48O/t+Bt4vMVSJ0XYpjq5n5+4j///Nfe+zlzrYDVJB2ZuxnaYpAqaVdy
        aaI17acCV7Abk6lSRHvS1vjpnEg5frbhKHGEzkOjPVAlAnsJCDK0oI4yZjF5jLKTDmF/om
        Gif4fHEo43ATe7RUIAHTsp0YhK8XFrMlHsxobTrFi1jmjMl+DpQ4NHk72kItKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1613464501;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=70lHKWgGoo6VhWpcJ2+NWE0z9250K2X/fg1wAF15xQY=;
        b=EZQfdGrnk0Aq3GZa/wBny+XqOkAwEcFy9iNQ/ifeGFwHfm/cRGj5wOklP6k2A5mh6MTDIb
        MMaqq/EVDJgDZECw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-fbdev@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] video: Remove in_interrupt() usage.
Message-ID: <20210216083500.brcafu6mo2yiz3cg@linutronix.de>
References: <20210208223810.388502-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210208223810.388502-1-bigeasy@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2021-02-08 23:38:07 [+0100], To linux-fbdev@vger.kernel.org wrote:
> Folks,
> 
> in the discussion about preempt count consistency across kernel
> configurations:
> 
>  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
> 
> it was concluded that the usage of in_interrupt() and related context
> checks should be removed from non-core code.
> 
> In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
> driver code completely.
> 
> This series targets the video subsystem. The omap patches are a repost
> of [0], the amba-clcd is new after I received no feedback on my analysis
> [1].
> 
> [0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
> [1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de

Could someone please apply the series? Video seems unmaintained.

Sebastian
