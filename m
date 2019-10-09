Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 426EAD1A24
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 22:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbfJIUx5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 16:53:57 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37064 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJIUx5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 16:53:57 -0400
Received: by mail-io1-f67.google.com with SMTP id b19so8474803iob.4
        for <linux-omap@vger.kernel.org>; Wed, 09 Oct 2019 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MsNiqYSrxFWad3Mv4mkSk6uiD28v/BQqDUWQXZUAzMw=;
        b=Ekzl3tgC/SZXt6vjQomCdlt6FlJyH/ggCyWREhgmGHkoSYRapO35UOs9WfKLGUu5n/
         72+ev8h5RBXRUpCnd6O1cpQxPlYYSkuhTUePDGOZouD4fsiPZcfz0NgBe2X6O0wd06lg
         te74kaQStS6MXVM8NmBFK0u4aHVenGyVpEW+zESsTNZf+VGLiachcDRQvIdldi8ud0Jv
         +oLshoqKUbIBGNEq4Tx9sJqe5jw4TBdxFRokg8S1s4o6RN2hGsOCbYGJHK13iFj9nY9R
         vMoAh/XG8F0jYmIltfmMu+YOhBclVn14/uLuf8ghGEW8zumGUL3IaJvUAIChH/g3ObFJ
         M5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MsNiqYSrxFWad3Mv4mkSk6uiD28v/BQqDUWQXZUAzMw=;
        b=gqcpcsajjqmWPcJvgKgia2p4GbQKwvO3+0AYk6QlEbzBn8Ys2Q2XRe2E0GckF3f/4n
         kDWW2vb8dnd+/Vtqyf3wQKBzaIvCv9qxy/0+CDNiPVV3dPlKmZSq7KVG6BKQhWA4dInE
         /YAjXiqLMWdVQiscR49ziP6x05ctjL80CGsdArRaJUqcvG+ilUNxxMGTmX+gUHGcJ/M+
         iFVkdmhNaR8S5YT36EvAEDNMf/R5c+UKqBTXVF8mAZxbYQG4UkklVUUiqHh+gq0AqXsG
         HI3mnlG6HrrWtnoiLRe9HFzAPemHr8HqLSTADZ3KURCD7mzgAK/yGoOHDgfFfHeH32jw
         ot8Q==
X-Gm-Message-State: APjAAAUBq2/B6Y7toQsURrupCyigizZ1kaxdwbSb/16bJDJflBiD3NSi
        qyzX/jWEyR3sV9T/tSr7H4mFKqSwWCykXBsIdE8dtw==
X-Google-Smtp-Source: APXvYqxbqwHan5vWSVwMAqzk0Z6HSC0V2+cowHmPpDrAi3OL+zkuNIzNyHzuo/hlLoqtzIycxi49mFhmNAfKuD6scr0=
X-Received: by 2002:a02:92c9:: with SMTP id c9mr5618503jah.0.1570654435700;
 Wed, 09 Oct 2019 13:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190925171444.9904-1-aford173@gmail.com> <CAHCN7xL6OXkWxY1r=ALhHpufDan6AsWkoRkv9JGST52qFJsNCQ@mail.gmail.com>
 <20191009201314.GP5610@atomide.com>
In-Reply-To: <20191009201314.GP5610@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 9 Oct 2019 15:53:43 -0500
Message-ID: <CAHCN7x+9qKTbw9F87KdskvGmJeTenzZPWSM3S3zykSs9M6hwYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap3.dtsi: Fix AES and SHA Engines
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 9, 2019 at 3:13 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Adam Ford <aford173@gmail.com> [191009 18:56]:
> > On Wed, Sep 25, 2019 at 12:14 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > The AES and SHA engines for the OMAP3 are currently not functional.
> > > When the stopped working is unknown, but we have a regression.
> > >
> > > This patch uses the ti,sysc-omap2 to address the issue and enables
> > > to the AES and SHA engines on the DM3730 and OMAP3530 to work once
> > > again.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > Tony,
> >
> > Any chance these could get review and/or pushed for 5.4 since they
> > used to work and now they don't.  I didn't do a bisect, so I didn't
> > add a 'fixes' note, but this patch seems to fix a regression.
>
> Well let's rather tag them with fixes tag and that way they get
> merged to stable kernels when ready.
>
> I'd rather not hastily start adding devices hastily during the -rc
> cycle as by the time we get there with few weeks in next we're
> already too close to the merge window.
>
> And my guess is that this stuff has been broken for many years
> and nobody cared until now.

I will try to bisect it tomorrow.

>
> A fixes tag would be good to know though.. And maybe we can get them
> working with hwmod data for v5.4-rc cycle with just a minimal change?

That would be nice.  I am mostly interested because the last kernel
Logic PD released (4.9) had it working and I am hoping to minimize the
patching I will have to do to the 5.4 kernel when done.

thanks,

adam

>
> Regards,
>
> Tony
