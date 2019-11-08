Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90973F3E13
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 03:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfKHC2D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Nov 2019 21:28:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:42744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfKHC2C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Nov 2019 21:28:02 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E9542084D;
        Fri,  8 Nov 2019 02:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573180081;
        bh=EmadM+X2aXhTG5ipw+1vGj1uDpsQx+J0azDRdE/N1n8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u6eJJ8FpsQt7K8Hxqi9SRqDIST9r/gmbGjyImf5IHFmdYMfbjw+YhhgJRmd7iVvh3
         0JFyIvzd6fiP4D7fESS93YrE4M2DFe5j0n1En7xFqhCjB/fp8YlbSJGGNbYLSrBPLV
         7t71NOkw6f+iXej4O35JBOPS3GfXZaAq1mUfhlCk=
Date:   Thu, 7 Nov 2019 18:27:59 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Gilad Ben-Yossef <gilad@benyossef.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
Message-ID: <20191108022759.GB1140@sol.localdomain>
Mail-Followup-To: Gilad Ben-Yossef <gilad@benyossef.com>,
        Tero Kristo <t-kristo@ti.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20191017122549.4634-1-t-kristo@ti.com>
 <20191017122549.4634-10-t-kristo@ti.com>
 <CAOtvUMeBXjDBhSVgMOW=hshEx_AkNPg-Zk2c2jCDzY8vyXWW5g@mail.gmail.com>
 <076f0bc6-ad04-9543-db02-d7c7060db036@ti.com>
 <CAOtvUMc7pbtPAPUbEmz_MTHmB9LboQVdgG-t9tHCr=biEbFuUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOtvUMc7pbtPAPUbEmz_MTHmB9LboQVdgG-t9tHCr=biEbFuUQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 06, 2019 at 09:33:20AM +0200, Gilad Ben-Yossef wrote:
> On Wed, Nov 6, 2019 at 9:25 AM Tero Kristo <t-kristo@ti.com> wrote:
> >
> > On 06/11/2019 08:39, Gilad Ben-Yossef wrote:
> > > Hi,
> > >
> > >
> > > On Thu, Oct 17, 2019 at 3:26 PM Tero Kristo <t-kristo@ti.com> wrote:
> > >>
> > >> Currently crypto_wait_req waits indefinitely for an async crypto request
> > >> to complete. This is bad as it can cause for example the crypto test
> > >> manager to hang without any notification as to why it has happened.
> > >> Instead of waiting indefinitely, add a 1 second timeout to the call,
> > >> and provide a warning print if a timeout happens.
> > >
> > > While the incentive is clear and positive, this suggested solution
> > > creates problems of its own.
> > > In many (most?) cases where we are waiting here, we are waiting for a
> > > DMA operation to finish from hardware.
> > > Exiting while this pending DMA operation is not finished, even with a
> > > proper error return value, is dangerous because
> > > unless the calling code takes great care to not release the memory the
> > > DMA is being done from/to, this can have disastrous effects.
> > >
> > > As Eric has already mentioned, one second might seem like a long time,
> > > but we don't really know if it is enough.
> > >
> > > How about adding a second API (ig. crypto_wait_req_timeout) which
> > > supports a calee specified timeout where
> > > the calle knows how to correctly deal with timeout and port the
> > > relevant call sites to use this?
> >
> > Yeah, that would work for me. I guess we could just swap the testmgr to
> > use this timeout API, as it is quite clear it should timeout rather than
> > wait indefinitely, and afaics, the data buffers it uses are limited
> > size. It doesn't really matter for it whether the timeout is 1 second or
> > 10 seconds, as long as it eventually times out.
> 
> 
> As long as you avoid releasing the memory used on timeout, that should
> work well, I think.
> 

The memory is always going to be freed eventually, though.  Although the crypto
tests currently reuse the input/output buffers and the request structure from
one test to the next, they're freed at the end of the tests.  Also, it's unsafe
for one request structure to be used for multiple requests concurrently anyway.

I think crypto_wait_req_timeout() would just be fundamentally unsafe.

Couldn't you just use CONFIG_DETECT_HUNG_TASK=y instead?  It should report if
any thread is blocked for too long.

- Eric
