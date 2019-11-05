Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D650EFE3B
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 14:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388782AbfKENU7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 08:20:59 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:33330 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388753AbfKENU7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 Nov 2019 08:20:59 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iRylR-00062K-GN; Tue, 05 Nov 2019 21:20:53 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iRylP-0000nY-Aq; Tue, 05 Nov 2019 21:20:51 +0800
Date:   Tue, 5 Nov 2019 21:20:51 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/6] crypto: additional fixes for omap-aes
Message-ID: <20191105132051.smkx32ix3465b5bq@gondor.apana.org.au>
References: <20191026145259.16040-1-ardb@kernel.org>
 <b8743ccb-2e3a-6d50-017c-48af6d3fa846@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8743ccb-2e3a-6d50-017c-48af6d3fa846@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 05, 2019 at 02:19:54PM +0200, Tero Kristo wrote:
> On 26/10/2019 17:52, Ard Biesheuvel wrote:
> > This series applies onto Tero's series [0], and addresses a number of
> > additional issues that exist in the omap-aes driver that aren't being
> > addresses by Tero's fixes.
> > 
> > Note that the resulting code is still not 100% correct: an issue remains
> > where inputs into GCM consisting solely of assocdata are not being processed
> > correctly, e.g.,
> > 
> > alg: aead: gcm-aes-omap encryption test failed (wrong result) on test vector
> >    "random: alen=38 plen=0 authsize=16 klen=32",
> >     cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+19] iv_offset=31"
> > 
> > I have no idea how to fix this, so I'll leave this to people that know this
> > hardware and have access to the Sitara TRM.
> > 
> > Note that I also spotted some issues in the SHAM driver, i.e.,
> > 
> > alg: ahash: omap-sha1 test failed (wrong result) on test vector
> >    "random: psize=7928 ksize=0", cfg="random: inplace use_final
> >        src_divs=[5.64%@+13, 59.70%@+18, <flush>31.53%@+4072,
> >        <flush,nosimd>3.13%@alignmask+263]"
> > alg: ahash: omap-hmac-sha256 test failed (wrong result) on test vector
> >    "random: psize=960 ksize=37", cfg="random: inplace use_final
> >        src_divs=[32.54%@+2449, 17.18%@+4, <flush>50.28%@+1] iv_offset=31"
> > 
> > All of these failures are triggered by CONFIG_CRYPTO_MANAGER_EXTRA_TESTS,
> > so they will not show up when using the standard set of test vectors.
> > 
> > [0] https://lore.kernel.org/linux-crypto/20191017122549.4634-1-t-kristo@ti.com/
> > 
> > Cc: linux-omap@vger.kernel.org
> > Cc: Tero Kristo <t-kristo@ti.com>
> 
> For the whole series:
> 
> Reviewed-by: Tero Kristo <t-kristo@ti.com>
> Tested-by: Tero Kristo <t-kristo@ti.com>

Actually I've lost track of both of your patch series.  Please
repost both in the correct order for merging.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
