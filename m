Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D238E954
	for <lists+linux-omap@lfdr.de>; Thu, 15 Aug 2019 12:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731367AbfHOKyQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Aug 2019 06:54:16 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41534 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731315AbfHOKyP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Aug 2019 06:54:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id o101so4906764ota.8
        for <linux-omap@vger.kernel.org>; Thu, 15 Aug 2019 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xAfQMpDjWZ+YLsCCIX1yRvdpUpYvcM+QtbdedBYAkPQ=;
        b=lAorBde0HBEMmmvvArwlACOlQYXSDnTbf34O89sZ0uiJGRPGgNU9rRaNFojmtBI3U0
         4fBLAYxZhKR8N2CD2qc8VSpZs9zS8lhDDQqpIB6H6ih05Ld+5sq111I2cLAIzUGS49mQ
         sQEvT5aRD+CeyHOa0XbMEDGwAKDvXeLqhM6jOjNhFCSn2hKJGRvcon1GpwLPLvkQXm4r
         q9SQavA09BmtlRDjd67A4/JQegTtZM89cNC3jB3WXd6awPJyei5qfA1yg5phdfJNYKTE
         7bARyUOVEakaQ8/VvVqfBftqnHyP9APy4L90sIf+pQigtlI0YkcbStJZRl96AqZqvzNw
         wwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xAfQMpDjWZ+YLsCCIX1yRvdpUpYvcM+QtbdedBYAkPQ=;
        b=NXecnS1xYbgAkTINq0EZf92ju8jMEwJmyjTHndcuRDuBPj/jbJgfa7SUvHRW050gNH
         /dsxp+utmXz6pLYR9OaN/mP6yJC9dS9D7w4/+uO2jeZzy5uMzkqS3IepTwRArHzSS4fX
         wS82i5SBtdf7HoNF6xA5w25leX23E2KQE5Wj7jNlzvesLrtAn43QMA6mIYlXEPzzN61Y
         TPkeCmwKLavkJGdT6SbwudSKhYP35qgh47ijvmVkMJV9QXDaHuc47B3nrlYMTkWCsdxt
         yiupVCTmmYWlYx/akFKoIXEXP2et5cp1eOjfQApmcaOR3vBmdPRAg59zkebR1dFoni0F
         dW+A==
X-Gm-Message-State: APjAAAXOePyF6RcunxDIa2PFhwr8uCDmJN6Vlws3LYrb8fZmcAYdDtEZ
        NOuiDNK79JavQH7FiXKDv0qi+nDczrOPhbla6/Q=
X-Google-Smtp-Source: APXvYqz7P2MU50xLkessIGhfKqa0kcDPTt/eoZE2w8ZUbB8OLaa/tr54eTfbjQwE7oEorfE2h31VhizHqYNclkvphB4=
X-Received: by 2002:a6b:621a:: with SMTP id f26mr4471231iog.127.1565866454187;
 Thu, 15 Aug 2019 03:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJXJ__Gm3x=eAKkXuRTi1tDJocddKUzSw8oeYXQzM4tuQ@mail.gmail.com>
 <20190814232816.4906f903@lepton>
In-Reply-To: <20190814232816.4906f903@lepton>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 15 Aug 2019 05:54:02 -0500
Message-ID: <CAHCN7xJyhy9F6JLCG_Lz7EizNDGnA_wHgr13Xs91yo+zdp2c4Q@mail.gmail.com>
Subject: Re: omap36
To:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 14, 2019 at 4:28 PM Andr=C3=A9 Roth <neolynx@gmail.com> wrote:
>
>
> Hi Adam,
>
> > The Logic PD Torpedo dm3730 boots with a few messages that concern me:
> >
> > [    2.824188] omap2_set_init_voltage: unable to find boot up OPP for
> > vdd_mpu_iva
> > [    2.831481] omap2_set_init_voltage: unable to set vdd_mpu_iva
> > [    2.837280] omap2_set_init_voltage: unable to find boot up OPP for v=
dd_core
> > [    2.844329] omap2_set_init_voltage: unable to set vdd_core
>
> I noticed the same on my dm3730 and found that the order in which TWL,
> SmartReflex and the omap init functions are called was wrong.
>
> See my patch set here:
> https://marc.info/?l=3Dlinux-omap&m=3D156462291906717&w=3D2
>
> With this I was able to get rid of half of those messages...
>
> > I noticed that abb_mpu_iva has a bunch of OPP's, but it's not clear to
> > me how or what should power this and/or how the regulator is is
> > related (if at all)
>
> It seems to be more complex than I assumed. In short, proper Dynamic
> voltage and frequency scaling (DVFS) is required, which is currently not =
implemented.

There happened to be a patch pushed yesterday that I didn't see:
https://patchwork.kernel.org/patch/11094653/

It seems to fix the issue I was seeing.

>
> > The torpedo is using the TWL4030 PMIC, and I would expect those
> > voltages to be acceptable to the twl4030
>
> I found one patch [1] which enables SmartReflex on the twl4030, which
> this dm3730 ran without RAM errors at 1GHz.
>
> However, I have learned that these patches are not enough, and would
> reduce the chips lifetime without DVFS active.

What makes DVFS different from what cpufreq does by changing the
operating voltage and frequency?

adam

>
> Kind Regards,
>
>  Andr=C3=A9
>
> [1] https://marc.info/?l=3Dlinux-omap&m=3D156462292206718&w=3D2
