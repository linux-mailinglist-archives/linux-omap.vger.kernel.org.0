Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5747F247802
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 22:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgHQUPi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 16:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHQUPi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 16:15:38 -0400
X-Greylist: delayed 934 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Aug 2020 13:15:37 PDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F23C061389;
        Mon, 17 Aug 2020 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MQxwrtyOSC0pqe1VevhdSFunt/8xuDEPA6IOemddH4o=; b=Tu3HPHWaEXY96Wq4yxc3gzDq4d
        m39dWE3VGFrwZ+xgRjkiplje1pfUG92mS0Nf9FEQq9/mCI6ldmIMUC+djq/pu/7CAIgVwOGLihIbc
        Bs/8i/xz7FtV6zZTn9ZWhOZZJurqYSPdirLVVF14700DDi6oKYlNpZuiqrM9GuMrmQSM=;
Received: from p5dcc3306.dip0.t-ipconnect.de ([93.204.51.6] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1k7lXa-000549-1W; Mon, 17 Aug 2020 22:15:34 +0200
Date:   Mon, 17 Aug 2020 22:15:32 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH V2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
Message-ID: <20200817221532.5d150648@aktux>
In-Reply-To: <CAHCN7x+2trMJPmg1xA_j2EUfxqtZX0da-pyzvpiZE4GanVNf4Q@mail.gmail.com>
References: <20200817133931.11785-1-aford173@gmail.com>
        <20200817215953.59607c11@aktux>
        <CAHCN7x+2trMJPmg1xA_j2EUfxqtZX0da-pyzvpiZE4GanVNf4Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 17 Aug 2020 15:02:27 -0500
Adam Ford <aford173@gmail.com> wrote:

> On Mon, Aug 17, 2020 at 2:59 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > On Mon, 17 Aug 2020 08:39:31 -0500
> > Adam Ford <aford173@gmail.com> wrote:
> >  
> > > The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
> > > depending on commercial or industrial temperature ratings.
> > >
> > > This patch expands the thermal information to include the limits of 90
> > > and 105C for alert and critical.  It sets the coolings-cells for the
> > > 34xx and 36xx CPU's which both point to omap3-cpu-thermal.dtsi.
> > >
> > > For boards who never use industrial temperatures, these can be
> > > changed on their respective device trees with something like:
> > >
> > > &cpu_alert0 {
> > >       temperature = <85000>; /* millicelsius */
> > > };
> > >
> > > &cpu_crit {
> > >       temperature = <90000>; /* millicelsius */
> > > };
> > >
> > > OMAP3_THERMAL will need to be enabled.  It is off by default.
> > >  
> > hmm, I think the patch for idling core when OMAP3_THERMAL is enabled
> > got stuck somewhere. It still seems not to work. Shouldn't that patch
> > be applied first?  
> 
> I rebased the idle stuff, and now I get errors, so I haven't pushed it
> yet.  I put a note that OMAP3_THERMAL is off by default, but this
> patch would at least get the framing in there.  I know at least two of
> us that use 1GHZ processors which are not supposed to run at that
> speed above 90MHz, so the idea was to tolerate the higher current for
> now, and when the idle stuff works, we'll enable the OMAP3_THERMAL by
> default.
> 
yes, makes sense, so with this patch we have the choice to either
optimize for low speeds and currents (by disabling OMAP3_THERMAL and
1GHz) or high speeds (by enabling OMAP3_THERMAL and 1 Ghz).

Regards,
Andreas
