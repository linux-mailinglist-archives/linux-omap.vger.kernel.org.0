Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC1024985A
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 10:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgHSIj7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 04:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgHSIj6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Aug 2020 04:39:58 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F03C061757
        for <linux-omap@vger.kernel.org>; Wed, 19 Aug 2020 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=WQNvN5XBxviNXp/nkEsX3Q8j54elLp096iKbVfrH+Do=;
        b=WMhMtygMQgBy9ELSyWTfgSQAmbDdUzcHo0Om3w9OseuLTJc8Si9jgWIuddn0R8OQ4XgDHa3ATrZyfLJwEVSPAp95gH6FAhVpzwPcHWH0s1H85N6ydHwHXNlUBWGppiZU4vTcMV/3Y7SM0oXXM7AyWzPpY4d4jiUldQnq0oj3k0M=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=archlinux)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k8JdR-0000V1-RV; Wed, 19 Aug 2020 04:39:54 -0400
Message-ID: <ba4e3060d59250e744411097bf75af4aa3dec30d.camel@ds0.me>
Subject: Re: [Letux-kernel] [PATCH] omap5: Fix DSI base address and clocks
From:   David Shah <dave@ds0.me>
To:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com
Date:   Wed, 19 Aug 2020 09:39:45 +0100
In-Reply-To: <20200819055844.GT2994@atomide.com>
References: <20200818095100.25412-1-dave@ds0.me>
         <9081697A-02F9-42EA-9F22-F62381FA1C79@goldelico.com>
         <20200819055844.GT2994@atomide.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In any case the HDMI bug has reappeared while testing 5.9-rc1, although
I can get the display to work by doing 'modprobe omapdrm' even if HDMI
is enabled (as before it loads automatically if HDMI is disabled).

Best

David

On Wed, 2020-08-19 at 08:58 +0300, Tony Lindgren wrote:
> * H. Nikolaus Schaller <hns@goldelico.com> [200818 09:58]:
> > > Am 18.08.2020 um 11:51 schrieb David Shah <dave@ds0.me>:
> > > 
> > > DSI was not probing due to base address off by 0x1000, and
> > > sys_clk
> > > missing.
> > > 
> > > With this patch, the Pyra display works if HDMI is disabled in
> > > the
> > > device tree.
> > 
> > For me it also works if HDMI is not disabled.
> > So IMHO this comment is misleading.
> > 
> > Otherwise,
> > 
> > Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> 
> Thanks pushed out into fixes. Looks like I missed removing the
> HDMI disabled comment part but seems like that's not critical
> and don't want to redo the branch after pushing out.
> 
> Regards,
> 
> Tony
> _______________________________________________
> https://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

