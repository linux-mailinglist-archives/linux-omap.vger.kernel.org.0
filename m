Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0163A1207C1
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 15:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbfLPN51 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 08:57:27 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:33952 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbfLPN50 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Dec 2019 08:57:26 -0500
Received: by mail-il1-f195.google.com with SMTP id s15so2410255iln.1;
        Mon, 16 Dec 2019 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2tBYGnK2Aq8T6hQ21qou143/hbgltxjW1oUM3LKKX4g=;
        b=MfUuorgN62i/6BTeoViD+3wdtgGw8nhJoiV9dUU5aST/wEvSmP9/yBEBHUcamzHS1v
         NHt/UdYJMolLAUVrm2pOKJvNlItPS+Piotp1TWH48w/9be3QPbhbwUTecGzffyEu0QjB
         E/0had3gNGhzgLMcDLlXWnAdjlTaGfFLkzuiKGXlNC7LbBsImKSjA6w33izjwW2vt8vS
         3Lvwp/rx+ZsPrdMFX9rYzO9y8vj0dNd/lFRVPWc6rn5WSGrNxTliy3b9s4rxgq4I+S+x
         66B191iF6Dv31yjM+9nxyZefY9Ap94xN9NdAPE93XYqLcxzffVRnDlwHBguo/19Lsdpa
         Tp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2tBYGnK2Aq8T6hQ21qou143/hbgltxjW1oUM3LKKX4g=;
        b=jIs+xTAEKMnC/4us/MKWmcSk8cn6GakYpK6cqgv4yjjGGh3MfRlY4qEvPsr6aUh+zb
         Rof/4D8urVXbVb7aOKMkni1q574DfGb09LrNCu5E6v6omC9cnZtiKyNCBK/54/oP0+DQ
         6N09zTiiZc9MZS3ru4uL6dKQOngFiAvXd8px4T/fnhEjR7sPcvFEaZCyA+cAlJ8CXgy7
         Iv7Dn8HCg90D/acyHHKbzP4lXXjRfGvU2kwGJYCNNC/x/bneVa/Om0VVeGf0P5VsIvYe
         cgJCKvaC2WRakwChuRISbErwq3coEsk0mt9pWMdakqBs5zFTJFHChRpmXwkLoBfRNEpP
         UzKA==
X-Gm-Message-State: APjAAAUI9aZdHMV1tUvvjqUN1o0T5pdiCi0rXYm6r6KChaanyNe4gtip
        CFTMl4hiAES8iHdV8SXN0FWyE77qeiUGWykNd9k=
X-Google-Smtp-Source: APXvYqz58Q517KTUKqWPVVGd8fh0ZfJdGDtUjFu0F4IqRF52csg1S96w6+T4loixYrF3aCQHOLwXpjulmsVQ+MeG96o=
X-Received: by 2002:a92:4e:: with SMTP id 75mr11868466ila.276.1576504645520;
 Mon, 16 Dec 2019 05:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20191215173817.47918-1-tony@atomide.com> <20191215230331.645b9064@aktux>
 <20191216030948.GL35479@atomide.com> <20191216031637.GM35479@atomide.com> <20191216130536.5935a587@kemnade.info>
In-Reply-To: <20191216130536.5935a587@kemnade.info>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 16 Dec 2019 07:57:14 -0600
Message-ID: <CAHCN7xJ-ndGxz0DYSwnuDi+4Hu349RTCzHjsspx2evMvLDtDqA@mail.gmail.com>
Subject: Re: [PATCH] w1: omap-hdq: Simplify driver with PM runtime autosuspend
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Tony Lindgren <tony@atomide.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Dec 16, 2019 at 7:48 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> On Sun, 15 Dec 2019 19:16:37 -0800
> Tony Lindgren <tony@atomide.com> wrote:
>
> > * Tony Lindgren <tony@atomide.com> [191216 03:10]:
> > > Hi,
> > >
> > > * Andreas Kemnade <andreas@kemnade.info> [191215 22:04]:
> > > > On Sun, 15 Dec 2019 09:38:17 -0800
> > > > If I remember correctly this thing is critical to get the hwmod out of
> > > > reset but I need to examine that again:
> > >
> > > Thanks for testing, yes that's what I thought might cause it
> > > too, but nope :)
> > >
> > > We currently disable interrupts for some reason after
> > > the first read. That won't play with runtime PM autosuspend
> > > at all as we never enable them again until the device has
> > > idled. Can you try the following additional patch on top?
> >
> > And we should probably do the following too to make sure
> > the mode is initialized before we call runtime PM.
> >
> CM_FCLKEN1/IDLEST1_CORE seem to behave, reading also works
>
> With these two additional patches this deserves a
> Tested-By: Andreas Kemnade <andreas@kemnade.info> # gta04

Tony,

Any way you can do a V2 patch with the other stuff added?  Pulling the
patches from gmail doesn't work.  I think G-mail does something weird
because they don't apply cleanly, so I have to download the patches
from patchwork.  I should be able to test it today.

thanks

adam
>
> Regards,
> Andreas
