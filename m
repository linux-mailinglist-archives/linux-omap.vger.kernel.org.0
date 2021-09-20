Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0207411829
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 17:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236781AbhITP1B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 11:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhITP1A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 11:27:00 -0400
X-Greylist: delayed 1993 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Sep 2021 08:25:33 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2B0C061574
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 08:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=go+/gEITCs03fpg1GDFKdWvXdGfCh7Xg90tSzpOmvXQ=; b=ENF3iJotxO6kBJxKbz9Ie62lJt
        P3UDpgX7YT4QhYjJiI/qv7yCyJLFm0FLG5phuWZz5mftExAgTAg90BC8MvP0uQunMLEMLnZiqLUJG
        6fTd/OE75g1sj+QWSGzs6OwNpx1e9NEqrQ3J0R7YsOSFlgJC8upnJeRM0YLjec66ETxA=;
Received: from p200300ccff0bf1001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:f100:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mSKeW-0004ki-TT; Mon, 20 Sep 2021 16:52:17 +0200
Date:   Mon, 20 Sep 2021 16:52:16 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <20210920165216.34abc4dd@aktux>
In-Reply-To: <YUiOA4QEbZXPmQ7F@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
        <YUiOA4QEbZXPmQ7F@atomide.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Mon, 20 Sep 2021 16:34:59 +0300
Tony Lindgren <tony@atomide.com> wrote:

> > I fail to understand how omap3isp affects this since it actually disable
> > clocks after probe. Does it keep some power domain active which then
> > keeps the timer active etc?  
> 
> Sounds like it's because omap3isp never allows the SoC to enter deeper
> idle states. The mpu clock is stopped for idle states.

On GTA04 I experienced also some strange pm issues with omap3isp:
rmmod clears up everything fine.

After probing, clocks seems to be turned off, but power consumption
does not drop. It only drops when there is an iommu_detach paired to
that iommu_attach in the driver.
But if I add it, the driver does not work properly.

Regards,
Andreas
