Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D18B7F5CFA
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2019 03:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfKIC1w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 21:27:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:58502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbfKIC1w (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Nov 2019 21:27:52 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A48D214DA;
        Sat,  9 Nov 2019 02:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573266471;
        bh=mMesAn5bzqaMXFwOkfks3W22Wpyo5hJg1BB/Q5ylArM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TePygY9zSTjFoOkXjTbRPu9BHRSgLLowCiG9m2pbpfgF/Zm3Wo/wyaF/sjPQ8oI+1
         KyRmQogswC95Zg6uCRfIsmsYprUimGf12TR6MbRM+Ixmq99Pm3ohmEUnkFsqhbwNJ+
         X5kxZHatcgqTY60g27hZSEeS9hAwKN+1WPgoq6vo=
Date:   Fri, 8 Nov 2019 18:27:49 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
Message-ID: <20191109022749.GB9739@sol.localdomain>
Mail-Followup-To: Tero Kristo <t-kristo@ti.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
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
 <20191108022759.GB1140@sol.localdomain>
 <d55c0182-5fb0-2ef9-f056-54b396fb0026@ti.com>
 <20191108091608.i5fxt2vu2nwrybgn@gondor.apana.org.au>
 <2ab94492-21e4-fbe0-41eb-e12b02511d7c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ab94492-21e4-fbe0-41eb-e12b02511d7c@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 08, 2019 at 11:22:48AM +0200, Tero Kristo wrote:
> On 08/11/2019 11:16, Herbert Xu wrote:
> > On Fri, Nov 08, 2019 at 09:40:57AM +0200, Tero Kristo wrote:
> > > 
> > > The problem is not detecting a hung task, the problem is determining what
> > > caused the hang. Personally I don't care if the system dies if a crypto
> > > accelerator self test has failed, as long as I get reported about the exact
> > > nature of the failure. The failures are expected to happen only in
> > > development phase of a crypto driver.
> > > 
> > > With the timeout patch in place, I get reported what exact crypto test case
> > > failed and I can focus my debug efforts on that one.
> > 
> > If that's all you need then how about just making the wait killable?
> 
> Yeah, that would be an alternative.
> 

I don't see how making crypto_wait_req killable would be any better than adding
a timeout, since in both cases the crypto operation would still be proceeding in
the background while things are being freed.

Would it help if the crypto self-tests printed a pr_debug() message when
starting each test vector?  These wouldn't be shown by default, but it would be
possible to enable them using dynamic-debug or by adding '#define DEBUG' to the
top of the source file.

- Eric
