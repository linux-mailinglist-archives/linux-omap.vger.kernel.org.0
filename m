Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3726E266465
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 18:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgIKQhQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 12:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgIKPM6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 11:12:58 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4351C061358;
        Fri, 11 Sep 2020 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Mqkz/TWdkaK1QSCbkP0AJS8OkxokSpm+JnM6y2Dzk1U=; b=iuePkO9Gkom/odDxD1jBzDR2t6
        xtNgBI1jkys2M3Dufsm1WU4nOmnsz8hVTMzk9DfnLsHRW/TrlMWYbM3tu8WyJ+Th7lkrxGguMhiWx
        hOpme4zgCM/XcytmhnbjAlZtiPoXaUXYVgtvuCgQjucNNi9YLQk4ieFPB9A+CotJ5Pdc=;
Received: from p200300ccff0ce9001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:e900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kGk1B-0001LS-Kb; Fri, 11 Sep 2020 16:27:32 +0200
Date:   Fri, 11 Sep 2020 16:27:12 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     khilman@kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH] omap3: enable off mode automatically
Message-ID: <20200911162712.740d96ec@aktux>
In-Reply-To: <20200911103337.GH7101@atomide.com>
References: <20200911064924.26281-1-andreas@kemnade.info>
        <20200911103337.GH7101@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 11 Sep 2020 13:33:37 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [200911 09:50]:
> > --- a/arch/arm/mach-omap2/pm.h
> > +++ b/arch/arm/mach-omap2/pm.h
> > @@ -49,11 +49,7 @@ static inline int omap4_opp_init(void)
> >  extern int omap3_pm_get_suspend_state(struct powerdomain *pwrdm);
> >  extern int omap3_pm_set_suspend_state(struct powerdomain *pwrdm, int state);
> >  
> > -#ifdef CONFIG_PM_DEBUG
> >  extern u32 enable_off_mode;
> > -#else
> > -#define enable_off_mode 0
> > -#endif  
> 
> Hmm isn't the above still needed for the other SoCs? Or is omap3 the only
> user?
> 
well, the linker moans about undefined symbols if
CONFIG_ARCH_OMAP3 is not enabled.
I will send a v2.

Regards,
Andreas
