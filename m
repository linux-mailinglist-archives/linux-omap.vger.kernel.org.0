Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DF239C906
	for <lists+linux-omap@lfdr.de>; Sat,  5 Jun 2021 16:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFEOWo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Jun 2021 10:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFEOWo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Jun 2021 10:22:44 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AE5C061766;
        Sat,  5 Jun 2021 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Pmol+G8wvDcuK55JiTURyw+d5wno0lRvkbdjGiOqPdU=; b=WcZRAbaA4cW2SCrcEthuHvv7Rw
        Qg8rL9fdI1b2cNx0SgOVnTkUe1UYNqRcaiUX1qA2sl2eIePkS2QyyQA1lHVKTqpKHQXi/P91en/tb
        5m+31hHNwN1LU3Q/uf9IWutAajzg5u8bABTRSuNSq9//SEUIzYTT37FggPqSNgJHYUn0=;
Received: from p200300ccff3be8001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff3b:e800:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lpXAN-0002hm-72; Sat, 05 Jun 2021 16:20:51 +0200
Date:   Sat, 5 Jun 2021 16:20:46 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210605162046.7362a05e@aktux>
In-Reply-To: <YLsJFqYQQ9e233QQ@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
        <20210604103533.6392beeb@aktux>
        <YLn06uuntThMlaTQ@atomide.com>
        <20210604185943.3efa2a19@aktux>
        <YLsJFqYQQ9e233QQ@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 5 Jun 2021 08:18:14 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [210604 17:00]:
> > On Fri, 4 Jun 2021 12:39:54 +0300
> > Tony Lindgren <tony@atomide.com> wrote:  
> > > Does the following patch fix things for you or does something else break again? :)
> > >   
> > sigh,..
> > ok, it breaks something. gadget (at least ecm) only works if
> > musb/phy stuff is loaded, ecm configured via configfs
> > rmmod omap2430
> > modprube 2430
> > 
> > until the next usb disconnect
> > and another rmmod/modprobe is required.  
> 
> Hmm I don't follow, do you mean there's now another issue after a
> system suspend? Or is this issue not related to system suspend and
> resume?
> 
independently of suspend.


> > The following musb patches were applied additional to that one you
> > added to this mail on top of 5.13-rc4.
> > 
> > usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling
> > usb: musb: Add missing PM suspend and resume functions for 2430 glue
> > usb: musb: Check devctl status again for a spurious session request  
> 
> Does one of the above cause some additional usb gadget issue?
> 
I do not see any additional gadget issue just with them. It just starts
with the small patch you proposed to fix suspend power consumption in
this thread.

Regards,
Andreas
