Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5BEF1059
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 08:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbfKFHdc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 02:33:32 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42433 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbfKFHdc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Nov 2019 02:33:32 -0500
Received: by mail-vk1-f196.google.com with SMTP id r4so5384690vkf.9
        for <linux-omap@vger.kernel.org>; Tue, 05 Nov 2019 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fbVrCNlPLaDTmcKHIN3LtBZK21JIiPNghUTOX5jQAi0=;
        b=tXq9+cEdTgcUL/rTgW92c4PNWlxnqdy9ufzkcqPbyt0BmkFpZwtDr2SKTAZ2B2adPA
         F+XDqVbx7RMa+5XEnQg/NkxPXT5p1qsf2Il96TWl2Xo9SSM9hUuVYMdG4OSux/yBuUE8
         /lt+ifyc1imI3ov8PQ2W9bkBv+/tM6c/VcGIy/P/kI10Cz+YzkEMxuP+yQO8wBG0+vvv
         4n+EMc34+wsK62rjmo/p32ZrKZm00eMyRRnbQWc2dTB1jGdGHtZvt3NtPvauqSi+hfbZ
         LBqtHWQ+Da8ZxU44fzKnYQQKozNVLB2Tu1/P25qp5db4qn1FRQ9kkdL7iUFiBnTCljtW
         Vuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbVrCNlPLaDTmcKHIN3LtBZK21JIiPNghUTOX5jQAi0=;
        b=mBp46g8/MXZqOowRz125a2LWJKXaj2HcOS7qgIvt5HwJiiZVvOL7iM+IqblExSYeFN
         ZUmPL+x8o57OLZBuGgmsvUf8M2K6tmhNtJs/udhAv2uMBaU92KS/lXEmaM8aNuPHjSRY
         +Accufaq3DKIiDy8Pi9e75whLzpNL0XGYOrzgslcwu+MeMRs3fWzoMANPq6gwycl6eGl
         kq4PR9KefCyOEhybur28LNnBB9Rgm+L+VNaFbWF6iHfRx54lf1Fmh9r7oWeVXpPGV6Rg
         Y+ZTo6gPmH6Wmfglni/UTB5d/gVaj4f7+m0TsHl2XuP8yaz3/KcztgKhw5z/nuycjsvz
         NbqQ==
X-Gm-Message-State: APjAAAWe71uT+KD/hFUzdya9XIoIHwvLNoEg6m4ylcn6ElNeUK4n26uZ
        KZuD5Q5vBx9apBoHjmS/TiZIw3n501M4qdTHUojjHGLiUFIScA==
X-Google-Smtp-Source: APXvYqw32qEeWfeBSD+BM8iRa57I4atoH5ZwU4QbRCyWX48m3mTUA1rFPOiMiu2Vt5iwu172Y/DEdSEJXJ81xV0PdLY=
X-Received: by 2002:ac5:c756:: with SMTP id b22mr628305vkn.2.1573025611342;
 Tue, 05 Nov 2019 23:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20191017122549.4634-1-t-kristo@ti.com> <20191017122549.4634-10-t-kristo@ti.com>
 <CAOtvUMeBXjDBhSVgMOW=hshEx_AkNPg-Zk2c2jCDzY8vyXWW5g@mail.gmail.com> <076f0bc6-ad04-9543-db02-d7c7060db036@ti.com>
In-Reply-To: <076f0bc6-ad04-9543-db02-d7c7060db036@ti.com>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Wed, 6 Nov 2019 09:33:20 +0200
Message-ID: <CAOtvUMc7pbtPAPUbEmz_MTHmB9LboQVdgG-t9tHCr=biEbFuUQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@google.com>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 6, 2019 at 9:25 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> On 06/11/2019 08:39, Gilad Ben-Yossef wrote:
> > Hi,
> >
> >
> > On Thu, Oct 17, 2019 at 3:26 PM Tero Kristo <t-kristo@ti.com> wrote:
> >>
> >> Currently crypto_wait_req waits indefinitely for an async crypto request
> >> to complete. This is bad as it can cause for example the crypto test
> >> manager to hang without any notification as to why it has happened.
> >> Instead of waiting indefinitely, add a 1 second timeout to the call,
> >> and provide a warning print if a timeout happens.
> >
> > While the incentive is clear and positive, this suggested solution
> > creates problems of its own.
> > In many (most?) cases where we are waiting here, we are waiting for a
> > DMA operation to finish from hardware.
> > Exiting while this pending DMA operation is not finished, even with a
> > proper error return value, is dangerous because
> > unless the calling code takes great care to not release the memory the
> > DMA is being done from/to, this can have disastrous effects.
> >
> > As Eric has already mentioned, one second might seem like a long time,
> > but we don't really know if it is enough.
> >
> > How about adding a second API (ig. crypto_wait_req_timeout) which
> > supports a calee specified timeout where
> > the calle knows how to correctly deal with timeout and port the
> > relevant call sites to use this?
>
> Yeah, that would work for me. I guess we could just swap the testmgr to
> use this timeout API, as it is quite clear it should timeout rather than
> wait indefinitely, and afaics, the data buffers it uses are limited
> size. It doesn't really matter for it whether the timeout is 1 second or
> 10 seconds, as long as it eventually times out.


As long as you avoid releasing the memory used on timeout, that should
work well, I think.

Gilad
