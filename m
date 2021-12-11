Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CC747129E
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 08:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhLKHyH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Dec 2021 02:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhLKHyH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Dec 2021 02:54:07 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D90BC061714
        for <linux-omap@vger.kernel.org>; Fri, 10 Dec 2021 23:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3X918KdCszKdJTzpGEpHXq9YOFlEhNVsgugET2Gl3OY=; b=ceU6dhAhSTjKADpmJ9aOk/S+9C
        mlyi34fsZYj0V+N9DO5V5afhInv3FMBAL8J6iOpppbPsuj37525OqazRwhnU+BOM2xj1cCxLR3MNf
        X+NlZ7qK0PGGCNdoIcnnzrLVuCqZVjTooZT9GMD9sC8I+Kv97sSL/T8GAf5MvKTcLkuo=;
Received: from p200300ccff3520001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff35:2000:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mvxCl-0001ay-Ss; Sat, 11 Dec 2021 08:54:04 +0100
Date:   Sat, 11 Dec 2021 08:54:03 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dev Null <devnull@uvos.xyz>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: Nokia N900 OFF mode regression between v5.10 and v5.11
Message-ID: <20211211085403.3c1fcb0d@aktux>
In-Reply-To: <43cac03a-53c2-83dd-e1b0-4d25920d9095@wizzup.org>
References: <43cac03a-53c2-83dd-e1b0-4d25920d9095@wizzup.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Sat, 11 Dec 2021 00:20:24 +0100
Merlijn Wajer <merlijn@wizzup.org> wrote:

> Hi Tony, Adam,
> 
> I noticed that after I fixed the OFF mode regression between v5.9 and
> v5.10 that there are another one between v5.10 and v5.11. Fortunately,
> much like the other change it can be worked around with a config change,
> and in fact it looks like the commit identified by git bisect is indeed
> just a commit to change omap2plus_defconfig.
> 
> a82820fcd079e38309403f595f005a8cc318a13c ("ARM: omap2plus_defconfig:
> Enable OMAP3_THERMAL") prevents the N900 from entering OFF mode pretty
> much all the time (I've seen scenarios with OFF:2,RET:500), but with the
> config change reverted, stuff like this is more common: OFF:13,RET:2
> 
> We will probably to keep the thermal features enabled, but maybe we can
> figure out why it causes the SoC to not enter sleep modes?

well, it was enabled after people agreed that is fixed... including me.
It was wrongly enabled some time before, then disabled again, fixed and
reenabled.
The mentioned commit was just after the fix. So what is different now?

Regards,
Andreas
