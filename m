Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774C71DE7CB
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 15:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgEVNNL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 May 2020 09:13:11 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:39262 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729334AbgEVNNL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 22 May 2020 09:13:11 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jc7Tj-0007Pz-B1; Fri, 22 May 2020 23:12:48 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2020 23:12:47 +1000
Date:   Fri, 22 May 2020 23:12:47 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHv2 3/7] crypto: omap-crypto: fix userspace copied buffer
 access
Message-ID: <20200522131247.GA27255@gondor.apana.org.au>
References: <20200511111913.26541-1-t-kristo@ti.com>
 <20200511111913.26541-4-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111913.26541-4-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 11, 2020 at 02:19:09PM +0300, Tero Kristo wrote:
> In case buffers are copied from userspace, directly accessing the page
> will most likely fail because it hasn't been mapped into the kernel
> memory space. Fix the issue by forcing a kmap / kunmap within the
> cleanup functionality.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/crypto/omap-crypto.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/omap-crypto.c b/drivers/crypto/omap-crypto.c
> index cc88b7362bc2..31bdb1d76d11 100644
> --- a/drivers/crypto/omap-crypto.c
> +++ b/drivers/crypto/omap-crypto.c
> @@ -178,11 +178,16 @@ static void omap_crypto_copy_data(struct scatterlist *src,
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
> +		flush_dcache_page(sg_page(dst));

You need to check !PageSlab as it's illegal to call it on a kernel
page.  Also you should be using flush_kernel_dcache_page.  scatterwalk
uses flush_dcache_page only because when it was created the other
function didn't exist.

Would it be possible to use the sg_miter interface to do the copy?
In fact your function could possibly be added to lib/scatterlist.c
as it seems to be quite generic.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
