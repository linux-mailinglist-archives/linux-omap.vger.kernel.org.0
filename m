Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95648F5D5A
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2019 06:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfKIFBY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Nov 2019 00:01:24 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:33704 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbfKIFBY (ORCPT <rfc822;linux-omap@vger.kernel.orG>);
        Sat, 9 Nov 2019 00:01:24 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iTIs5-0006nb-Un; Sat, 09 Nov 2019 13:01:14 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iTIs0-00083U-GN; Sat, 09 Nov 2019 13:01:08 +0800
Date:   Sat, 9 Nov 2019 13:01:08 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        David Miller <davem@davemloft.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
Message-ID: <20191109050108.mcykgg2izb7htrek@gondor.apana.org.au>
References: <20191017122549.4634-1-t-kristo@ti.com>
 <20191017122549.4634-10-t-kristo@ti.com>
 <CAOtvUMeBXjDBhSVgMOW=hshEx_AkNPg-Zk2c2jCDzY8vyXWW5g@mail.gmail.com>
 <076f0bc6-ad04-9543-db02-d7c7060db036@ti.com>
 <CAOtvUMc7pbtPAPUbEmz_MTHmB9LboQVdgG-t9tHCr=biEbFuUQ@mail.gmail.com>
 <20191108022759.GB1140@sol.localdomain>
 <d55c0182-5fb0-2ef9-f056-54b396fb0026@ti.com>
 <20191108091608.i5fxt2vu2nwrybgn@gondor.apana.org.au>
 <2ab94492-21e4-fbe0-41eb-e12b02511d7c@ti.com>
 <20191109022749.GB9739@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191109022749.GB9739@sol.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 08, 2019 at 06:27:49PM -0800, Eric Biggers wrote:
> 
> I don't see how making crypto_wait_req killable would be any better than adding
> a timeout, since in both cases the crypto operation would still be proceeding in
> the background while things are being freed.

Right, you would need to modify the caller to actually distinguish
between the killed case vs. actual completion.

> Would it help if the crypto self-tests printed a pr_debug() message when
> starting each test vector?  These wouldn't be shown by default, but it would be
> possible to enable them using dynamic-debug or by adding '#define DEBUG' to the
> top of the source file.

This should be simpler to implement.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
