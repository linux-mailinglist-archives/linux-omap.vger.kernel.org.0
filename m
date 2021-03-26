Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5C034A901
	for <lists+linux-omap@lfdr.de>; Fri, 26 Mar 2021 14:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhCZNvg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Mar 2021 09:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:41114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230203AbhCZNvR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Mar 2021 09:51:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AE1E61971;
        Fri, 26 Mar 2021 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616766676;
        bh=3yxu25BCyXJuNRSnfqli1QuGuzszCOUzkRm5a7AUprg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pLD8TjjGbcl1RYgn2bQ81BR4ivofFupKbksBNMoMTvZbkKJzgJMng9etNxZ9RYaeS
         rcWEc1LSn6aYeDUod3OqbxbWGPSWE1nb2Sj2+VNJNOLSgjIC1mPVKWdh9c73bSmopN
         lbps7/eiVuEhVFpFW+QoIMzFEBPY9z3lKP5G1SzU=
Date:   Fri, 26 Mar 2021 14:51:14 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Bhushan Shah <bshah@kde.org>
Subject: Re: [PATCH RESEND] usb: musb: Fix suspend with devices connected for
 a64
Message-ID: <YF3m0jAOfIT/ounG@kroah.com>
References: <20210324071142.42264-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324071142.42264-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Mar 24, 2021 at 09:11:41AM +0200, Tony Lindgren wrote:
> Pinephone running on Allwinner A64 fails to suspend with USB devices
> connected as reported by Bhushan Shah <bshah@kde.org>. Reverting
> commit 5fbf7a253470 ("usb: musb: fix idling for suspend after
> disconnect interrupt") fixes the issue.
> 
> Let's add suspend checks also for suspend after disconnect interrupt
> quirk handling like we already do elsewhere.
> 
> Fixes: 5fbf7a253470 ("usb: musb: fix idling for suspend after disconnect interrupt")
> Reported-by: Bhushan Shah <bshah@kde.org>
> Tested-by: Bhushan Shah <bshah@kde.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> ---
> 
> Looks like this fix is still pending, can you guys please apply? This is also
> needed on am335x to suspend with devices connected in addition to a64

Now queued up, thanks.

greg k-h
