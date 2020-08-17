Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0294A2477DE
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 22:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgHQUDD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 16:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbgHQUCr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 16:02:47 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99311C06134A;
        Mon, 17 Aug 2020 13:02:39 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id u126so18794573iod.12;
        Mon, 17 Aug 2020 13:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WwUrycf48TYkmEUsmwdsPhuJLiR8sk6wFEPhan5oRwY=;
        b=sn2+pfvHDOajFSskAm9Fxm/qqS/xvSKDRlv+Nr+am6Zd0sVSR6cX7LVWLoDov8ber3
         ce5nnc1y1Sl5ZemoRcLc074zh71xINuWQLLNszSbXYlsgJgJ38RkM2hGgvFJwOGXYpsZ
         o5dvorhKPsFoQl+XtP0CCdb6evXVON9IYxqcnIEktO6LXfErwy5ZNcqK++1SQWA3KNP4
         VSD2WV68j34nl7stIi0clDmhgjh/GipeiGa3AVpZQWj3AwkW7TFube9OeZ221ELOQLtH
         c2kjOVqgPbtpcwo4g1Aa/BQQgxzvrHsfrWeqUulbwUQaLcOuLUS7mSBNAAEhAqBCdkcv
         hguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WwUrycf48TYkmEUsmwdsPhuJLiR8sk6wFEPhan5oRwY=;
        b=kkK1G22yzevA0EJg2pyjmGTRLpOfebJObOYRvOXlo1UJ5Dd+nQLWMOq0hfTM3GqDzT
         oIEAjxQYq28A/5BC7qa+Vg95HREKO+SXETSyy9XTyIp1S3WQdp8sI/xl+ZV1YHUdAjFv
         PQ3c3xFrw+YzsWg6yEXxrMVCCJ3/5j3DqR7mNQsbnCnEvAVCyqXCx9guoYV/63ZyXzIq
         oOkyIykGfM/YFy2CYoo4oOLIYob3rP8r8Bj9Jsqoe9wKlbE5iFDJ5sRePDiHGDmtnW5R
         ZRFUx6nVq/pcogNsQo+G2zxyE1x/SyPVTH/jHAbn0uo4/81V1fVufmTGavpPiKF3COan
         NnYQ==
X-Gm-Message-State: AOAM531BopSGU6L5Gg215yFjkNEEfdp9lmMYr+v47Dryf2jL7+8sZ1F/
        NGHknxicYi5LJDusgY5Sf5ySBWRa70I7Hs2rB/o=
X-Google-Smtp-Source: ABdhPJzj+6X2ku5vJmBvnez2/FVa+qVYD9yvkbDWWfWNDJmGlYW6tYwx9XRCr4Kkh/o15zvNhmsVrj/7A7T0TUym9xE=
X-Received: by 2002:a6b:e002:: with SMTP id z2mr13402090iog.178.1597694558727;
 Mon, 17 Aug 2020 13:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200817133931.11785-1-aford173@gmail.com> <20200817215953.59607c11@aktux>
In-Reply-To: <20200817215953.59607c11@aktux>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 17 Aug 2020 15:02:27 -0500
Message-ID: <CAHCN7x+2trMJPmg1xA_j2EUfxqtZX0da-pyzvpiZE4GanVNf4Q@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Aug 17, 2020 at 2:59 PM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> On Mon, 17 Aug 2020 08:39:31 -0500
> Adam Ford <aford173@gmail.com> wrote:
>
> > The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
> > depending on commercial or industrial temperature ratings.
> >
> > This patch expands the thermal information to include the limits of 90
> > and 105C for alert and critical.  It sets the coolings-cells for the
> > 34xx and 36xx CPU's which both point to omap3-cpu-thermal.dtsi.
> >
> > For boards who never use industrial temperatures, these can be
> > changed on their respective device trees with something like:
> >
> > &cpu_alert0 {
> >       temperature = <85000>; /* millicelsius */
> > };
> >
> > &cpu_crit {
> >       temperature = <90000>; /* millicelsius */
> > };
> >
> > OMAP3_THERMAL will need to be enabled.  It is off by default.
> >
> hmm, I think the patch for idling core when OMAP3_THERMAL is enabled
> got stuck somewhere. It still seems not to work. Shouldn't that patch
> be applied first?

I rebased the idle stuff, and now I get errors, so I haven't pushed it
yet.  I put a note that OMAP3_THERMAL is off by default, but this
patch would at least get the framing in there.  I know at least two of
us that use 1GHZ processors which are not supposed to run at that
speed above 90MHz, so the idea was to tolerate the higher current for
now, and when the idle stuff works, we'll enable the OMAP3_THERMAL by
default.

adam
>
> Regards,
> Andreas
