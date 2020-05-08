Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009691CA28A
	for <lists+linux-omap@lfdr.de>; Fri,  8 May 2020 07:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgEHFJO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 May 2020 01:09:14 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:40074 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725550AbgEHFJO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 May 2020 01:09:14 -0400
Received: from gwarestrin.me.apana.org.au ([192.168.0.7] helo=gwarestrin.arnor.me.apana.org.au)
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1jWv9G-0003nP-El; Fri, 08 May 2020 15:02:11 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 08 May 2020 15:08:48 +1000
Date:   Fri, 8 May 2020 15:08:48 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/6] crypto: omap-crypto: fix userspace copied buffer
 access
Message-ID: <20200508050848.GA21823@gondor.apana.org.au>
References: <20200429144205.5291-1-t-kristo@ti.com>
 <20200429144205.5291-4-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429144205.5291-4-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Apr 29, 2020 at 05:42:02PM +0300, Tero Kristo wrote:
>
> diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
> index cc88b7362bc2..cbc5a4151c3c 100644
> --- a/drivers/crypto/omap-crypto.c
> +++ b/drivers/crypto/omap-crypto.c
> @@ -178,11 +178,14 @@ static void omap_crypto_copy_data(struct scatterlist *src,
>  		amt = min(src->length - srco, dst->length - dsto);
>  		amt = min(len, amt);
>  
> -		srcb = sg_virt(src) + srco;
> -		dstb = sg_virt(dst) + dsto;
> +		srcb = kmap_atomic(sg_page(src)) + srco + src->offset;
> +		dstb = kmap_atomic(sg_page(dst)) + dsto + dst->offset;
>  
>  		memcpy(dstb, srcb, amt);
>  
> +		kunmap_atomic(srcb);
> +		kunmap_atomic(dstb);

With dst you also need to flush the cache.  Please refer to the
flush dcache call in include/crypto/scatterwalk.h.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
